coin = -> Math.random() > 0.5

class Node
    constructor: (@data=null, @key=0, @next=null) ->

class SkipList
    constructor: ->
        @num_levels = 1
        @levels = []
        @list = null

    insert: (key, data) ->
        if @list is null
            @list = new Node(data, key)
        else
            prev_node = @_find(key)
            console.log key, prev_node
            node = new Node(data, key, prev_node.next)
            prev_node.next = node

        lower = node

        level = 1

        while coin()
            n = new Node(data, key)
            n.below = lower
            lower = n
            level++

        @num_levels = Math.max(@num_levels, level)

        if @list is null
            @list = n

        return this

    remove: (key) ->
        [prev, node] = @_find(key)
        prev.next = node.next

        return this

    _find: (key) ->
        node = @list
        prev = null
        level = 1

        console.log node

        if node.key is key
            return [prev, node]

        while node isnt null
            if node.key is key
                return [prev, node]
            else if level < @num_levels and node.next.key > key
                console.log node.below
                node = node.below
                prev = node
                level++
            else
                node = node.next
                prev = node
        return null

    find: (key) ->
        @_find(key).data or 'Not found'

    successor: (key) ->
        @_find(key).next.key

module.exports = SkipList
