is_palindrome = (s) ->
    l = s.length
    n =  Math.floor(l / 2)
    for i in [0...n]
        if s[i] isnt s[l - 1 - i]
            return false
    return true

module.exports = {is_palindrome}
