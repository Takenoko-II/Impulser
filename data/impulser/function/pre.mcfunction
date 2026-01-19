#> impulser:pre

# 回転の保存
    summon marker ~ ~ ~ {Tags: ["Impulser.PlayerRotation"]}
    rotate @n[type=marker, tag=Impulser.PlayerRotation] ~ ~

# 回転
    function impulser:rotate

# サドルリセット
    item modify entity @s saddle impulser:clear
