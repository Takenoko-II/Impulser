#> impulser:calculate_b

# レベルの格納
    data modify storage impulser: _ set value {}

    execute store result storage impulser: _.level int 1 run data get storage impulser: in
