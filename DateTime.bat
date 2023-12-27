@echo off
echo %DATE%
echo %time%


::Changing format of date in different way
::changing date into YY-MM-DD

@echo off
REM Get the current date in YY-MM-DD format
for /F "tokens=2 delims==." %%G in ('wmic os get localdatetime /value') do set "dt=%%G"
set "YY=%dt:~2,2%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
echo Current date in YY-MM-DD format: %YY%-%MM%-%DD%
