$env:Path += ";C:\Program Files\nodejs"

npm install -g @angular/cli
#[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Windows\system32\config\systemprofile\AppData\Roaming\npm", "Machine")
#$env:Path += ";C:\Windows\system32\config\systemprofile\AppData\Roaming\npm"
pwd