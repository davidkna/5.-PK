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

proc quickSort[T](liste: var openarray[T], linkeGrenze, rechteGrenze: int) =
  var rechterZeiger = rechteGrenze
  var linkerZeiger = linkeGrenze
  let n = rechteGrenze - linkeGrenze + 1
  if n < 2: return

  block trenner:
    # Median von Drei
    if n <= 40:
      var m = medianVon3(liste, linkeGrenze, linkeGrenze + n div 2, rechteGrenze)
      swap liste[m], liste[rechteGrenze]
    # Ninther
    else:
      let achtel = n div 8
      let mitte = linkeGrenze + n div 2

      let m1 = liste.medianVon3(linkeGrenze, linkeGrenze + achtel, linkeGrenze + achtel + achtel)
      let m2 = liste.medianVon3(mitte - achtel, mitte, mitte + achtel)
      let m3 = liste.medianVon3(rechteGrenze - achtel - achtel, rechteGrenze - achtel, rechteGrenze)

      let ninther = liste.medianVon3(m1, m2, m3)

      swap liste[ninther], liste[rechteGrenze]

  let trenner = liste[rechteGrenze]

  while linkerZeiger <= rechterZeiger:

    if liste[linkerZeiger] < trenner:
      inc linkerZeiger
      continue

    if liste[rechterZeiger] > trenner:
      dec rechterZeiger
      continue

    if linkerZeiger <= rechterZeiger:
      swap liste[linkerZeiger], liste[rechterZeiger]
      inc linkerZeiger
      dec rechterZeiger

  quickSort(liste, linkeGrenze, rechterZeiger)
  quickSort(liste, linkerZeiger, rechteGrenze)

proc quickSort* [T] (liste: var openarray[T]) =
  # Mit Median von 3 / Ninther
  quickSort(liste, 0, liste.high)
  assert liste.isSorted

proc simpleQuickSort[T](liste: var openarray[T], linkeGrenze, rechteGrenze: int) =
  var rechterZeiger = rechteGrenze
  var linkerZeiger = linkeGrenze
  let n = rechteGrenze - linkeGrenze + 1
  if n < 2: return

  let trenner = liste[rechteGrenze]

  while linkerZeiger <= rechterZeiger:
    if liste[linkerZeiger] < trenner:
      inc linkerZeiger
      continue

    if liste[rechterZeiger] > trenner:
      dec rechterZeiger
      continue

    if linkerZeiger <= rechterZeiger:
      swap liste[linkerZeiger], liste[rechterZeiger]
      inc linkerZeiger
      dec rechterZeiger

  quickSort(liste, linkeGrenze, rechterZeiger)
  quickSort(liste, linkerZeiger, rechteGrenze)

proc simpleQuickSort* [T] (liste: var openarray[T]) =
  # Ohne Median von 3 / Ninther
  simpleQuickSort(liste, 0, liste.high)
  assert liste.isSorted

proc insertionSort* [T](liste: var openarray[T]) =
  for i in 1 .. <liste.len:

    let aktuellerWert = liste[i]
    var position = i

    while position > 0 and aktuellerWert < liste[position - 1]:
      liste[position] = liste[position - 1]
      dec position

    liste[position] = aktuellerWert

  assert liste.isSorted

proc radixSort* [T](liste: var seq[T], radix: int = 32) =
  var maxLänge = false
  var position = 1
 
  while not maxLänge:
    maxLänge = true
    
    # Intialisiere Buckets
    var buckets = newSeqWith(radix , newSeq[int](0))
 
    # Bringe Schlüssel in passende Buckets
    for i in liste:
      let tmp = i div position
      buckets[tmp mod radix].add( i )
      if maxLänge and tmp > 0:
        maxLänge = false
 
    # Vereine Listen. (dauert O(n))
    liste = concat buckets
 
    # Bewege zur nächsten Ziffer
    position *= radix

  assert liste.isSorted
