@echo off
rem Prepares this machine to run configuration scripts.

if not exist C:\ProgramData\chocolatey\nul (
    echo.
    echo.
    echo Installing chocolatey.
    echo.
    echo.
    powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
    echo.
    echo.
    echo Finished installing chocolatey.
    echo.
    echo.
)

echo.
echo.
echo Installing Boxstarter.
echo.
echo.
choco install Boxstarter
echo.
echo.
echo Finished installing Boxstarter.
echo.
echo.

echo.
echo.
pause