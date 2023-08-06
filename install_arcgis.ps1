# Download the archive to a folder
Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1pBwf4I3dehDQtpjQZYQwvKfw5CE3aynq?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile "${Env:TEMP}\ArcGIS_Setup.zip"
# Extract the downloaded archive to a folder
Expand-Archive -Path "${Env:TEMP}\ArcGIS_Setup.zip" -DestinationPath "C:\ArcGIS\"
Start-Process -FilePath "C:\ArcGIS\Extract\Setup.exe" -ArgumentList "ESRI_LICENSE_HOST=GIS ACCEPTEULA=yes SOFTWARE_CLASS=Professional SEAT_PREFERENCE=Float DESKTOP_CONFIG=TRUE INSTALLDIR1=D:\python27 /qb"
Copy-Item "C:\ArcGIS\Originals\AfCore.dll" -Destination "${Env:programfiles(x86)}\Desktop10.8\bin\"
