# Impulser

`enchantment` (`apply_impulse`) によるシンプルなプレイヤー `Motion` 操作ライブラリ

## Usage

### 絶対座標軸基準
以下のコマンドを実行したのち
```
data modify storage impulser: in set value [-5, 4, 0]
```

このコマンドを実行すると実行者がベクトル `(-5, 4, 0)` の方向に沿って飛んでいきます
```mcfunction
function #impulser:
```

### ローカル座標軸基準
以下のコマンドを実行したのち
```
data modify storage impulser: in set value 7
```

このコマンドを実行すると実行者が実行方向の方角に強さ `7` で飛んでいきます
```mcfunction
function #impulser:
```

### 速度ベクトルの累加
- 以下のように同tick内に複数回呼び出すとその分速度ベクトルは加算されます

```mcfunction
# 最終的には ~ ~3 ~ ^ ^ ^8 の向きに飛んでいく

# 上向きに+3
    data modify storage impulser: in set value [0, 3, 0]
    function #impulser:

# 水平面に沿ってプレイヤーの視線の向きに+8
    data modify storage impulser: in set value 8
    execute rotated ~ 0 run function #impulser:
```

## Note
- `0.0` ～ `63.75` までの `0.25` 間隔の強さの値にのみ対応させています(手抜き)

## Compatible Versions
- 1.21.11

## Author
- [Takenoko-II](https://x.com/Takenoko_4096)

## License
[MIT](/LICENSE)
