_ = require 'lodash'

class PriorityQueue
    constructor: ->
        @data = []

    parent: (n) -> Math.floor((n - 1) / 2)

    left: (n) -> (2 * n) + 1

    right: (n) -> (2 * n) + 2

    heapify: (i) ->
        left = @left(i)
        right = @right(i)
        if left < @data.length and @data[left].distance < @data[i].distance
            smallest = left
        else
            smallest = i
        if right < @data.length and @data[right].distance < @data[smallest].distance
            smallest = right

        unless smallest is i
            tmp = @data[smallest]
            @data[smallest] = @data[i]
            @data[i] = tmp
            @heapify(smallest)

    decrease_key: (el, key) ->
        if key > @data[el.i].distance
            fatal('New key is greater than existing key')

        @data[el.i].distance = key

        while el.i > 0 and @data[@parent(el.i)].distance > @data[el.i].distance
            tmp = @data[el.i]
            @data[@parent(el.i)] = tmp
            @data[el.i] = @data[@parent(el.i)]
            el.i = @parent(el.i)

        return this

    is_empty: -> @data.length is 0

    extract_min: ->
        if @data.length < 1
            throw new Error('Heap underflow')

        min = @data[0]
        @data[0] = _.last(@data)
        @data = @data[..-1]
        @heapify(0)
        return min

    insert: (el) ->
        el.i = @data.length
        @data.push(el)
        @decrease_key(el, el.distance)
        return this

module.exports = PriorityQueue
