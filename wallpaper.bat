@echo off
:: reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d D:\a\bingwallpaper.jpg /f
rundll32.exe user32.dll,UpdatePerUserSystemParameters
taskkill /f /im explorer.exe
start explorer.exe
