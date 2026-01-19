#> impulser:pre

# 回転の保存
    summon marker ~ ~ ~ {Tags: ["Impulser.PlayerRotation"]}
    rotate @n[type=marker, tag=Impulser.PlayerRotation] ~ ~

# タグ
    tag @s add Impulser.Player

# 回転してお片付け
    execute as @e[type=marker, tag=Impulser.VectorU] if score @s Impulser.Math = @p[tag=Impulser.Player] Impulser.Math \
        rotated as @s run rotate @p[tag=Impulser.Player] ~ ~

    execute as @e[type=marker, tag=Impulser.VectorU] if score @s Impulser.Math = @p[tag=Impulser.Player] Impulser.Math \
        run kill

# タグ削除
    tag @s remove Impulser.Player
