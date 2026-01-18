#> impulser:calculate_a

# 入力のスコア化
    execute store result score #X_I Impulser.Math run data get storage impulser: in[0] 1000
    execute store result score #Y_I Impulser.Math run data get storage impulser: in[1] 1000
    execute store result score #Z_I Impulser.Math run data get storage impulser: in[2] 1000

# 単位ベクトルの取得
    summon marker 0.0 0.0 0.0 {Tags: ["Impulser.VectorI"]}
    data modify entity @n[type=marker, tag=Impulser.VectorI] Pos set from storage impulser: in
    execute positioned 0.0 0.0 0.0 facing entity @n[type=marker, tag=Impulser.VectorI] feet run summon marker ^ ^ ^1 {Tags: ["Impulser.VectorU"]}

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

# プレイヤーの回転の調整
    execute rotated as @n[type=marker, tag=Impulser.VectorU] run rotate @s ~ ~

# お片付け
    kill @n[type=marker, tag=Impulser.VectorI]
    kill @n[type=marker, tag=Impulser.VectorU]

    scoreboard players reset #Max_I Impulser.Math
    scoreboard players reset #Max_U Impulser.Math

    scoreboard players reset #X_I
    scoreboard players reset #Y_I
    scoreboard players reset #Z_I

    scoreboard players reset #X_U
    scoreboard players reset #Y_U
    scoreboard players reset #Z_U

# レベルの格納
    data modify storage impulser: _ set value {}

    execute store result storage impulser: _.level int 0.001 run scoreboard players get #Strength Impulser.Math
