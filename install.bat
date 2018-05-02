
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
choco update all -y
pause

::-----Win10 Initial Setup Script
:Win10-Initial-Setup-Script
git clone https://github.com/Disassembler0/Win10-Initial-Setup-Script.git
if exist ".\reclaim.preset"(
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Win10-Initial-Setup-Script\Win10.ps1" -preset ".\reclaim.preset"
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Win10-Initial-Setup-Script\Win10.ps1" -preset "\Win10-Initial-Setup-Script\Default.preset"

)