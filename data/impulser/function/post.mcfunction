#> impulser:post

#
    item replace entity @s saddle with air

    execute rotated as @n[type=marker, tag=ILD.Core.ApplyImpulse.PlayerRotation] run rotate @s ~ ~

    kill @n[type=marker, tag=ILD.Core.ApplyImpulse.PlayerRotation]

say post