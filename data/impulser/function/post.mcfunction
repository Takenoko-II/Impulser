#> impulser:post

# アイテムを再編集
    item modify entity @s saddle impulser:clear_level

# 向きを戻す
    execute rotated as @n[type=marker, tag=Impulser.PlayerRotation] run rotate @s ~ ~

# お片付け
    kill @n[type=marker, tag=Impulser.PlayerRotation]
