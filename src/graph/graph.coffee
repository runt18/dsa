class Graph
    constructor: (@vertices=[], @edges=[]) ->

class Vertex
    constructor: (@neighbours=[]) ->

relax = (u, e) ->
    v = e.target
    new_dist = u.distance + e.cost
    if v.distance > new_dist
        v.distance = new_dist
        v.previous = u

module.exports = {Graph, Vertex, relax}
