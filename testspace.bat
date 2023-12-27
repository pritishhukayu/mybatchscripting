@echo OFF
SET /A a=5
REM if here we write SET a=5 ; then also while calculating c
@REM as we have used /A for c in down so it getting calculated.
SET /A b=10
SET /A c=%a%+%b%
echo %c%
SET /A c=%a%-%b%
echo %c%