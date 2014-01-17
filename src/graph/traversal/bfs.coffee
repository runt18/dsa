# Breadth-first search
# Running time: O(V + E)
bfs = (graph, start) ->
    for vertex in graph.vertices
        vertex.discovered = false
        vertex.explored = false
        vertex.distance = Infinity
        vertex.previous = null

    start.discovered = true
    start.distance = 0
    start.previous = null

    queue = []
    queue.push(start)

    until queue.length is 0
        u = queue.splice(0, 1)[0]
        for edge in u.neighbours
            vertex = edge.target
            unless vertex.discovered
                vertex.discovered = true
                vertex.distance = u.distance + edge.cost
                vertex.previous = u
                queue.push(vertex)
        u.explored = true

module.exports = bfs
