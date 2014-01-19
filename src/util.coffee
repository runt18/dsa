_ = require 'lodash'

# Returns every (xn + o)th element of the array
nths = (a) -> ((a) -> ((n, o) -> (x for x, i in a when i % n is o)))(a)
evens = (a) -> nths(a)(2, 0)
odds = (a) -> nths(a)(2, 1)

# Splits array a into chunks of size n
chunks = (a, n) -> (a[i...i+n] for x, i in a by n)

# Returns the median value of the array of numbers
median = (a) -> a.sort()[Math.floor(a.length / 2)]

coin = -> Math.random() > 0.5

_.mixin({nths, evens, odds, chunks, median, coin})

module.exports = _
