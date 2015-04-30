import times, os, saveData, strutils, algorithm

template time*(s: stmt): expr =
  let t0 = cpuTime()
  s
  cpuTime() - t0

proc prepareBench(fileName: string, times, step: int): int =
  if not existsDir("testData"):
    createDir("testData")
  if not existsFile("testData" & DirSep & fileName):
    createFile("testData" & DirSep & fileName)
    result = 1
  else:
    result = saveData.countLines("testData" & DirSep & fileName) div times + 1
    if (result > 10_000 and step != 1):
      result = (result - 10_000) * step + 10_000


proc isSorted*[T](s: openarray[T]): bool =
  var last = low(T)
  for c in s:
    if c < last:
      return false
    last = c
  return true

iterator countUpBenchStyle[S, T](a: S, b: T, step = 1): T {.inline.} =
  ## Counts from ordinal value `a` up to `b` with the given
  ## step count. `S`, `T` may be any ordinal type, `step` may only
  ## be positive.
  var res: T = T(a)
  while res <= b:
    yield res
    if res < 10_000: inc (res, 1)
    else: inc(res, step)



template benchMark*(sorter: stmt, listSpawner: stmt, saveFileName: string, maxLength: int, times: int, step: int) =
  let beginAt = prepareBench(saveFileName, times, step)
  var resultString = ""
  if not existsFile("testData" & DirSep & saveFileName & ".lock") and beginAt < maxLength:
    # Create lockfile
    createFile("testData" & DirSep & saveFileName & ".lock")
    for i in countUpBenchStyle(beginAt, maxLength, step):
      for j in 1..times:
        if likely(i != 0): resultString.add("\n")
        resultString.add($i & ";")
        var t = 0.0
        while t <= 0.0:
          var a = listSpawner i
          t = time(a.sorter)
          assert a.isSorted
        resultString.add formatFloat(t, ffScientific, 32)
      if (unlikely(i mod 10_000 div times == 0)):
        appendDataTo("testData" & DirSep & saveFileName, resultString)
        resultString = ""
    appendDataTo("testData" & DirSep & saveFileName, resultString)
    resultString = ""
    removeFile "testData" & DirSep & saveFileName & ".lock"

template distMark*(sorter: stmt, saveFileName: string) =
  let beginAt = prepareBench(saveFileName, 1, 1)
  const times = 10_000

  if not existsFile("testData" & DirSep & saveFileName & ".lock") and beginAt < times:
    # Create lockfile
    createFile("testData" & DirSep & saveFileName & ".lock")

    var results = newSeq[float](times)
    for i in beginAt .. times: 
      var t = 0.0
      while t == 0.0:
        var a = randKeys times
        t = time(a.sorter)
        assert a.isSorted
      results[i] = t

    sort results, cmp[float]
    var resultString = formatFloat(results[0], ffScientific, 32).replace(".", ",")
    for i in results.items:
      resultString.add "\n" & formatFloat(i, ffScientific, 32).replace(".", ",")
    appendDataTo("testData" & DirSep & saveFileName, resultString)
    removeFile "testData" & DirSep & saveFileName & ".lock"
