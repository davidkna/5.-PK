import listSpawner, threadpool
{.experimental.}

proc radixify(liste: var seq[int]) {.inline.} =
    parallel:
        for i in 0..liste.high:
            liste[i] = spawn liste[i] * 32

proc fewUniqueKeysx32*(länge: int): seq[int] {.inline.} =
    result = fewUniqueKeys(länge)
    result.radixify()

proc almostSortedKeysx32*(länge: int): seq[int] {.inline.} =
    result = almostSortedKeys(länge)
    result.radixify()

proc equalKeysx32*(länge: int): seq[int] {.inline.} =
    result = equalKeys(länge)
    result.radixify()


proc almostReverseKeysx32*(länge: int): seq[int] {.inline.} =
    result = almostReverseKeys(länge)
    result.radixify()


proc shuffledKeysx32*(länge: int): seq[int] {.inline.} =
    result = shuffledKeys(länge)
    result.radixify()

proc normalKeysx32*(länge: int): seq[int] {.inline.} =
    result = normalKeys(länge)
    result.radixify()

proc randKeysx32*(länge: int): seq[int] {.inline.} =
    result = randKeys(länge)
    result.radixify()
