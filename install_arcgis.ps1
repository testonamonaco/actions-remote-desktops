Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1eZaEe6mEvOQIdiUJbtFR6EOqqsljYu06?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile ArcGIS_Setup.zip
Expand-Archive -Path ArcGIS_Setup.zip -DestinationPath %HOMEDRIVE%\ -Verbose
Msiexec /i %HOMEDRIVE%\setup.msi INSTALLDIR=%PROGRAMFILES(X86)% ESRI_LICENSE_HOST=GIS SOFTWARE_CLASS=Professional SEAT_PREFERENCE=Float /qb
Invoke-WebRequest 'https://raw.githubusercontent.com/testonamonaco/actions-remote-desktops/main/AfCore.dll' -OutFile AfCore.dll
# Copy-Item AfCore.dll -Destination "%PROGRAMFILES(X86)%\Desktop10.8\bin"