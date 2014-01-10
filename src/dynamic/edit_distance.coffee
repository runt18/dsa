_ = require 'lodash'

edit_distance = (s1, s2) ->
    l1 = s1.length
    l2 = s2.length
    ed = ((0 for c in [0..l2]) for d in [0..l1])
    ed[i][0] = i for i in [1..l1]
    ed[0][i] = i for i in [1..l2]

    for c1, i in s2
        for c2, j in s1
            ed[j + 1][i + 1] = _.min([
                ed[j][i] + if c1 is c2 then 0 else 1
                ed[j][i + 1] + 1
                ed[j + 1][i] + 1
            ])

    return ed[l1][l2]

module.exports = edit_distance
