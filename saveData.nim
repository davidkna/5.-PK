

proc appendDataTo*(fileName, text: string) =
  var datei = open(fileName, fmAppend)
  write (datei, text)
  close(datei)

proc stringifySeq*[T](sequence: seq[T]): string =
  var stringSq = $sequence
  return "\n" & stringSq[2 .. sequence.high - 1]

proc countLines*(fileName: string): int =
    for line in fileName.lines:
        result += 1

proc createFile*(fileName: string) =
    open(fileName, fmWrite).close()