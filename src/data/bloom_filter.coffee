_ = require '../util'

class BloomFilter
    constructor: (@size, @num_hashes, @universe=100) ->
        @b = (0 for x in [1..@size])
        @hashes = []
        prime = _.next_prime(@universe)
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
