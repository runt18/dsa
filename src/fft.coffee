math = require('mathjs')()
{pow, multiply, divide, add, subtract, pi, e, select, format} = math

# Returns every (xn + o)th element of the array
get_nth = (a, n, o) -> (x for x, i in a when i % n is o)

# Fast Fourier Transform implementation. Evaluates polynomial a where a is an
# array whose ith element is the coefficient of x^i in the polynomial
fft_r = (a) ->
    n = a.length
    # Recursion base case: a polynomial with one term is already solved
    return a if n is 1

    # Compute the nth root of unity of the polynomial
    wn = pow(e, select(2).multiply(pi).multiply(math.i).divide(n).done())
    w = select(1)
    # Split the polynomial into two sets, the even-indexed components...
    a0 = get_nth(a, 2, 0)
    # .. and the odd-indexed ones
    a1 = get_nth(a, 2, 1)
    # Recursively evaluate them
    y0 = fft_r(a0)
    y1 = fft_r(a1)

    y = []

    # Multiply the two components into one array
    for x, k in y0
        b = w.multiply(y1[k].done()).done()
        y[k] = y0[k].add(b)
        y[k + n / 2] = y0[k].subtract(b)
        w = w.multiply(wn)

    # Return it
    return y

fft = (a) -> (format(x.done(), 2) for x in fft_r((select(y) for y in a)))

module.exports = fft
