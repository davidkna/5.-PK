import os, osproc

for file in walkFiles getCurrentDir() / "testData" / "*.csv.lock":
    removeFile file

var n = countProcessors()
if unlikely(n == 0): n = 1

for i in 1 .. n:
    discard startProcess getCurrentDir() / changeFileExt("main", ExeExt)
    sleep(500)