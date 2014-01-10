PriorityQueue = require './priority_queue'

# Prim's algorithm for minimium spanning trees
prim = (graph) ->
    queue = new PriorityQueue()

    for vertex in graph.vertices
        vertex.key = Infinity
        vertex.previous = null
        queue.insert(vertex)

    r = graph.vertices[0]
    r.key = 0

    until queue.is_empty()
        u = queue.extract_min()
        for edge in graph.edges when edge.v1 is u or edge.v2 is u
            v = u is edge.v1 then edge.v2 else edge.v1
            if v in queue.data and edge.cost < v.key
                v.previous = u
                queue.decrease_key(v, edge.cost)

module.exports = prim
