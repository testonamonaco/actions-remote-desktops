Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1eZaEe6mEvOQIdiUJbtFR6EOqqsljYu06?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile ArcGIS_Setup.zip
Expand-Archive -Path ArcGIS_Setup.zip -DestinationPath .\ -Verbose
Msiexec /i .\setup.msi INSTALLDIR=C:\ArcGIS ESRI_LICENSE_HOST=GIS SOFTWARE_CLASS=Professional SEAT_PREFERENCE=Float /qb
