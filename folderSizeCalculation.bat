@echo off
setlocal enabledelayedexpansion
REM Setting folder Path
set "folderPath=C:\Users\Pritish Behera\OneDrive - Cubastion Consulting Pvt Ltd\Desktop\Batch Scripting"  
set "totalSize=0"

for /r "%folderPath%" %%i in (*) do (
    set "file=%%i"
    for %%A in ("!file!") do (
        set /a "size=%%~zA"
        set /a "totalSize+=size"
    )
)

REM Convert bytes to KB, MB, GB for better readability
set /a "totalSizeKB=totalSize / 1024"
set /a "totalSizeMB=totalSizeKB / 1024"
set /a "totalSizeGB=totalSizeMB / 1024"

echo Total size of folder: %folderPath%
echo Total Size: %totalSize% bytes
echo Total Size: %totalSizeKB% KB
echo Total Size: %totalSizeMB% MB
echo Total Size: %totalSizeGB% GB

endlocal