import math

proc shuffle*(x: var seq[int]) =
    for i in countdown(x.high, 0):
        let j = random(i + 1)
        swap(x[i], x[j])


proc weakShuffle*(x: var seq[int]) =
    for i in countdown(x.high-1, 1):
        let j = i + 1 - random(2)
        swap(x[i], x[j])


{.passC: "-ffast-math".}
proc gaussRand*(länge: int): int =
    result = -1
    let tmp = 1 + länge.toFloat / PI * cos(2*PI*random(1.0)) * sqrt(-2*log10(random(1.0)))
    result = tmp.toInt
    # Mirror for RadixSort
    if result < 0:
      result = -result
