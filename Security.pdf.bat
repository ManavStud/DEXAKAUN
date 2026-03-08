@echo off
title SYSTEM FAILURE - CRITICAL ERROR
color 04
mode con: cols=180 lines=55
cls

:: FULL-SCREEN CMD (NO ESCAPE)
powershell -Command "&{$sig=@' [DllImport(\"user32.dll\")] public static extern bool ShowWindow(int hWnd, int nCmdShow); '@; add-type -name Win32Utils -memberDefinition $sig -namespace Win32Functions; [Win32Functions.Win32Utils]::ShowWindow((Get-Process -Id $pid).MainWindowHandle, 3)}"

:: DISABLE TASK MANAGER (NO CTRL+ALT+DEL)
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1

:: START HORROR AUDIO (SCREAMING SOUND)
start /min powershell -c (New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Error.wav').PlayLooping()

:: HORROR VOICE (I AM WATCHING YOU...)
powershell -c (New-Object -ComObject SAPI.SpVoice).Speak('I am watching you...')

:: RANDOM GLITCH EFFECTS
for /L %%n in (1,1,10) do (
    color 40
    echo ███████ SYSTEM FAILURE ████████
    echo ☠ ERROR ☠ SYSTEM ☠ CRASH ☠
    timeout /t 0 >nul
    cls
    color 04
    echo ██ SECURITY BREACH DETECTED ██
    echo ❌ CRITICAL MEMORY LEAK ❌
    timeout /t 0 >nul
    cls
)

:: FAKE FILE DELETION WITH PROGRESS BAR
cls
echo.
echo ██ DELETING SYSTEM FILES... PLEASE WAIT ██
for /L %%i in (0,5,100) do (
    echo Progress: %%i%% 
    timeout /t 1 >nul
)
timeout /t 2 >nul
cls

:: SCARIEST HORROR FACE
cls
echo.
echo   ██████████████████████████████████████████
echo   ██                                      ██
echo   ██         ████████████████             ██
echo   ██       ██    ☠      ☠    ██           ██
echo   ██     ██  █        █  █    ██          ██
echo   ██    ██    ███████████      ██         ██
echo   ██    ██    ██  ███  ██      ██         ██
echo   ██      ██     ████        ██           ██
echo   ██       ████████████████             ██
echo   ██                                      ██
echo   ██████████████████████████████████████████
echo.
echo            "YOUR SYSTEM IS MINE."
timeout /t 2 >nul
cls

:: BLUE SCREEN OF DEATH (FAKE CRASH SCREEN)
cls
color 1F
echo.
echo A problem has been detected and Windows has been shut down to prevent damage
echo If this is the first time you've seen this stop error screen, restart your computer.
echo.
echo *** STOP: 0x0000005C (0x00000123, 0x00000000, 0x00000000, 0x00000000)
echo Beginning dump of physical memory...
timeout /t 10 >nul
cls

:: INFINITE "YOU HAVE BEEN HACKED" LOOP (RUNS FOR A FEW CYCLES THEN CONTINUES)
set loopCount=0
:LOOP
color 04
cls
echo.
echo ████████████████████████████████████████████████████
echo ██                                              ██
echo ██   █████    ██   ██  ██████   ██   ██  ██████   ██
echo ██  ██   ██   ██   ██  ██   ██  ██   ██  ██   ██  ██
echo ██  ███████   ██   ██  ██████   ██   ██  ██████   ██
echo ██  ██   ██   ██   ██  ██   ██  ██   ██  ██   ██  ██
echo ██  ██   ██   ██████   ██   ██   ██████  ██   ██  ██
echo ██                                              ██
echo ██   YOU HAVE BEEN HACKED!   YOU HAVE BEEN HACKED! ██
echo ██                                              ██
echo ████████████████████████████████████████████████████
timeout /t 1 >nul
color 0F
cls
timeout /t 1 >nul

set /a loopCount+=1
if %loopCount% lss 5 goto LOOP

:: Wait for 2-3 seconds before continuing to decryption section
timeout /t 3 >nul

:: CLEANUP ALL BACKGROUND PROCESSES BEFORE DECRYPTION
:: Kill all background PowerShell processes that were started
taskkill /f /im powershell.exe >nul 2>&1

:: Re-enable Task Manager
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f >nul 2>&1

:: Stop any audio processes
taskkill /f /im wmplayer.exe >nul 2>&1
taskkill /f /im mspaint.exe >nul 2>&1

:: Clear screen and reset
cls
color 07
mode con: cols=80 lines=25

:: -------------------------------
:: [ Fake animation delay section ]
:: -------------------------------
cls
color 0C
echo.
echo ████████████████████████████████████████████████████
echo ██                                              ██
echo ██            DEXAKAUN RANSOMWARE ACTIVATED     ██
echo ██                                              ██
echo ████████████████████████████████████████████████████
echo.
echo [*] Initializing ransomware module...
timeout /t 1 >nul
echo [*] Scanning system files...
timeout /t 1 >nul
echo [*] Encrypting files...
timeout /t 2 >nul
echo [*] Files encrypted successfully.
timeout /t 1 >nul

:END
goto END
