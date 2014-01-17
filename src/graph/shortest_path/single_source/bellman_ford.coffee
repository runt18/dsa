{relax} = require '../../graph'

# Bellman-Ford shortest path algorithm
# Running time: O(VE)
bellman_ford = (graph, start) ->
    for vertex in graph.vertices
        vertex.distance = Infinity
        vertex.previous = null

    start.distance = 0

    for i in [1..graph.vertices.length - 1]
        for vertex in graph.vertices
            for edge in vertex.neighbours
                relax(vertex, edge)

    for vertex in graph.vertices
        for edge in vertex.neighbours
            if edge.target.distance > vertex.distance + edge.cost
                throw new Error('Negative weight cycle detected')

module.exports = bellman_ford
