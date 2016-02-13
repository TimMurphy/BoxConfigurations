@echo off
pushd %~dp0
powershell -NoProfile -ExecutionPolicy unrestricted -Command %1 %2 %3 %4
echo.
echo.
pause