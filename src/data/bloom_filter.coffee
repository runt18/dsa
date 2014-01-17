_ = require 'lodash'

is_prime = (n) ->
    for x in [2..Math.ceil(Math.sqrt(n))]
        if n % x is 0
            return false
    return true

next_prime = (n) ->
    until is_prime(n)
        n++
    return n

class BloomFilter
    constructor: (@size, @num_hashes, @universe=100) ->
        @b = (0 for x in [1..@size])
        @hashes = []
        prime = next_prime(@universe)
        for x in [1..@num_hashes]
            a = _.random(1, prime - 1)
            b = _.random(0, prime - 1)
            hash = ((a, b, prime, size) ->
                return ((x) -> (1 + ((a * x + b) % prime)) % size)
            )(a, b, prime, @size)
            @hashes.push hash

    insert: (key) ->
        for hash in @hashes
            @b[hash(key)] = 1
        return this

    member: (key) ->
        for hash in @hashes
            if @b[hash(key)] is 0
                return false

        return true

module.exports = BloomFilter
