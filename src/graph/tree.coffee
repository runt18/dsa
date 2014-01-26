class Node
    constructor: (@left=null, @right=null, @value=null) ->

height = (tree) ->
    h = 1
    lh = if tree.left then height(tree.left) else 0
    rh = if tree.right then height(tree.right) else 0
    h += Math.max(lh, rh)
    return h

is_balanced = (tree) -> Math.abs(height(tree.left) - height(tree.right)) <= 1

make_tree = (array) ->
    l = array.length

    if l is 0
        return null

    tree = new Node()
    divider = Math.floor(l / 2)

    tree.value =  array[divider]
    tree.left = make_tree(array[...divider])
    tree.right = make_tree(array[divider+1..])

    return tree

module.exports = {Node, height, is_balanced, make_tree}
