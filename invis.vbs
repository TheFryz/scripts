echo Set WshShell = WScript.CreateObject("WScript.Shell")
echo WshShell.Run """" & WScript.Arguments(0) & """" & sargs, 0, False
