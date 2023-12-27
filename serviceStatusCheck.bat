@echo off

REM List of services to check (Add or modify as needed)
set "services=w32time"

echo Checking service statuses...

REM Loop through each service in the list
for %%s in (%services%) do (
    sc query "%%s" | find "STATE" | find "RUNNING" >nul
    if errorlevel 1 (
        echo %%s is Stopped
    ) else (
        echo %%s is Running
    )
)

echo Service status check complete.


::===============================================

REM Services you can check:
@REM wuauserv: Windows Update Service
@REM w32time: Windows Time Service
@REM Spooler: Print Spooler Service
@REM ShellHWDetection: Shell Hardware Detection Service
@REM Dnscache: DNS Client Service
@REM LanmanWorkstation: Workstation Service
@REM wscsvc: Security Center Service
@REM Winmgmt: Windows Management Instrumentation Service
@REM RpcSs: Remote Procedure Call (RPC) Service
@REM BITS: Background Intelligent Transfer Service

::==================================================