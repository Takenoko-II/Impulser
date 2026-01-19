#> impulser:calculate_local

# 入力を保存
    data modify storage impulser: strength set from storage impulser: in

# ベクトルに変換
    execute positioned 0.0 0.0 0.0 run summon marker ^ ^ ^1 {Tags: ["Impulser.VectorL"]}

    execute store result score #X_L Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorL] Pos[0] 1000
    execute store result score #Y_L Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorL] Pos[1] 1000
    execute store result score #Z_L Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorL] Pos[2] 1000

    execute store result score #Strength Impulser.Math run data get storage impulser: in 10

    scoreboard players operation #X_L Impulser.Math *= #Strength Impulser.Math
    scoreboard players operation #Y_L Impulser.Math *= #Strength Impulser.Math
    scoreboard players operation #Z_L Impulser.Math *= #Strength Impulser.Math

    data modify storage impulser: in set value [0d, 0d, 0d]

    execute store result storage impulser: in[0] double 0.0001 run scoreboard players get #X_L Impulser.Math
    execute store result storage impulser: in[1] double 0.0001 run scoreboard players get #Y_L Impulser.Math
    execute store result storage impulser: in[2] double 0.0001 run scoreboard players get #Z_L Impulser.Math

# お片付け
    scoreboard players reset #X_L Impulser.Math
    scoreboard players reset #Y_L Impulser.Math
    scoreboard players reset #Z_L Impulser.Math

    scoreboard players reset #Strength Impulser.Math

    kill @n[type=marker, tag=Impulser.VectorL]

# 呼び出し
    function impulser:calculate_relative

# 戻す
    data modify storage impulser: in set from storage impulser: strength

    data remove storage impulser: strength
