fibonacci = require './src/dynamic/fibonacci'
edit_distance = require './src/dynamic/edit_distance'

test(fibonacci(7), [1, 1, 2, 3, 5, 8, 13], 'Fibonacci')
test(edit_distance('bristol', 'hustle'), 5, 'Edit distance')
