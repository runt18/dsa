PriorityQueue = require '../../../data/priority_queue'
{relax} = require '../../../data/graph'
_ = require 'lodash'

# Dijkstra's shortest path algorithm
# Running time: O(ElogV)     (Binary heap)
#               O(E + VlogV) (Fibonacci heap)
dijkstra = (graph, start, end) ->
    queue = new PriorityQueue()

    previous = (null for x in graph)
    distances = (Infinity for x in graph)
    distances[start] = 0

    vertices = []

    until vertices.length is 0
        vertex = _.min(vertices)
        for i in graph[vertex.i]
            if distances[i] > distances[vertex.i] + graph[vertex.i][i]
                distances[i] = distances[vertex.i] + graph[vertex.i][i]
                previous[i] = target.i

    # for vertex in graph.vertices
    #     vertex.distance = Infinity
    #     vertex.previous = null
    #     queue.insert(vertex)

    # start.distance = 0

    # until queue.is_empty()
    #     console.log queue.data.length
    #     vertex = queue.extract_min()
    #     for edge in vertex.neighbours
    #         target = edge.target
    #         new_dist = vertex.distance + edge.cost
    #         if target.distance > new_dist
    #             queue.decrease_key(target, new_dist)
    #             target.previous = vertex

    # path = [end]

    # v = end
    # while v.previous isnt null
    #     path.push(v)
    #     v = v.previous

    # return path.reverse()

module.exports = dijkstra
