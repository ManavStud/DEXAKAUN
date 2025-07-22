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
echo ██            RANSOMWARE ACTIVATED              ██
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
echo.
echo ████████████████████████████████████████████████████
echo ██                                              ██
echo ██    ALL YOUR FILES HAVE BEEN ENCRYPTED!       ██
echo ██                                              ██
echo ██    Opening secure input terminal...          ██
echo ██                                              ██
echo ████████████████████████████████████████████████████
echo.
timeout /t 2 >nul

:: CREATE THE KEY INPUT SCRIPT
echo @echo off > keyinput.bat
echo title DECRYPTION KEY INPUT >> keyinput.bat
echo color 0C >> keyinput.bat
echo cls >> keyinput.bat
echo. >> keyinput.bat
echo echo ████████████████████████████████████████████████████ >> keyinput.bat
echo echo ██                                              ██ >> keyinput.bat
echo echo ██    ALL YOUR FILES HAVE BEEN ENCRYPTED!       ██ >> keyinput.bat
echo echo ██                                              ██ >> keyinput.bat
echo echo ██    To decrypt your files, enter the          ██ >> keyinput.bat
echo echo ██    correct decryption key below.             ██ >> keyinput.bat
echo echo ██                                              ██ >> keyinput.bat
echo echo ████████████████████████████████████████████████████ >> keyinput.bat
echo echo. >> keyinput.bat
echo setlocal EnableDelayedExpansion >> keyinput.bat
echo. >> keyinput.bat
echo :: Load hash from key.txt >> keyinput.bat
echo set "KEYFILE=key.txt" >> keyinput.bat
echo if not exist "%%KEYFILE%%" ( >> keyinput.bat
echo     echo [ERROR] key.txt file not found in the same directory. >> keyinput.bat
echo     echo The key file must be present to verify the decryption key. >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo Press any key to close... >> keyinput.bat
echo     pause ^>nul >> keyinput.bat
echo     del "%%~f0" >> keyinput.bat
echo     exit /b >> keyinput.bat
echo ^) >> keyinput.bat
echo. >> keyinput.bat
echo set /p "storedHash="^<"%%KEYFILE%%" >> keyinput.bat
echo set attempts=3 >> keyinput.bat
echo. >> keyinput.bat
echo :askKey >> keyinput.bat
echo echo. >> keyinput.bat
echo echo Attempts remaining: %%attempts%% >> keyinput.bat
echo echo. >> keyinput.bat
echo set /p "userKey=Enter decryption key: " >> keyinput.bat
echo. >> keyinput.bat
echo :: Compute SHA1 hash of input using PowerShell >> keyinput.bat
echo for /f "delims=" %%%%H in ('powershell -Command "[BitConverter]::ToString((New-Object Security.Cryptography.SHA1Managed).ComputeHash([Text.Encoding]::UTF8.GetBytes('%%userKey%%'))).Replace('-','').ToLower()"'^) do ( >> keyinput.bat
echo     set "hashedInput=%%%%H" >> keyinput.bat
echo ^) >> keyinput.bat
echo. >> keyinput.bat
echo :: Compare hashes >> keyinput.bat
echo if /i "!hashedInput!"=="%%storedHash%%" ( >> keyinput.bat
echo     cls >> keyinput.bat
echo     color 0A >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo ████████████████████████████████████████████████████ >> keyinput.bat
echo     echo ██                                              ██ >> keyinput.bat
echo     echo ██              SUCCESS!                        ██ >> keyinput.bat
echo     echo ██                                              ██ >> keyinput.bat
echo     echo ████████████████████████████████████████████████████ >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo ✅ Correct key! Files are being decrypted... >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo [*] Decrypting files... Please wait... >> keyinput.bat
echo     timeout /t 2 ^>nul >> keyinput.bat
echo     echo [*] Restoring system settings... >> keyinput.bat
echo     timeout /t 1 ^>nul >> keyinput.bat
echo     echo [*] Cleaning up temporary files... >> keyinput.bat
echo     timeout /t 1 ^>nul >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo ████████████████████████████████████████████████████ >> keyinput.bat
echo     echo ██                                              ██ >> keyinput.bat
echo     echo ██        DECRYPTION COMPLETE!                  ██ >> keyinput.bat
echo     echo ██        SIMULATION FINISHED                   ██ >> keyinput.bat
echo     echo ██                                              ██ >> keyinput.bat
echo     echo ████████████████████████████████████████████████████ >> keyinput.bat
echo     echo. >> keyinput.bat
echo     echo SUCCESS! Window will remain open for review. >> keyinput.bat
echo     echo Close manually when ready. >> keyinput.bat
echo     echo. >> keyinput.bat
echo     timeout /t -1 ^>nul 2^>^&1 >> keyinput.bat
echo     pause ^>nul >> keyinput.bat
echo     goto :eof >> keyinput.bat
echo ^) else ( >> keyinput.bat
echo     set /a attempts-=1 >> keyinput.bat
echo     if !attempts! gtr 0 ( >> keyinput.bat
echo         color 0C >> keyinput.bat
echo         echo. >> keyinput.bat
echo         echo ❌ Incorrect key. You have !attempts! attempt(s^) left. >> keyinput.bat
echo         echo Try again... >> keyinput.bat
echo         timeout /t 2 ^>nul >> keyinput.bat
echo         goto askKey >> keyinput.bat
echo     ^) else ( >> keyinput.bat
echo         cls >> keyinput.bat
echo         color 04 >> keyinput.bat
echo         echo. >> keyinput.bat
echo         echo ████████████████████████████████████████████████████ >> keyinput.bat
echo         echo ██                                              ██ >> keyinput.bat
echo         echo ██              FAILED!                         ██ >> keyinput.bat
echo         echo ██                                              ██ >> keyinput.bat
echo         echo ████████████████████████████████████████████████████ >> keyinput.bat
echo         echo. >> keyinput.bat
echo         echo ❌❌❌ All attempts used! >> keyinput.bat
echo         echo Your files remain encrypted forever... >> keyinput.bat
echo         echo. >> keyinput.bat
echo         echo [SIMULATION COMPLETE - ACCESS DENIED] >> keyinput.bat
echo         echo FAILED! Window will remain open for review. >> keyinput.bat
echo         echo Close manually when ready. >> keyinput.bat
echo         echo. >> keyinput.bat
echo         timeout /t -1 ^>nul 2^>^&1 >> keyinput.bat
echo         pause ^>nul >> keyinput.bat
echo         goto :eof >> keyinput.bat
echo     ^) >> keyinput.bat
echo ^) >> keyinput.bat

:: LAUNCH THE CLEAN INPUT WINDOW
start "Decryption Terminal" keyinput.bat

:: SHOW COMPLETION MESSAGE IN MAIN WINDOW
cls
color 07
echo.
echo ████████████████████████████████████████████████████
echo ██                                              ██
echo ██        SIMULATION COMPLETE!                  ██
echo ██                                              ██
echo ████████████████████████████████████████████████████
echo.
echo Main simulation window - Effects completed
echo Decryption terminal has been opened separately
echo.
echo This window shows the simulation effects
echo The new window handles key input cleanly
echo.
echo Both windows will remain open for review
echo Close them manually when finished
echo.

:keepOpen
timeout /t -1 >nul 2>&1
pause >nul
goto :keepOpen