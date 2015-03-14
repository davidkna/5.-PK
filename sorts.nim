import sequtils, import test

proc quickSort [T] (a: var openarray[T], inl: int, inr: int) =
  var r = inr
  var links = inl
  let n = r - links + 1
  if n < 2: return
  let p = a[links + 3 * n div 4]
  while links <= r:
    if a[links] < p:
      inc links
      continue
    if a[r] > p:
      dec r
      continue
    if links <= r:
      swap a[links], a[r]
      inc links
      dec r
  quickSort(a, inl, r)
  quickSort(a, links, inr)


proc quickSort* [T] (a: var openarray[T]) =
  quickSort(a, 0, a.high)
  assert a.isSorted




proc insertionSort* [T](liste: var openarray[T]) =
  for i in 1 .. <liste.len:
    let wert = liste[i]
    var j = i
    while j > 0 and wert < liste[j-1]:
      liste[j] = liste[j-1]
      dec j
      liste[j] = wert
  assert a.isSorted

proc radixSort* [T](liste: var seq[T], radix: int = 10) =
  var maxLength = false
  var tmp = -1
  var placement = 1
 
  while not maxLength:
    maxLength = true
    # declare and initialize buckets
    var buckets = newSeqWith(radix , newSeq[int](0))
 
    # split aList between lists
    for i in liste:
      tmp = i div placement
      buckets[tmp mod radix].add( i )
      if maxLength and tmp > 0:
        maxLength = false
 
    # empty lists into aList array
    echo buckets
    liste = concat buckets
    echo liste
 
    # move to next digit
    placement *= radix

  assert a.isSorted

