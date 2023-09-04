@echo off

echo Please enter exe file path:
set /p filePath=
echo File: %filePath%
for %%i in ("%filePath%") do (
  set "fileName=%%~ni"
)
echo File: %fileName%

cd /d %~dp0
echo Current directory: %cd%

instsrv %fileName% %filePath%

pause