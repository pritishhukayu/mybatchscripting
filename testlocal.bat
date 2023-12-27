@echo OFF
SET globalvar=5
SETLOCAL
set var=13145
set /a var=%var% + 5
echo %var%
echo %globalvar%
endlocal
echo %var%
rem here in syntax used above nothing will be displayed so it will say "Echo OFF"
