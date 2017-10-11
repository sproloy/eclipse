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

#$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)


$setupFolder= "$($env:USERPROFILE)\Desktop\guide.txt"
Create-Folder "$setupFolder"






# haxm 
if((Test-Path "$setupFolder\guide.txt") -eq $false)
{
  
        Download-File "https://atestdeccan6192.blob.core.windows.net/guide/guide.txt" "$setupFolder\guide.txt"
}



 





