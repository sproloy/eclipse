#$env:Path += ";C:\Windows\system32\"

$DesktopPath = [Environment]::GetFolderPath("Desktop")  


cd $DesktopPath
npm install -g @angular/cli
pwd