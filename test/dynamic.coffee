assert = require 'assert'

root = '../src/dynamic/'

fibonacci = require "#{root}fibonacci"
edit_distance = require "#{root}edit_distance"
{is_palindrome, min_palindrome} = require "#{root}palindromes"

describe 'Fibonacci sequence generator', ->
    it 'should generate the correct sequence of numbers', ->
        assert.deepEqual(fibonacci(7), [1, 1, 2, 3, 5, 8, 13])

describe 'String edit distance calculator', ->
    it 'should correctly calculate the edit distance', ->
        assert.equal(edit_distance('bristol', 'hustle'), 5)

describe 'Palindromes', ->
    it 'should determine whether a string is palindromic', ->
        assert.equal(is_palindrome('madamimadam'), true)
        assert.equal(is_palindrome('a'), true)
        assert.equal(is_palindrome('ab'), false)
        assert.equal(is_palindrome('aba'), true)
        assert.equal(is_palindrome('hello world'), false)

    it 'should find the minimum number of palindromes the given string can be constructed from', ->
        assert.equal(min_palindrome('a'), 1)
        assert.equal(min_palindrome('ab'), 2)
        assert.equal(min_palindrome('aba'), 1)
        assert.equal(min_palindrome('baobab'), 4)
        assert.equal(min_palindrome('amanaplanacanalpanama'), 1)
        assert.equal(min_palindrome('abcdef'), 6)
