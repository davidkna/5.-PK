import math

proc shuffle*(x: var seq[int]) =
  randomize()
  for i in countdown(x.high, 0):
    let j = random(i + 1)
    swap(x[i], x[j])


proc weakShuffle*(x: var seq[int]) =
  randomize()
  for i in countdown(x.high, 0):
    let j = i + 1 - random(2)
    swap(x[i], x[j])