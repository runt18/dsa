_ = require 'lodash'

is_palindrome = (s) ->
    l = s.length
    n =  Math.floor(l / 2)
    for i in [0...n]
        if s[i] isnt s[l - 1 - i]
            return false
    return true

min_palindrome = (s, i=0, j=s.length-1) ->
    return switch i
        when j then 1
        when j - 1 then 2
        else _.min((min_palindrome(s, i, k) for k in [i..j]))

module.exports = {is_palindrome, min_palindrome}
