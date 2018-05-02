@echo off

:: ------- Self-elevating.bat --------------------------------------
@whoami /groups | find "S-1-16-12288" > nul && goto :admin
set "ELEVATE_CMDLINE=cd /d "%~dp0" & call "%~f0" %*"
findstr "^:::" "%~sf0">temp.vbs
cscript //nologo temp.vbs & del temp.vbs & exit /b
:admin -------------------------------------------------------------

::-----Check if Chocolaty is already Installed
if exist "C:\ProgramData\chocolatey\choco.exe" (
    cls
    echo Chocolatey is already Installed on this machine...

    echo Installing now specified packages...
    call :choco-programme-install

    cls
    echo Running the Win10-Initial-Setup-Script...
    call :Win10-Initial-Setup-Script

    cls
    echo All done!
    pause
    exit

) else (
    cls
    echo Chocolatey is not Installed on this machine, installing now...
    call :install-chocolatey

    cls
    echo Installing now specified packages...
    call :choco-programme-install

    cls
    echo Running the Win10-Initial-Setup-Script...
    call :Win10-Initial-Setup-Script

    cls
    echo All done!
    pause
    exit
)

::-----Chocolatey Install Script
:install-chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

::-----Start Intall loop
:choco-programme-install
choco install git --acceptlicense -y
for /f "delims=," %%a in (.\choco.preset) do choco install %%a --acceptlicense -y
cls
echo Package %%a is installing...
cls
choco upgrade all -y
pause

::-----Win10 Initial Setup Script
:Win10-Initial-Setup-Script

if exist Win10-Initial-Setup-Script (rmdir /S /Q .\Win10-Initial-Setup-Script && echo old Repo deleted, the new one will be downloaded now....)

git clone https://github.com/Disassembler0/Win10-Initial-Setup-Script.git
if exist "reclaim.preset" (
    cls
    echo custom preset found...
    call powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Win10-Initial-Setup-Script\Win10.ps1" -preset ".\reclaim.preset"
) else (
    cls
    echo No custom preset found, reverting to defaults...
    call powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Win10-Initial-Setup-Script\Win10.ps1" -preset "\Win10-Initial-Setup-Script\Default.preset"

)