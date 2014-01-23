class Node
    constructor: (@data=0, @next=null) ->

class List
    constructor: ->
        @head = null

    length: ->
        el = @head
        i = 0

        while el != null
            i++
            el = el.next

        return i

    append: (data) ->
        new_node = new Node(data)

        if @head is null
            @head = new_node
            return this

        el = @head
        loop
            if el.next is null
                el.next = new_node
                return this
            el = el.next

    to_array: ->
        el = @head
        arr = []

        while el.next isnt null
            arr.push(el.data)
            el = el.next

        arr.push(el.data)

        return arr

module.exports = List
