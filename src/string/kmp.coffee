prefix = (pattern) ->
    table = (0 for c in pattern)
    i = 0
    j = 1
    while j < pattern.length
        while i > 0 and pattern[i] isnt pattern[j]
            i = table[i]
        if pattern[i] is pattern[j]
            i++
        table[j] = i
        j++

    return table

kmp = (string, pattern) ->
    table = prefix(pattern)
    console.log table
    i = 0
    results = []

    for char, j in string
        while i > 0 and pattern[i + 1] isnt char
            i = table[i]
        if pattern[i + 1] is char
            i++
        if i is pattern.length - 1
            results.push(j - pattern.length)
            i = table[i]

    return results

module.exports = kmp
