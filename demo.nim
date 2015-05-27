import listSpawner
import os
import bench
import sorts
import parseopt2

const max = 5_000

let appDirPath = getAppDir()
let testDataPath = appDirPath / "testData"

if not existsDir testDataPath:
    createDir testDataPath

template demoIt(listSpawner: stmt) =
    demoBenchMark(radixSort, listSpawner, "Radix LSD Sort", max, 1)
    demoBenchMark(quickSort, listSpawner, "QuickSort", max, 1)
    demoBenchMark(insertionSort, listSpawner, "Insertion Sort", max, 1)

var param = ""
if paramCount() != 0:
    param = paramStr(1)


case param:
    of "fewUnique":
        demoIt fewUniqueKeys
    of "almostSorted":
        demoIt almostSortedKeys
    of "almostReverse":
        demoIt almostReverseKeys
    of "random":
        demoIt randKeys
    of "normal":
        demoIt normalKeys
    else:
        demoIt shuffledKeys



