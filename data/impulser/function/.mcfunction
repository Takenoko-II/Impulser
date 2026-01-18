#> impulser:

# 入力を計算
    function impulser:calculate

# アイテムを編集
    execute unless items entity @s saddle saddle run item replace entity @s saddle with saddle

    item modify entity @s saddle impulser:set_level
