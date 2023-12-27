@echo off 
set list=1 2 3 4 
(for %%a in (%list%) do ( 
   echo %%a 
))

@REM Here "a" is acting as an array variable. This is also an way of implementing an array.
@REM also we can set array like


::========================================================
::set a[0]=1
@echo off
set a[0]=1 
set a[1]=2 
set a[2]=3 
echo The first element of the array is %a[0]% 
echo The second element of the array is %a[1]% 
echo The third element of the array is %a[2]%
::========================================================

@REM Mixing Both for using it in for loop:
::========================================================

@echo off
setlocal enabledelayedexpansion
set topic[0]=comments 
set topic[1]=variables 
set topic[2]=Arrays 
set topic[3]=Decision making 
set topic[4]=Time and date 
set topic[5]=Operators 

for /l %%n in (0,1,5) do (
    echo !topic[%%n]!
)

::=========================================================

