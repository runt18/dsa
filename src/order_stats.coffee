_ = require './util'

# Rearrange the elements of a[start..end] so that elements less than pivot are
# at the start, and elements greater than it are at the end
partition = (a, start, end, pivot) ->
    i = start - 1
    for j in [start...end-1]
        if a[j] <= pivot
            i++
            [a[i], a[j]] = [a[j], a[i]]

    [a[i + 1], a[end]] = [a[end], a[i + 1]]
    return i + 1

# Selects the ith smallest element of array a using a random pivot, giving
# O(n^2) worst-case performance
rand_select = (a, i, start=0, end=a.length-1) ->
    # Base case for the recursion. If an array segment of length 1 is reached,
    # return the single element in that section
    return a[start] if start is end

    # Select an arbitary pivot from the array (the end one in this case, can
    # be anything)
    pivot = a[end]
    # Partition by that value and get its index
    pivot_idx = partition(a, start, end, pivot)
    # Offset the pivot index to be in the range a[start..end]
    offset_idx = pivot_idx - start + 1

    return if i is offset_idx then a[pivot_idx]
    else if i < offset_idx then rand_select(a, start, pivot_idx - 1, i)
    else rand_select(a, pivot_idx + 1, end, i - offset_idx)

# Selects the ith smallest element of array a using BFPRT's method to choose a
# pivot, giving O(n) worst-case performance
select = (a, i, start=0, end=a.length-1) ->
    # Find the median of the medians of the 5-element subsections of a
    pivot = _.median((_.median(chunk) for chunk in _.chunks(a, 5)))
    # x = select(medians, Math.floor(medians.length / 2))
    # Partition the array by the pivot and get the pivots index
    pivot_idx = partition(a, start, end, pivot)

    # If the index of the pivot is the index being searched for, return the
    # value of the pivot
    # Otherwise return the result of recursively evaluating the subsection
    # to the left or the right of the pivot based on the search index
    return if i is pivot_idx then pivot
    else if i < pivot_idx then select(a[..pivot_idx], i)
    else select(a[pivot_idx+1..], i - pivot_idx)

module.exports = {rand_select, select}
