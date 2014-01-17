PriorityQueue = require '../../data/priority_queue'

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
        for edge in graph.edges when edge.source is u or edge.target is u
            v = if u is edge.source then edge.target else edge.source
            if v in queue.data and edge.cost < v.key
                v.previous = u
                queue.decrease_key(v, edge.cost)

    return

module.exports = prim
