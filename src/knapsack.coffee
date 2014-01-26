knapsack = (items, capacity) ->
    m = ((0 for j in [0..capacity]) for i in items)

    for i in [1...items.length]
        for j in [0..capacity]
            w = items[i].weight
            v = items[i].value
            if w <= j
                m[i][j] = Math.max(m[i - 1][j], m[i - 1][j - w] + v)
            else
                m[i][j] = m[i - 1][j]

    return m[items.length - 1][capacity]

module.exports = knapsack
