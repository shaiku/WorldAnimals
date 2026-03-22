import { cpSync, rmSync } from "fs";
import { join } from "path";

const mojang = join(
  process.env.APPDATA,
  "Minecraft Bedrock/Users/Shared/games/com.mojang"
);

const bpDest = join(mojang, "development_behavior_packs/worldanimals_bp");
const rpDest = join(mojang, "development_resource_packs/worldanimals_rp");

// Remove old copies (including legacy structures pack)
try { rmSync(bpDest, { recursive: true }); } catch {}
try { rmSync(rpDest, { recursive: true }); } catch {}
try { rmSync(join(mojang, "development_behavior_packs/worldanimals_structures_bp"), { recursive: true }); } catch {}

// Copy fresh
cpSync("BP", bpDest, { recursive: true });
cpSync("RP", rpDest, { recursive: true });

console.log("Deployed BP →", bpDest);
console.log("Deployed RP →", rpDest);
