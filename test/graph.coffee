root = '../src/graph/'

assert = require 'assert'
{Graph, Vertex, Edge, relax} = require "../src/data/graph"

floyd_warshall = require "#{root}shortest_path/all_pairs/floyd_warshall"
johnson = require "#{root}shortest_path/all_pairs/johnson"

dijkstra = require "#{root}shortest_path/single_source/dijkstra"
bellman_ford = require "#{root}shortest_path/single_source/bellman_ford"

kruskal = require "#{root}mst/kruskal"
prim = require "#{root}mst/prim"

bfs = require "#{root}traversal/bfs"
dfs = require "#{root}traversal/dfs"

# graph2 = new Graph(v, e)
# bellman_ford(graph, v[0])
# test(prim(graph2), [], "Prim's minimum spanning tree")
# test(kruskal(graph2), [], "Kruskal's minimum spanning tree")

v = (new Vertex() for x in [1..6])

e = [
    new Edge(v[0], v[1], 9)
    new Edge(v[0], v[4], 6)
    new Edge(v[1], v[3], 2)
    new Edge(v[1], v[5], 3)
    new Edge(v[2], v[5], 8)
    new Edge(v[2], v[3], 5)
    new Edge(v[3], v[4], 2)
    new Edge(v[3], v[2], 3)
    new Edge(v[5], v[0], 7)
    new Edge(v[5], v[4], 7)
]

v[0].neighbours = [e[0], e[1]]
v[1].neighbours = [e[2], e[3]]
v[2].neighbours = [e[4], e[5]]
v[3].neighbours = [e[6], e[7]]
v[4].neighbours = []
v[5].neighbours = [e[8], e[9]]

graph = new Graph(v)

describe 'Floyd-Warshall all-pairs shortest path', ->
    adj = [
        [0, 1, Infinity, Infinity]
        [Infinity, 0, 1, Infinity]
        [2, 4, 0, 0]
        [-1, Infinity, Infinity, 0]
    ]

    expected = [
        [0, 1, 2, 2]
        [0, 0, 1, 1]
        [-1, 0, 0, 0]
        [-1, 0, 1, 0]
    ]
    it 'should correctly calculate the adjacency matrix', ->
        assert.deepEqual(floyd_warshall(adj), expected)

# describe "Dijkstra's single source shortest path", ->
#     it 'should find the shortest path from the start vertex to all others in the graph', ->
#         assert.deepEqual(dijkstra(graph, v[0], v[2]), [v[0], v[1], v[3], v[2]])

describe 'Breadth-first search', ->
    bfs(graph, v[0])

    it 'should correctly calculate the shortest path from the start vertex to all others in the graph', ->
        assert.equal(v[2].previous.previous.previous, v[0])
