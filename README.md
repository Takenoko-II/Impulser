# Impulser

`enchantment` (`apply_impulse`) によるシンプルなプレイヤー `Motion` 操作ライブラリ

## Usage

### 1. 絶対座標軸基準
以下のコマンドを実行したのち
```
data modify storage impulser: in set value [-5, 4, 0]
```

このコマンドを実行すると実行者が `(x, y, z) = (-5, 4, 0)` の方角に飛んでいきます
```mcfunction
function #impulser:
```

### 2. ローカル座標軸基準
以下のコマンドを実行したのち
```
data modify storage impulser: in set value 7
```

このコマンドを実行すると実行者が実行方向の方角に強さ `7` で飛んでいきます
```mcfunction
function #impulser:
```

### Note
- `0.0` ～ `63.75` までの `0.25` 間隔の強さの値にのみ対応させています(手抜き)

## Compatible Versions
- 1.21.11

## Author
- [Takenoko-II](https://x.com/Takenoko_4096)

## License
[MIT](/LICENSE)
