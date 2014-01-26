assert = require 'assert'

{height, is_balanced} = require '../src/graph/tree'

describe 'Tree operations', ->
    tree1 =
        value: 4
        left:
            value: 5
            left:
                value: 1
            right:
                value: 2
        right:
            value: 3

    describe 'height', ->
        it 'should return the height of the tree', ->
            assert.equal(height(tree1), 3)

    describe 'is_balanced', ->
        it 'should determine whether the tree is balanced', ->
            assert.equal(is_balanced(tree1), true)

