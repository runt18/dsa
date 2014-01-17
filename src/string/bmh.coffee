_ = require 'lodash'

bmh = (string, pattern) ->
    m = pattern.length
    n = string.length
    alphabet = _.uniq(pattern)
    d = {}
    for char in alphabet
        d[char] = m
    for char, j in pattern[..-1]
        d[char] = m - j

    pos = 0
    results = []

    while pos <= n - m
        j = m
        j-- while j >= 1 and string[pos + j] is pattern[j]
        results.push(pos + 1) if j < 1
        pos += d[string[pos + m]]

    return results

module.exports = bmh
