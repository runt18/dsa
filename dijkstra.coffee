PriorityQueue = require './priority_queue'
{relax} = require './graph'

# Dijkstra's shortest path algorithm
# Running time: O(ElogV)     (Binary heap)
#               O(E + VlogV) (Fibonacci heap)
dijkstra = (graph, start) ->
    queue = new PriorityQueue()

    for vertex in graph.vertices
        vertex.distance = Infinity
        vertex.previous = null
        queue.insert(vertex)

    start.distance = 0

    until queue.is_empty()
        vertex = queue.extract_min()
        for edge in vertex.neighbours
            relax(vertex, edge)
