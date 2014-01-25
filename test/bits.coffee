assert = require 'assert'

{bits_to_str, str_to_bits, is_power_of_two, bit_diff, swap_adjacent, set_bits} = require '../src/bits'

describe 'Bit manipulation', ->
    describe 'set_bits', ->
        it 'should set the correct bits', ->
            assert.equal(set_bits(1024, 21, 2, 6), 1108)

    describe 'bits_to_str', ->
        it 'should convert the number to a bitstring', ->
            assert.equal(bits_to_str(19), '0000000000010011.0000')
            assert.equal(bits_to_str(2.75), '0000000000000010.1100')

    describe 'str_to_bits', ->
        it 'should convert the bitstring to a number', ->
            assert.equal(str_to_bits('0000000000010011'), 19)

    describe 'is_power_of_two', ->
        it 'should determine whether a number is a power of two', ->
            assert.equal(is_power_of_two(32), true)
            assert.equal(is_power_of_two(0), true)
            assert.equal(is_power_of_two(18), false)

    describe 'bit_diff', ->
        it 'should return the number of bits that differ between the two numbers', ->
            assert.equal(bit_diff(31, 14), 2)

    describe 'swap_adjacent', ->
        it 'should swap every adjacent pair of bits', ->
            a = str_to_bits('101101')
            b = str_to_bits('011110')
            assert.equal(swap_adjacent(a), b)

