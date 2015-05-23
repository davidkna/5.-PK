import bench
import sorts
import listSpawner
import radixListSpawner

{.passC: "-Ofast" .}

const max = 100_000

# DistMark
distMark radixSort, "distRS"
distMark quickSort, "distQS"
distMark insertionSort, "distIS"

# RadixSort
benchMark(radixSort, almostSortedKeys, "almostSortedKeysRS", max)
benchMark(radixSort, almostSortedKeysx32, "almostSortedKeysx32RS", max)

benchMark(radixSort, almostReverseKeys, "almostReverseKeysRS", max)
benchMark(radixSort, almostReverseKeysx32, "almostReverseKeysx32RS", max)

benchMark(radixSort, equalKeys, "equalKeysRS", max)
benchMark(radixSort, equalKeysx32, "equalKeysx32RS", max)

benchMark(radixSort, fewUniqueKeys, "fewUniqueKeysRS", max)
benchMark(radixSort, fewUniqueKeysx32, "fewUniqueKeysx32RS", max)

benchMark(radixSort, shuffledKeys, "shuffledKeysRS", max)
benchMark(radixSort, shuffledKeysx32, "shuffledKeysx32RS", max)

benchMark(radixSort, randKeys, "randKeysRS", max)
benchMark(radixSort, randKeysx32, "randKeysx32RS", max)

benchMark(radixSort, normalKeys, "normalKeysRS", max)
benchMark(radixSort, normalKeysx32, "normalKeysx32RS", max)

# QuickSort
benchMark(quickSort, almostSortedKeys, "almostSortedKeysQS", max)

benchMark(quickSort, almostReverseKeys, "almostReverseKeysQS", max)

benchMark(quickSort, equalKeys, "equalKeysQS", max)

benchMark(quickSort, fewUniqueKeys, "fewUniqueKeysQS", max)

benchMark(quickSort, shuffledKeys, "shuffledKeysQS", max)

benchMark(quickSort, randKeys, "randKeysQS", max)

benchMark(quickSort, normalKeys, "normalKeysQS", max)

benchMark(simpleQuickSort, almostSortedKeys, "worstCaseKeysSQS", max, 100)

# InsertionSort
benchMark(insertionSort, almostSortedKeys, "almostSortedKeysIS", max)

benchMark(insertionSort, almostReverseKeys, "almostReverseKeysIS", max, 100)

benchMark(insertionSort, equalKeys, "equalKeysIS", max, 100)

benchMark(insertionSort, fewUniqueKeys, "fewUniqueKeysIS", max, 100)

benchMark(insertionSort, shuffledKeys, "shuffledKeysIS", max, 100)

benchMark(insertionSort, randKeys, "randKeysIS", max, 100)

benchMark(insertionSort, normalKeys, "normalKeysIS", max, 100)


