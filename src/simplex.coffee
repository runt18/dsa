_ = require 'lodash'

pivot = () ->

simplex = (coefficients, limits, basics, objective) ->
    until _.isUndefined(coef = _.find(objective, (x) -> x > 0))
        delta = []
        for limit, i in limits
            delta[i] = b[i] / coefficients[i][e]
        # choose l in b that minimises delta[l]
        if delta[l] is Infinity
            return 'unbounded'
        else
            pivot()

    x = []

    for y, i in limits
        if i in basics
            x[i] = limits[i]
        else
            x[i] = 0

    return x

module.exports = simplex
