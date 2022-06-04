Invoke-WebRequest 'https://www.googleapis.com/drive/v3/files/1mTeknzgsG_tkl491L2_VvZDvwpmcwZLC?alt=media&key=AIzaSyBD8tY90tF5DojRDNgAHN00gfoTCNOiuAI' -OutFile 'Global Mapper 22.0.zip'
Expand-Archive -Path 'Global Mapper 22.0.zip' -DestinationPath 'C:\Users\brooke\Documents\GM' -Verbose
& 'C:\Users\brooke\Documents\GM\global_mapper-22.exe' /s
Invoke-WebRequest 'https://raw.githubusercontent.com/testonamonaco/actions-remote-desktops/main/AfCore.dll' -OutFile AfCore.dll
Copy-Item "C:\Users\brooke\Documents\GM\Crack\global_mapper.exe" -Destination "C:\Program Files\GlobalMapper22.0_64bit"
Copy-Item -Path "C:\Users\brooke\Documents\GM\Crack\ProgramData" -Destination "C:\" -Recurse