_ = require './util'

all_unique = (s) ->
    seen = ''

    for c in s
        return false if c in seen
        seen += c

    return true

reverse = (s) ->
    len = s.length - 1
    i = len - 1
    r = ''

    while i >= 0
        r += s[i]
        i--

    r += s[len]

# remove_duplicates = (s) ->
#     for c, i in s

max = (array) ->
    m = array[0]

    for x in array[1..]
        m = x if x > m

    return m


is_anagram = (s1, s2) ->
    return false if s1.length isnt s2.length
    s1 = _.toArray(s1)
    s2 = _.toArray(s2)
    return _.isEqual(s1.sort(), s2.sort())

escape_spaces = (s) ->
    ((if c is ' ' then '%20' else c) for c in s).join('')

rotate_image = (img) ->

zero_cross = (matrix) ->
    m2 = _.cloneDeep(matrix)

    for row, i in matrix
        for cell, j in row
            if cell is 0
                for row1, i1 in matrix
                    m2[i1][j] = 0
                m2[i] = (0 for x in row)

    return m2

is_rotation = (s1, s2) ->
    return false if s1.length isnt s2.length
    return (s1 + s1).indexOf(s2) isnt -1

module.exports = module.exports = {
    all_unique
    reverse
    max
    is_anagram
    escape_spaces
    rotate_image
    zero_cross
    is_rotation
}
