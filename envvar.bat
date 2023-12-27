@echo off
echo Displaying System Environment Variables:
echo -------------------------------------
echo User Name: %USERNAME%
echo User Profile: %USERPROFILE%
echo Temporary Directory: %TEMP%
echo Path: %PATH%
echo Home Drive: %HOMEDRIVE%
echo -------------------------------------
echo.

REM Custom Environment Variable
echo Creating and Using Custom Environment Variable:
set MY_VARIABLE=HelloWorld
echo Custom Variable Value: %MY_VARIABLE%
echo.

REM Using Environment Variable in a Command
echo Using Environment Variable in a Command:
echo The current directory is: %CD%
echo Listing files in the current directory:
dir %CD%
echo.
