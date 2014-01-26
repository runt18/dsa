class SetOfStacks
    constructor: (@max=5) ->
        @stacks = [[]]
        @idx = 0

    push: (x) ->
        @stacks[@idx].push(x)
        if @stacks[@idx].length is @max
            @stacks.push([])
            @idx++
        return this

    pop: (i=@idx) ->
        r = @stacks[i].pop()
        if @stacks[i].length is 0
            @stacks.splice(i, 1)
            @idx--
        return r

module.exports = SetOfStacks
