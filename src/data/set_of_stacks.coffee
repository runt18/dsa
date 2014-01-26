class SetOfStacks
    constructor: (@max=5) ->
        @stacks = [[]]
        @idx = 0

    push: (x) ->
        if @stacks[@idx].length is @max
            @stacks.push([])
            @idx++
        @stacks[@idx].push(x)
        return this

    pop: (i=@idx) ->
        if i < 0 or i > @idx
            return null
        r = @stacks[i].pop()
        if @stacks[i].length is 0
            @stacks.splice(i, 1)
            @idx--
        return r

module.exports = SetOfStacks
