#! /usr/bin/env coffee

_ = require 'lodash'
require 'colors'

{Graph, Vertex, Edge, relax} = require './src/graph/graph'


floyd_warshall = require './src/graph/shortest_path/all_pairs/floyd_warshall'
johnson = require './src/graph/shortest_path/all_pairs/johnson'

dijkstra = require './src/graph/shortest_path/single_source/dijkstra'
bellman_ford = require './src/graph/shortest_path/single_source/bellman_ford'

kruskal = require './src/graph/mst/kruskal'
prim = require './src/graph/mst/prim'

{Man, Woman, gale_shapley} = require './src/gale_shapley'

fibonacci = require './src/dynamic/fibonacci'
edit_distance = require './src/dynamic/edit_distance'

counting_sort = require './src/sort/counting'
radix_sort = require './src/sort/radix'

kmp = require './src/string/kmp'
bmh = require './src/string/bmh'

bfs = require './src/graph/traversal/bfs'
dfs = require './src/graph/traversal/dfs'



pretty = (o) ->
    console.log(JSON.stringify(o, null, 2))

passed = 0
total = 0

test = (actual, expected, message) ->
    total++
    if _.isEqual(actual, expected)
        console.log("#{message} passed".green)
        passed++
    else
        console.log("#{message} failed".red)
        console.log('Expected')
        console.log(actual)
        console.log('to be')
        console.log(expected)

# Test Floyd-Warshall
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

new_adj = floyd_warshall(adj)

# Test Dijkstra
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
# graph2 = new Graph(v, e)

# bellman_ford(graph, v[0])

# test(dijkstra(graph, v[0], v[2]), [v[0], v[1], v[3], v[2]], "Dijkstra's path-finding")
# test(prim(graph2), [], "Prim's minimum spanning tree")
# test(kruskal(graph2), [], "Kruskal's minimum spanning tree")

bfs(graph, v[0])

# Test Gale-shapley
alan = new Man('Alan')
bill = new Man('Bill')
carl = new Man('Carl')

debbie = new Woman('Debbie')
elena = new Woman('Elena')
freida = new Woman('Freida')

alan.preferences = [debbie, elena, freida]
bill.preferences = [elena, debbie, freida]
carl.preferences = [debbie, freida, elena]

debbie.preferences = [carl, alan, bill]
elena.preferences = [alan, bill, carl]
freida.preferences = [alan, carl, bill]

men = [alan, bill, carl]

gale_shapley(men)

test(carl.match, debbie, 'Gale-Shapley stable matching')
test(v[2].previous.previous.previous, v[0], 'Breadth-first search')

# Test fibonacci
test(fibonacci(7), [1, 1, 2, 3, 5, 8, 13], 'Fibonacci')
test(edit_distance('bristol', 'hustle'), 5, 'Edit distance')
test(counting_sort([5, 7, 9, 3, 2]), [2, 3, 5, 7, 9], 'Counting sort')
test(radix_sort([5, 7, 9, 3, 2], 10), [2, 3, 5, 7, 9], 'Radix sort')
test(kmp('ababaabbababb', 'ababb'), [9], 'Knuth-Morris-Pratt string matcher')
test(bmh('ababaabbababb', 'ababb'), [9], 'Boyer-Moore-Horspool string matcher')

test(new_adj, expected, 'Floyd-Warshall')

msg = "#{passed} / #{total} tests passed (#{(passed / total * 100).toFixed(2)}%)"
msg = if passed is total then msg.green else msg.red
console.log(msg)
