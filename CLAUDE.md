# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Minecraft Bedrock Edition addon** called "World Animals", created by ArathNido. It adds 70+ real-world animals, custom blocks, items, recipes, and world generation features. Migrated to Bedrock 1.21.20+ stable APIs (no Holiday Creator Features).

Minimum engine version: 1.21.20. Uses `@minecraft/server` v2.0.0 Script API for custom block components.

## Environment

- Python is invoked with `py` (not `python` or `python3`) on this system.
- Deploy to Minecraft: `npm run deploy` (copies BP/ and RP/ to `%APPDATA%/Minecraft Bedrock/Users/Shared/games/com.mojang` development packs)
- Build .mcaddon: `npm run build` (creates dist/worldanimals_v2.0.0.mcaddon)

## Architecture

Two addon packs (BP depends on RP, installing BP auto-installs RP):

### BP/ — Behavior Pack
- **scripts/main.js** — Script API custom components (ore_xp, turkey_eat, palm_sapling)
- **entities/** — Entity behavior definitions (~75 files). Some in subdirectories (chimpanzee/, crab/, hyena/, iguana/, stork/). Namespace: `worldanimals:`
- **blocks/** — Custom blocks (12 files): bananas, coco_3d, sofa, carpet, ores, gem blocks, cooked turkey, palm sapling
- **items/** — Custom items (~115 files) organized by category: saddles/, scarf/, armor/, astronaut/, butterfly/, rhyno_armor/, ruby_armor/, elephant_armor/, citrine_armor/, reptil_armor/
- **recipes/** — Crafting recipes (~104 files)
- **loot_tables/** — Drop tables split into blocks/ and entities/ subdirectories
- **spawn_rules/** — Biome-specific spawn conditions (~78 files)
- **features/** and **feature_rules/** — World generation for custom ores and trees
- **trading/** — Custom villager trade tables
- **structures/** — Structure template files (.mcstructure)

### RP/ — Resource/Texture Pack
- **entity/** — Client-side entity definitions
- **models/entity/** — Geometry models. Subdirectories: armor/, elytra/, morph/
- **animations/** — Client-side skeletal animations
- **render_controllers/** — Render controllers for variants and equipment
- **textures/** — Entity and block texture images
- **attachables/** — First-person item/armor rendering
- **sounds/** — Sound files and sound_definitions.json (format 1.20.20)
- **sounds.json** — Entity sound event mappings
- **blocks.json** — Block sound assignments

## Script API (BP/scripts/main.js)

Uses `@minecraft/server` v2.0.0 with `system.beforeEvents.startup`. Three custom block components:

| Component | Blocks | Behavior |
|---|---|---|
| `worldanimals:ore_xp` | 4 ore blocks | Spawn XP orb on player break |
| `worldanimals:turkey_eat` | cooked_turkey | Cycle slice state, play burp, give saturation, destroy at end |
| `worldanimals:palm_sapling` | palm_sapling | Bone meal growth (25% chance), auto-grow on tick |

### Script Event Commands

Triggered via `/scriptevent` or wrapper mcfunctions (`/function worldanimals_refresh`):

| Event | Function wrapper | Behavior |
|---|---|---|
| `worldanimals:refresh` | `worldanimals_refresh` | Despawn all wild entities and respawn fresh replacements, preserving tamed status, equipment/armor, name tags, and scoreboard tags |
| `worldanimals:despawnall` | `worldanimals_despawnall` | Clean removal of all addon entities via `entity.remove()` (no loot drops) |

The refresh system uses a mark_variant → event mapping to restore armor on elephants, mammoth, ostrich, and rhinoceros. Simple saddle/chest state is restored for big cats, penguins, giraffe, deer, and zebra.

## Key Patterns

- **Entity namespace:** `worldanimals:` prefix throughout
- **Naming convention:** snake_case for all filenames and identifiers
- **Rotation system:** Blocks use `minecraft:placement_direction` trait with `y_rotation_offset: 180`
- **Entity variants:** Component groups handle age, gender, and visual variants
- **Equipment system:** Entities use event-driven component group swaps (not `minecraft:equippable`). Saddle/armor is applied via `minecraft:interact` filters that detect held items and trigger events like `minecraft:on_chest`, `minecraft:on_saddle`, or armor-specific events. Equipment state is tracked via `minecraft:is_saddled` and `minecraft:mark_variant`.
- **Taming:** 39 entities are tameable. All use `minecraft:on_tame` event. Tamed state is tracked via `minecraft:is_tamed` component in a tamed component group.
- **Cross-pack consistency:** Entity/item/block identifiers, loot table paths, and spawn rule filenames must stay in sync across BP and RP
- **Translations:** 5 language files in RP/texts/ (en_US, es_ES, es_MX, pt_PT, pt_BR). Requires RP/texts/languages.json to be present. Keys use both `item.worldanimals:name.name=` and `item.worldanimals:name=` formats for cross-version compatibility.

## Bedrock Command Syntax

- **Execute:** Use new syntax `execute as @e[...] at @s run <command>` (not legacy `execute @e[...] ~ ~ ~ <command>`)
- **Entity removal:** Use Script API `entity.remove()` for clean despawn without loot. `minecraft:instant_despawn` component does NOT work when added at runtime via events.
- **Color codes:** Use `§` section sign for colored text in .lang files (e.g., `§d` for light purple/Epic rarity)

## Working With Entities

Adding or modifying an entity typically requires changes in multiple locations:
1. **BP/entities/** — Server behavior (components, AI, health, loot)
2. **RP/entity/** — Client definition (model, texture, animation bindings)
3. **RP/models/entity/** — Geometry model (.geo.json)
4. **RP/textures/** — Texture image files
5. **RP/animations/** — Client animations
6. **RP/render_controllers/** — Render controller (if entity needs variant rendering)
7. **BP/spawn_rules/** — Spawn conditions (biome, light, herd size)
8. **BP/loot_tables/entities/** — Death/interaction drops

## Testing

```bash
npm run deploy   # Copy to Minecraft development packs
npm run build    # Create .mcaddon for distribution
```

Test in-game:
- `/summon worldanimals:<entity_name>` to test specific entities
- `/scriptevent worldanimals:refresh` to re-create all addon entities (preserves tame/armor state)
- `/scriptevent worldanimals:despawnall` to remove all addon entities cleanly
- Place/break each block type
- Craft items and verify recipes
- Check content log for errors after loading (`%APPDATA%/Minecraft Bedrock/Users/Shared/logs/`)

## Migration Notes (HCF to 1.21.20+)

This addon was migrated from Holiday Creator Features to stable Bedrock 1.21.20+ APIs. Key lessons:

### Block Migration
- `run_command` in entity events → `queue_command` (modern replacement)
- Block `on_player_placing` rotation events → `minecraft:placement_direction` trait with `y_rotation_offset: 180`
- Block `on_interact`/`queued_ticking`/`on_player_destroyed` → Script API custom components via `system.beforeEvents.startup`
- Custom components using `onTick` require `minecraft:tick` component declared on the block

### Item Migration (1.12/1.16.100 → 1.21.20)
- `minecraft:hand_equipped`, `minecraft:foil`, `minecraft:render_offsets`, `minecraft:stacked_by_data`, `minecraft:can_destroy_in_creative`, `minecraft:mining_speed` → remove entirely
- `minecraft:armor` → removed (deprecated in 1.21.20)
- `minecraft:food.saturation_modifier` must be numeric (not string like `"normal"`) — use: poor=0.2, low=0.6, normal=1.2, good=1.6, max=2.4
- `minecraft:food` requires `minecraft:use_modifiers: { use_duration: 1.6 }` as a sibling component
- `minecraft:food.effects` → removed (not valid in 1.21.20)
- `minecraft:icon: { texture: "x" }` → `minecraft:icon: "x"` (short form)
- `minecraft:damage: N` → `minecraft:damage: { value: N }`
- `minecraft:creative_category` in components → `menu_category` in description
- Items missing `minecraft:icon` will show no icon (old 1.12 format auto-derived icons; 1.21.20 requires explicit)
- `on_dig` in `minecraft:digger` → remove (not valid)
- `on_hurt_entity` in `minecraft:weapon` → remove (not valid)
- Item `events` section → remove entirely (item events removed with HCF)

### Entity Fixes
- `minecraft:fall_damage` and `minecraft:celebrate` → removed from schema, delete them
- `run_command` in entity events → `queue_command`
- Large animals need `minecraft:knockback_resistance: { value: 1.0 }` to prevent flying when hit
- Only one `minecraft:navigation.*` component allowed per entity — remove duplicates

### Resource Pack
- `RP/texts/languages.json` MUST exist listing language codes or lang files won't load
- Item translations: modern format is `item.namespace:id=Name` (no `.name` suffix), but keep both old and new format for compatibility
- Animation controllers reference short names that must be defined in every entity's `animations` block — if an entity uses a controller, it must map ALL short names that controller references
- Vanilla animation controllers (wolf.sitting, polarbear.baby, llama.move, dolphin.general) require specific short names: `wolf_sitting`, `baby_transform`, `look_at_target`, `general`, `walk`
- `sound_definitions.json` needs `format_version: "1.20.20"` wrapper
- Render controllers from vanilla (e.g., `controller.render.wolf`) may have been updated with new texture expectations — create addon-specific controllers instead

### Recipe Migration
- Remove all `"data": 0` entries
- Non-zero data values need flattening to modern item names (e.g., `minecraft:wool` data 11 → `minecraft:blue_wool`)
