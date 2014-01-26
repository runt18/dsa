knapsack = (items, capacity) ->
    matrix = ((0 for j in [0..capacity]) for i in items)
    n = items.length - 1

    for i in [1..n]
        for j in [0..capacity]
            {weight, value} = items[i]
            matrix[i][j] = if weight <= j
                Math.max(matrix[i - 1][j], matrix[i - 1][j - weight] + value)
            else
                matrix[i - 1][j]

    return matrix[n][capacity]

module.exports = knapsack
