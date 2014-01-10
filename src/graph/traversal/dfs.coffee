# Depth-first search
# Running time: O(V + E)
dfs = (graph) ->
    for vertex in graph.vertices
        v.discovered = false
        v.explored = false
    time = 0
    for vertex in graph.vertices
        unless vertex.discovered
            dfs_visit(vertex, time)

dfs_visit = (vertex, time) ->
    vertex.discovered = true
    time++
    vertex.distance = time
    for neighbour in vertex.neighbours
        unless neighbour.discovered
            neighbour.previous = vertex
            time = dfs_visit(neighbour, time)

    vertex.explored = true
    time++
    vertex.f = time
    return time
