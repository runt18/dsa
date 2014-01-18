assert = require 'assert'

fft = require "../src/fft"

describe 'Fast Fourier Transform', ->
    it 'should multiply two polynomials', ->
        assert.deepEqual(fft([0, 0, 1, -1]), ['0', '-1 + i', '2', '-1 - i'])
