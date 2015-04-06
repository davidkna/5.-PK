import listSpawner


proc fewUniqueKeysx32*(länge: int): seq[int] {.inline.} =
    result = fewUniqueKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32

proc almostSortedKeysx32*(länge: int): seq[int] {.inline.} =
    result = almostSortedKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32

proc equalKeysx32*(länge: int): seq[int] {.inline.} =
    result = equalKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32


proc almostReverseKeysx32*(länge: int): seq[int] {.inline.} =
    result = almostReverseKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32


proc shuffledKeysx32*(länge: int): seq[int] {.inline.} =
    result = shuffledKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32

proc normalKeysx32*(länge: int): seq[int] {.inline.} =
    result = normalKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32

proc randKeysx32*(länge: int): seq[int] {.inline.} =
    result = randKeys(länge)
    for i in result.low .. result.high:
        result[i] *= 32
