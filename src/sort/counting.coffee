_ = require 'lodash'

counting_sort = (arr) ->
    range = _.max(arr)
    temp = (0 for x in [0..range])
    out = (0 for x in arr)

    for x in arr
        temp[x]++

    for i in [2..range]
        temp[i] += temp[i - 1]

    for x in arr by -1
        out[temp[x] - 1] = x
        temp[x]--

    return out

module.exports = counting_sort
