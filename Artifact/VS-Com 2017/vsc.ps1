Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )
 
   
}
$url = 'https://prodartifact.blob.core.windows.net/artifacts/vs_Community.exe'
$codeSetupUrl = "$PSScriptroot\10meg.exe"
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