@echo off  

REM Bitbucket Credentials and Repository Information
set BITBUCKET_USERNAME=pritishhukayu
set BITBUCKET_PASSWORD=ATBBXQTjWh8veL2VYSu66rDM9CUC0AFFCC57
set WORKSPACE=test
set REPO=testrepo
set REPO_SLUG=test23050019
set BRANCH_TO_MERGE=testbranch5

REM Bitbucket API URL for merging a branch into main
set BITBUCKET_API_URL=https://api.bitbucket.org/2.0/repositories/test23050019/testrepo/pullrequests

REM JSON payload for creating a pull request to merge branch into main
set JSON_PAYLOAD={"title": "Merge %BRANCH_TO_MERGE% into main","source": {"branch": {"name": "%BRANCH_TO_MERGE%"}}, "destination": {"branch": {"name": "main"}}}

REM Temporary JSON file to store the payload
echo %JSON_PAYLOAD% > pull_request_payload.json

REM Using curl to create a pull request to merge the branch into main
curl -X POST -u %BITBUCKET_USERNAME%:%BITBUCKET_PASSWORD% -H "Content-Type: application/json" -d @pull_request_payload.json %BITBUCKET_API_URL% -i -v -o pull_request_response.txt

REM Display response received from Bitbucket API
type pull_request_response.txt

REM Check for response status and handle accordingly
if %ERRORLEVEL% NEQ 0 (
    echo Failed to create pull request to merge the branch into main.
) else (
    echo Pull request to merge branch "%BRANCH_TO_MERGE%" into main created successfully.
)

REM Delete temporary payload and response files
del pull_request_payload.json
del pull_request_response.txt
