bits_to_str = (n) ->
    ((if n & (1 << i) then '1' else '0') for i in [15..0]).join('')

str_to_bits = (s) ->
    ((if c is '1' then 1 << (s.length - 1 - i) else 0) for c, i in s).reduce((m, x) -> m + x)

# Sets n[start..end] = m
set_bits = (n, m, start, end) ->
    diff = end - start
    for i in [0..diff]
        bit = m & (1 << i)
        if bit
            n |= 1 << (i + start)
        else
            n &= ~(1 << (i + start))

        console.log bits_to_str n

    return n

module.exports = {bits_to_str, str_to_bits, set_bits}
