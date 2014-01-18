_ = require 'lodash'

is_palindrome = (s) ->
    l = s.length
    n =  Math.floor(l / 2)
    for i in [0...n]
        if s[i] isnt s[l - 1 - i]
            return false
    return true

min_palindrome = (s) ->
    m = ((if i is j then 1 else null for c1, j in s) for c2, i in s)
    return min_pal_r(s, m, 0, s.length - 1)

min_pal_r = (s, m, i, j) ->
    if m[i][j] isnt null
        return m[i][j]

    if is_palindrome(s[i..j])
        m[i][j] = 1
        return 1

    min = j - i + 1
    for k in [i...j]
        temp = min_pal_r(s, m, i, k) + min_pal_r(s, m, k + 1, j)
        if min > temp
            min = temp
    m[i][j] = min
    return min

module.exports = {is_palindrome, min_palindrome}
