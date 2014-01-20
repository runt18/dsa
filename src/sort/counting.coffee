_ = require 'lodash'

# Sort an array of integers in O(n + k) time without using any comparisons
counting_sort = (arr) ->
    range = [0.._.max(arr)]
    temp = (0 for x in range)
    out = (0 for x in arr)

    # Set the i element of temp to be equal to the number of times i occurs
    # in the input array
    for i in arr
        temp[i]++

    # Set the ith element of temp to be equal to the number of elements less
    # than or equal to i in the input array
    for i in range[2..]
        temp[i] += temp[i - 1]

    # Distribute the values into an output array
    for x in arr
        out[temp[x] - 1] = x
        temp[x]--

    return out

module.exports = counting_sort
