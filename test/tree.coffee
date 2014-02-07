assert = require 'assert'

Tree = require '../src/data/tree'
List = require '../src/data/linked_list'

describe 'Tree', ->
    tree1 = new Tree(
        new Tree(
            new Tree(null, null, 1),
            new Tree(null, null, 2),
            5
        ),
        new Tree(
            null,
            new Tree(null, null, 3),
            6
        ),
        4
    )

    tree2 = new Tree(
        new Tree(null, null, 1),
        new Tree(null, null, 3),
        2
    )

    tree3 = new Tree(
        new Tree(null, null, 1),
        new Tree(null, null, 1),
        1
    )


    l1 = new List()
    l1.append(2)
    l2 = new List()
    l2.append(1).append(3)
    lists = [l1, l2]

    describe 'height', ->
        it 'should return the height of the tree', ->
            assert.equal(tree1.height(), 3)

    describe 'is_balanced', ->
        it 'should determine whether the tree is balanced', ->
            assert.equal(tree1.is_balanced(), true)

    describe 'make_tree', ->
        it 'should create a new balanced binary tree from the array', ->
            assert.deepEqual(Tree.from_array([1, 2, 3]), tree2)

    describe 'find_sum', ->
        it 'should find all paths in the tree that sum to the given value', ->
            assert.deepEqual(tree2.find_sum(3), [[2, 1]])
            assert.deepEqual(tree2.find_sum(5), [[2, 3]])
            # assert.deepEqual(tree2.find_sum(6), [[1, 2, 3]])

    describe 'is_unival', ->
        it 'should determine whether all values in the tree are the same', ->
            assert.equal(tree1.is_unival(), false)
            assert.equal(tree3.is_unival(), true)
