#! /usr/bin/env coffee

_ = require 'lodash'
require 'colors'

{Graph, Vertex, relax} = require './src/graph/graph'

floyd_warshall = require './src/graph/sssp/floyd_warshall'
dijkstra = require './src/graph/shortest_path/dijkstra'
{Man, Woman, gale_shapley} = require './src/gale_shapley'

pretty = (o) ->
    console.log(JSON.stringify(o, null, 2))

test = (actual, expected, message) ->
    if _.isEqual(actual, expected)
        console.log("#{message} passed".green)
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
vertex = new Vertex()
graph = new Graph([vertex], [])
dijkstra(graph, vertex)

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

test(new_adj, expected, 'Floyd-Warshall')
