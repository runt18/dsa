assert = require 'assert'

math = require('mathjs')()

{complex_format, fft, inverse_fft,
    polynomial_multiply, polynomial_multiply_slow} = require '../src/fft'

describe 'Fast Fourier Transform', ->
    it 'should convert a coefficient representation polynomial to a point-value one', ->
        assert.deepEqual(complex_format(fft([0, 0, 1, -1])), ['0', '-1 + i', '2', '-1 - i'])

    it 'should convert a point-value representation polynomial to a coefficient one', ->
        input = [
            math.select(0)
            math.select(-1).add(math.i)
            math.select(2)
            math.select(-1).subtract(math.i)
        ]
        assert.deepEqual(inverse_fft(input), [0, 0, 1, -1])

    it 'should multiply two polynomials', ->
        # (3x^2 + 5x + 3)(8x^2 - 2x) = 24x^4 + 34x^3 + 22x^2 - 8x
        a = [4, 5, 3]
        b = [0, -2, 8]
        expected = ['0', '-8', '22', '34', '24']
        actual = polynomial_multiply(a, b)
        assert.deepEqual(complex_format(actual), expected)
