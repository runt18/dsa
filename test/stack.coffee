assert = require 'assert'

SetOfStacks = require '../src/data/set_of_stacks'

describe 'SetOfStacks', ->
    s1 = new SetOfStacks(2)

    describe 'push', ->
        it 'should use new stacks when ones fill up', ->
            s1.push(1).push(2).push(3)
            assert.equal(s1.idx, 1)

    describe 'pop', ->
        it 'should return the most recently pushed value', ->
            assert.equal(s1.pop(), 3)

        it 'should update the size correctly', ->
            assert.equal(s1.idx, 0)

        it 'should use an index if specified', ->
            s1.push(3).push(4).push(5)
            assert.equal(s1.pop(1), 4)
            assert.equal(s1.pop(0), 2)
            assert.equal(s1.pop(), 5)
