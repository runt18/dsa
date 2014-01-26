height = (tree) ->
    h = 1
    lh = if tree.left then height(tree.left) else 0
    rh = if tree.right then height(tree.right) else 0
    h += Math.max(lh, rh)
    return h

is_balanced = (tree) -> Math.abs(height(tree.left) - height(tree.right)) <= 1

module.exports = {height, is_balanced}
