_ = require 'lodash'

edit_distance = (s1, s2) ->
    l1 = s1.length
    l2 = s2.length

    # Construct a matrix with the height equal to the length of the first
    # input string, and width equal to the length of the second
    ed = ((0 for c in [0..l2]) for d in [0..l1])
    # Set the elements of the first row and column to be their own index
    ed[i][0] = i for i in [1..l1]
    ed[0][i] = i for i in [1..l2]

    # Iterate through each character in each string
    for c1, i in s2
        for c2, j in s1
            # Set the cell of the matrix corresponding to the current
            # pair of characters to be the edit distance of the two strings
            # up to that point
            ed[j + 1][i + 1] = _.min([
                ed[j][i] + if c1 is c2 then 0 else 1
                ed[j][i + 1] + 1
                ed[j + 1][i] + 1
            ])

    # Return the bottom-right element of the matrix - the edit distance of the
    # two strings
    return ed[l1][l2]

module.exports = edit_distance
