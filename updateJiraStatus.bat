@echo off

REM Set your JIRA details
set JIRA_API_TOKEN=cHJpdGlzaHNwaW5veEBnbWFpbC5jb206QVRBVFQzeEZmR0YwUTh1T2VfaHAzclpfdFFSXzhYTzdydUhDcER3WnFxVDRBbHA0Vm1SbTZBMkNDQjlkTmc5LWhfM182SEd2cEl1TXpvZ1QxU04zUFFrTnNpdmRkeDBSWHI0OTVDY1k2dzFTc0k4UmJzcjk1N0lJOTRlQk1TelhxM0NqU0N4Z3pxMzJpZFpXMGRFOUEyM1RFRC0tS1FXaFJYai1UTEU4eFo1dF9vZEdTOWk0cHhFPTI2MUJGN0JE
set JIRA_BASE_URL=https://pritishhukayu.atlassian.net/rest/api/2/issue

REM Set the JIRA issue key and the new status transition ID
set ISSUE_KEY=DEMO-1
set TRANSITION_ID=61
REM Replace TRANSITION_ID with the desired transition ID for the new status

REM Set the comment to be added
set COMMENT_TEXT=Status changed to  -- Done .
REM Replace with the desired comment text

REM Build the JSON payload for the status update including the comment
echo { "update": { "comment": [ { "add": { "body": "%COMMENT_TEXT%" } } ] }, "transition": { "id": "%TRANSITION_ID%" } } > payload.json

REM Update the issue status and add a comment using cURL
curl --location "%JIRA_BASE_URL%/%ISSUE_KEY%/transitions" ^
--header "Accept: application/json" ^
--header "Content-Type: application/json" ^
--header "Authorization: Basic %JIRA_API_TOKEN%" ^
--data @payload.json
