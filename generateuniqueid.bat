@echo off
setlocal enabledelayedexpansion

set "csvFile=data.csv"
set "newData=New data to insert"

REM Check if the CSV file exists
if not exist "%csvFile%" (
    echo "Row ID", "Data" > "%csvFile%"
)

REM Generate a Row ID in the format "ABCD1-EF"
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "rowID="

REM Generate the first four characters (letters)
for /l %%a in (1,1,4) do (
    set /a "randNum=!random! %% 26"
    for %%b in (!randNum!) do set "char=!characters:~%%b,1!"
    set "rowID=!rowID!!char!"
)

REM Append the hyphen
set "rowID=!rowID!-"

REM Append the number part (1 random number)
set /a "randNum=!random! %% 10"
set "rowID=!rowID!!randNum!"

REM Append the last two characters (letters)
for /l %%a in (1,1,2) do (
    set /a "randNum=!random! %% 26"
    for %%b in (!randNum!) do set "char=!characters:~%%b,1!"
    set "rowID=!rowID!!char!"
)

REM Insert the new data with the generated Row ID into the CSV file
echo "%rowID%", "%newData%" >> "%csvFile%"

echo Data inserted with Row ID: %rowID%
