@echo off
setlocal enabledelayedexpansion

REM Step 1: Get the current date and time in a format compatible with file names
for /f "tokens=2 delims==." %%G in ('wmic os get localdatetime /value') do set "dt=%%G"
set "YY=%dt:~2,2%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"

REM Step 2: Find files modified in the last 24 hours and add them to a temporary directory
mkdir TempBackupFolder 2>nul
forfiles /D -1 /C "cmd /c if @isdir==FALSE copy @path TempBackupFolder"

REM Step 3: Create a zip file using 7-Zip command line tool (7z.exe)
"C:\Program Files" a -tzip Backup_%YY%-%MM%-%DD%_%HH%-%Min%.zip TempBackupFolder\*

REM Step 4: Move the zip file to a backup folder
mkdir BackupFolder 2>nul
move Backup_%YY%-%MM%-%DD%_%HH%-%Min%.zip BackupFolder

REM Cleanup: Delete the temporary folder
rd /s /q TempBackupFolder

echo Backup and archiving completed!
pause