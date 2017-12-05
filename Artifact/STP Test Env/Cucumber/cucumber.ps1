# Silent SASS using RubyInstaller

[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Ruby23-x64\bin\;C:\RubyDevKit;C:\Ansico\x64", "Machine") 
$env:Path += ";C:\Ruby23-x64\bin\;C:\Ansico\x64" 

function Create-Folder {
Param ([string]$path)
if ((Test-Path $path) -eq $false) 
{
Write-Host "$path doesn't exist. Creating now.."
New-Item -ItemType "directory" -Path $path
}
}

function Download-File{
Param ([string]$src, [string] $dst)

(New-Object System.Net.WebClient).DownloadFile($src,$dst)
#Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
while(!(Test-Path $File)) { 
Start-Sleep -s 10; 
} 
} 

$workdir = "C:\installer\"
#Create-Folder "$setupFolder"
Create-Folder "C:\installer\"

if((Test-Path "C:\installer\rubyinstaller-2.3.3-x64.exe") -eq $false)
{
Download-File "https://mylibrary123.blob.core.windows.net/reposit/rubyinstaller-2.3.3-x64.exe" "$workdir\rubyinstaller-2.3.3-x64.exe" 
Start-Process -FilePath "C:\installer\rubyinstaller-2.3.3-x64.exe" -ArgumentList "/verysilent /tasks='assocfiles,modpath'" -PassThru -Wait 
}

# Wait XX Seconds for the installation to finish
Start-Sleep -s 40

#Get-ChildItem $Destinationruby | ForEach-Object {Copy-Item -Path $Sourceruby -Destination $_ -Force -Recurse}

# Install Devkit

#Setup Folders

$setupFolder = "C:\RubyDevKit"
#Create-Folder "$setupFolder"
Create-Folder "C:\RubyDevKit"



if((Test-Path "C:\RubyDevKit\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe") -eq $false)
{
Download-File "https://mylibrary123.blob.core.windows.net/reposit/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe" "C:\RubyDevKit\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe" 
Start-Process $setupFolder\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe -ArgumentList "-oC:\RubyDevKit -y" -PassThru -Wait
cd C:\RubyDevKit
ruby dk.rb init
Add-Content -Path "C:\RubyDevKit\config.yml" -Value '- C:\Ruby23-x64' -PassThru
ruby dk.rb install

#install sass
gem install cucumber -v 2.3.3
#cucumber --version

}

# Installing Ansicon

function Create-Folder {
Param ([string]$path)
if ((Test-Path $path) -eq $false) 
{
Write-Host "$path doesn't exist. Creating now.."
New-Item -ItemType "directory" -Path $path
}
}

function Download-File{
Param ([string]$src, [string] $dst)

(New-Object System.Net.WebClient).DownloadFile($src,$dst)
#Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
while(!(Test-Path $File)) { 
Start-Sleep -s 10; 
} 
} 

#Setup Folders

$setupFolder = "C:\Ansico"
Create-Folder "$setupFolder"

if((Test-Path "$setupFolder\ansi160.zip") -eq $false)
{
Download-File "https://mylibrary123.blob.core.windows.net/reposit/ansi160.zip" "$setupFolder\ansi160.zip" 
}


Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\ansi160.zip"

$destination = "C:\Ansico"


Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path "C:\Ansico\ansi160.zip" -Recurse

cd C:\Ansico\x64
ansicon.exe -i

# Remove the installer
rm -Force $workdir\rubyinstaller-2.3.3-x64.exe 