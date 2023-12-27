::======================================================
REM Dont Run it it will create an user for the system
 -------------
|             |
|             |
|             |
|             |
|             |
|             |
|             |
|             |ONT    EXECUTE    IT !!!!!!
--------------
::=====================================================


@echo off
echo === User Account Creation ===

REM Prompt for username and password
set /p "username=Enter the username for the new account: "
set /p "password=Enter the password for the new account: "

REM Create the user account with the provided username and password
net user "%username%" "%password%" /add

if %errorlevel% equ 0 (
    echo User account "%username%" created successfully.
) else (
    echo Failed to create user account "%username%".
)

pause