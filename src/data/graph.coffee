class Graph
    constructor: (@vertices=[], @edges=[]) ->

class Vertex
    constructor: (@neighbours=[]) ->

class Edge
    constructor: (@source, @target, @cost=0) ->

relax = (u, e) ->
    v = e.target
    new_dist = u.distance + e.cost
    if v.distance > new_dist
        v.distance = new_dist
        v.previous = u

    return v

module.exports = {Graph, Vertex, Edge, relax}
