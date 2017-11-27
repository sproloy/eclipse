# Silent CUCUMBER using RubyInstaller
$workdir = "C:\installer\"
# Check if work directory exists if not create it
If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }
# Download the installer
$source = "https://mylibrary123.blob.core.windows.net/reposit/rubyinstaller-2.4.2-2-x64.exe"
$destination = "$workdir\rubyinstaller-2.4.2-2-x64.exe"
# Check if Invoke-Webrequest exists otherwise execute WebClient
if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}
Invoke-WebRequest $source -OutFile $destination 
# Start the installation
Start-Process -FilePath "C:\installer\rubyinstaller-2.4.2-2-x64.exe" -ArgumentList "/silent /tasks='assocfiles,modpath'" -PassThru -Wait  
# Wait XX Seconds for the installation to finish
Start-Sleep -s 35

$env:Path += ";C:\Ruby24-x64\bin\"
#install cucumber version 2.3.3
gem install cucumber -v 2.3.3
cucumber --version