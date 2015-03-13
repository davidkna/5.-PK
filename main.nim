import bench
import sorts
import listSpawner
import saveData

######################
# Tests for QuickSort #
######################


for i in 1..1000000:
    var t = newSeq[float](0)
    for j in 1 .. 100:  
        var a = randomKeys(i) # MASTER
        t.add time a.quickSort
        assert a.isSorted


    t.quickSort
    appendTo("./testData/randKeysQS.json", $t)
    echo t