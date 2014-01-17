assert = require 'assert'

root = '../src/string/'

kmp = require "#{root}kmp"
bmh = require "#{root}bmh"

describe 'Knuth-Morris-Pratt string matching', ->
    it 'should find the correct substring index', ->
        assert.equal(kmp('ababaabbababb', 'ababb'), [9])

describe 'Boyer-Moore-Horspool string matching', ->
    it 'should find the correct substring index', ->
        assert.deepEqual(bmh('ababaabbababb', 'ababb'), [9])
