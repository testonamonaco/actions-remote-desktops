@echo off
net config server /srvcomment:"Windows Server" > out.txt 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v HideFastUserSwitching /t REG_DWORD /d 0 > out.txt 2>&1
net user brooke Jacobs123 /add /active:yes /logonpasswordchg:no>nul
net localgroup Administrators brooke /add >nul
diskperf -Y >nul
sc config audiosrv start= auto >nul
sc start audiosrv >nul
icacls C:\Windows\Temp /grant brooke:F >nul
icacls C:\Windows\installer /grant brooke:F >nul
echo IP:
tasklist | find /i "ngrok.exe" >nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
ping -n 10 127.0.0.1 >nul
