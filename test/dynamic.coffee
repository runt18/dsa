assert = require 'assert'

root = '../src/dynamic/'

fibonacci = require "#{root}fibonacci"
edit_distance = require "#{root}edit_distance"
{is_palindrome} = require "#{root}palindromes"

describe 'Fibonacci sequence generator', ->
    it 'should generate the correct sequence of numbers', ->
        assert.deepEqual(fibonacci(7), [1, 1, 2, 3, 5, 8, 13])

describe 'String edit distance calculator', ->
    it 'should correctly calculate the edit distance', ->
        assert.equal(edit_distance('bristol', 'hustle'), 5)

describe 'Plaindrome checker', ->
    it 'should determine whether a string is palindromic', ->
        assert.equal(is_palindrome('madamimadam'), true)
        assert.equal(is_palindrome('hello world'), false)
