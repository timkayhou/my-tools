@echo off
set /p task_name="Enter SCHEDULER_NAME: "
schtasks /Delete /F /TN %task_name%
echo Uninstall done!
pause