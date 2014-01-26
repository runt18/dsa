assert = require 'assert'

knapsack = require '../src/knapsack'

describe 'Knapsack', ->
    it 'should calculate the maximum value that can be stored with the capacity', ->
        items = [
            {weight: 2, value: 5}
            {weight: 4, value: 9}
            {weight: 7, value: 2}
        ]

        capacity = 10

        assert.equal(knapsack(items, capacity), 9)
