#! /usr/bin/env coffee

_ = require 'lodash'
require 'colors'


fibonacci = require './src/dynamic/fibonacci'
edit_distance = require './src/dynamic/edit_distance'

counting_sort = require './src/sort/counting'
radix_sort = require './src/sort/radix'

pretty = (o) ->
    console.log(JSON.stringify(o, null, 2))

passed = 0
total = 0

test = (actual, expected, message) ->
    total++
    if _.isEqual(actual, expected)
        console.log("#{message} passed".green)
        passed++
    else
        console.log("#{message} failed".red)
        console.log('Expected')
        console.log(actual)
        console.log('to be')
        console.log(expected)

test(fibonacci(7), [1, 1, 2, 3, 5, 8, 13], 'Fibonacci')
test(edit_distance('bristol', 'hustle'), 5, 'Edit distance')
test(counting_sort([5, 7, 9, 3, 2]), [2, 3, 5, 7, 9], 'Counting sort')
test(radix_sort([5, 7, 9, 3, 2], 10), [2, 3, 5, 7, 9], 'Radix sort')

msg = "#{passed} / #{total} tests passed (#{(passed / total * 100).toFixed(2)}%)"
msg = if passed is total then msg.green else msg.red
console.log(msg)
