

proc appendTo*(fileName: string, text: string) =
  var datei = open(fileName, fmAppend)
  write (datei, "\n" & text)
  close(datei)