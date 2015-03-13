import listSpawner, sequtils

proc radixSort*(liste: var seq[int]) =
  let RADIX = 10
  var maxLength = false
  var tmp = -1
  var placement = 1
 
  while not maxLength:
    maxLength = true
    # declare and initialize buckets
    var buckets = newSeqWith(RADIX , newSeq[int](0))
 
    # split aList between lists
    for i in liste:
      tmp = i div placement
      buckets[tmp mod RADIX].add( i )
      if maxLength and tmp > 0:
        maxLength = false
 
    # empty lists into aList array
    echo buckets
    liste = concat buckets
    echo liste
 
    # move to next digit
    placement *= RADIX

var a = reverseKeys(20)
echo a
radixSort a
echo a