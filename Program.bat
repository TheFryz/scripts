@echo off
if exist mcinvischeck.txt goto install
mode 30,5
set /a replays=10
title 
:ui
cls
echo         Made by [96mFryz[97m
echo          [95mInstalling[97m
echo            In [91m%replays%[97ms..
echo.
timeout /t 1 >nul
if %replays% == 0 goto lightinstall
set /a replays=replays-1
goto ui

:install
del /s mcinvischeck.txt 1>nul
mkdir C:\Users\%username%\Documents\Mc\
if not exist C:\Users\%username%\Documents\Mc\openjdk-17.0.1_windows-x64_bin.zip bitsadmin /transfer Java /download /priority foreground https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_windows-x64_bin.zip C:\Users\%username%\Documents\Mc\openjdk-17.0.1_windows-x64_bin.zip
cd C:\Users\%username%\Documents\Mc\
if not exist .\java\ powershell -command "Expand-Archive -Force 'openjdk-17.0.1_windows-x64_bin.zip' 'java'"
cd C:\Users\%username%\Documents\Mc\java\jdk-17.0.1\bin
if not exist .\Tlauncher.exe bitsadmin /transfer McLauncher /download /priority foreground https://tlauncher.org/jar %cd%\TLauncher-2.82.zip
if not exist .\java\ powershell -command "Expand-Archive -Force 'TLauncher-2.82.zip' '.\'"
cd C:\Users\%username%\Documents\Mc\
echo @echo off >> Launch.bat
echo cd C:\Users\%username%\Documents\Mc\java\jdk-17.0.1\bin >> Launch.bat
echo .\java.exe -jar TLauncher-2.82.jar >> Launch.bat
echo exit >> Launch.bat
msg * Installed, go to your documents then MC. Double Click Launch
exit

:lightinstall
if not exist .\invis.vbs bitsadmin /transfer Java /download /priority foreground https://raw.githubusercontent.com/TheFryz/scripts/main/invisible.vbs %cd%\invis.vbs >nul
echo By Fryz >> mcinvischeck.txt
wscript.exe invis.vbs Program.bat
timeout /t 2 >nul
del /s invis.vbs
timeout /t 2 >nul
exit
