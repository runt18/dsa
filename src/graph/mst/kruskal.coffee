_ = require 'lodash'

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
