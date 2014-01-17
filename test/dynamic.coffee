assert = require 'assert'

root = '../src/dynamic/'

fibonacci = require "#{root}fibonacci"
edit_distance = require "#{root}edit_distance"

describe 'Fibonacci sequence generator', ->
    it 'should generate the correct sequence of numbers', ->
        assert.deepEqual(fibonacci(7), [1, 1, 2, 3, 5, 8, 13])

describe 'String edit distance calculator', ->
    it 'should correctly calculate the edit distance', ->
        assert.equal(edit_distance('bristol', 'hustle'), 5)
