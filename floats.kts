import java.math.BigDecimal

var n = BigDecimal("0.0")

var s = n.toString()

for (x in 1..255) {
    n += BigDecimal(0.25)
    s += ", $n"
}

println(s)
