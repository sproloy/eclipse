function Create-Folder {
    Param ([string]$path)
    if ((Test-Path $path) -eq $false) 
    {
        Write-Host "$path doesn't exist. Creating now.."
        New-Item -ItemType "directory" -Path $path
    }
}

function Download-File{
    Param ([string]$src, [string] $dst)

    (New-Object System.Net.WebClient).DownloadFile($src,$dst)
    #Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
  while(!(Test-Path $File)) {    
    Start-Sleep -s 10;   
  }  
} 


#Setup Folders

$setupFolder = "c:\bal"
Create-Folder "$setupFolder"

$dest = "c:\realm"
Create-Folder "$setupFolder"


$os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x64)’

# SQL Server Installation 
if((Test-Path "$setupFolder\realm.zip") -eq $false)
{
    Write-Host "Downloading."
    if ($os_type -eq "True"){
        Download-File "https://g7crtipl-my.sharepoint.com/personal/proloy_saha_g7cr_in/_layouts/15/guestaccess.aspx?docid=13e75941d89cd4348a16dbae1342854c6&authkey=AQi0vTRHPPkMYttOlnJ73mE" "$setupFolder\realm.zip"
    }else {
        Write-Host "32 Bit system is not supported"
    }    
}



Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "C:\bal\realm.zip"

$Destination = $dest

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)


$wshshell = New-Object -ComObject WScript.Shell
$desktop = [System.Environment]::GetFolderPath('Desktop')
  $lnk = $wshshell.CreateShortcut($desktop+"\realm.lnk")
  $lnk.TargetPath = "c:\realm"
  $lnk.Save()  
