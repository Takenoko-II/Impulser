#> impulser:
#
# @input
#   storage impulser:
#       in: ArrayLike<? extends Number>
#
# @api

# プレイヤー以外
    execute if entity @s[type=!player] run return 0

# 入力を計算
    execute if data storage impulser: in[] run function impulser:calculate_absolute
    execute unless data storage impulser: in[] run function impulser:calculate_local

# アイテムを編集
    execute unless items entity @s saddle saddle run item replace entity @s saddle with saddle
    item modify entity @s saddle impulser:set_level

# 1
    return 1
