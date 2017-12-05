$uri= "https://mylibrary123.blob.core.windows.net/reposit/node-v9.1.0-x64.msi"
$out = "c:\nodejs_installer.msi"
Invoke-WebRequest -uri $uri -OutFile $out
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l c:\installlog.txt"