@REM @echo off
@REM set obj[0].Name=Pritish
@REM set obj[0].ID=PT-01
@REM set obj[1].Name=Bhagya
@REM set obj[1].ID=PT-02
@REM set obj[2].Name=Amil
@REM set obj[2].ID=PT-03
@REM for /l %%i in (0,1,2) do (
@REM     call echo Name is %%obj[%%i].Name%%
@REM     call echo ID = %%obj[%%i].ID%%
@REM )

::Call Function is basically used for calling another script inside a script.
::Here call is basically used to call the value outside the loop


::======================================================
::Without call 
@echo off
setlocal enabledelayedexpansion
REM Simulating array-like variables
set obj[0].Name=Pritish
set obj[0].ID=PT-01
set obj[1].Name=Bhagya
set obj[1].ID=PT-02
set obj[2].Name=Amil
set obj[2].ID=PT-03

REM Accessing simulated "array" elements within a loop
for /L %%i in (0,1,2) do (
    echo Name is !obj[%%i].Name!
    echo ID = !obj[%%i].ID!
)

::==========================================================
