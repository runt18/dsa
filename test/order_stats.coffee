assert = require 'assert'

{rand_select, select} = require "../src/order_stats"

describe 'Order Statistics', ->
    describe 'Random select', ->
        it 'should find the ith smallest element of the array', ->
            assert.equal(rand_select([5, 16, 3, 7, 8], 2), 5)

    describe 'BFPRT select', ->
        it 'should find the ith smallest element of the array', ->
            assert.equal(select([5, 16, 3, 7, 8, 13, 27, 93, 5, 10], 2), 5)
