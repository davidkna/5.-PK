{.optimization: speed.}

from bench import isSorted

proc medianVon3 [T](liste: openarray[T], a, b, c: int): int {.noSideEffect.} =
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

proc trenner [T](liste: openarray[T], linkeGrenze, rechteGrenze, n: int): int {.noSideEffect.} =
    # Median von Drei
    if n <= 40:
        result = liste[medianVon3(liste, linkeGrenze, linkeGrenze + n div 2, rechteGrenze)]
    # Ninther
    else:
        let achtel = n div 8
        let mitte = linkeGrenze + n div 2

        let m1 = medianVon3(liste, linkeGrenze, linkeGrenze + achtel, linkeGrenze + achtel + achtel)
        let m2 = medianVon3(liste, mitte - achtel, mitte, mitte + achtel)
        let m3 = medianVon3(liste, rechteGrenze - achtel - achtel, rechteGrenze - achtel, rechteGrenze)

        result = liste[medianVon3(liste, m1, m2, m3)]

proc quickSort [T](liste: var openarray[T], linkeGrenze, rechteGrenze: int) {.noSideEffect.} =
    var linkerZeiger = linkeGrenze
    var rechterZeiger = rechteGrenze

    let n = rechteGrenze - linkeGrenze + 1
    if n < 2: return

    let trenner = liste.trenner(linkeGrenze, rechteGrenze, n)

    while linkerZeiger <= rechterZeiger:

        while liste[linkerZeiger] < trenner:
            inc linkerZeiger

        while liste[rechterZeiger] > trenner:
            dec rechterZeiger

        if linkerZeiger <= rechterZeiger:
            swap liste[linkerZeiger], liste[rechterZeiger]
            inc linkerZeiger
            dec rechterZeiger

    quickSort(liste, linkeGrenze, rechterZeiger)
    quickSort(liste, linkerZeiger, rechteGrenze)

proc quickSort* [T](liste: var openarray[T]) {.noSideEffect.} =
    # Mit Median von 3 / Ninther
    quickSort(liste, 0, liste.high)
    assert liste.isSorted

proc simpleQuickSort [T](liste: var openarray[T], linkeGrenze, rechteGrenze: int) {.noSideEffect.} =
    var linkerZeiger = linkeGrenze
    var rechterZeiger = rechteGrenze

    let n = rechteGrenze - linkeGrenze + 1
    if n < 2: return

    let trenner = liste[rechteGrenze]

    while linkerZeiger <= rechterZeiger:
        while liste[linkerZeiger] < trenner:
            inc linkerZeiger

        while liste[rechterZeiger] > trenner:
            dec rechterZeiger

        if linkerZeiger <= rechterZeiger:
            swap liste[linkerZeiger], liste[rechterZeiger]
            inc linkerZeiger
            dec rechterZeiger

    quickSort(liste, linkeGrenze, rechterZeiger)
    quickSort(liste, linkerZeiger, rechteGrenze)

proc simpleQuickSort* [T](liste: var openarray[T]) {.noSideEffect.} =
    # Ohne Median von 3 / Ninther
    simpleQuickSort(liste, 0, liste.high)
    assert liste.isSorted

proc insertionSort* [T](liste: var openarray[T]) {.noSideEffect.} =
    for i in 1 .. liste.high:

        let aktuellerWert = liste[i]
        var position = i

        while position > 0 and aktuellerWert < liste[position - 1]:
            shallowCopy(liste[position], liste[position - 1])
            dec position

        liste[position] = aktuellerWert

    assert liste.isSorted

proc radixSort* [T](liste: var openarray[T]) {.noSideEffect.} =
    const radix = 32

    let max = liste.max
    var position = 1
 
    while position <= max:
    
        # Intialisiere Buckets
        var buckets: array[radix, seq[T]]
        for i in 0 .. buckets.high:
            buckets[i] = @[]
 
        # Bringe Schlüssel in passende Buckets
        for i in liste:
            let tmp = i div position
            buckets[tmp mod radix].add( i )

        # Vereine Listen
        var i = 0
        for s in items(buckets):
            for itm in items(s):
                shallowCopy(liste[i], itm)
                inc i
 
        # Bewege zur nächsten Ziffer
        position *= radix

    assert liste.isSorted
