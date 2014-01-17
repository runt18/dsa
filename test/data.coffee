assert = require 'assert'

root = '../src/data/'

PriorityQueue = require "#{root}priority_queue"
SkipList = require "#{root}skip_list"
BloomFilter = require "#{root}bloom_filter"

# sl = new SkipList()
# sl.insert(2, 'foo').insert(5, 'bar').insert(8, 'baz')
# test(sl.find(2), 'foo', "Skip list data store")

describe 'PriorityQueue', ->
    pq = new PriorityQueue()
    pq
        .insert({distance: 8, data: 'foo'})
        .insert({distance: 5, data: 'bar'})
        .insert({distance: 19, data: 'baz'})
    describe 'extract_min', ->
        it 'should return the element with the lowest key', ->
            assert.equal(pq.extract_min().data, 'bar')

describe 'BloomFilter', ->
    bf = new BloomFilter(10, 5)
    bf.insert(8)
    describe 'member', ->
        it 'should have no false negatives', ->
            assert.equal(bf.member(10), false)
