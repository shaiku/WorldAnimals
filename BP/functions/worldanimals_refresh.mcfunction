# Refresh all WorldAnimals entities - removes old and spawns fresh replacements
# Use this to fix worlds after addon updates

# Phase 1: Tag all existing worldanimals entities for removal
tag @e[type=worldanimals:african_elephant] add wa_refresh
tag @e[type=worldanimals:african_penguin_egg] add wa_refresh
tag @e[type=worldanimals:ant] add wa_refresh
tag @e[type=worldanimals:asian_elephant] add wa_refresh
tag @e[type=worldanimals:bag_items] add wa_refresh
tag @e[type=worldanimals:ballena] add wa_refresh
tag @e[type=worldanimals:bear] add wa_refresh
tag @e[type=worldanimals:black_bear] add wa_refresh
tag @e[type=worldanimals:blue_penguin] add wa_refresh
tag @e[type=worldanimals:blue_penguin_egg] add wa_refresh
tag @e[type=worldanimals:buffalo] add wa_refresh
tag @e[type=worldanimals:butterfly] add wa_refresh
tag @e[type=worldanimals:capuchin_monkeys] add wa_refresh
tag @e[type=worldanimals:caracal] add wa_refresh
tag @e[type=worldanimals:chimpanzee] add wa_refresh
tag @e[type=worldanimals:clam] add wa_refresh
tag @e[type=worldanimals:cougar] add wa_refresh
tag @e[type=worldanimals:crab] add wa_refresh
tag @e[type=worldanimals:crocodile] add wa_refresh
tag @e[type=worldanimals:cyanocitta_cristata] add wa_refresh
tag @e[type=worldanimals:deer] add wa_refresh
tag @e[type=worldanimals:dove] add wa_refresh
tag @e[type=worldanimals:duck] add wa_refresh
tag @e[type=worldanimals:duck_egg] add wa_refresh
tag @e[type=worldanimals:eagle] add wa_refresh
tag @e[type=worldanimals:emperor_penguin] add wa_refresh
tag @e[type=worldanimals:emperor_penguin_egg] add wa_refresh
tag @e[type=worldanimals:erizo] add wa_refresh
tag @e[type=worldanimals:flamingo] add wa_refresh
tag @e[type=worldanimals:giraffe] add wa_refresh
tag @e[type=worldanimals:gorilla] add wa_refresh
tag @e[type=worldanimals:hammerhead_shark] add wa_refresh
tag @e[type=worldanimals:hippopotamus] add wa_refresh
tag @e[type=worldanimals:hyenas] add wa_refresh
tag @e[type=worldanimals:iguana] add wa_refresh
tag @e[type=worldanimals:jellyfish_wa] add wa_refresh
tag @e[type=worldanimals:kangaroo] add wa_refresh
tag @e[type=worldanimals:kiwi] add wa_refresh
tag @e[type=worldanimals:komodo_dragon] add wa_refresh
tag @e[type=worldanimals:land_turtle] add wa_refresh
tag @e[type=worldanimals:lantern_fish] add wa_refresh
tag @e[type=worldanimals:leopard] add wa_refresh
tag @e[type=worldanimals:lion] add wa_refresh
tag @e[type=worldanimals:lucienaga] add wa_refresh
tag @e[type=worldanimals:mammoth] add wa_refresh
tag @e[type=worldanimals:orca] add wa_refresh
tag @e[type=worldanimals:ornitorrinco_original] add wa_refresh
tag @e[type=worldanimals:ostrich] add wa_refresh
tag @e[type=worldanimals:ostrich_egg] add wa_refresh
tag @e[type=worldanimals:panther] add wa_refresh
tag @e[type=worldanimals:pelican] add wa_refresh
tag @e[type=worldanimals:penguin] add wa_refresh
tag @e[type=worldanimals:penguin_african] add wa_refresh
tag @e[type=worldanimals:pink_dolphin] add wa_refresh
tag @e[type=worldanimals:raccoon] add wa_refresh
tag @e[type=worldanimals:rat] add wa_refresh
tag @e[type=worldanimals:real_penguin_egg] add wa_refresh
tag @e[type=worldanimals:red_panda] add wa_refresh
tag @e[type=worldanimals:rhinoceros] add wa_refresh
tag @e[type=worldanimals:seagull] add wa_refresh
tag @e[type=worldanimals:seal] add wa_refresh
tag @e[type=worldanimals:shark] add wa_refresh
tag @e[type=worldanimals:shrimp] add wa_refresh
tag @e[type=worldanimals:snail] add wa_refresh
tag @e[type=worldanimals:snake] add wa_refresh
tag @e[type=worldanimals:snake_coral] add wa_refresh
tag @e[type=worldanimals:snake_scarlet] add wa_refresh
tag @e[type=worldanimals:snow_leopard] add wa_refresh
tag @e[type=worldanimals:squirrel] add wa_refresh
tag @e[type=worldanimals:stingray] add wa_refresh
tag @e[type=worldanimals:stork] add wa_refresh
tag @e[type=worldanimals:swordfish] add wa_refresh
tag @e[type=worldanimals:tiger] add wa_refresh
tag @e[type=worldanimals:tiger_shark] add wa_refresh
tag @e[type=worldanimals:tucan] add wa_refresh
tag @e[type=worldanimals:turkey] add wa_refresh
tag @e[type=worldanimals:turkey_egg] add wa_refresh
tag @e[type=worldanimals:village_ice] add wa_refresh
tag @e[type=worldanimals:village_wild] add wa_refresh
tag @e[type=worldanimals:vulture] add wa_refresh
tag @e[type=worldanimals:white_lion] add wa_refresh
tag @e[type=worldanimals:white_shark] add wa_refresh
tag @e[type=worldanimals:white_tiger] add wa_refresh
tag @e[type=worldanimals:wild_boar] add wa_refresh
tag @e[type=worldanimals:zebra] add wa_refresh

# Phase 2: Summon fresh replacements at each old entity's position
execute @e[type=worldanimals:african_elephant,tag=wa_refresh] ~ ~ ~ summon worldanimals:african_elephant ~ ~ ~
execute @e[type=worldanimals:african_penguin_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:african_penguin_egg ~ ~ ~
execute @e[type=worldanimals:ant,tag=wa_refresh] ~ ~ ~ summon worldanimals:ant ~ ~ ~
execute @e[type=worldanimals:asian_elephant,tag=wa_refresh] ~ ~ ~ summon worldanimals:asian_elephant ~ ~ ~
execute @e[type=worldanimals:bag_items,tag=wa_refresh] ~ ~ ~ summon worldanimals:bag_items ~ ~ ~
execute @e[type=worldanimals:ballena,tag=wa_refresh] ~ ~ ~ summon worldanimals:ballena ~ ~ ~
execute @e[type=worldanimals:bear,tag=wa_refresh] ~ ~ ~ summon worldanimals:bear ~ ~ ~
execute @e[type=worldanimals:black_bear,tag=wa_refresh] ~ ~ ~ summon worldanimals:black_bear ~ ~ ~
execute @e[type=worldanimals:blue_penguin,tag=wa_refresh] ~ ~ ~ summon worldanimals:blue_penguin ~ ~ ~
execute @e[type=worldanimals:blue_penguin_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:blue_penguin_egg ~ ~ ~
execute @e[type=worldanimals:buffalo,tag=wa_refresh] ~ ~ ~ summon worldanimals:buffalo ~ ~ ~
execute @e[type=worldanimals:butterfly,tag=wa_refresh] ~ ~ ~ summon worldanimals:butterfly ~ ~ ~
execute @e[type=worldanimals:capuchin_monkeys,tag=wa_refresh] ~ ~ ~ summon worldanimals:capuchin_monkeys ~ ~ ~
execute @e[type=worldanimals:caracal,tag=wa_refresh] ~ ~ ~ summon worldanimals:caracal ~ ~ ~
execute @e[type=worldanimals:chimpanzee,tag=wa_refresh] ~ ~ ~ summon worldanimals:chimpanzee ~ ~ ~
execute @e[type=worldanimals:clam,tag=wa_refresh] ~ ~ ~ summon worldanimals:clam ~ ~ ~
execute @e[type=worldanimals:cougar,tag=wa_refresh] ~ ~ ~ summon worldanimals:cougar ~ ~ ~
execute @e[type=worldanimals:crab,tag=wa_refresh] ~ ~ ~ summon worldanimals:crab ~ ~ ~
execute @e[type=worldanimals:crocodile,tag=wa_refresh] ~ ~ ~ summon worldanimals:crocodile ~ ~ ~
execute @e[type=worldanimals:cyanocitta_cristata,tag=wa_refresh] ~ ~ ~ summon worldanimals:cyanocitta_cristata ~ ~ ~
execute @e[type=worldanimals:deer,tag=wa_refresh] ~ ~ ~ summon worldanimals:deer ~ ~ ~
execute @e[type=worldanimals:dove,tag=wa_refresh] ~ ~ ~ summon worldanimals:dove ~ ~ ~
execute @e[type=worldanimals:duck,tag=wa_refresh] ~ ~ ~ summon worldanimals:duck ~ ~ ~
execute @e[type=worldanimals:duck_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:duck_egg ~ ~ ~
execute @e[type=worldanimals:eagle,tag=wa_refresh] ~ ~ ~ summon worldanimals:eagle ~ ~ ~
execute @e[type=worldanimals:emperor_penguin,tag=wa_refresh] ~ ~ ~ summon worldanimals:emperor_penguin ~ ~ ~
execute @e[type=worldanimals:emperor_penguin_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:emperor_penguin_egg ~ ~ ~
execute @e[type=worldanimals:erizo,tag=wa_refresh] ~ ~ ~ summon worldanimals:erizo ~ ~ ~
execute @e[type=worldanimals:flamingo,tag=wa_refresh] ~ ~ ~ summon worldanimals:flamingo ~ ~ ~
execute @e[type=worldanimals:giraffe,tag=wa_refresh] ~ ~ ~ summon worldanimals:giraffe ~ ~ ~
execute @e[type=worldanimals:gorilla,tag=wa_refresh] ~ ~ ~ summon worldanimals:gorilla ~ ~ ~
execute @e[type=worldanimals:hammerhead_shark,tag=wa_refresh] ~ ~ ~ summon worldanimals:hammerhead_shark ~ ~ ~
execute @e[type=worldanimals:hippopotamus,tag=wa_refresh] ~ ~ ~ summon worldanimals:hippopotamus ~ ~ ~
execute @e[type=worldanimals:hyenas,tag=wa_refresh] ~ ~ ~ summon worldanimals:hyenas ~ ~ ~
execute @e[type=worldanimals:iguana,tag=wa_refresh] ~ ~ ~ summon worldanimals:iguana ~ ~ ~
execute @e[type=worldanimals:jellyfish_wa,tag=wa_refresh] ~ ~ ~ summon worldanimals:jellyfish_wa ~ ~ ~
execute @e[type=worldanimals:kangaroo,tag=wa_refresh] ~ ~ ~ summon worldanimals:kangaroo ~ ~ ~
execute @e[type=worldanimals:kiwi,tag=wa_refresh] ~ ~ ~ summon worldanimals:kiwi ~ ~ ~
execute @e[type=worldanimals:komodo_dragon,tag=wa_refresh] ~ ~ ~ summon worldanimals:komodo_dragon ~ ~ ~
execute @e[type=worldanimals:land_turtle,tag=wa_refresh] ~ ~ ~ summon worldanimals:land_turtle ~ ~ ~
execute @e[type=worldanimals:lantern_fish,tag=wa_refresh] ~ ~ ~ summon worldanimals:lantern_fish ~ ~ ~
execute @e[type=worldanimals:leopard,tag=wa_refresh] ~ ~ ~ summon worldanimals:leopard ~ ~ ~
execute @e[type=worldanimals:lion,tag=wa_refresh] ~ ~ ~ summon worldanimals:lion ~ ~ ~
execute @e[type=worldanimals:lucienaga,tag=wa_refresh] ~ ~ ~ summon worldanimals:lucienaga ~ ~ ~
execute @e[type=worldanimals:mammoth,tag=wa_refresh] ~ ~ ~ summon worldanimals:mammoth ~ ~ ~
execute @e[type=worldanimals:orca,tag=wa_refresh] ~ ~ ~ summon worldanimals:orca ~ ~ ~
execute @e[type=worldanimals:ornitorrinco_original,tag=wa_refresh] ~ ~ ~ summon worldanimals:ornitorrinco_original ~ ~ ~
execute @e[type=worldanimals:ostrich,tag=wa_refresh] ~ ~ ~ summon worldanimals:ostrich ~ ~ ~
execute @e[type=worldanimals:ostrich_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:ostrich_egg ~ ~ ~
execute @e[type=worldanimals:panther,tag=wa_refresh] ~ ~ ~ summon worldanimals:panther ~ ~ ~
execute @e[type=worldanimals:pelican,tag=wa_refresh] ~ ~ ~ summon worldanimals:pelican ~ ~ ~
execute @e[type=worldanimals:penguin,tag=wa_refresh] ~ ~ ~ summon worldanimals:penguin ~ ~ ~
execute @e[type=worldanimals:penguin_african,tag=wa_refresh] ~ ~ ~ summon worldanimals:penguin_african ~ ~ ~
execute @e[type=worldanimals:pink_dolphin,tag=wa_refresh] ~ ~ ~ summon worldanimals:pink_dolphin ~ ~ ~
execute @e[type=worldanimals:raccoon,tag=wa_refresh] ~ ~ ~ summon worldanimals:raccoon ~ ~ ~
execute @e[type=worldanimals:rat,tag=wa_refresh] ~ ~ ~ summon worldanimals:rat ~ ~ ~
execute @e[type=worldanimals:real_penguin_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:real_penguin_egg ~ ~ ~
execute @e[type=worldanimals:red_panda,tag=wa_refresh] ~ ~ ~ summon worldanimals:red_panda ~ ~ ~
execute @e[type=worldanimals:rhinoceros,tag=wa_refresh] ~ ~ ~ summon worldanimals:rhinoceros ~ ~ ~
execute @e[type=worldanimals:seagull,tag=wa_refresh] ~ ~ ~ summon worldanimals:seagull ~ ~ ~
execute @e[type=worldanimals:seal,tag=wa_refresh] ~ ~ ~ summon worldanimals:seal ~ ~ ~
execute @e[type=worldanimals:shark,tag=wa_refresh] ~ ~ ~ summon worldanimals:shark ~ ~ ~
execute @e[type=worldanimals:shrimp,tag=wa_refresh] ~ ~ ~ summon worldanimals:shrimp ~ ~ ~
execute @e[type=worldanimals:snail,tag=wa_refresh] ~ ~ ~ summon worldanimals:snail ~ ~ ~
execute @e[type=worldanimals:snake,tag=wa_refresh] ~ ~ ~ summon worldanimals:snake ~ ~ ~
execute @e[type=worldanimals:snake_coral,tag=wa_refresh] ~ ~ ~ summon worldanimals:snake_coral ~ ~ ~
execute @e[type=worldanimals:snake_scarlet,tag=wa_refresh] ~ ~ ~ summon worldanimals:snake_scarlet ~ ~ ~
execute @e[type=worldanimals:snow_leopard,tag=wa_refresh] ~ ~ ~ summon worldanimals:snow_leopard ~ ~ ~
execute @e[type=worldanimals:squirrel,tag=wa_refresh] ~ ~ ~ summon worldanimals:squirrel ~ ~ ~
execute @e[type=worldanimals:stingray,tag=wa_refresh] ~ ~ ~ summon worldanimals:stingray ~ ~ ~
execute @e[type=worldanimals:stork,tag=wa_refresh] ~ ~ ~ summon worldanimals:stork ~ ~ ~
execute @e[type=worldanimals:swordfish,tag=wa_refresh] ~ ~ ~ summon worldanimals:swordfish ~ ~ ~
execute @e[type=worldanimals:tiger,tag=wa_refresh] ~ ~ ~ summon worldanimals:tiger ~ ~ ~
execute @e[type=worldanimals:tiger_shark,tag=wa_refresh] ~ ~ ~ summon worldanimals:tiger_shark ~ ~ ~
execute @e[type=worldanimals:tucan,tag=wa_refresh] ~ ~ ~ summon worldanimals:tucan ~ ~ ~
execute @e[type=worldanimals:turkey,tag=wa_refresh] ~ ~ ~ summon worldanimals:turkey ~ ~ ~
execute @e[type=worldanimals:turkey_egg,tag=wa_refresh] ~ ~ ~ summon worldanimals:turkey_egg ~ ~ ~
execute @e[type=worldanimals:village_ice,tag=wa_refresh] ~ ~ ~ summon worldanimals:village_ice ~ ~ ~
execute @e[type=worldanimals:village_wild,tag=wa_refresh] ~ ~ ~ summon worldanimals:village_wild ~ ~ ~
execute @e[type=worldanimals:vulture,tag=wa_refresh] ~ ~ ~ summon worldanimals:vulture ~ ~ ~
execute @e[type=worldanimals:white_lion,tag=wa_refresh] ~ ~ ~ summon worldanimals:white_lion ~ ~ ~
execute @e[type=worldanimals:white_shark,tag=wa_refresh] ~ ~ ~ summon worldanimals:white_shark ~ ~ ~
execute @e[type=worldanimals:white_tiger,tag=wa_refresh] ~ ~ ~ summon worldanimals:white_tiger ~ ~ ~
execute @e[type=worldanimals:wild_boar,tag=wa_refresh] ~ ~ ~ summon worldanimals:wild_boar ~ ~ ~
execute @e[type=worldanimals:zebra,tag=wa_refresh] ~ ~ ~ summon worldanimals:zebra ~ ~ ~

# Phase 3: Remove all old entities
tp @e[tag=wa_refresh] ~ -100 ~
