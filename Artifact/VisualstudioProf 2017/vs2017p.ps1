Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )  
}
$url = 'https://mylibrary123.blob.core.windows.net/reposit/vs_professional__719492380.1495459676.exe'

$vscodeSetup = "${env:Temp}\vs_community.exe"


try
{
    Invoke-WebRequest -Uri $Url -OutFile $vscodeSetup;
}
catch
{
    Write-Error "Failed to download VS 2017";
}
try
{
    Start-Process -FilePath $vscodeSetup -ArgumentList "--add Microsoft.VisualStudio.Workload.NetCoreTools;includeRecommended --passive";
}
catch
{
    Write-Error "Failed to install VS 2017";
}