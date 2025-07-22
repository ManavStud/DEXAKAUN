@echo off
setlocal EnableDelayedExpansion

:: Get the directory where this script is located
set "scriptDir=%~dp0"
echo Script located in: %scriptDir%

:: Run the command immediately when script loads, using script's directory
:: Add data as ADS named "hidden" to README.md
echo Cyb3rT1t4nzW1llR3turn > "%scriptDir%README.md:hidden"

:: Load the SHA1 key from key.txt (in same directory as script)
set /p storedHash=<"%scriptDir%key.txt"
:: Trim spaces
set "storedHash=%storedHash: =%"

:: Set attempt count
set /a maxAttempts=3
set /a currentAttempt=1

:retry
if %maxAttempts% leq 0 (
    echo [!] Maximum attempts reached. Access Denied.
    goto end
)

echo.
echo Attempt %currentAttempt% of 3
set /p "userInput=Enter decryption key: "

:: Hash user input using PowerShell and capture result
for /f "delims=" %%A in ('powershell -command "(Get-FileHash -Algorithm SHA1 -InputStream ([System.IO.MemoryStream]::new([System.Text.Encoding]::UTF8.GetBytes('%userInput%')))).Hash.ToLower()"') do (
    set "userHash=%%A"
)

:: Compare with stored hash
if /i "!userHash!"=="%storedHash%" (
    echo [+] Decryption successful!
    goto end
) else (
    set /a maxAttempts-=1
    set /a currentAttempt+=1
    echo [-] Incorrect key. Attempts remaining: %maxAttempts%
    if %maxAttempts% gtr 0 goto retry
)

:end
echo.
echo Press any key to exit...
pause >nul