_ = require 'lodash'

# Floyd-Warshall algorithm for finding the shortest path between every pair of vertices in a graph
# Running time: O(V^3) -- better than running Dijktra's on each vertex O(VE + V^2logV)

floyd_warshall = (matrix) ->
    size = matrix.length

    prev = matrix
    curr = _.cloneDeep(matrix)

    for k in [0...size]
        for i in [0...size]
            for j in [0...size]
                val = Math.min(prev[i][j], prev[i][k] + prev[k][j])
                curr[i][j] = val
        prev = _.cloneDeep(curr)

    return curr

module.exports = {floyd_warshall}
