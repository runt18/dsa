# Returns whether or not a string is palindromic
is_palindrome = (s) ->
    l = s.length
    n =  Math.floor(l / 2)
    for i in [0...n]
        if s[i] isnt s[l - 1 - i]
            return false
    return true

# Returns the minimum number of palindromic substrings that can be concatenated
# to form the string
min_palindrome = (s) ->
    # Construct an n*n matrix where n is the length of s, with 1s on the
    # diagonal and null everywhere else
    m = ((if i is j then 1 else null for c1, j in s) for c2, i in s)
    return min_pal_r(s, m, 0, s.length - 1)

# Recursive function for calculating the minimum number of palindromic substrings
# between the two indices
min_pal_r = (s, m, start, end) ->
    if m[start][end] isnt null
        return m[start][end]

    if is_palindrome(s[start..end])
        m[start][end] = 1
        return 1

    min = end - start + 1
    for k in [start...end]
        temp = min_pal_r(s, m, start, k) + min_pal_r(s, m, k + 1, end)
        if min > temp
            min = temp
    m[start][end] = min
    return min

module.exports = {is_palindrome, min_palindrome}
