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

    is_unival: (tree=this) ->
        unless tree.left or tree.right
            return true

        for sub in [tree.left, tree.right]
            if sub and (tree.value isnt sub.value or not sub.is_unival())
                return false

        return true

    num_unival: (depth=0, tree=this) ->
        if not tree.left and not tree.right
            return [1, true]

        sum = 0
        is_unival = true

        for sub in [tree.left, tree.right]
            if sub
                [num, status] = sub.num_unival(depth + 1)
                sum += num
                if tree.value isnt sub.value or not status
                    is_unival = false

        sum++ if is_unival

        return if depth is 0 then sum else [sum, is_unival]

    find_sum: (search, node=this, sum=0, seq=[], seqs=[]) ->
        sum += node.value

        if sum is search
            seqs.push(seq)
        if node.left
            node.find_sum(search, node.left, sum, seq.concat([node.value]), seqs)
        if node.right
            node.find_sum(search, node.right, sum, seq.concat([node.value]), seqs)

        return seqs

    common_ancestor: (n1, n2) ->

    # Checks if n2 is a subtree of n1
    is_subtree: (n1, n2) ->
        return true if n2 is null

        if n2.is_leaf() and n2.value is n1.value
            return true

        return is_subtree(n1.left, n2) or is_subtree(n1.right, n2)

module.exports = Tree
