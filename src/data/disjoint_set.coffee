List = require './linked_list'

class DisjointSet
    constructor: (@size) ->
        @universe = (null for x in [1..@size])

    make_set: (x, data) ->
        node = new Node(data)
        list = new List(node, node)

        @universe[x] = list

    find_set: (x) ->
        console.log x
        @universe[x].head.data

    union: (x, y) ->
        @universe[x].tail.next = @universe[y].head
        @universe[x].tail = @universe[y].tail
        node = @universe[y].head
        until node is null
            @universe[node.data] = @universe[x]
            node = node.next
