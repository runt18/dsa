_ = require 'lodash'

{floor, ceil, random, sqrt} = Math

# Returns every (xn + o)th element of the array
nths = (a) -> ((a) -> ((n, o) -> (x for x, i in a when i % n is o)))(a)
evens = (a) -> nths(a)(2, 0)
odds = (a) -> nths(a)(2, 1)

# Splits array a into chunks of size n
chunks = (a, n) -> (a[i...i+n] for x, i in a by n)

# Returns the median value of the array of numbers
median = (a) -> a.sort()[floor(a.length / 2)]

# 50/50 chance random boolean
coin = -> random() > 0.5

# Returns true if n is prime
is_prime = (n) ->
    for x in [2..ceil(sqrt(n))]
        if n % x is 0
            return false
    return true

# Find the smallest prime greater than n
next_prime = (n) ->
    n++ until is_prime(n)
    return n

# Finds the smallest power of `power` greater than n
next_power = (n, power) ->
    x = 1
    x *= power while x < n
    return x

_.mixin({nths, evens, odds, chunks, median, coin, is_prime, next_prime,
    next_power})

module.exports = _
