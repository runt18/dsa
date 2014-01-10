#! /usr/bin/env coffee

_ = require 'lodash'
require 'colors'

pretty = (o) ->
    console.log(JSON.stringify(o, null, 2))

{floyd_warshall} = require './floyd_warshall'

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

if _.isEqual(new_adj, expected)
    console.log('Floyd-Warshall works'.green)
else
    console.log('Floyd-Warshall fails'.red)
