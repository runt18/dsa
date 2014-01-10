_ = require 'lodash'

class Man
    constructor: (@name) ->
        @match = null
        @rejected = []

    propose: ->
        woman = _.find(@preferences, (woman) => woman not in @rejected)

        if woman.prefers(this)
            old = woman.match
            woman.match = this
            this.match = woman
            if old
                old.match = null
                old.rejected.push(woman)
        else
            @rejected.push(woman)

class Woman
    constructor: (@name) ->
        @match = null

    prefers: (man) ->
        @match is null or @preferences.indexOf(man) < @preferences.indexOf(@match)

gale_shapley = (men) ->
    until _.isUndefined(man = _.find(men, (m) -> m.match is null))
        man.propose()

module.exports = {Man, Woman, gale_shapley}
