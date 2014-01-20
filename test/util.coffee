assert = require 'assert'

_ = require '../src/util'

describe 'Utilities', ->
    describe 'nths', ->
        it 'should return the correct elements of the array', ->
            assert.deepEqual(_.nths([9, 6, 8, 2, 7])(2, 0), [9, 8, 7])
