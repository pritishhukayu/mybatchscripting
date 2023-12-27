@echo off
setlocal enabledelayedexpansion

set source_branch=main
set destination_branch=testbranch
set JQPath=C:\Users\Administrator\Documents\Code\JQ

REM Make the API request and capture the response
set "response="
for /f "delims=" %%A in ('curl --location --request POST "https://api.bitbucket.org/2.0/repositories/pritishhukayu/testrepo/pullrequests" --header "Content-Type: application/json" --header "Authorization: Bearer ATBBXQTjWh8veL2VYSu66rDM9CUC0AFFCC57" --data-raw "{\"title\": \"Jenkins_automation\",\"source\": {\"branch\": {\"name\": \"%source_branch%\"}},\"destination\": {\"branch\": {\"name\": \"%destination_branch%\"}}}"') do (
  set "response=!response!%%A"
)

REM Extract the pull request ID using jq
cd %JQPath%
set "pull_request_id="
for /f "delims=" %%B in ('echo !response! ^| jq -r ".id"') do (
  set "pull_request_id=%%B"
)

REM Print the pull request ID
if "%pull_request_id%" == "" (
  echo Pull request ID not found.
  exit /b 1
) else (
  echo Pull Request ID: %pull_request_id%

  REM JSON payload for the merge request
  set "merge_payload={\"type\": \"pullrequest\", \"message\": \"merge test\", \"close_source_branch\": false, \"merge_strategy\": \"merge_commit\"}"

  REM Merge the pull request using the pull request ID and the merge request JSON payload
  curl --location --request POST "https://api.bitbucket.org/2.0/repositories/test/test23050019/pullrequests/%pull_request_id%/merge" --header "Content-Type: application/json" --header "Authorization: Bearer ATBBXQTjWh8veL2VYSu66rDM9CUC0AFFCC57" --data-raw "!merge_payload!" >nul 2>nul

  REM Check the exit code of the curl command to determine if the merge was successful
  if %ERRORLEVEL% equ 0 (
    echo Pull request merged successfully.
    exit /b 0
  ) else (
    echo Error: Failed to merge the pull request.
    exit /b 1
  )
)
