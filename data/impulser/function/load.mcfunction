#> impulser:load
#
# ロードエントリ

# 導入時メッセージ
    say Datapack 'Impulser' has been successfully loaded with namespace 'impulser'.

# 原点
    forceload add 0 0

# ストレージ
    data modify storage impulser: _ set value {}

# スコアボード
    scoreboard objectives add Impulser.Math dummy

# 定数
    scoreboard players set #-1 Impulser.Math -1
    execute unless score #ID Impulser.Math matches -2147483648..2147483647 run scoreboard players set #ID Impulser.Math -2147483648
