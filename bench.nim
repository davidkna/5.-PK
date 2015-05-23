import times, os, strutils, algorithm

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

proc beginWhere(testName: string, step: int = 1): int =
    let filePath = testDataPath / changeFileExt(testName, "csv")

    if not existsFile(filePath):
        result = 1
    else:
        result = countLines(filePath) + 1
        if (result > countUpThreshold and step != 1):
            result = (result - countUpThreshold) * step + countUpThreshold


proc isSorted*[T](s: openarray[T]): bool =
    var last = low(T)
    for c in s:
        if c < last:
            return false
        last = c
    return true

iterator countUpBenchStyle[S, T](a: S, b: T, step: Natural = 1): T {.inline.} =
    var res: T = T(a)
    while res <= b:
        yield res
        if res < countUpThreshold: inc (res, 1)
        else: inc(res, step)



template benchMark*(sorter: stmt, listSpawner: stmt, testName: string, maxLength: Natural, step: Natural = 1) =
    let beginAt = beginWhere(testName, step)
    let lockFilePath = testDataPath / changeFileExt(testName, "lock")

    if not existsFile(lockFilePath) and beginAt < maxLength:
        # Create lockfile 
        createFile lockFilePath

        let testPath = testDataPath / changeFileExt(testName, "csv")
        var datei = open(testPath, fmWrite)

        for i in countUpBenchStyle(beginAt, maxLength, step):
            if likely(i != 1):
                write(datei, "\n")
          
            write(datei, $i & ",")
        
            var t = 0.0
            while t <= 0.0:
                var a = listSpawner i
                t = time(a.sorter)
            write(datei, formatFloat(t, ffScientific, 32))

        flushFile datei
        close datei
        removeFile lockFilePath

template distMark*(sorter: stmt, testName: string) =
    const times = 10_000
    let beginAt = beginWhere(testName)
    let lockFilePath = testDataPath / changeFileExt(testName, "lock")

    if not existsFile(lockFilePath) and beginAt < times:
        # Create lockfile
        createFile(lockFilePath)

        let testPath = testDataPath / changeFileExt(testName, "csv")
        var datei = open(testPath, fmWrite)

        for i in beginAt .. times: 
            var t = 0.0
            while t <= 0.0:
                var a = randKeys times
                t = time(a.sorter)
            if likely(i != 1):
                write(datei, "\n")
            write(datei, formatFloat(t, ffScientific, 32))
    
        flushFile datei
        close datei
        removeFile lockFilePath

template demoBenchMark*(sorter: stmt, listSpawner: stmt, testName: string, maxLength: Natural, beginAt: Natural = 1) =

    let testPath = testDataPath / changeFileExt(testName, "csv")
    var datei = open(testPath, fmWrite)

    for i in countUp(beginAt, maxLength - beginAt + 1):
        if likely(i != 1):
            write(datei, "\n")
        write(datei, $i & ",")
        var t = 0.0
        while t <= 0.0:
            var a = listSpawner i
            t = time(a.sorter)
        write(datei, formatFloat(t, ffScientific, 32))

    flushFile datei
    close datei
