# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Minecraft Bedrock Edition addon** called "World Animals", created by ArathNido. It adds 70+ real-world animals, custom blocks, items, recipes, and world generation features. The addon uses Bedrock's native component system exclusively — there is no JavaScript/TypeScript scripting.

Minimum engine version: 1.17.0 (main packs), 1.20.30 (structure generation pack).

## Architecture

The project consists of three separate addon packs:

### 1. World Animals BehaviorPack (server-side data)
- **entities/** — Entity behavior definitions (~79 files). Some organized in subdirectories (chimpanzee/, crab/, hyena/, iguana/, stork/). Each entity uses the `worldanimals:` namespace identifier.
- **blocks/** — Custom blocks (bananas, gemstone ores/blocks, furniture). Has an `update/` subdirectory for block variants.
- **items/** — Custom items (~115 files) organized by category: saddles/, scarf/, armor/, astronaut/, butterfly/, rhyno_armor/, ruby_armor/, elephant_armor/, citrine_armor/, reptil_armor/.
- **recipes/** — Crafting recipes (~104 files), organized into subdirectories by material/entity type.
- **loot_tables/** — Drop tables (~81 files) split into `blocks/` and `entities/` subdirectories.
- **spawn_rules/** — Biome-specific spawn conditions (~78 files), generally 1:1 with entities.
- **animations/** — Server-side animation timelines (command-based effects, e.g., big_cat.json, bird.json).
- **animation_controllers/** — Server-side animation state machines.
- **features/** and **feature_rules/** — World generation for custom ores (citrine, ruby) and trees (palm, banana).
- **trading/** — Custom villager trade tables for ice and wild village NPCs.
- **structures/** — Structure template files (.mcstructure) for world generation.

### 2. World Animals TexturePack (client-side resources)
- **entity/** — Client-side entity definitions (render bindings, textures, geometry references).
- **models/entity/** — Geometry models (~115 .geo.json files). Subdirectories: armor/, elytra/, morph/.
- **animations/** — Client-side skeletal animations (~65 files).
- **animation_controllers/** — Client-side animation state machines. Has elytras/ subdirectory.
- **render_controllers/** — Render controller definitions (~32 files) handling variants, equipment layers.
- **textures/** — Entity and block texture images.
- **attachables/** — First-person item/armor rendering (citrine armor, ruby armor, reptil armor, etc.).
- **sounds/** and **sounds.json** — Custom sound definitions.
- **blocks.json** — Block texture atlas mappings.
- **materials/** — Custom material/shader definitions.
- **particles/** — Particle effect definitions.

### 3. World Animals [Structure generation] BehaviorPack (supplementary)
- Separate pack (min engine 1.20.30) dedicated to structure template features and feature rules.
- Contains its own features/ and feature_rules/ for structure placement.

## Key Patterns

- **Entity namespace:** All custom entities use `worldanimals:` prefix (e.g., `worldanimals:lion`, `worldanimals:elephant`).
- **Naming convention:** snake_case throughout all filenames and identifiers.
- **Entity variants:** Component groups handle age (baby/adult), gender (male/female), and visual variants. Babies typically use 0.5–0.7 scale.
- **Breeding system:** Most animals support breeding via `minecraft:breedable` with specific food items.
- **Equipment system:** Many large animals support saddles, armor, and accessories via layered render controllers and attachable models.
- **Format versions:** Entity definitions use format_version 1.13.0 or 1.16.0. Features use 1.13.0. Manifests use format_version 2.
- **Cross-pack consistency:** Entity identifiers, item identifiers, loot table paths, and spawn rule filenames must stay in sync across both packs.

## Working With Entities

Adding or modifying an entity typically requires changes in multiple locations:
1. **BehaviorPack/entities/** — Server behavior (components, AI, health, loot)
2. **TexturePack/entity/** — Client definition (model, texture, animation bindings)
3. **TexturePack/models/entity/** — Geometry model (.geo.json)
4. **TexturePack/textures/** — Texture image files
5. **TexturePack/animations/** — Client animations
6. **TexturePack/render_controllers/** — Render controller (if entity needs variant rendering)
7. **BehaviorPack/spawn_rules/** — Spawn conditions (biome, light, herd size)
8. **BehaviorPack/loot_tables/entities/** — Death/interaction drops

## Testing

There is no automated test suite. Testing is done by loading the addon into Minecraft Bedrock Edition. To test:
1. Copy/symlink the three pack directories into the Minecraft Bedrock `development_behavior_packs` and `development_resource_packs` folders.
2. Create or edit a world with the packs enabled.
3. Use `/summon worldanimals:<entity_name>` to test specific entities.
