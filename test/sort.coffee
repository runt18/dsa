assert = require 'assert'

root = '../src/sort/'

counting_sort = require "#{root}counting"
radix_sort = require "#{root}radix"
quicksort = require "#{root}quick"

describe 'Radix sort', ->
    it 'should sort the list into the correct order', ->
        assert.deepEqual(radix_sort([5, 7, 9, 3, 2], 10), [2, 3, 5, 7, 9])

describe 'Counting sort', ->
    it 'should sort the list into the correct order', ->
        assert.deepEqual(counting_sort([5, 7, 9, 3, 2]), [2, 3, 5, 7, 9])

describe 'Quicksort', ->
    it 'should sort the list into the correct order', ->
        assert.deepEqual(quicksort([5, 7, 9, 3, 2]), [2, 3, 5, 7, 9])
