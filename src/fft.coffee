_ = require './util'
# Import Math.js for complex number operations
math = require('mathjs')()
{pow, multiply, divide, add, subtract, pi, e, select, format} = math

root_of_unity = (n) ->
    pow(e, select(2).multiply(pi).multiply(math.i).divide(n).done())

# Fast Fourier Transform implementation. Converts a polynomial from coefficient
# representation to point value representation. Input a is an array whose ith
# element is the coefficient of x^i in the polynomial
fft_r = (a) ->
    n = a.length
    # Recursion base case: a polynomial with one term is already solved
    return a if n is 1

    # Compute the nth root of unity of the polynomial (e ^ ((2*pi*i) / n))
    wn = root_of_unity(n)
    w = select(1)
    # Split the polynomial into two sets, the even-indexed components and the
    # odd-indexed ones, and recursively evaluate each
    [y0, y1] = [fft_r(_.evens(a)), fft_r(_.odds(a))]

    y = []

    # Multiply the two components into one array
    for x, k in y0
        b = w.multiply(y1[k].done()).done()
        y[k] = y0[k].add(b)
        y[k + y0.length] = y0[k].subtract(b)
        w = w.multiply(wn)

    # Return it
    return y

fft = (a) ->
    # Find the next power of two greater than the order of the polynomial
    len = _.next_power(a.length, 2)
    # Add zero coefficients to the polynomial until it's that length
    _.zero_pad(a, (l) -> l is len)
    # Convert to Math.js representation
    a = (select(x) for x in a)
    # Run the FFT on it
    return fft_r(a)

# Converts a polynomial in point-value representation into a coefficient
# representation
inverse_fft = (a) ->
    out = []
    n = a.length
    rou = root_of_unity(n)

    for x, i in a
        sum = select(0)
        for y, j in a
            sum = sum.add(y.multiply(pow(rou, -j * i)).done())
        out[i] = sum.divide(n)

    return out

# Multiplies two order-n polynomials together in O(nlogn) time using the FFT
polynomial_multiply = (a, b) ->
    # Use the FFT to convert the two coefficient-representation inputs
    # to point-value representations
    a_point = fft(a)
    b_point = fft(b)

    # Multiply the ith element of a with the ith element of b and store it
    # in the ith element of a new array to hold the product
    product_point = (ai.multiply(bi.done()) for [ai, bi] in _.zip(a_point, b_point))

    # Use the inverse FFT to convert back to a coefficient representation
    # and return
    return inverse_fft(product_point)

# Multiplies two order-n polynomials together in O(n^2) time using standard
# long multiplication
polynomial_multiply_slow = (a, b) ->

module.exports = {fft, inverse_fft, polynomial_multiply, polynomial_multiply_slow}
