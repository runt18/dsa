_ = require 'lodash'

class Set
    constructor: (data=[]) ->
        @data = {}
        for x in data
            @add(x)
        @size = 0

    add: (x) ->
        @data[@hash(x)] = x
        @size++
        return this

    remove: (x) ->
        delete @data[@hash(x)]
        @size--
        return this

    hash: (x) ->
        s = JSON.stringify(x)
        n = 0
        for c, i in s
            n += s.charCodeAt(i)
        return n

    contains: (x) -> x of @data

    subsets: (set=this) ->
        s = new Set()
        if set.size is 0
            s.add(new Set())
            return s

        s.add(set)

        for k, v of set
            x = _.clone(set)
            delete x[k]
            for sub in set.subsets()
                s.add(sub)

        return s

    to_array: ->
        a = []

        for k, v of @data
            if v.to_array?
                a = a.concat(v.to_array())
            else
                a.push(v)

        return add

module.exports = Set
