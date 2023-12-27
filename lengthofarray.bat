@REM The length of an array is done by iterating over the list of values in the array 
@REM since there is no direct function to determine the number of elements in an array.

@echo off
set arr[0]=1
set arr[1]=2
set arr[2]=3
set arr[3]=4

set x=0

:Continue

if  defined arr[%x%] (
    set /a x+=1 

    GOTO :Continue
)

echo The length of the array is %x%

