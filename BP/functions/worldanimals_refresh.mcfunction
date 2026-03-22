# Refresh all WorldAnimals entities - removes old and spawns fresh replacements
# Use this to fix worlds after addon updates
# Tamed entities are preserved (skipped)

# Phase 1: Tag all wild (untamed) worldanimals entities for refresh
tag @e[type=worldanimals:african_elephant,family=!tamed] add wa_refresh
tag @e[type=worldanimals:african_penguin_egg] add wa_refresh
tag @e[type=worldanimals:ant] add wa_refresh
tag @e[type=worldanimals:asian_elephant,family=!tamed] add wa_refresh
tag @e[type=worldanimals:bag_items] add wa_refresh
tag @e[type=worldanimals:ballena] add wa_refresh
tag @e[type=worldanimals:bear] add wa_refresh
tag @e[type=worldanimals:black_bear] add wa_refresh
tag @e[type=worldanimals:blue_penguin,family=!tamed] add wa_refresh
tag @e[type=worldanimals:blue_penguin_egg] add wa_refresh
tag @e[type=worldanimals:buffalo] add wa_refresh
tag @e[type=worldanimals:butterfly] add wa_refresh
tag @e[type=worldanimals:capuchin_monkeys,family=!tamed] add wa_refresh
tag @e[type=worldanimals:caracal,family=!tamed] add wa_refresh
tag @e[type=worldanimals:chimpanzee,family=!tamed] add wa_refresh
tag @e[type=worldanimals:clam] add wa_refresh
tag @e[type=worldanimals:cougar,family=!tamed] add wa_refresh
tag @e[type=worldanimals:crab] add wa_refresh
tag @e[type=worldanimals:crocodile,family=!tamed] add wa_refresh
tag @e[type=worldanimals:cyanocitta_cristata,family=!tamed] add wa_refresh
tag @e[type=worldanimals:deer,family=!tamed] add wa_refresh
tag @e[type=worldanimals:dove,family=!tamed] add wa_refresh
tag @e[type=worldanimals:duck] add wa_refresh
tag @e[type=worldanimals:duck_egg] add wa_refresh
tag @e[type=worldanimals:eagle] add wa_refresh
tag @e[type=worldanimals:emperor_penguin,family=!tamed] add wa_refresh
tag @e[type=worldanimals:emperor_penguin_egg] add wa_refresh
tag @e[type=worldanimals:erizo,family=!tamed] add wa_refresh
tag @e[type=worldanimals:flamingo] add wa_refresh
tag @e[type=worldanimals:giraffe,family=!tamed] add wa_refresh
tag @e[type=worldanimals:gorilla,family=!tamed] add wa_refresh
tag @e[type=worldanimals:hammerhead_shark] add wa_refresh
tag @e[type=worldanimals:hippopotamus] add wa_refresh
tag @e[type=worldanimals:hyenas,family=!tamed] add wa_refresh
tag @e[type=worldanimals:iguana,family=!tamed] add wa_refresh
tag @e[type=worldanimals:jellyfish_wa] add wa_refresh
tag @e[type=worldanimals:kangaroo] add wa_refresh
tag @e[type=worldanimals:kiwi,family=!tamed] add wa_refresh
tag @e[type=worldanimals:komodo_dragon,family=!tamed] add wa_refresh
tag @e[type=worldanimals:land_turtle,family=!tamed] add wa_refresh
tag @e[type=worldanimals:lantern_fish] add wa_refresh
tag @e[type=worldanimals:leopard,family=!tamed] add wa_refresh
tag @e[type=worldanimals:lion,family=!tamed] add wa_refresh
tag @e[type=worldanimals:lucienaga] add wa_refresh
tag @e[type=worldanimals:mammoth,family=!tamed] add wa_refresh
tag @e[type=worldanimals:orca] add wa_refresh
tag @e[type=worldanimals:ornitorrinco_original,family=!tamed] add wa_refresh
tag @e[type=worldanimals:ostrich,family=!tamed] add wa_refresh
tag @e[type=worldanimals:ostrich_egg] add wa_refresh
tag @e[type=worldanimals:panther,family=!tamed] add wa_refresh
tag @e[type=worldanimals:pelican] add wa_refresh
tag @e[type=worldanimals:penguin,family=!tamed] add wa_refresh
tag @e[type=worldanimals:penguin_african,family=!tamed] add wa_refresh
tag @e[type=worldanimals:pink_dolphin] add wa_refresh
tag @e[type=worldanimals:raccoon,family=!tamed] add wa_refresh
tag @e[type=worldanimals:rat,family=!tamed] add wa_refresh
tag @e[type=worldanimals:real_penguin_egg] add wa_refresh
tag @e[type=worldanimals:red_panda,family=!tamed] add wa_refresh
tag @e[type=worldanimals:rhinoceros,family=!tamed] add wa_refresh
tag @e[type=worldanimals:seagull] add wa_refresh
tag @e[type=worldanimals:seal,family=!tamed] add wa_refresh
tag @e[type=worldanimals:shark] add wa_refresh
tag @e[type=worldanimals:shrimp] add wa_refresh
tag @e[type=worldanimals:snail] add wa_refresh
tag @e[type=worldanimals:snake] add wa_refresh
tag @e[type=worldanimals:snake_coral] add wa_refresh
tag @e[type=worldanimals:snake_scarlet,family=!tamed] add wa_refresh
tag @e[type=worldanimals:snow_leopard,family=!tamed] add wa_refresh
tag @e[type=worldanimals:squirrel] add wa_refresh
tag @e[type=worldanimals:stingray] add wa_refresh
tag @e[type=worldanimals:stork] add wa_refresh
tag @e[type=worldanimals:swordfish] add wa_refresh
tag @e[type=worldanimals:tiger,family=!tamed] add wa_refresh
tag @e[type=worldanimals:tiger_shark] add wa_refresh
tag @e[type=worldanimals:tucan,family=!tamed] add wa_refresh
tag @e[type=worldanimals:turkey] add wa_refresh
tag @e[type=worldanimals:turkey_egg] add wa_refresh
tag @e[type=worldanimals:village_ice] add wa_refresh
tag @e[type=worldanimals:village_wild] add wa_refresh
tag @e[type=worldanimals:vulture] add wa_refresh
tag @e[type=worldanimals:white_lion,family=!tamed] add wa_refresh
tag @e[type=worldanimals:white_shark] add wa_refresh
tag @e[type=worldanimals:white_tiger,family=!tamed] add wa_refresh
tag @e[type=worldanimals:wild_boar] add wa_refresh
tag @e[type=worldanimals:zebra,family=!tamed] add wa_refresh

# Phase 2: Summon fresh replacements at each tagged entity's position
execute as @e[type=worldanimals:african_elephant,tag=wa_refresh] at @s run summon worldanimals:african_elephant
execute as @e[type=worldanimals:african_penguin_egg,tag=wa_refresh] at @s run summon worldanimals:african_penguin_egg
execute as @e[type=worldanimals:ant,tag=wa_refresh] at @s run summon worldanimals:ant
execute as @e[type=worldanimals:asian_elephant,tag=wa_refresh] at @s run summon worldanimals:asian_elephant
execute as @e[type=worldanimals:bag_items,tag=wa_refresh] at @s run summon worldanimals:bag_items
execute as @e[type=worldanimals:ballena,tag=wa_refresh] at @s run summon worldanimals:ballena
execute as @e[type=worldanimals:bear,tag=wa_refresh] at @s run summon worldanimals:bear
execute as @e[type=worldanimals:black_bear,tag=wa_refresh] at @s run summon worldanimals:black_bear
execute as @e[type=worldanimals:blue_penguin,tag=wa_refresh] at @s run summon worldanimals:blue_penguin
execute as @e[type=worldanimals:blue_penguin_egg,tag=wa_refresh] at @s run summon worldanimals:blue_penguin_egg
execute as @e[type=worldanimals:buffalo,tag=wa_refresh] at @s run summon worldanimals:buffalo
execute as @e[type=worldanimals:butterfly,tag=wa_refresh] at @s run summon worldanimals:butterfly
execute as @e[type=worldanimals:capuchin_monkeys,tag=wa_refresh] at @s run summon worldanimals:capuchin_monkeys
execute as @e[type=worldanimals:caracal,tag=wa_refresh] at @s run summon worldanimals:caracal
execute as @e[type=worldanimals:chimpanzee,tag=wa_refresh] at @s run summon worldanimals:chimpanzee
execute as @e[type=worldanimals:clam,tag=wa_refresh] at @s run summon worldanimals:clam
execute as @e[type=worldanimals:cougar,tag=wa_refresh] at @s run summon worldanimals:cougar
execute as @e[type=worldanimals:crab,tag=wa_refresh] at @s run summon worldanimals:crab
execute as @e[type=worldanimals:crocodile,tag=wa_refresh] at @s run summon worldanimals:crocodile
execute as @e[type=worldanimals:cyanocitta_cristata,tag=wa_refresh] at @s run summon worldanimals:cyanocitta_cristata
execute as @e[type=worldanimals:deer,tag=wa_refresh] at @s run summon worldanimals:deer
execute as @e[type=worldanimals:dove,tag=wa_refresh] at @s run summon worldanimals:dove
execute as @e[type=worldanimals:duck,tag=wa_refresh] at @s run summon worldanimals:duck
execute as @e[type=worldanimals:duck_egg,tag=wa_refresh] at @s run summon worldanimals:duck_egg
execute as @e[type=worldanimals:eagle,tag=wa_refresh] at @s run summon worldanimals:eagle
execute as @e[type=worldanimals:emperor_penguin,tag=wa_refresh] at @s run summon worldanimals:emperor_penguin
execute as @e[type=worldanimals:emperor_penguin_egg,tag=wa_refresh] at @s run summon worldanimals:emperor_penguin_egg
execute as @e[type=worldanimals:erizo,tag=wa_refresh] at @s run summon worldanimals:erizo
execute as @e[type=worldanimals:flamingo,tag=wa_refresh] at @s run summon worldanimals:flamingo
execute as @e[type=worldanimals:giraffe,tag=wa_refresh] at @s run summon worldanimals:giraffe
execute as @e[type=worldanimals:gorilla,tag=wa_refresh] at @s run summon worldanimals:gorilla
execute as @e[type=worldanimals:hammerhead_shark,tag=wa_refresh] at @s run summon worldanimals:hammerhead_shark
execute as @e[type=worldanimals:hippopotamus,tag=wa_refresh] at @s run summon worldanimals:hippopotamus
execute as @e[type=worldanimals:hyenas,tag=wa_refresh] at @s run summon worldanimals:hyenas
execute as @e[type=worldanimals:iguana,tag=wa_refresh] at @s run summon worldanimals:iguana
execute as @e[type=worldanimals:jellyfish_wa,tag=wa_refresh] at @s run summon worldanimals:jellyfish_wa
execute as @e[type=worldanimals:kangaroo,tag=wa_refresh] at @s run summon worldanimals:kangaroo
execute as @e[type=worldanimals:kiwi,tag=wa_refresh] at @s run summon worldanimals:kiwi
execute as @e[type=worldanimals:komodo_dragon,tag=wa_refresh] at @s run summon worldanimals:komodo_dragon
execute as @e[type=worldanimals:land_turtle,tag=wa_refresh] at @s run summon worldanimals:land_turtle
execute as @e[type=worldanimals:lantern_fish,tag=wa_refresh] at @s run summon worldanimals:lantern_fish
execute as @e[type=worldanimals:leopard,tag=wa_refresh] at @s run summon worldanimals:leopard
execute as @e[type=worldanimals:lion,tag=wa_refresh] at @s run summon worldanimals:lion
execute as @e[type=worldanimals:lucienaga,tag=wa_refresh] at @s run summon worldanimals:lucienaga
execute as @e[type=worldanimals:mammoth,tag=wa_refresh] at @s run summon worldanimals:mammoth
execute as @e[type=worldanimals:orca,tag=wa_refresh] at @s run summon worldanimals:orca
execute as @e[type=worldanimals:ornitorrinco_original,tag=wa_refresh] at @s run summon worldanimals:ornitorrinco_original
execute as @e[type=worldanimals:ostrich,tag=wa_refresh] at @s run summon worldanimals:ostrich
execute as @e[type=worldanimals:ostrich_egg,tag=wa_refresh] at @s run summon worldanimals:ostrich_egg
execute as @e[type=worldanimals:panther,tag=wa_refresh] at @s run summon worldanimals:panther
execute as @e[type=worldanimals:pelican,tag=wa_refresh] at @s run summon worldanimals:pelican
execute as @e[type=worldanimals:penguin,tag=wa_refresh] at @s run summon worldanimals:penguin
execute as @e[type=worldanimals:penguin_african,tag=wa_refresh] at @s run summon worldanimals:penguin_african
execute as @e[type=worldanimals:pink_dolphin,tag=wa_refresh] at @s run summon worldanimals:pink_dolphin
execute as @e[type=worldanimals:raccoon,tag=wa_refresh] at @s run summon worldanimals:raccoon
execute as @e[type=worldanimals:rat,tag=wa_refresh] at @s run summon worldanimals:rat
execute as @e[type=worldanimals:real_penguin_egg,tag=wa_refresh] at @s run summon worldanimals:real_penguin_egg
execute as @e[type=worldanimals:red_panda,tag=wa_refresh] at @s run summon worldanimals:red_panda
execute as @e[type=worldanimals:rhinoceros,tag=wa_refresh] at @s run summon worldanimals:rhinoceros
execute as @e[type=worldanimals:seagull,tag=wa_refresh] at @s run summon worldanimals:seagull
execute as @e[type=worldanimals:seal,tag=wa_refresh] at @s run summon worldanimals:seal
execute as @e[type=worldanimals:shark,tag=wa_refresh] at @s run summon worldanimals:shark
execute as @e[type=worldanimals:shrimp,tag=wa_refresh] at @s run summon worldanimals:shrimp
execute as @e[type=worldanimals:snail,tag=wa_refresh] at @s run summon worldanimals:snail
execute as @e[type=worldanimals:snake,tag=wa_refresh] at @s run summon worldanimals:snake
execute as @e[type=worldanimals:snake_coral,tag=wa_refresh] at @s run summon worldanimals:snake_coral
execute as @e[type=worldanimals:snake_scarlet,tag=wa_refresh] at @s run summon worldanimals:snake_scarlet
execute as @e[type=worldanimals:snow_leopard,tag=wa_refresh] at @s run summon worldanimals:snow_leopard
execute as @e[type=worldanimals:squirrel,tag=wa_refresh] at @s run summon worldanimals:squirrel
execute as @e[type=worldanimals:stingray,tag=wa_refresh] at @s run summon worldanimals:stingray
execute as @e[type=worldanimals:stork,tag=wa_refresh] at @s run summon worldanimals:stork
execute as @e[type=worldanimals:swordfish,tag=wa_refresh] at @s run summon worldanimals:swordfish
execute as @e[type=worldanimals:tiger,tag=wa_refresh] at @s run summon worldanimals:tiger
execute as @e[type=worldanimals:tiger_shark,tag=wa_refresh] at @s run summon worldanimals:tiger_shark
execute as @e[type=worldanimals:tucan,tag=wa_refresh] at @s run summon worldanimals:tucan
execute as @e[type=worldanimals:turkey,tag=wa_refresh] at @s run summon worldanimals:turkey
execute as @e[type=worldanimals:turkey_egg,tag=wa_refresh] at @s run summon worldanimals:turkey_egg
execute as @e[type=worldanimals:village_ice,tag=wa_refresh] at @s run summon worldanimals:village_ice
execute as @e[type=worldanimals:village_wild,tag=wa_refresh] at @s run summon worldanimals:village_wild
execute as @e[type=worldanimals:vulture,tag=wa_refresh] at @s run summon worldanimals:vulture
execute as @e[type=worldanimals:white_lion,tag=wa_refresh] at @s run summon worldanimals:white_lion
execute as @e[type=worldanimals:white_shark,tag=wa_refresh] at @s run summon worldanimals:white_shark
execute as @e[type=worldanimals:white_tiger,tag=wa_refresh] at @s run summon worldanimals:white_tiger
execute as @e[type=worldanimals:wild_boar,tag=wa_refresh] at @s run summon worldanimals:wild_boar
execute as @e[type=worldanimals:zebra,tag=wa_refresh] at @s run summon worldanimals:zebra

# Phase 3: Instantly despawn all old entities (no loot drops)
event entity @e[tag=wa_refresh] worldanimals:despawn
