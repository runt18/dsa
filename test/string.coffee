assert = require 'assert'

root = '../src/string/'

kmp = require "#{root}kmp"
bmh = require "#{root}bmh"

describe 'Knuth-Morris-Pratt string matching', ->
    it 'should find the correct substring index', ->
        assert.deepEqual(kmp('aaa', 'a'), [0, 1, 2])
        assert.deepEqual(kmp('hello', 'll'), [2])
        assert.deepEqual(kmp('bbaa', 'ba'), [1])
        assert.deepEqual(kmp('ababaabbababb', 'ababb'), [8])

describe 'Boyer-Moore-Horspool string matching', ->
    it 'should find the correct substring index', ->
        assert.deepEqual(bmh('ababaabbababb', 'ababb'), [9])
