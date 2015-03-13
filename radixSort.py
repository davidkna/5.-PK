#!/usr/bin/env python
 
def radix_sort(array):
    """
    A simple implementation of Radix Sort.
    """
 
    def list_to_buckets(array, iteration):
        buckets = [[] for _ in range(10)]
        for number in array:
            # Isolate the base-digit from the number
            digit = ( number // (10 ** iteration) ) % 10
            # Drop the number into the correct bucket
            buckets[digit].append(number)
        return buckets
 
    def buckets_to_list(buckets):
        array = []
        # Collapse buckets back into a list
        for bucket in buckets:
            array.extend(bucket)
        return array
 
    # Find the largest value in the array to
    maxval = 0
    for i in array:
        if i > maxval:
            maxval = i
 
    it = 0
    # Iterate, sorting the array by each base-digit
    while ( (10 ** it) <= maxval):
        array = buckets_to_list(list_to_buckets(array, it))
        it += 1
 
    return array


 