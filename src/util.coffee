_ = require 'lodash'

# Returns every (xn + o)th element of the array
nths = (a) -> ((a) -> ((n, o) -> (x for x, i in a when i % n is o)))(a)
evens = (a) -> nths(a)(2, 0)
odds = (a) -> nths(a)(2, 1)

_.mixin({nths, evens, odds})

module.exports = _
