quicksort = (array) ->
    if typeof array is 'string'
        array = array.split('')

    # An array of zero or one elements is already sorted
    return array if array.length < 2

    # Select and remove a pivot element pivot from the array
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

module.exports = quicksort
