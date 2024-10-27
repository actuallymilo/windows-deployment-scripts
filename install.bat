@echo off
:Start
cls
echo 1. Windows XP Professional
echo 2. Windows Vista Business x86 SP1
echo 3. Windows 7 Enterprise x64
echo 4. Windows 8.1 Enterprise x64
echo 5. Windows 10 Enterprise (1703) x64
echo 6. Windows 10 Enterprise for HP Laptop
echo 7. Reboot
echo 8. Prepare Drive for Windows
echo 9. Prepare Drive for Windows XP/Vista
echo.

choice /c 123456789 /m "Select the version of Windows to be installed:"

if errorlevel 9 goto DiskPrepXP
if errorlevel 8 goto DiskPrep
if errorlevel 7 goto Reboot
if errorlevel 6 goto Win10lap
if errorlevel 5 goto Win101703
if errorlevel 4 goto WinBlue
if errorlevel 3 goto Win7
if errorlevel 2 goto WinVista
if errorlevel 1 goto WinXP

:WinXP
dism /Apply-Image /ImageFile:"Windows XP GFX.wim" /Index:1 /ApplyDir:W:\
pause
goto start

:WinVista
dism /Apply-Image /ImageFile:"Windows Vista SP1.wim" /Index:1 /ApplyDir:W:\
bcdedit /delete {default}
bootrec /rebuildbcd
pause
goto Start

:Win7
dism /Apply-Image /ImageFile:"Windows 7 Enterprise NVIDIA.wim" /Index:1 /ApplyDir:W:\
bcdboot W:\Windows /s S:\
pause
goto Start

:WinBlue
dism /Apply-Image /ImageFile:"Windows 8.1 Enterprise.wim" /Index:1 /ApplyDir:W:\
bcdboot W:\Windows /s S:\
pause
goto Start

:Win101703
dism /Apply-Image /ImageFile:"Windows 10 Enterprise 1703.wim" /Index:1 /ApplyDir:W:\
bcdboot W:\Windows /s S:\
pause
goto Start

:Win10lap
dism /Apply-Image /ImageFile:"Windows 10 Enterprise HP Laptop.wim" /Index:1 /ApplyDir:W:\
bcdboot W:\Windows /s S:\
pause
goto Start

:Reboot
wpeutil reboot

:DiskPrep
diskpart /s "DiskPart script.txt"
pause
goto Start

:DiskPrepXP
diskpart /s "DiskPartXP.txt"
pause
goto Start
