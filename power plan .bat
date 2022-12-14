@echo off
cls
title YFN Power plan
color 06
Mode 45,11
::--------------------------------------------------------------------------------------------------------------------------------------
::Run as Admin
Reg.exe add HKLM /F >nul 2>&1
if %errorlevel% neq 0 start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b

::Show Detailed BSoD
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1

::Blank/Color Character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")

::Add ANSI escape sequences
Reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
goto start
::--------------------------------------------------------------------------------------------------------------------------------------
: start 
echo select your Power plan
echo 1- Amit v3 
echo 2- zoyata 
echo 3- Muren
::-------------------------------------------------------
set input=
set /p "input=                      >:"
if /i %input% == 1 goto Amit v3 
if /i %input% == 2 goto zoyata
if /i %input% == 3 goto Muren
:X
cls
echo                                            Error
timeout /T 2 /NOBREAK >nul 2>&1
cls
goto start
::----------------------------------------------------------------------------------------------
: Amit v3  
cls
echo select
echo 1- Amit v3 Idle Enabled
echo 2- Amit v3 idle disable 
::-------------------------------------------------------
set input=
set /p "input=                      >:"
if /i %input% == 1 goto Amit v3 Idle Enabled
if /i %input% == 2 goto Amit v3 idle disable 
:X
cls
echo                                            Error
timeout /T 2 /NOBREAK >nul 2>&1
cls
goto start
::-------------------------------------------------------
: Amit v3 Idle Enabled
cls
echo Import Amit v3  
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/Amitv3IdleEnabled.pow" -outfile "C:\Users\%username%\Downloads\Amitv3IdleEnabled.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\Amitv3IdleEnabled" 77777777-7777-7777-7777-777777777777
echo SETACTIVE Amit v3 Idle Enabled
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\Amitv3IdleEnabled.pow
cls
exit
::--------------------------------------------------------
: Amit v3 idle disable
cls 
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/Amitv3.pow" -outfile "C:\Users\%username%\Downloads\Amitv3.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\Amitv3.pow" 77777777-7777-7777-7777-777777777778
echo SETACTIVE Amit v3 idle disable
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777778"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\Amitv3.pow
cls
exit
::--------------------------------------------------------------------
:  Muren
cls
echo select
echo 1- Muren Idle Enabled
echo 2- Muren idle disable 
::-------------------------------------------------------
set input=
set /p "input=                      >:"
if /i %input% == 1 goto Muren Idle Enabled
if /i %input% == 2 goto Muren idle disable 
:X
cls
echo                                            Error
timeout /T 2 /NOBREAK >nul 2>&1
cls
goto start
::--------------------------------------
: Muren Idle Enabled
cls
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/MurenIdleEnabled.pow" -outfile "C:\Users\%username%\Downloads\MurenIdleEnabled.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\MurenIdleEnabled.pow" 77777777-7777-7777-7777-777777777779
echo SETACTIVE MurenIdleEnabled.pow
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777779"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\MurenIdleEnabled.pow
cls
exit
::------------------------------------------------------
: Muren idle disable 
cls
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/Muren.pow" -outfile "C:\Users\%username%\Downloads\Muren.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\Muren.pow" 77777777-7777-7777-7777-777777777776
echo SETACTIVE Muren
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777776"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\Muren.pow
exit
::--------------------------------------------------------------------
: zoyata
cls
echo select
echo 1- zoyata Idle Enabled
echo 2- zoyata idle disable 
::-------------------------------------------------------
set input=
set /p "input=                      >:"
if /i %input% == 1 goto zoyata Idle Enabled
if /i %input% == 2 goto zoyata idle disable 
:X
cls
echo                                            Error
timeout /T 2 /NOBREAK >nul 2>&1
cls
goto start-
::-----------------------------------------------------------------------------
:zoyata Idle Enabled
cls
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/ZoyataIdleEnabled.pow" -outfile "C:\Users\%username%\Downloads\ZoyataIdleEnabled.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\ZoyataIdleEnabled.pow" 77777777-7777-7777-7777-777777777775
echo SETACTIVE ZoyataIdleEnabled.pow
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777775"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\ZoyataIdleEnabled.pow
cls
exit
::---------------------------------------
: zoyata idle disable 
cls
powershell invoke-webrequest -uri "https://github.com/YFNOS/YFNOS-Post-Install/raw/main/Zoyata.pow" -outfile "C:\Users\%username%\Downloads\Zoyata.pow"
cls
powercfg -import "C:\Users\%username%\Downloads\Zoyata.pow" 77777777-7777-7777-7777-777777777774
echo SETACTIVE Zoyata.pow
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777774"

echo Delete Balanced
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

echo Delete High performance
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Delete Power saver
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo Disable hibernate
powercfg -h off

echo Disable HPET
bcdedit /deletevalue useplatformclock

echo Disable dynamic tick (laptop power savings)
bcdedit /set disabledynamictick yes

echo Disable synthetic timers
bcdedit /set useplatformtick yes

echo Boot timeout 10
bcdedit /timeout 10

echo Disable nx
bcdedit /set nx optout

echo Disable boot screen animation
bcdedit /set bootux disabled

echo Speed up boot times
bcdedit /set bootmenupolicy standard

echo Remove windows login logo
bcdedit /set quietboot yes

echo Disable boot logo
bcdedit /set {globalsettings} custom:16000067 true

echo Disable spinning animation
bcdedit /set {globalsettings} custom:16000069 true

echo Disable boot messages
bcdedit /set {globalsettings} custom:16000068 true
cls
del /s /f /q C:\Users\%username%\Downloads\Zoyata.pow
cls
exit