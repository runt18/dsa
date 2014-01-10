fibonacci = (n) ->
    a = 1
    b = 1
    fibs = [a, b]
    i = 0
    while i < n - 2
        [a, b] = [a + b, a]
        fibs.push(a)
        i++

    return fibs

module.exports = fibonacci
