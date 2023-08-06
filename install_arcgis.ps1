# Download the archive to a folder
Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1pBwf4I3dehDQtpjQZYQwvKfw5CE3aynq?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile "$Env:TEMP\ArcGIS_Setup.zip"
# Extract the downloaded archive to a folder
Expand-Archive -Path "$Env:TEMP\ArcGIS_Setup.zip" -DestinationPath "C:\ArcGIS\"
Start-Process -FilePath "C:\ArcGIS\ArcGIS_Desktop_108_172737.exe" -Wait
# Copy-Item "C:\ArcGIS\AfCore.dll" -Destination "C:\ArcGIS\Desktop10.8\bin"
