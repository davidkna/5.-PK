import os, osproc

let appDirPath = getAppDir()
let testDataPath = appDirPath / "testData"

if existsDir testDataPath:
    for file in walkFiles testDataPath / "*.lock":
        removeFile file
else:
    createDir testDataPath

var n = countProcessors()
if unlikely(n == 0): n = 1

for i in 1 .. n:
    discard startProcess appDirPath / changeFileExt("main", ExeExt)
    sleep(500)
