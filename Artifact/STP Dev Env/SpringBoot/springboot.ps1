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

$setupFolder = "c:\Software-Modules"
Create-Folder "$setupFolder"

#Create-Folder "c:\Springboot Module"




if((Test-Path "$setupFolder\spring-boot-cli-1.5.9.RELEASE-bin (1).zip") -eq $false)
{
  
        Download-File "https://mylibrary123.blob.core.windows.net/reposit/spring-boot-cli-1.5.9.RELEASE-bin%20(1).zip" "$setupFolder\spring-boot-cli-1.5.9.RELEASE-bin (1).zip"  
}






Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\spring-boot-cli-1.5.9.RELEASE-bin (1).zip"

$destination = "C:\Software-Modules"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item �path "C:\Software-Modules\spring-boot-cli-1.5.9.RELEASE-bin (1).zip" -Recurse

#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\ 
