_ = require 'lodash'
{floor, pow, round, log, abs} = Math

get_digit = (num, base, digit) ->
    floor(num / pow(base, digit)) % base

split = (arr, base, digit) ->
    buckets = ([] for x in [1..base])
    for x in arr
        buckets[get_digit(x, base, digit)].push(x)
    return buckets

radix_sort = (arr, base) ->
    passes = round(log(_.max((abs(x) for x in arr))) / log(base)) + 1
    out = arr[..]
    for digit in [0...passes]
        out = _.flatten(split(out, base, digit))
    return out

module.exports = radix_sort
