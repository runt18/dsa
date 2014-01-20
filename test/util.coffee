assert = require 'assert'

_ = require '../src/util'

describe 'Utilities', ->
    describe 'nths', ->
        it 'should return the correct elements of the array', ->
            assert.deepEqual(_.nths([9, 6, 8, 2, 7])(2, 0), [9, 8, 7])

    describe 'chunks', ->
        it 'should correctly split the array', ->
            assert.deepEqual(_.chunks([9, 6, 8, 2, 7], 2), [[9, 6], [8, 2], [7]])

    describe 'median', ->
        it 'should find the median', ->
            assert.equal(_.median([9, 6, 8, 2, 7]), 7)

    describe 'is_prime', ->
        it 'should correctly identify the primality of a number', ->
            assert.equal(_.is_prime(5), true)
            assert.equal(_.is_prime(2), true)
            assert.equal(_.is_prime(10), false)
            assert.equal(_.is_prime(144), false)

    describe 'next_prime', ->
        it 'should find the smallest prime greater than or equal to the given number', ->
            assert.equal(_.next_prime(7), 7)
            assert.equal(_.next_prime(9), 11)
            assert.equal(_.next_prime(1), 2)

    describe 'next_power', ->
        it 'should find the next power of x greater than or equal to n', ->
            assert.equal(_.next_power(5, 3), 9)
            assert.equal(_.next_power(11, 3), 27)

    describe 'zero_pad', ->
        it 'should add enough zeros', ->
            a = [1, 2, 3]
            _.zero_pad(a, (l) -> l is 5)
            assert.deepEqual(a, [1, 2, 3, 0, 0])
            _.zero_pad(a, (l) -> l > 10 and l % 3 is 0)
            assert.deepEqual(a, [1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0])
