assert = require 'assert'

minimax = require '../src/minimax'

describe 'Minimax', ->
    it 'should extract the correct value from the decision tree', ->
        tree =
            children: [
                {children: [{value: 3}, {value: 12}, {value: 8}]}
                {children: [{value: 2}, {value: 4}, {value: 6}]},
                {children: [{value: 14}, {value: 5}, {value: 2}]}
            ]

        assert.equal(minimax(tree, 3, true), 3)
