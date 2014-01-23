assert = require 'assert'

List = require '../src/data/linked_list'

describe 'Linked List', ->
    l = new List()
    l.append(1).append(2).append(3)

    describe 'append', ->
        it 'should add an item to the list', ->
            assert.deepEqual(l.to_array(), [1, 2, 3])

    describe 'length', ->
        it 'should return the correct length', ->
            assert.equal(l.length(), 3)
