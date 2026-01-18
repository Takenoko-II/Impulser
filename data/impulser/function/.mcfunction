#> impulser:

# プレイヤー以外
    execute unless entity @s[type=player] run return fail

# 入力を計算
    execute if data storage impulser: in[] run function impulser:calculate_a
    execute unless data storage impulser: in[] run function impulser:calculate_b

# アイテムを編集
    execute unless items entity @s saddle saddle run item replace entity @s saddle with saddle
    item modify entity @s saddle impulser:set_level
