@ECHO OFF & CD /D %~DP0 & TITLE ж��
>NUL 2>&1 reg.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)
taskkill /f /im ��������.exe 2>NUL
reg delete HKLM\SOFTWARE\Huorong /f 2>NUL
schtasks /delete /TN "Huorong PopBlock" /f 2>NUL
if exist C:\ProgramData\Huorong\sysdiag\popblkuser.db goto tip
goto delete

:tip
echo.&&set /p bakdb=�Ƿ񱸷ݵ������ظ�����Ϣ������Y���ݡ�
if /I "%bakdb%"=="Y" goto bak
goto delete

:bak
xcopy C:\ProgramData\Huorong\sysdiag\popblkuser* "%~dp0data_bak\" /S /Y 

:delete
rd /s /q C:\ProgramData\Huorong 2>NUL
echo.&&pause