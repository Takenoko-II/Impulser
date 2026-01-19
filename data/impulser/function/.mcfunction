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
    execute unless items entity @s saddle saddle run item replace entity @s saddle with saddle

# 保存された入力を取り出し
    function impulser:get_saved

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
