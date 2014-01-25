assert = require 'assert'

{bits_to_str, str_to_bits, set_bits} = require '../src/bits'

describe 'Bit manipulation', ->
    describe 'set_bits', ->
        it 'should set the correct bits', ->
            assert.equal(set_bits(512, 21, 2, 6), 564)

    describe 'bits_to_str', ->
        it 'should convert the number to a bitstring', ->
            assert.equal(bits_to_str(19), '0000000000010011')

    describe 'str_to_bits', ->
        it 'should convert the bitstring to a number', ->
            assert.equal(str_to_bits('0000000000010011'), 19)

