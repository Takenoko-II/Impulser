#> impulser:calculate_a

# 入力のスコア化
    execute store result score #X_I Impulser.Math run data get storage impulser: in[0] 10000
    execute store result score #Y_I Impulser.Math run data get storage impulser: in[1] 10000
    execute store result score #Z_I Impulser.Math run data get storage impulser: in[2] 10000

# 保存されたベクトルの加算
    execute store result score #X_P Impulser.Math run data get storage impulser: previous.vector[0] 10000
    execute store result score #Y_P Impulser.Math run data get storage impulser: previous.vector[1] 10000
    execute store result score #Z_P Impulser.Math run data get storage impulser: previous.vector[2] 10000

    scoreboard players operation #X_I Impulser.Math += #X_P Impulser.Math
    scoreboard players operation #Y_I Impulser.Math += #Y_P Impulser.Math
    scoreboard players operation #Z_I Impulser.Math += #Z_P Impulser.Math

    data modify storage impulser: added set value [0d, 0d, 0d]
    execute store result storage impulser: added[0] double 0.0001 run scoreboard players get #X_I Impulser.Math
    execute store result storage impulser: added[1] double 0.0001 run scoreboard players get #Y_I Impulser.Math
    execute store result storage impulser: added[2] double 0.0001 run scoreboard players get #Z_I Impulser.Math

    execute unless items entity @s saddle saddle[custom_data~{impulser: {level: 0}}] run kill @n[type=marker, tag=Impulser.VectorU]

# 単位ベクトルの取得
    summon marker 0.0 0.0 0.0 {Tags: ["Impulser.VectorI"]}
    data modify entity @n[type=marker, tag=Impulser.VectorI] Pos set from storage impulser: added

    execute positioned 0.0 0.0 0.0 facing entity @n[type=marker, tag=Impulser.VectorI] feet run summon marker ^ ^ ^1 {Tags: ["Impulser.VectorU"]}
    scoreboard players operation @n[type=marker, tag=Impulser.VectorU] Impulser.Math = @s Impulser.Math

    execute store result score #X_U Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorU] Pos[0] 1000
    execute store result score #Y_U Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorU] Pos[1] 1000
    execute store result score #Z_U Impulser.Math run data get entity @n[type=marker, tag=Impulser.VectorU] Pos[2] 1000

# 絶対値取得
    execute unless score #X_I Impulser.Math matches 0.. run scoreboard players operation #X_I Impulser.Math *= #-1 Impulser.Math
    execute unless score #Y_I Impulser.Math matches 0.. run scoreboard players operation #Y_I Impulser.Math *= #-1 Impulser.Math
    execute unless score #Z_I Impulser.Math matches 0.. run scoreboard players operation #Z_I Impulser.Math *= #-1 Impulser.Math

    execute unless score #X_U Impulser.Math matches 0.. run scoreboard players operation #X_U Impulser.Math *= #-1 Impulser.Math
    execute unless score #Y_U Impulser.Math matches 0.. run scoreboard players operation #Y_U Impulser.Math *= #-1 Impulser.Math
    execute unless score #Z_U Impulser.Math matches 0.. run scoreboard players operation #Z_U Impulser.Math *= #-1 Impulser.Math

# 最大値計算
    scoreboard players operation #Max_I Impulser.Math > #X_I Impulser.Math
    scoreboard players operation #Max_I Impulser.Math > #Y_I Impulser.Math
    scoreboard players operation #Max_I Impulser.Math > #Z_I Impulser.Math

    scoreboard players operation #Max_U Impulser.Math > #X_U Impulser.Math
    scoreboard players operation #Max_U Impulser.Math > #Y_U Impulser.Math
    scoreboard players operation #Max_U Impulser.Math > #Z_U Impulser.Math

# 係数の算出
    scoreboard players operation #Strength Impulser.Math = #Max_I Impulser.Math

    scoreboard players operation #Strength Impulser.Math /= #Max_U Impulser.Math

    execute if score #Strength Impulser.Math matches 255.. run scoreboard players set #Strength Impulser.Math 255

# あとで使いやすいようにマーカーの向きを合わせておく
    execute as @n[type=marker, tag=Impulser.VectorU] positioned 0.0 0.0 0.0 facing entity @s feet run rotate @s ~ ~

# レベルの格納
    data modify storage impulser: _ set value {level: -1, vector: [0d, 0d, 0d]}

    execute store result storage impulser: _.level int 0.1 run scoreboard players get #Strength Impulser.Math

# ベクトルの保存
    data modify storage impulser: _.vector[0] set from entity @n[type=marker, tag=Impulser.VectorI] Pos[0]
    data modify storage impulser: _.vector[1] set from entity @n[type=marker, tag=Impulser.VectorI] Pos[1]
    data modify storage impulser: _.vector[2] set from entity @n[type=marker, tag=Impulser.VectorI] Pos[2]

    item modify entity @s saddle impulser:save

# お片付け
    kill @n[type=marker, tag=Impulser.VectorI]

    scoreboard players reset #Max_I Impulser.Math
    scoreboard players reset #Max_U Impulser.Math

    scoreboard players reset #X_I Impulser.Math
    scoreboard players reset #Y_I Impulser.Math
    scoreboard players reset #Z_I Impulser.Math

    scoreboard players reset #X_U Impulser.Math
    scoreboard players reset #Y_U Impulser.Math
    scoreboard players reset #Z_U Impulser.Math

    scoreboard players reset #X_P Impulser.Math
    scoreboard players reset #Y_P Impulser.Math
    scoreboard players reset #Z_P Impulser.Math

    scoreboard players reset #Strength Impulser.Math

    data remove storage impulser: added
