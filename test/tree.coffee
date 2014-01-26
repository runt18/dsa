assert = require 'assert'

{Node, height, is_balanced, make_tree} = require '../src/graph/tree'

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

    tree2 = new Node(
        new Node(null, null, 1),
        new Node(null, null, 3),
        2
    )

    describe 'height', ->
        it 'should return the height of the tree', ->
            assert.equal(height(tree1), 3)

    describe 'is_balanced', ->
        it 'should determine whether the tree is balanced', ->
            assert.equal(is_balanced(tree1), true)

    describe 'make_tree', ->
        it 'should create a new balanced binary tree from the array', ->
            assert.deepEqual(make_tree([1, 2, 3]), tree2)


