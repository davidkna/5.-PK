import times, sorts

template time*(s: stmt): expr =
  let t0 = cpuTime()
  s
  cpuTime() - t0

proc isSorted*[T](s: openarray[T]): bool =
  var last = low(T)
  for c in s:
    if c < last:
      return false
    last = c
  return true