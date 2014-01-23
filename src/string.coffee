#! /usr/bin/env coffee

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


quicksort = (array) ->
    if typeof array is 'string'
        array = array.split('')

    if array.length <= 1
        #an array of zero or one elements is already sorted
        return array

    #select and remove a pivot element pivot from 'array'  // see '#Choice of pivot' below
    idx = Math.floor(array.length / 2)
    pivot = array.splice(idx, 1)[0]

    less = []
    greater = []

    for x in array
        if x <= pivot
            less.push(x)
        else
            greater.push(x)

    return quicksort(less).concat([pivot]).concat(quicksort(greater))


max = (array) ->
    m = array[0]

    for x in array[1..]
        m = x if x > m

    return m


counting_sort = (a) ->
    m = max(a)
    c = (0 for x in [0..m])
    b = (0 for x in a)

    c[item]++ for item in a
    c[i] += c[i - 1] for i in [2..m]

    j = a.length

    while j >= 0
        b[c[a[j]]] = a[j]
        c[a[j]]--
        j--

    return b[1..b.length]



is_anagram = (s1, s2) ->
    return false if s1.length isnt s2.length

    return quicksort(s1).join('') is quicksort(s2).join('')

escape_spaces = (s) ->
    ((if c == ' ' then '%20' else c) for c in s).join('')

rotate_image = (img) ->

zero_cross = (matrix) ->
    m2 = ((cell for cell in row) for row in matrix)

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


console.log all_unique('hello')
console.log all_unique('abcd')

console.log reverse('hello')

console.log quicksort('fdsfdsfjsfdsfhjfskdfjd')

console.log is_anagram('stop', 'spot')
console.log is_anagram('fork', 'cord')

console.log escape_spaces('hi there john')

console.log(zero_cross([
    [1, 2, 3, 4],
    [0, 8, 1, 9],
    [4, 1, 4, 2],
    [9, 3, 0, 6]
]))

console.log(max([3,5,7,1,9,2]))

console.log counting_sort [5, 9, 2, 6, 4]

