minimax = (node, depth, max_mode) ->
    if depth is 0 or not node.children? or node.children.every((x) -> x is null)
        return node.value

    best = if max_mode then -Infinity else Infinity
    fn = if max_mode then Math.max else Math.min
    for child in node.children
        best = fn(best, minimax(child, depth - 1, not max_mode))
    return best

module.exports = minimax
