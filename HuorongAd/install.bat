@ECHO OFF & CD /D %~DP0 & TITLE 绿化
>NUL 2>&1 reg.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)
title 火绒弹窗拦截绿化
color 2F
echo 正在写入软件配置信息...
xcopy "%~dp0data"  C:\ProgramData\Huorong\sysdiag\ /S /Y 1>nul
if exist "%~dp0data_bak\popblkuser.db" goto tip
goto setdata

:tip
echo.&&set /p cpbak=发现备份的个人信息，是否还原？输入Y还原。
if /I "%cpbak%"=="Y" goto bak
goto setdata

:bak
xcopy "%~dp0data_bak"  C:\ProgramData\Huorong\sysdiag\ /S /Y 1>nul
goto setdata

:setdata
reg add HKLM\SOFTWARE\Huorong\Sysdiag\app /f /v DataPath /t reg_sz /d C:\ProgramData\Huorong\sysdiag
echo.&&echo 绿化完毕，按任意键启动弹窗拦截。
echo.&&pause
start "" "%~dp0弹窗拦截.exe"

