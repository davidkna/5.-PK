from listSpawner import shuffledKeys
import os
import bench
import sorts

let appDirPath = getAppDir()
let testDataPath = appDirPath / "testData"

if not existsDir testDataPath:
    createDir testDataPath

const max = 5_000

demoBenchMark(radixSort, shuffledKeys, "shuffledKeysRS", max, 1)

demoBenchMark(quickSort, shuffledKeys, "shuffledKeysQS", max, 1)

demoBenchMark(insertionSort, shuffledKeys, "shuffledKeysIS", max, 1)
