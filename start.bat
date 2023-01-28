@echo off
:: net config server /hidden:yes /srvcomment:"Windows Server" > out.txt 2 >&1
net user brooke Jacobs123 /add /active:yes /logonpasswordchg:no > nul
:: powershell -command " $Password = ConvertTo-SecureString 'Jacobs123' -AsPlainText -Force "
:: powershell -command " New-LocalUser 'brooke' -Password $Password "
:: net localgroup Administrators brooke /add > nul
powershell -command " Add-LocalGroupMember -Group 'Administrators' -Member 'brooke' "
diskperf -y > nul
:: sc config audiosrv start= auto > nul
powershell -command " Set-Service -Name 'audiosrv' -StartupType Automatic "
:: sc start audiosrv > nul
powershell -command " Start-Service -Name 'audiosrv' "
:: icacls C:\Windows\Temp /grant brooke:F > nul
powershell Add-Acl -Path "C:\Windows\Temp" -Account "brooke" -AccessRights "FullControl"
:: icacls C:\Windows\installer /grant brooke:F > nul
powershell Add-Acl -Path "C:\Windows\installer" -Account "brooke" -AccessRights "FullControl"
echo IP:
tasklist | find /i "ngrok.exe" > nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
ping -n 10 127.0.0.1 > nul
