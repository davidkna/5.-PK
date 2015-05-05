import bench
import sorts
import listSpawner
import radixListSpawner
import saveData


const max = 100_000

# DistMark
distMark radixSort, "distRS"
distMark quickSort, "distQS"
distMark insertionSort, "distIS"

# RadixSort
benchMark(radixSort, almostSortedKeys, "almostSortedKeysRS", max, 1, 1)
benchMark(radixSort, almostSortedKeysx32, "almostSortedKeysx32RS", max, 1, 1)

benchMark(radixSort, almostReverseKeys, "almostReverseKeysRS", max, 1, 1)
benchMark(radixSort, almostReverseKeysx32, "almostReverseKeysx32RS", max, 1, 1)

benchMark(radixSort, equalKeys, "equalKeysRS", max, 1, 1)
benchMark(radixSort, equalKeysx32, "equalKeysx32RS", max, 1, 1)

benchMark(radixSort, fewUniqueKeys, "fewUniqueKeysRS", max, 1, 1)
benchMark(radixSort, fewUniqueKeysx32, "fewUniqueKeysx32RS", max, 1, 1)

benchMark(radixSort, shuffledKeys, "shuffledKeysRS", max, 1, 1)
benchMark(radixSort, shuffledKeysx32, "shuffledKeysx32RS", max, 1, 1)

benchMark(radixSort, randKeys, "randKeysRS", max, 1, 1)
benchMark(radixSort, randKeysx32, "randKeysx32RS", max, 1, 1)

benchMark(radixSort, normalKeys, "normalKeysRS", max, 1, 1)
benchMark(radixSort, normalKeysx32, "normalKeysx32RS", max, 1, 1)

# QuickSort
benchMark(quickSort, almostSortedKeys, "almostSortedKeysQS", max, 1, 1)

benchMark(quickSort, almostReverseKeys, "almostReverseKeysQS", max, 1, 1)

benchMark(quickSort, equalKeys, "equalKeysQS", max, 1, 1)

benchMark(quickSort, fewUniqueKeys, "fewUniqueKeysQS", max, 1, 1)

benchMark(quickSort, shuffledKeys, "shuffledKeysQS", max, 5, 1)

benchMark(quickSort, randKeys, "randKeysQS", max, 1, 1)

benchMark(quickSort, normalKeys, "normalKeysQS", max, 1, 1)

benchMark(simpleQuickSort, almostSortedKeys, "worstCaseKeysSQS", max, 1, 100)

# InsertionSort
benchMark(insertionSort, almostSortedKeys, "almostSortedKeysIS", max, 1, 100)

benchMark(insertionSort, almostReverseKeys, "almostReverseKeysIS", max, 1, 100)

benchMark(insertionSort, equalKeys, "equalKeysIS", max, 1, 100)

benchMark(insertionSort, fewUniqueKeys, "fewUniqueKeysIS", max, 1, 100)

benchMark(insertionSort, shuffledKeys, "shuffledKeysIS", max, 1, 20)

benchMark(insertionSort, randKeys, "randKeysIS", max, 1, 100)

benchMark(insertionSort, normalKeys, "normalKeysIS", max, 1, 100)


