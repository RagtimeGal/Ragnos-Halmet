####################
# Load Function
####################

## Scoreboards
scoreboard objectives add hamlet.config dummy
scoreboard objectives add hamlet.dummy dummy
scoreboard objectives add hamlet.coas_click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add hamlet.playerID dummy
scoreboard objectives add hamlet.empireID dummy
scoreboard objectives add hamlet.kingdomID dummy


## Setup Triggers
scoreboard objectives add hamlet.create_empire trigger
scoreboard objectives add hamlet.join_empire trigger
scoreboard objectives modify hamlet.create_empire displayname "Create Empire"
scoreboard objectives modify hamlet.join_empire displayname "Join Empire"

## Schedule
schedule function hamlet:technical/second_clock 1s replace

## Set Config
execute unless score version loom.config matches 001 run function hamlet:technical/update
scoreboard players set version loom.config 001

## Send Chat Messages
execute if score IsInstalled loom.config matches 1 if score doReloadMessage loom.config matches 1 run function loom:technical/reload_message
execute unless score IsInstalled loom.config matches 1 run function loom:technical/default_config
execute unless score IsInstalled loom.config matches 1 run function loom:technical/install_message
