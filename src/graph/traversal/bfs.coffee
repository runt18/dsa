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

    queue = new Queue()

    queue.enqueue(start)

    until queue.is_empty()
        u = queue.dequeue()
        for vertex in u.neighbours
            unless vertex.discovered
                vertex.discovered = true
                vertex.distance = u.distance + 1
                queue.enqueue(vertex)
        u.explored = true
