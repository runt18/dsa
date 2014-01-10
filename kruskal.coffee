
class Node
    constructor: (@data=0, @next=null) ->

class List
    constructor: (@head=null, @tail=null) ->

class DisjointSet
    constructor: (@size) ->
        @universe = (null for x in [1..@size])

    make_set: (x) ->
        node = new Node(x)
        list = new List(node, node)

        @universe[x] = list

    find_set: (x) -> @universe.head.data

    union: (x, y) ->
        @universe[x].tail.next = @universe[y].head
        @universe[x].tail = @universe[y].tail
        node = @universe[y].head
        until node is null
            @universe[node.data] = @universe[x]
            node = node.next

forest = []

# Kruskal's algorithm for minimium spanning trees
kruskal = (graph) ->
    set = new DisjointSet()

    for vertex in graph.vertices
        set.make_set(vertex)

    edges = _.sort(graph.edges, (e1, e2) -> e1.cost < e2.cost)
    for edge in edges
        if set.find_set(edge.v1) isnt set.find_set(edge.v2)
            forest.push(edge)
            set.union(edge.v1, edge.v2)
