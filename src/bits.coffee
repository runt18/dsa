log_base = (n, b) -> Math.log(n) / Math.log(b)

gen_bit = (i) -> 1 << i

# n[i] = val
set_bit = (n, i, val) ->
    mask = gen_bit(i)
    if val then n | mask else n & ~mask

# val = n[i]
get_bit = (n, i) -> (n & gen_bit(i)) > 0

bits_to_str = (n) ->
    main = ((if get_bit(n, i) then '1' else '0') for i in [15..0]).join('')
    if Math.round(n) is n
        frac = '0000'
    else
        str = n.toString()
        decimal = str[str.indexOf('.')+1..]
        console.log decimal
        frac = '1100'

    return "#{main}.#{frac}"

str_to_bits = (s) ->
    ((if c is '1' then gen_bit(s.length - 1 - i) else 0) for c, i in s).reduce((m, x) -> m + x)

is_power_of_two = (n) -> (n & (n - 1)) is 0

swap_adjacent = (n) -> ((n & 0xaaaaaaaa) >> 1) | ((n & 0x55555555) << 1)

# Number of bits that differ between n and m
bit_diff = (n, m) ->
    [0..31].filter((i) -> get_bit(n, i) isnt get_bit(m, i)).length

# Sets n[start..end] = m
set_bits = (n, m, start, end) ->
    n = set_bit(n, i, get_bit(m, i - start)) for i in [start..end]
    return n

missing = (a) ->
    for x, i in a
        if get_bit(x, Math.floor(log_base(i, 2)))
            return x - 1

module.exports = {bits_to_str, str_to_bits, is_power_of_two, bit_diff, swap_adjacent, set_bits}
