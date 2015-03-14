import sequtils, shuffle

proc equalKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)

proc fewUnique*(länge: int): seq[int] =
    result = newSeq[int](länge)

proc almostSortedKeys*(länge: int): seq[int] =
    result = sortedKeys länge
    weakShuffle result

proc reverseKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)
    for i in 0 .. länge - 1:
        result[i] = länge - i


proc randomKeys*(länge: int): seq[int] =
    result = sortedKeys länge
    shuffle(result)
