#! /usr/bin/env coffee

class Node
    constructor: (@data=0) ->
        @next = null


class List
    constructor: ->
        @head = new Node()

    length: ->
        el = @head
        i = 0

        while el != null
            i++
            el = el.next

        return i

    append: (data) ->
        el = @head

        loop11
            if el.next is null
                el.next = new Node(data)
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

l = new List()

console.log l.append(1).append(2).append(3).to_array()

