#> impulser:pre

# 回転の保存
    summon marker ~ ~ ~ {Tags: ["Impulser.PlayerRotation"]}
    rotate @n[type=marker, tag=Impulser.PlayerRotation] ~ ~

# 回転
    execute rotated as @n[type=marker, tag=Impulser.VectorU] run rotate @s ~ ~

# お片付け
    kill @n[type=marker, tag=Impulser.VectorU]
