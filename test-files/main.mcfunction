scoreboard objectives add GrassCnt dummy
scoreboard objectives add OtherCnt dummy

tag @s add subject

execute as @a[tag=subject] if block ~ ~-1 ~ minecraft:grass_block \
    run scoreboard players add @s GrassCnt 1
execute as @a[tag=subject] unless block ~ ~-1 ~ minecraft:grass_block \
    run scoreboard players add @s OtherCnt 1

execute as @a[scores={GrassCnt=1..}] \
    run particle minecraft:flame ~ ~1 ~ .125 .125 .125 0 1000 normal
