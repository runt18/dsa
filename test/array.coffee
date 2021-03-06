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
    k_merge
    merge_sorted
    sort_anagrams
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

    describe 'Escape', ->
        it 'should escape spaces', ->
            assert.deepEqual(escape_spaces('hello world'), 'hello%20world')

    describe 'Zero cross', ->
        input = [
            [1, 2, 3, 4]
            [0, 8, 1, 9]
            [4, 1, 4, 2]
            [9, 3, 0, 6]
        ]

        expected = [
            [0, 2, 0, 4]
            [0, 0, 0, 0]
            [0, 1, 0, 2]
            [0, 0, 0, 0]
        ]

        it 'should set every row and column with a zero in to all zeroes', ->
            assert.deepEqual(zero_cross(input), expected)

    describe 'Max', ->
        it 'should find the maximum element', ->
            assert.equal(max([3,5,7,1,9,2]), 9)

    describe 'Sort anagrams', ->
        it 'should sort the array of strings so all anagrams are adjacent', ->
            assert.deepEqual(sort_anagrams(['spot', 'eats', 'tops']), ['eats', 'spot', 'tops'])

    describe 'Merge sorted', ->
        it 'should merge the two sorted arrays, keeping them sorted', ->
            a_contents = [1, 4, 7, 9]
            i = a_contents.length
            b = [2, 5, 12]

            a = new Array(i + b.length)
            a[0...i] = a_contents

            assert.deepEqual(merge_sorted(a, b, i - 1), [1, 2, 4, 5, 7, 9, 12])

    # describe 'K-merge', ->
    #     it 'should merge the sorted arrays', ->
    #         a = [1, 4, 7]
    #         b = [2, 3, 9]
    #         c = [5, 6, 8]

    #         assert.deepEqual(k_merge([a, b, c]), [1..9])
