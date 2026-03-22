import { world, system } from "@minecraft/server";

system.beforeEvents.startup.subscribe((initEvent) => {
  // =========================================================================
  // worldanimals:ore_xp — Spawn XP orb when ore block is broken by player
  // Used by: citrine_ore, deepslate_citrine_ore, ruby_ore, deepslate_ruby_ore
  // =========================================================================
  initEvent.blockComponentRegistry.registerCustomComponent("worldanimals:ore_xp", {
    onPlayerBreak(e) {
      const { x, y, z } = e.block.location;
      try {
        e.player.runCommand(`summon xp_orb ${x} ${y} ${z}`);
      } catch (_) {}
    },
  });

  // =========================================================================
  // worldanimals:turkey_eat — Cooked turkey slice cycling
  // Each interact advances the slice state (0→1→2→3→4→5→destroy).
  // Plays burp sound and gives saturation effect on each slice.
  // =========================================================================
  initEvent.blockComponentRegistry.registerCustomComponent("worldanimals:turkey_eat", {
    onPlayerInteract(e) {
      const block = e.block;
      const player = e.player;
      const { x, y, z } = block.location;
      const slices = block.permutation.getState("cooked_turkey:slices");

      if (slices >= 5) {
        // Last slice — destroy the block
        block.dimension.runCommand(`setblock ${x} ${y} ${z} air destroy`);
      } else {
        // Advance to next slice
        block.setPermutation(
          block.permutation.withState("cooked_turkey:slices", slices + 1)
        );
      }

      // Sound and saturation effect
      try {
        player.runCommand(`playsound random.burp @s ${x} ${y} ${z} 0.8`);
        player.runCommand(`effect @s saturation 1 9 true`);
      } catch (_) {}
    },
  });

  // =========================================================================
  // worldanimals:palm_sapling — Palm tree sapling growth
  // On interact with bone meal: particle + sound, 25% chance to grow into
  // a palm tree via structure load. Decrements bone meal stack.
  // On tick: auto-grow chance (replaces queued_ticking).
  // =========================================================================
  initEvent.blockComponentRegistry.registerCustomComponent("worldanimals:palm_sapling", {
    onPlayerInteract(e) {
      const block = e.block;
      const player = e.player;
      const { x, y, z } = block.location;

      // Check if player is holding bone meal
      const equip = player.getComponent("minecraft:equippable");
      if (!equip) return;
      const mainhand = equip.getEquipment("Mainhand");
      if (!mainhand || mainhand.typeId !== "minecraft:bone_meal") return;

      // Particle and sound
      try {
        player.runCommand(
          `particle minecraft:crop_growth_emitter ${x} ${y} ${z}`
        );
        player.runCommand(
          `playsound item.bone_meal.use @s ${x} ${y} ${z}`
        );
      } catch (_) {}

      // Decrement bone meal
      if (mainhand.amount > 1) {
        mainhand.amount -= 1;
        equip.setEquipment("Mainhand", mainhand);
      } else {
        equip.setEquipment("Mainhand", undefined);
      }

      // 25% chance to grow
      if (Math.random() < 0.25) {
        try {
          block.dimension.runCommand(
            `structure load mystructure:palm_2 ${x - 6} ${y} ${z - 5}`
          );
        } catch (_) {}
      }
    },

    onTick(e) {
      // Very low chance to auto-grow each tick (replaces queued_ticking 20000-25000 tick interval)
      // onTick fires every tick, so use ~1/22500 chance to approximate the old interval
      if (Math.random() < 0.000044) {
        const { x, y, z } = e.block.location;
        try {
          e.block.dimension.runCommand(
            `structure load mystructure:palm_2 ${x - 6} ${y} ${z - 5}`
          );
        } catch (_) {}
      }
    },
  });
});
