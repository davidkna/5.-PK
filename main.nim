import bench
import sorts
import listSpawner
import radixListSpawner
import saveData


const max = 100_000

# DistMark
distMark radixSort, "distRS.csv"
distMark quickSort, "distQS.csv"
distMark insertionSort, "distIS.csv"

# RadixSort
benchMark(radixSort, almostSortedKeys, "almostSortedKeysRS.csv", max, 1, 1)
benchMark(radixSort, almostSortedKeysx32, "almostSortedKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, almostReverseKeys, "almostReverseKeysRS.csv", max, 1, 1)
benchMark(radixSort, almostReverseKeysx32, "almostReverseKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, equalKeys, "equalKeysRS.csv", max, 1, 1)
benchMark(radixSort, equalKeysx32, "equalKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, fewUniqueKeys, "fewUniqueKeysRS.csv", max, 1, 1)
benchMark(radixSort, fewUniqueKeysx32, "fewUniqueKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, shuffledKeys, "shuffledKeysRS.csv", max, 1, 1)
benchMark(radixSort, shuffledKeysx32, "shuffledKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, randKeys, "randKeysRS.csv", max, 1, 1)
benchMark(radixSort, randKeysx32, "randKeysx32RS.csv", max, 1, 1)

benchMark(radixSort, normalKeys, "normalKeysRS.csv", max, 1, 1)
benchMark(radixSort, normalKeysx32, "normalKeysx32RS.csv", max, 1, 1)

# QuickSort
benchMark(quickSort, almostSortedKeys, "almostSortedKeysQS.csv", max, 1, 1)

benchMark(quickSort, almostReverseKeys, "almostReverseKeysQS.csv", max, 1, 1)

benchMark(quickSort, equalKeys, "equalKeysQS.csv", max, 1, 1)

benchMark(quickSort, fewUniqueKeys, "fewUniqueKeysQS.csv", max, 1, 1)

benchMark(quickSort, shuffledKeys, "shuffledKeysQS.csv", max, 5, 1)

benchMark(quickSort, randKeys, "randKeysQS.csv", max, 1, 1)

benchMark(quickSort, normalKeys, "normalKeysQS.csv", max, 1, 1)

benchMark(simpleQuickSort, almostSortedKeys, "worstCaseKeysSQS.csv", max, 1, 100)

# InsertionSort
benchMark(insertionSort, almostSortedKeys, "almostSortedKeysIS.csv", max, 1, 100)

benchMark(insertionSort, almostReverseKeys, "almostReverseKeysIS.csv", max, 1, 100)

benchMark(insertionSort, equalKeys, "equalKeysIS.csv", max, 1, 100)

benchMark(insertionSort, fewUniqueKeys, "fewUniqueKeysIS.csv", max, 1, 100)

benchMark(insertionSort, shuffledKeys, "shuffledKeysIS.csv", max, 1, 20)

benchMark(insertionSort, randKeys, "randKeysIS.csv", max, 1, 100)

benchMark(insertionSort, normalKeys, "normalKeysIS.csv", max, 1, 100)


