# Splits array a into chunks of size n
chunk = (a, n) -> (a[i...i+n] for x, i in a by n)

median = (a) -> a.sort()[Math.floor(a.length / 2)]

partition = (a, p, q, x) ->
    i = p - 1
    for j in [p...q-1]
        if a[j] <= x
            i++
            [a[i], a[j]] = [a[j], a[i]]

    [a[i + 1], a[q]] = [a[q], a[i + 1]]
    return i + 1

# Selects the ith smallest element of array a using a random pivot, giving
# O(n^2) worst-case performance
rand_select = (a, i, p=0, q=a.length-1) ->
    return a[p] if p is q

    pivot = a[q]
    r = partition(a, p, q, pivot)
    k = r - p + 1
    return a[r] if i is k

    return if i < k then rand_select(a, p, r - 1, i)
    else rand_select(a, r + 1, q, i - k)

# Selects the ith smallest element of array a using BFPRT's method to choose a
# pivot, giving O(n) worst-case performance
select = (a, i, p=0, q=a.length-1) ->
    chunks = chunk(a, 5)
    medians = (median(ch) for ch in chunks)

    x = median(medians)
    # x = select(medians, Math.floor(medians.length / 2))
    k = partition(a, p, q, x)

    return x if i is k

    return if i < k then select(a[..k], i)
    else select(a[k+1..], i - k)

module.exports = {rand_select, select}
