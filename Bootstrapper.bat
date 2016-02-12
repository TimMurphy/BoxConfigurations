@echo off
rem Prepares any machine to run configuration scripts.

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

echo.
echo Installing Boxstarter...
cmd /c choco install -y Boxstarter
cmd /c choco install -y Boxstarter.Azure
echo Finished installing Boxstarter.

echo.
echo Close this command prompt to ensure you are using updated environment variables, e.g. PATH.
echo.
echo.
pause