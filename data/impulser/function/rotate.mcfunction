#> impulser:rotate

# 保存された入力を取り出し
    data modify storage impulser: saved set value {level: 0, vector: [0d, 0d, 0d], direction: [0d, 0d, 0d]}
    data modify storage impulser: saved set from entity @s equipment.saddle.components.minecraft:custom_data.impulser

# ベクトルを作成
    summon marker 0.0 0.0 0.0 {Tags: ["Impulser.Direction"]}
    data modify entity @n[type=marker, tag=Impulser.Direction] Pos set from storage impulser: saved.direction

# 回転
    execute positioned 0.0 0.0 0.0 facing entity @n[type=marker, tag=Impulser.Direction] feet run rotate @s ~ ~

# お片付け
    kill @n[type=marker, tag=Impulser.Direction]

    data remove storage impulser: saved
