from listSpawner import shuffledKeys
import os
import bench
import sorts

let appDirPath = getAppDir()
let testDataPath = appDirPath / "testData"

if not existsDir testDataPath:
    createDir testDataPath

const max = 5_000

demoBenchMark(radixSort, shuffledKeys, "RS", max, 1)

demoBenchMark(quickSort, shuffledKeys, "QS", max, 1)

demoBenchMark(insertionSort, shuffledKeys, "IS", max, 1)
