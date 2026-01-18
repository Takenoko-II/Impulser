#> impulser:calculate_local

# レベルの格納
    data modify storage impulser: _ set value {level: -1}

    execute store result score #Strength Impulser.Math run data get storage impulser: in 10

    execute if score #Strength Impulser.Math matches 255.. run scoreboard players set #Strength Impulser.Math 255

    execute store result storage impulser: _.level int 0.1 run scoreboard players get #Strength Impulser.Math
