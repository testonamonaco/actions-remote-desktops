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
powershell -command " Add-Acl -Path 'C:\Windows\Temp' -Account 'brooke' -AccessRights 'FullControl' "
:: icacls C:\Windows\installer /grant brooke:F > nul
powershell -command " Add-Acl -Path 'C:\Windows\installer' -Account 'brooke' -AccessRights 'FullControl' "
powershell -command " Write-Output 'IP:' "
tasklist | find /i "ngrok.exe" > nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"

:: if (Get-Process ngrok -ErrorAction SilentlyContinue) {
::     $response = Invoke-WebRequest -Uri "http://localhost:4040/api/tunnels" -Method GET -UseBasicParsing
::     $responseJson = $response.Content | ConvertFrom-Json
::     $responseJson.tunnels[0].public_url
:: } else {
::     "Failed to retreive NGROK authtoken - check again your authtoken"
:: }

powershell -command " Test-Connection -Count 10 -ComputerName '127.0.0.1' "