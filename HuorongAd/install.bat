@ECHO OFF & CD /D %~DP0 & TITLE �̻�
>NUL 2>&1 reg.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)
title ���޵��������̻�
color 2F
echo ����д�����������Ϣ...
xcopy "%~dp0data"  C:\ProgramData\Huorong\sysdiag\ /S /Y 1>nul
if exist "%~dp0data_bak\popblkuser.db" goto tip
goto setdata

:tip
echo.&&set /p cpbak=���ֱ��ݵĸ�����Ϣ���Ƿ�ԭ������Y��ԭ��
if /I "%cpbak%"=="Y" goto bak
goto setdata

:bak
xcopy "%~dp0data_bak"  C:\ProgramData\Huorong\sysdiag\ /S /Y 1>nul
goto setdata

:setdata
reg add HKLM\SOFTWARE\Huorong\Sysdiag\app /f /v DataPath /t reg_sz /d C:\ProgramData\Huorong\sysdiag
echo.&&echo �̻���ϣ�������������������ء�
echo.&&pause
start "" "%~dp0��������.exe"

