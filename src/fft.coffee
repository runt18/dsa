_ = require 'lodash'
# Import Math.js for complex number operations
math = require('mathjs')()
{pow, multiply, divide, add, subtract, pi, e, select, format} = math

# Returns every (xn + o)th element of the array
nths = (a) -> ((a) -> ((n, o) -> (x for x, i in a when i % n is o)))(a)
# So much curry
evens = (a) -> nths(a)(2, 0)
odds = (a) -> nths(a)(2, 1)

zero_pad = (a) ->
    a.push(select(0)) until a.length % 2 is 0

root_of_unity = (n) ->
    pow(e, select(2).multiply(pi).multiply(math.i).divide(n).done())

# Fast Fourier Transform implementation. Converts a polynomial from coefficient
# representation to point value representation. Input a is an array whose ith
# element is the coefficient of x^i in the polynomial
fft = (a) ->
    # Recursion base case: a polynomial with one term is already solved
    return a if a.length is 1

    # zero_pad(a)
    n = a.length

    # Compute the nth root of unity of the polynomial (e ^ ((2*pi*i) / n))
    wn = root_of_unity(n)
    w = select(1)
    # Split the polynomial into two sets, the even-indexed components and the
    # odd-indexed ones, and recursively evaluate each
    [y0, y1] = [fft(evens(a)), fft(odds(a))]

    if y0.length < y1.length
        y0.push(select(0)) until y0.length is y1.length
    if y1.length < y0.length
        y1.push(select(0)) until y0.length is y1.length

    y = []

    # Multiply the two components into one array
    for x, k in y0
        b = w.multiply(y1[k].done()).done()
        y[k] = y0[k].add(b)
        y[k + Math.floor(n / 2)] = y0[k].subtract(b)
        w = w.multiply(wn)

    # Return it
    return y

# Converts a polynomial in point-value representation into a coefficient
# representation
inverse_fft = (a) ->
    out = []
    n = a.length

    for x, i in a
        sum = select(0)
        for y, j in a
            sum = sum.add(y.multiply(pow(root_of_unity(n), -j * i)).done())
        out[i] = sum.divide(n).done()

    return out

# Multiplies two order-n polynomials together in O(nlogn) time using the FFT
polynomial_multiply = (a, b) ->
    # Use the FFT to convert the two coefficient-representation inputs
    # to point-value representations
    a_point = fft((select(x) for x in a))
    b_point = fft((select(y) for y in b))

    # Multiply the ith element of a with the ith element of b and store it
    # in the ith element of a new array to hold the product
    product_point = (ai.multiply(bi.done()) for [ai, bi] in _.zip(a_point, b_point))

    # Use the inverse FFT to convert back to a coefficient representation
    # and return
    return inverse_fft(product_point)

# Multiplies two order-n polynomials together in O(n^2) time using standard
# long multiplication
polynomial_multiply_slow = (a, b) ->

fft_format = (a) -> (format(x.done(), 2) for x in fft((select(y) for y in a)))

module.exports = {fft_format, polynomial_multiply, polynomial_multiply_slow}
