import sequtils, shuffle, math, threadpool
{.experimental.}


proc sortedKeys(länge: int): seq[int] =
    result = newSeq[int](länge)
    for i in result.low .. result.high:
        result[i] = i

proc equalKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)

proc fewUniqueKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)
    for i in result.low .. result.high:
        result[i] = i div 15
    shuffle result

proc almostSortedKeys*(länge: int): seq[int] =
    result = sortedKeys länge
    weakShuffle result

proc reverseKeys(länge: int): seq[int] =
    result = newSeq[int](länge)
    for i in result.low .. result.high:
        result[i] = länge - i

proc almostReverseKeys*(länge: int): seq[int] =
    result = reverseKeys länge
    weakShuffle result


proc shuffledKeys*(länge: int): seq[int] =
    result = sortedKeys länge
    shuffle(result)

proc randKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)
    parallel:
        for i in result.low .. result.high:
            result[i] = spawn random(länge)

proc normalKeys*(länge: int): seq[int] =
    result = newSeq[int](länge)
    parallel:
        for i in result.low .. result.high:
            result[i] = spawn gaussRand länge
