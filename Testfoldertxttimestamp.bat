@echo off
setlocal enabledelayedexpansion

REM Set the directory path where your .txt files are located
set "folder_path=C:\Users\Pritish Behera\OneDrive - Cubastion Consulting Pvt Ltd\Desktop\Batch Scripting\Testfolder>"

REM Get current date and time in YYYYMMDD_HHMMSS format
for /f "tokens=2 delims==." %%G in ('wmic os get localdatetime /value') do set "dt=%%G"
set "timestamp=!dt:~0,4!!dt:~4,2!!dt:~6,2!_!dt:~8,2!!dt:~10,2!!dt:~12,2!"

REM Change directory to the specified folder
cd /d "%folder_path%" || (
    echo Folder not found!
    exit /b
)

REM Loop through all .txt files in the specified folder
for %%F in (*.txt) do (
    REM Get filename and extension
    set "filename=%%~nF"
    set "extension=%%~xF"

    REM Rename the file by appending timestamp
    ren "%%F" "!filename!_!timestamp!!extension!"
)

endlocal
