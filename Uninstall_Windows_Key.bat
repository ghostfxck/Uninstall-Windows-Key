@echo off
title Uninstall Windows key
color 0A
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    pause
) else (
    echo Failure: Please rerun this batch file as administrator.
    pause
    exit
)
:key
cls
set /P c="Are you sure you want to uninstall your Windows key? [Y/N] > "
if /I "%c%" EQU "Y" (
    slmgr /upk
    slmgr /cpky
    slmgr /rearm
    exit
) else (
    if /I "%c%" EQU "N" (
        echo Press any key to exit...
        pause > nul
        exit
    ) else (
        cls
        echo Invalid argument
        pause
        goto :key
    )
)