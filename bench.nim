import times, os, saveData, strutils, algorithm

const countUpThreshold = 10_000
let appDirPath = getAppDir()
let testDataPath* = appDirPath / "testData"

proc countLines*(fileName: string): int =
    for line in fileName.lines:
        result += 1

proc createFile*(fileName: string) =
    open(fileName, fmWrite).close()

template time*(s: stmt): expr =
  let t0 = cpuTime()
  s
  cpuTime() - t0

proc prepareBench(testName: string, times, step: int): int =
  let filePath = testDataPath / changeFileExt(testName, "csv")

  if not existsFile(filePath):
    createFile(filePath)
    result = 1
  else:
    result = saveData.countLines(filePath) div times + 1
    if (result > countUpThreshold and step != 1):
      result = (result - countUpThreshold) * step + countUpThreshold


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
    if res < countUpThreshold: inc (res, 1)
    else: inc(res, step)



template benchMark*(sorter: stmt, listSpawner: stmt, testName: string, maxLength: int, times: int, step: int) =
  let beginAt = prepareBench(testName, times, step)
  let lockFilePath = testDataPath / changeFileExt(testName, "lock")

  if not existsFile(lockFilePath) and beginAt < maxLength:
    # Create lockfile 
    createFile lockFilePath

    let testPath = testDataPath / changeFileExt(testName, "csv")
    var datei = open(testPath, fmAppend)

    for i in countUpBenchStyle(beginAt, maxLength, step):
      for j in 1..times:

        if likely(i != 1 and j == 1):
          write(datei, "\n")
          
        write(datei, $i & ",")
        
        var t = 0.0
        while t <= 0.0:
          var a = listSpawner i
          t = time(a.sorter)
          assert a.isSorted
        write(datei, formatFloat(t, ffScientific, 32))

    flushFile datei
    close datei
    removeFile lockFilePath

template distMark*(sorter: stmt, testName: string) =
  const times = 10_000
  let beginAt = prepareBench(testName, 1, 1)
  let lockFilePath = testDataPath / changeFileExt(testName, "lock")

  if not existsFile(lockFilePath) and beginAt < times:
    # Create lockfile
    createFile(lockFilePath)

    let testPath = testDataPath / changeFileExt(testName, "csv")
    var datei = open(testPath, fmAppend)

    var results = newSeq[float](times)
    for i in beginAt .. times: 
      var t = 0.0
      while t <= 0.0:
        var a = randKeys times
        t = time(a.sorter)
        assert a.isSorted
      if likely(i != 1):
          write(datei, "\n")
      write(datei, formatFloat(t, ffScientific, 32))
    
    flushFile datei
    close datei
    removeFile lockFilePath
