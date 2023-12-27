@echo off

REM Bitbucket Credentials and Repository Information
set BITBUCKET_USERNAME=pritishhukayu
set BITBUCKET_PASSWORD=ATBBXQTjWh8veL2VYSu66rDM9CUC0AFFCC57
set WORKSPACE=test
set REPO=testrepo
set REPO_SLUG=test23050019   
::WORKSPACE ID
set BRANCH_NAME=testbranch5

REM Bitbucket API URL for creating a branch
set BITBUCKET_API_URL=https://api.bitbucket.org/2.0/repositories/test23050019/testrepo/refs/branches


REM JSON payload for creating a new branch
set JSON_PAYLOAD={"name": "%BRANCH_NAME%", "target": {"hash": "main"}}

REM set JSON_PAYLOAD={"name": "%BRANCH_NAME%", "target": {"hash": "master"}}

REM Temporary JSON file to store the payload
echo %JSON_PAYLOAD% > payload.json

REM Using curl to create a new branch
curl -X POST -u %BITBUCKET_USERNAME%:%BITBUCKET_PASSWORD% -H "Content-Type: application/json" -d @payload.json %BITBUCKET_API_URL% -i -v -o response.txt

REM Display response received from Bitbucket API
type response.txt

REM Check for response status and handle accordingly
if %ERRORLEVEL% NEQ 0 (
    echo Failed to create branch.
) else (
    echo Branch "%BRANCH_NAME%" created successfully.
)

REM Delete temporary payload and response files
del payload.json
del response.txt