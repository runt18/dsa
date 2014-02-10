_ = require 'lodash'
assert = require 'assert'

Set = require '../src/data/set'

# describe 'Set', ->
#     describe 'subsets', ->
#         it 'should return all subsets of the set', ->
#             # assert.deepEqual(new Set().subsets().to_array(), [[]])
#             assert.deepEqual(new Set([1]).subsets().to_array(), [[1], []])
#             assert.deepEqual(new Set([1, 2]).subsets(), [[1, 2], [2], [1], []])
