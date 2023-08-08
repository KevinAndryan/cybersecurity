$Url = "http://nom.domaine.com/fichier.exe"
$SavePath = ".\Monfichier.exe" 
$DelaySeconds = 10

function Download-File {
    param(
        [string]$url,
        [string]$savePath
    )
    $response = Invoke-WebRequest -Uri $url -OutFile $savePath
}

function Execute-File {
    param(
        [string]$filePath,
        [int]$delaySeconds
    )
    Start-Sleep -Seconds $delaySeconds
    
    if (Test-Path $filePath) {
        Start-Process -FilePath $filePath
    }
}

Download-File -url $Url -savePath $SavePath
Execute-File -filePath $SavePath -delaySeconds $DelaySeconds
