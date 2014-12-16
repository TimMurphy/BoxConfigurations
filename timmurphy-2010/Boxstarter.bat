@echo off

if "%1" == "" (  
  echo.
  echo.
  echo USAGE: Boxstarter [boxstarterScript.config]
  echo.
  echo.
  goto :eof
)

if not exist %1 (
  echo.
  echo.
  echo Cannot find boxstarter script '%1'.
  echo.
  echo.
  goto :eof
)

powershell -NoProfile -ExecutionPolicy unrestricted -Command .\Boxstarter.ps1 %1