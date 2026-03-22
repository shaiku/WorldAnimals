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
      // Auto-grow chance. minecraft:tick fires every 20 ticks (1 second).
      // Old queued_ticking was 20000-25000 ticks (~1000-1250 seconds).
      // So ~1/1125 chance per tick call to approximate the old interval.
      if (Math.random() < 0.00089) {
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

// ===========================================================================
// Entity refresh & despawn system
// Triggered via: /scriptevent worldanimals:refresh
//                /scriptevent worldanimals:despawnall
// ===========================================================================

// Mark variant → armor event mapping for entities with equipment
const ARMOR_EVENTS = {
  "worldanimals:african_elephant": {
    saddleEvent: "minecraft:on_saddle",
    armorByMarkVariant: {
      1: "minecraft:ruby_armor",
      2: "minecraft:amethyst_armor",
      3: "minecraft:citrine_armor",
      4: "minecraft:diamond_armor",
      5: "minecraft:emerald_armor",
      6: "minecraft:golden_armor",
      7: "minecraft:iron_armor",
      8: "minecraft:netherite_armor",
      9: "minecraft:reptil_armor",
    },
  },
  "worldanimals:asian_elephant": {
    saddleEvent: "minecraft:on_saddle",
    armorByMarkVariant: {
      1: "minecraft:ruby_armor",
      2: "minecraft:amethyst_armor",
      3: "minecraft:citrine_armor",
      4: "minecraft:diamond_armor",
      5: "minecraft:emerald_armor",
      6: "minecraft:golden_armor",
      7: "minecraft:iron_armor",
      8: "minecraft:netherite_armor",
      9: "minecraft:reptil_armor",
    },
  },
  "worldanimals:mammoth": {
    saddleEvent: "minecraft:on_saddle",
    armorByMarkVariant: {
      1: "minecraft:ruby_armor",
      2: "minecraft:amethyst_armor",
      3: "minecraft:citrine_armor",
      4: "minecraft:diamond_armor",
      5: "minecraft:emerald_armor",
      6: "minecraft:golden_armor",
      7: "minecraft:iron_armor",
      8: "minecraft:netherite_armor",
      9: "minecraft:reptil_armor",
    },
  },
  "worldanimals:ostrich": {
    saddleEvent: "minecraft:on_saddle",
    armorByMarkVariant: {
      1: "minecraft:green_flag",
      2: "minecraft:red_flag",
      3: "minecraft:blue_flag",
      4: "minecraft:yellow_flag",
      5: "minecraft:orange_flag",
    },
  },
  "worldanimals:rhinoceros": {
    armorByMarkVariant: {
      1: "minecraft:gold_armor_on",
      2: "minecraft:iron_armor_on",
      3: "minecraft:diamond_armor_on",
      4: "minecraft:citrine_armor_on",
      5: "minecraft:ruby_armor_on",
      6: "minecraft:emerald_armor_on",
      7: "minecraft:netherite_armor_on",
    },
  },
};

// Entities that use minecraft:on_chest for simple saddle/mount state
const SADDLE_VIA_CHEST = new Set([
  "worldanimals:lion",
  "worldanimals:tiger",
  "worldanimals:leopard",
  "worldanimals:panther",
  "worldanimals:caracal",
  "worldanimals:cougar",
  "worldanimals:snow_leopard",
  "worldanimals:white_tiger",
  "worldanimals:white_lion",
  "worldanimals:penguin",
  "worldanimals:blue_penguin",
  "worldanimals:emperor_penguin",
  "worldanimals:penguin_african",
  "worldanimals:giraffe",
  "worldanimals:deer",
  "worldanimals:zebra",
]);

function captureState(entity) {
  const state = {
    typeId: entity.typeId,
    location: { x: entity.location.x, y: entity.location.y, z: entity.location.z },
    dimensionId: entity.dimension.id,
    isTamed: false,
    isSaddled: false,
    markVariant: 0,
    nameTag: entity.nameTag || "",
    tags: entity.getTags(),
  };

  try {
    state.isTamed = !!entity.getComponent("minecraft:is_tamed");
  } catch (_) {}

  try {
    state.isSaddled = !!entity.getComponent("minecraft:is_saddled");
  } catch (_) {}

  try {
    const mv = entity.getComponent("minecraft:mark_variant");
    if (mv) state.markVariant = mv.value;
  } catch (_) {}

  return state;
}

function restoreState(entity, state) {
  // Restore name tag
  if (state.nameTag) {
    try { entity.nameTag = state.nameTag; } catch (_) {}
  }

  // Restore scoreboard tags
  for (const tag of state.tags) {
    try { entity.addTag(tag); } catch (_) {}
  }

  // Restore tamed status
  if (state.isTamed) {
    try { entity.triggerEvent("minecraft:on_tame"); } catch (_) {}
  }

  // Restore armor (entities with mark_variant-based equipment)
  const armorConfig = ARMOR_EVENTS[state.typeId];
  if (armorConfig) {
    if (state.isSaddled && armorConfig.saddleEvent) {
      try { entity.triggerEvent(armorConfig.saddleEvent); } catch (_) {}
    }
    if (state.markVariant > 0 && armorConfig.armorByMarkVariant) {
      const armorEvent = armorConfig.armorByMarkVariant[state.markVariant];
      if (armorEvent) {
        try { entity.triggerEvent(armorEvent); } catch (_) {}
      }
    }
    return;
  }

  // Restore simple saddle/chest state
  if (state.isSaddled && SADDLE_VIA_CHEST.has(state.typeId)) {
    try { entity.triggerEvent("minecraft:on_chest"); } catch (_) {}
  }
}

function refreshEntities(player) {
  const dimIds = ["overworld", "nether", "the_end"];
  const snapshots = [];

  // Phase 1: Capture state and remove old entities
  for (const dimId of dimIds) {
    try {
      const dim = world.getDimension(dimId);
      for (const entity of dim.getEntities()) {
        if (entity.typeId.startsWith("worldanimals:")) {
          snapshots.push(captureState(entity));
          entity.remove();
        }
      }
    } catch (_) {}
  }

  // Phase 2: Spawn fresh replacements and restore state (next tick)
  system.runTimeout(() => {
    let restored = 0;
    for (const state of snapshots) {
      try {
        const dim = world.getDimension(state.dimensionId);
        const newEntity = dim.spawnEntity(state.typeId, state.location);
        restoreState(newEntity, state);
        restored++;
      } catch (_) {}
    }

    if (player) {
      try {
        player.sendMessage(
          `§aWorldAnimals refresh complete. ${restored}/${snapshots.length} entities refreshed.`
        );
      } catch (_) {}
    }
  }, 1);
}

function despawnAllEntities(player) {
  const dimIds = ["overworld", "nether", "the_end"];
  let count = 0;

  for (const dimId of dimIds) {
    try {
      const dim = world.getDimension(dimId);
      for (const entity of dim.getEntities()) {
        if (entity.typeId.startsWith("worldanimals:")) {
          entity.remove();
          count++;
        }
      }
    } catch (_) {}
  }

  if (player) {
    try {
      player.sendMessage(`§aRemoved ${count} WorldAnimals entities.`);
    } catch (_) {}
  }
}

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id === "worldanimals:refresh") {
    refreshEntities(event.sourceEntity);
  } else if (event.id === "worldanimals:despawnall") {
    despawnAllEntities(event.sourceEntity);
  }
});
