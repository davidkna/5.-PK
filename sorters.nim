import times, os


template time(s: stmt): expr =
  let t0 = cpuTime()
  s
  cpuTime() - t0


proc spawnSameKeys[T](len: int) =
    var result = array[len, int]

    for i in low(result)..high(result):
        a[i] = 1


proc spawnSorted[T](len: int) =
    var a = array[len, int]

    for i in low(a)..high(a):
        a[i] = i


    return a

proc spawnReverse[T](len: int) =
    var a = array[len, int]

    for i in low(result)..high(result):
        a[i] = a - i


    return a

proc quickSort[T](liste: var openarray[T], inl = 0, inr = -1) =
  var rechts = if inr >= 0: inr else: liste.high
  var links = inl
  let n = rechts - links + 1
  if n < 2: return
  let trenner = liste[links + 3 * n div 4]
  while links <= rechts:
    if liste[links] < trenner:
      inc links
      continue
    if liste[rechts] > trenner:
      dec rechts
      continue
    if links <= rechts:
      swap liste[links], liste[rechts]
      inc links
      dec rechts
  quickSort(liste, inl, rechts)
  quickSort(liste, links, inr)

proc insertionSort[T](liste: var openarray[T]) =
    for i in 1 .. <liste.len:
     let wert = liste[i]
     var j = i
     while j > 0 and wert < liste[j-1]:
       liste[j] = liste[j-1]
       dec j
     liste[j] = wert


proc countingSort[T](a: var openarray[T]; min, max: int) =
    let range = max - min + 1
    var count = newSeq[T](range)
    var z = 0
    for i in 0 .. < a.len: inc count[a[i] - min]

    for i in min .. max:
        for j in 0 ..  <count[i - min]:
            a[z] = i
            inc z


var a = spawnSorted(1000)
var b = a
var c = a
echo(time(quickSort(a)))
echo(time(insertionSort(b)))
echo(time(countingSort(c, -31, 782)))

echo a
echo b
echo c
