assert = require 'assert'

{Node, height, is_balanced, make_tree, tree_to_lists} = require '../src/graph/tree'
List = require '../src/data/linked_list'

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

    l1 = new List()
    l1.append(2)
    l2 = new List()
    l2.append(1).append(3)
    lists = [l1, l2]

    describe 'height', ->
        it 'should return the height of the tree', ->
            assert.equal(height(tree1), 3)

    describe 'is_balanced', ->
        it 'should determine whether the tree is balanced', ->
            assert.equal(is_balanced(tree1), true)

    describe 'make_tree', ->
        it 'should create a new balanced binary tree from the array', ->
            assert.deepEqual(make_tree([1, 2, 3]), tree2)

    describe 'tree_to_lists', ->
        it 'should convert a tree to an array of linked lists, one for each level', ->
            assert.deepEqual(tree_to_lists(tree2), lists)

