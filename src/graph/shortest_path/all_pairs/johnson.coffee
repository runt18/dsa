# Johnson's algorithm for finding the shortest path between every pair of
# vertices in a graph
# Works by reweighting the graph to ensure all edges have a non-negative weight,
# then running Dijkstra's on each vertex
# Running time: O(VE + V^2logV) this better than Floyd-Warshall's O(V^3) for
# sparse graphs

dijkstra = require '../single_source/dijkstra'
bellman_ford = require '../single_source/bellman_ford'

johnson = (graph) ->
    # new_graph = add_start(graph)
    # for v in graph.vertices
    #     delta[s][v] = bellman_ford(graph, s, v)
    # for edge in graph.edges
    #     w_prime[u][v] =

    # for u in graph.vertices
    #     dijkstra(graph, u)
    #     for v in graph.vertices
    #         d[u][v] = delta(u, v) + delta(s, v) - delta(s, u)

    # return d

module.exports = johnson
