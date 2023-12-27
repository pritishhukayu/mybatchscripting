::===============================================================
:: The below example is used to find computer and logged on users
::
::===============================================================
ECHO OFF 
:: Windows version check 
IF NOT "%OS%"=="Windows_NT" GOTO Syntax 
ECHO.%* | FIND "?" >NUL 
:: Command line parameter check 
@REM IF NOT ERRORLEVEL 1 GOTO Syntax
@REM IF NOT [%2]==[] GOTO Syntax 
@REM :: Keep variable local 
@REM SETLOCAL 
@REM :: Initialize variable 
@REM SET WSS= 
@REM :: Parse command line parameter 
@REM IF NOT [%1]==[] FOR /F "tokens = 1 delims = \ " %%A IN ('ECHO.%~1') DO SET WSS = %%A 
@REM :: Use NET VIEW and NBTSTAT to find computers and logged on users 
@REM FOR /F "tokens = 1 delims = \ " %%a IN ('NET VIEW ^| FIND /I "\\%WSS%"') DO FOR /F 
@REM "tokens = 1 delims = " %%A IN ('NBTSTAT -a %%a ^| FIND /I /V "%%a" ^| FIND 
@REM "<03>"') DO ECHO.%%a %%A 
@REM :: Done 
@REM ENDLOCAL
@REM GOTO:EOF 
@REM :Syntax 
@REM ECHO Display logged on users and their workstations. 
@REM ECHO Usage: ACTUSR [ filter ] 
@REM IF "%OS%"=="Windows_NT" ECHO Where: filter is the first part of the 
@REM computer name^(s^) to be displayed
echo %YY%