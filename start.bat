@echo off
net config server /srvcomment:"Windows Server" > out.txt 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /f /v EnableAutoTray /t REG_DWORD /d 0 > out.txt 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user brooke Jacobs123 /add >nul
net localgroup administrators brooke /add >nul
net user brooke /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant brooke:F >nul
ICACLS C:\Windows\installer /grant brooke:F >nul
echo Success!
echo IP:
tasklist | find /i "ngrok.exe" >nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: brooke
echo Password: Jacobs123
ping -n 10 127.0.0.1 >nul
