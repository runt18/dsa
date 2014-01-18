math = require('mathjs')()
{pow, multiply, divide, add, subtract, pi, e, select, format} = math

fft_r = (a) ->
    n = a.length
    return a if n is 1

    wn = pow(e, select(2).multiply(pi).multiply(math.i).divide(n).done())
    w = select(1)
    a0 = (select(x) for x, i in a when i % 2 is 0)
    a1 = (select(x) for x, i in a when i % 2 is 1)
    y0 = fft_r(a0)
    y1 = fft_r(a1)

    y = []

    for x, k in y0
        b = w.multiply(y1[k].done()).done()
        y[k] = y0[k].add(b)
        y[k + n / 2] = y0[k].subtract(b)
        w = w.multiply(wn)

    return y

fft = (a) -> (format(x.done(), 2) for x in fft_r(a))

module.exports = fft
