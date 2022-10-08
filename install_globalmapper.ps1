Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1fKiPS1iLJ1_HqnEOabToLrI-o3tl4eW9?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile 'Global Mapper 22.0.zip'
Expand-Archive -Path 'Global Mapper 22.0.zip' -DestinationPath 'C:\GM\' -Verbose
& 'C:\GM\global_mapper-22.exe' /s
Invoke-WebRequest 'https://raw.githubusercontent.com/testonamonaco/actions-remote-desktops/main/AfCore.dll' -OutFile AfCore.dll
# Copy-Item "C:\GM\Crack\global_mapper.exe" -Destination "%PROGRAMFILES%\GlobalMapper22.0_64bit"
# Copy-Item -Path "C:\GM\Crack\ProgramData" -Destination "C:\" -Recurse
