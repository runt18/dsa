List = require '../data/linked_list'

class Tree
    constructor: (@left=null, @right=null, @value=null) ->

    is_leaf: -> @left is null and @right is null

    height: (node=this) ->
        h = 1
        lh = if node.left then node.height(node.left) else 0
        rh = if node.right then node.height(node.right) else 0
        h += Math.max(lh, rh)
        return h

    is_balanced: -> Math.abs(@height(@left) - @height(@right)) <= 1

    to_lists: (node=this, lists=[], level=0) ->
        unless lists[level]
            lists[level] = new List()

        lists[level].append(node.value)

        if node.left
            node.to_lists(node.left, lists, level + 1)

        if node.right
            node.to_lists(node.right, lists, level + 1)

        return lists

    @from_array: (array) ->
        l = array.length

        if l is 0
            return null

        tree = new Tree()
        divider = Math.floor(l / 2)

        tree.value =  array[divider]
        tree.left = @from_array(array[...divider])
        tree.right = @from_array(array[divider+1..])

        return tree

common_ancestor = (tree, n1, n2) ->

# Checks if n2 is a subtree of n1
is_subtree = (n1, n2) ->
    return true if n2 is null

    if n2.is_leaf() and n2.value is n1.value
        return true

    return is_subtree(n1.left, n2) or is_subtree(n1.right, n2)

find_sum = (tree, search, sum=0, seq=[]) ->
    if sum is search
        console.log seq
    for sub in [tree.left, tree.right] when sub
        find_sum(sub, search, sum + tree.value, seq.concat([tree.value]))

module.exports = Tree
