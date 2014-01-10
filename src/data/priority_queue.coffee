class PriorityQueue
    constructor: ->
        @data = []

    parent: (n) -> Math.floor(n / 2)

    left: (n) -> 2 * n  + 1

    right: (n) -> 2 * n + 2

    heapify: (i) ->
        left = @left(i)
        right = @right(i)
        if left <= @data.length and @data[left] < @data[i]
            smallest = left
        else
            smallest = i
        if right <= @data.length and @data[right] < @data[smallest]
            smallest = right

        unless smallest is i
            tmp = @data[smallest]
            @data[smallest] = @data[i]
            @data[i] = tmp
            heapify(smallest)

    decrease_key: (el, key) ->
        if key > @data[el.i].key
            fatal('New key is greater than existing key')

        @data[el.i].key = key

        while el.i > 1 and @data[@parent(el.i)].key > @data[el.i].key
            tmp = @data[el.i]
            @data[parent(el.i)] = tmp
            @data[el.i] = @data[parent(el.i)]
            el.i = parent(el.i)

    is_empty: -> @data.length is 0

    extract_min: ->
        if @data.length < 1
            fatal('Heap underflow')

        min = @data[0]
        @data[0] = @data[@data.length - 1]
        @heapify(0)
        return @data.pop()

    insert: (el) ->
        el.i = @data.length
        @data.push(el)
        @decrease_key(el, el.key)

module.exports = PriorityQueue
