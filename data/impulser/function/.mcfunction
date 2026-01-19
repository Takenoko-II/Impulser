#> impulser:
#
# @input
#   storage impulser:
#       in: Vector3 | Number
#
# @api

# プレイヤー以外
    execute if entity @s[type=!player] run return 0

# サドル用意
    execute unless items entity @s saddle saddle run item replace entity @s saddle with saddle[ \
        equippable = { \
            equip_sound: "minecraft:intentionally_empty", \
            slot: "saddle" \
        }, \
        enchantments = { \
            "minecraft:vanishing_curse": 1 \
        } \
    ]

# 保存された入力を取り出し
    data modify storage impulser: previous set value {level: 0, vector: [0d, 0d, 0d], direction: [0d, 0d, 0d]}
    data modify storage impulser: previous set from entity @s equipment.saddle.components.minecraft:custom_data.impulser

# 入力を計算
    execute if data storage impulser: in[] run function impulser:calculate_relative
    execute unless data storage impulser: in[] run function impulser:calculate_local

# アイテムを編集
    item modify entity @s saddle impulser:set_level

# お片付け
    data remove storage impulser: previous
    data remove storage impulser: _

# 1
    return 1
