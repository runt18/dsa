math = require('mathjs')()

pagerank = (a) ->
    accuracy = 0.01

    v = []

    for i in [1..n]
        v[i] = 1 / n
    k = 0
    loop
        v[k + 1] = v[k] * a
        sum = 0
        for i in [1..n]
            sum += Math.abs(v[k + 1] - v[k])
        if sum <= accuracy
            return v[k + 1]
        k++


module.exports = pagerank
