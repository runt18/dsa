prefix = (pattern) ->
    table = [null, 0]
    i = 0
    j = 2
    while j < pattern.length
        while i > 0 and pattern[i + 1] isnt pattern[j]
            i = table[i]
        if pattern[i + 1] is pattern[j]
            i++
        table[j] = i
        j++

    return table

kmp = (string, pattern) ->
    m = pattern.length
    string = ' ' + string
    pattern = ' ' + pattern
    table = prefix(pattern)

    i = 0
    results = []

    for char, j in string
        while i > 0 and pattern[i + 1] isnt char
            i = table[i]
        if pattern[i + 1] is char
            i++
        if i is m
            results.push(j - m)
            i = table[i]

    return results

module.exports = kmp
