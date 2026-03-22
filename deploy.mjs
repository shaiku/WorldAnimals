import { cpSync, rmSync } from "fs";
import { join } from "path";

const mojang = join(
  process.env.APPDATA,
  "Minecraft Bedrock/Users/Shared/games/com.mojang"
);

const bpDest = join(mojang, "development_behavior_packs/worldanimals_bp");
const rpDest = join(mojang, "development_resource_packs/worldanimals_rp");
const bpStructDest = join(mojang, "development_behavior_packs/worldanimals_structures_bp");

// Remove old copies
try { rmSync(bpDest, { recursive: true }); } catch {}
try { rmSync(rpDest, { recursive: true }); } catch {}
try { rmSync(bpStructDest, { recursive: true }); } catch {}

// Copy fresh
cpSync("BP", bpDest, { recursive: true });
cpSync("RP", rpDest, { recursive: true });
cpSync("BP_structures", bpStructDest, { recursive: true });

console.log("Deployed BP →", bpDest);
console.log("Deployed RP →", rpDest);
console.log("Deployed BP_structures →", bpStructDest);
