assert = require 'assert'

{complex_format, fft, polynomial_multiply, polynomial_multiply_slow} = require '../src/fft'

describe 'Fast Fourier Transform', ->
    it 'should convert a coefficient representation polynomial to a point-value one', ->
        assert.deepEqual(complex_format(fft([0, 0, 1, -1])), ['0', '-1 + i', '2', '-1 - i'])

    it 'should multiply two polynomials', ->
        # (3x^2 + 5x + 3)(8x^2 - 2x) = 24x^4 + 34x^3 + 22x^2 - 8x
        a = [4, 5, 3]
        b = [0, -2, 8]
        expected = ['0', '-8', '22', '34', '24']
        actual = polynomial_multiply(a, b)
        assert.deepEqual(complex_format(actual), expected)
