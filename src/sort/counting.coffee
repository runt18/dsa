_ = require 'lodash'

counting_sort = (arr) ->
    range = [0.._.max(arr)]
    temp = (0 for x in range)
    out = (0 for x in arr)

    for x in arr
        temp[x]++

    for i in range[2..]
        temp[i] += temp[i - 1]

    for x in arr
        out[temp[x] - 1] = x
        temp[x]--

    return out

module.exports = counting_sort
