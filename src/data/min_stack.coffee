class MinStack
    constructor: ->
        @min = Infinity
        @next_min = Infinity
        @data = []

    push: (x) ->
        @data.push(x)
        if x < @min
            @next_min = @min
            @min = x

    pop: ->
        x = @data.pop()
        if x is @min
            @min = @next_min

