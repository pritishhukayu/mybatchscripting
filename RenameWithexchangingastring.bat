@echo off
setlocal enabledelayedexpansion

set "folderPath=C:\Users\Pritish Behera\OneDrive - Cubastion Consulting Pvt Ltd\Desktop\Batch Scripting\Testfolder"  
REM Replace this with your folder path

set "searchString=01"          
REM Specify the substring to be replaced

set "replaceString=013"         
REM Specify the new substring

for %%F in ("%folderPath%\*%searchString%*") do (
    set "filename=%%~nF"
    set "extension=%%~xF"
    set "newname=!filename:%searchString%=%replaceString%!!extension!"
    ren "%%F" "!newname!"
    echo Renamed: %%F to !newname!
)

echo Renaming complete!
endlocal


::===================================================
REM Once verify with folder in your system what name it showing :)
REM for example : here in Test Folder it showing format .txt but in system folder its not showing so while we try to
REM rename .txt file its not working :)
::===================================================