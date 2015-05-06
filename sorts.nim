import sequtils, bench

proc medianVon3 [T] (liste: var openarray[T], a, b, c: int): int {.noSideEffect.} =
  if liste[a] < liste[b]:
    if liste[b] < liste[c]:
      return b
    elif liste[a] < liste[c]:
      return c
    else:
      return a
  else:
    if liste[c] < liste[b]:
      return b
    elif liste[c] < liste[a]:
      return c
    else:
      return a

proc quickSort[T](liste: var openarray[T], inl, inr: int) =
  var r = inr
  var l = inl
  let n = r - l + 1
  if n < 2: return

  block trenner:
    if n <= 40:
      var m = medianVon3(liste, l, l + n div 2, r)
      swap liste[m], liste[inr]
    # Turkey Ninther
    else:
      let eps = n div 8
      let mid = l + n div 2
      let m1 = liste.medianVon3(l, l + eps, l + eps + eps)
      let m2 = liste.medianVon3(mid - eps, mid, mid + eps)
      let m3 = liste.medianVon3(r - eps - eps, r - eps, r)
      let ninther = liste.medianVon3(m1, m2, m3)
      swap liste[ninther], liste[inr]

  let p = liste[inr]
  while l <= r:
    if liste[l] < p:
      inc l
      continue
    if liste[r] > p:
      dec r
      continue
    if l <= r:
      swap liste[l], liste[r]
      inc l
      dec r
  quickSort(liste, inl, r)
  quickSort(liste, l, inr)

proc quickSort* [T] (liste: var openarray[T]) =
  # Optimiert bis in den Tod
  quickSort(liste, 0, liste.high)
  assert liste.isSorted

proc simpleQuickSort[T](liste: var openarray[T], inl, inr: int) =
  var r = inr
  var l = inl
  let n = r - l + 1
  if n < 2: return

  let p = liste[inr]
  while l <= r:
    if liste[l] < p:
      inc l
      continue
    if liste[r] > p:
      dec r
      continue
    if l <= r:
      swap liste[l], liste[r]
      inc l
      dec r
  quickSort(liste, inl, r)
  quickSort(liste, l, inr)

proc simpleQuickSort* [T] (liste: var openarray[T]) =
  # Nicht optimiert bis in den Tod!
  simpleQuickSort(liste, 0, liste.high)
  assert liste.isSorted

proc insertionSort* [T](liste: var openarray[T]) =
  for i in 1 .. <liste.len:
    let wert = liste[i]
    var j = i
    while j > 0 and wert < liste[j-1]:
      liste[j] = liste[j-1]
      dec j
    liste[j] = wert
  assert liste.isSorted

proc radixSort* [T](liste: var seq[T], radix: int = 32) =
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
    liste = concat buckets
 
    # move to next digit
    placement *= radix

  assert liste.isSorted
