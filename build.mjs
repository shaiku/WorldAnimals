import { createWriteStream, readdirSync, statSync, readFileSync, mkdirSync } from "fs";
import { join, relative } from "path";
import { deflateRawSync } from "zlib";

// Minimal ZIP writer (no dependencies)
class ZipWriter {
  constructor(stream) {
    this.stream = stream;
    this.entries = [];
    this.offset = 0;
  }

  _write(buf) {
    this.stream.write(buf);
    this.offset += buf.length;
  }

  addFile(name, data) {
    const nameBuf = Buffer.from(name);
    const crc = crc32(data);
    const compressed = deflateRawSync(data);
    const useStore = compressed.length >= data.length;
    const method = useStore ? 0 : 8;
    const fileData = useStore ? data : compressed;

    const localOffset = this.offset;

    // Local file header
    const local = Buffer.alloc(30);
    local.writeUInt32LE(0x04034b50, 0);  // signature
    local.writeUInt16LE(20, 4);           // version needed
    local.writeUInt16LE(0, 6);            // flags
    local.writeUInt16LE(method, 8);       // compression
    local.writeUInt16LE(0, 10);           // mod time
    local.writeUInt16LE(0, 12);           // mod date
    local.writeUInt32LE(crc, 14);         // crc32
    local.writeUInt32LE(fileData.length, 18); // compressed size
    local.writeUInt32LE(data.length, 22);     // uncompressed size
    local.writeUInt16LE(nameBuf.length, 26);  // filename length
    local.writeUInt16LE(0, 28);               // extra length

    this._write(local);
    this._write(nameBuf);
    this._write(fileData);

    this.entries.push({ nameBuf, crc, compressedSize: fileData.length, size: data.length, method, localOffset });
  }

  finish() {
    const cdStart = this.offset;
    for (const e of this.entries) {
      const cd = Buffer.alloc(46);
      cd.writeUInt32LE(0x02014b50, 0);
      cd.writeUInt16LE(20, 4);
      cd.writeUInt16LE(20, 6);
      cd.writeUInt16LE(0, 8);
      cd.writeUInt16LE(e.method, 10);
      cd.writeUInt16LE(0, 12);
      cd.writeUInt16LE(0, 14);
      cd.writeUInt32LE(e.crc, 16);
      cd.writeUInt32LE(e.compressedSize, 20);
      cd.writeUInt32LE(e.size, 24);
      cd.writeUInt16LE(e.nameBuf.length, 28);
      cd.writeUInt16LE(0, 30);
      cd.writeUInt16LE(0, 32);
      cd.writeUInt16LE(0, 34);
      cd.writeUInt16LE(0, 36);
      cd.writeUInt32LE(0, 38);
      cd.writeUInt32LE(e.localOffset, 42);
      this._write(cd);
      this._write(e.nameBuf);
    }
    const cdEnd = this.offset;

    // End of central directory
    const eocd = Buffer.alloc(22);
    eocd.writeUInt32LE(0x06054b50, 0);
    eocd.writeUInt16LE(0, 4);
    eocd.writeUInt16LE(0, 6);
    eocd.writeUInt16LE(this.entries.length, 8);
    eocd.writeUInt16LE(this.entries.length, 10);
    eocd.writeUInt32LE(cdEnd - cdStart, 12);
    eocd.writeUInt32LE(cdStart, 16);
    eocd.writeUInt16LE(0, 20);
    this._write(eocd);

    this.stream.end();
  }
}

function crc32(buf) {
  let crc = 0xFFFFFFFF;
  for (let i = 0; i < buf.length; i++) {
    crc ^= buf[i];
    for (let j = 0; j < 8; j++) {
      crc = (crc >>> 1) ^ (crc & 1 ? 0xEDB88320 : 0);
    }
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

function walkDir(dir) {
  const results = [];
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) results.push(...walkDir(full));
    else results.push(full);
  }
  return results;
}

function buildPack(srcDir, zipPath) {
  const stream = createWriteStream(zipPath);
  const zip = new ZipWriter(stream);
  const files = walkDir(srcDir);
  for (const f of files) {
    const name = relative(srcDir, f).replace(/\\/g, "/");
    zip.addFile(name, readFileSync(f));
  }
  zip.finish();
  return new Promise(resolve => stream.on("close", resolve));
}

// Build
const pkg = JSON.parse(readFileSync("package.json", "utf8"));
const version = pkg.version;
const name = pkg.name;

mkdirSync("dist", { recursive: true });

const bpPath = `dist/${name}_bp_v${version}.mcpack`;
const rpPath = `dist/${name}_rp_v${version}.mcpack`;
const bpStructPath = `dist/${name}_structures_bp_v${version}.mcpack`;
const addonPath = `dist/${name}_v${version}.mcaddon`;

console.log(`Building ${name} v${version}...`);

await buildPack("BP", bpPath);
console.log(`  BP → ${bpPath}`);

await buildPack("RP", rpPath);
console.log(`  RP → ${rpPath}`);

await buildPack("BP_structures", bpStructPath);
console.log(`  BP_structures → ${bpStructPath}`);

// mcaddon is a zip containing the three mcpacks
const addonStream = createWriteStream(addonPath);
const addonZip = new ZipWriter(addonStream);
addonZip.addFile(`${name}_bp_v${version}.mcpack`, readFileSync(bpPath));
addonZip.addFile(`${name}_rp_v${version}.mcpack`, readFileSync(rpPath));
addonZip.addFile(`${name}_structures_bp_v${version}.mcpack`, readFileSync(bpStructPath));
addonZip.finish();
await new Promise(resolve => addonStream.on("close", resolve));

console.log(`  Addon → ${addonPath}`);
console.log("Done!");
