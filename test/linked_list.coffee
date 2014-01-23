assert = require 'assert'

List = require '../src/data/linked_list'

describe 'Linked List', ->
    l = new List()

    describe 'append', ->
        l.append(1).append(2).append(3)
        it 'Add an item to the list', ->
            assert.deepEqual(l.to_array(), [1, 2, 3])
