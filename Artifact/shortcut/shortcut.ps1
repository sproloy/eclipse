$TargetFile = 'C:\Program Files\Internet Explorer\iexplore.exe'
$ShortcutFile = "$($env:Public)\Desktop\iexplore - Shortcut.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = "C:\Program Files\Internet Explorer\iexplore.exe"
$shortcut.Arguments = "http://desfm4lfsapp.azurewebsites.net"
$Shortcut.Save()