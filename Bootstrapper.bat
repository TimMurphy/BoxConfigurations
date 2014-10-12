@echo off
rem Prepares this machine to run configuration scripts.

echo Setting powershell execution policy to unrestricted...
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Set-ExecutionPolicy Unrestricted"
echo Set powershell execution policy to unrestricted.
echo.

if not exist C:\ProgramData\chocolatey\nul (

  echo Installing chocolatey...
  powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
  echo Finished installing chocolatey.
  echo.
)

echo Installing Boxstarter...
choco install Boxstarter
choco install Boxstarter.Azure
echo Finished installing Boxstarter.
echo.

echo.
echo.
pause