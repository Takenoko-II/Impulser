#> impulser:

# 準備
    data modify storage ild: apply_impulse set value {_: {}}

    item replace entity @s saddle with saddle

# x
    execute store result score #ApplyImpulse ILD.Core.ApplyImpulse run data get storage ild: in[0] 1000

    execute if score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run data modify storage ild: apply_impulse.signs[0] set value 1

    execute unless score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run scoreboard players operation #ApplyImpulse ILD.Core.ApplyImpulse *= #-1 ILD.Core.Math
    execute store result storage ild: apply_impulse.abs[0] int 0.01 run scoreboard players get #ApplyImpulse ILD.Core.ApplyImpulse

# y
    execute store result score #ApplyImpulse ILD.Core.ApplyImpulse run data get storage ild: in[1] 1000

    execute if score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run data modify storage ild: apply_impulse.signs[1] set value 1

    execute unless score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run scoreboard players operation #ApplyImpulse ILD.Core.ApplyImpulse *= #-1 ILD.Core.Math
    execute store result storage ild: apply_impulse.abs[1] int 0.01 run scoreboard players get #ApplyImpulse ILD.Core.ApplyImpulse

# z
    execute store result score #ApplyImpulse ILD.Core.ApplyImpulse run data get storage ild: in[2] 1000

    execute if score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run data modify storage ild: apply_impulse.signs[2] set value 1

    execute unless score #ApplyImpulse ILD.Core.ApplyImpulse matches 0.. run scoreboard players operation #ApplyImpulse ILD.Core.ApplyImpulse *= #-1 ILD.Core.Math
    execute store result storage ild: apply_impulse.abs[2] int 0.01 run scoreboard players get #ApplyImpulse ILD.Core.ApplyImpulse

# 吹っ飛べ
    item modify entity @s saddle impulser:apply_impulse
