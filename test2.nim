
import sequtils
proc concatA*[T](seqs: openarray[seq[T]]): seq[T] =
  ## Takes several sequences' items and returns them inside a new sequence.
  ##
  ## Example:
  ##
  ## .. code-block::
  ##   let
  ##     s1 = @[1, 2, 3]
  ##     s2 = @[4, 5]
  ##     s3 = @[6, 7]
  ##     total = concat(s1, s2, s3)
  ##   assert total == @[1, 2, 3, 4, 5, 6, 7]
  var L = 0
  for seqitm in items(seqs): inc(L, len(seqitm))
  newSeq(result, L)
  var i = 0
  for s in items(seqs):
    for itm in items(s):
      result[i] = itm
      inc(i)


let
    s1 = [@[0,23],@[1,4,5,6],@[]]
    total = concatA(s1)


var a : array[1, seq[int]]
echo a[0] = @[]

echo total