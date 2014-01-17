_ = require 'lodash'

class Node
    constructor: (@data=null, @next=null) ->

class List
    constructor: (@head=null, @tail=null) ->

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

# Kruskal's algorithm for minimium spanning trees
kruskal = (graph) ->
    forest = []
    set = new DisjointSet(graph.vertices.length)

    for vertex, i in graph.vertices
        set.make_set(i, vertex)
        vertex.i = i

    edges = _.sortBy(graph.edges, (e) -> e.cost)
    for edge in edges
        if set.find_set(edge.source.i) isnt set.find_set(edge.target.i)
            forest.push(edge)
            set.union(edge.source.i, edge.target.i)

    return forest

module.exports = kruskal
