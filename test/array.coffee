assert = require 'assert'

{
    all_unique
    reverse
    max
    is_anagram
    escape_spaces
    rotate_image
    zero_cross
    is_rotation
} = require '../src/array'

describe 'Array functions', ->
    describe 'All unique', ->
        it 'should determine whether all elements of the array are unique', ->
            assert.equal(all_unique('hello'), false)
            assert.equal(all_unique('abcd'), true)

    describe 'Reverse', ->
        it 'should reverse the array', ->
            assert.deepEqual(reverse('hello\0'), 'olleh\0')

    describe 'Anagram', ->
        it 'should correctly identify anagrams', ->
            assert.equal(is_anagram('stop', 'spot'), true)
            assert.equal(is_anagram('fork', 'cord'), false)

# console.log escape_spaces('hi there john')

# console.log(zero_cross([
#     [1, 2, 3, 4],
#     [0, 8, 1, 9],
#     [4, 1, 4, 2],
#     [9, 3, 0, 6]
# ]))

# console.log(max([3,5,7,1,9,2]))
