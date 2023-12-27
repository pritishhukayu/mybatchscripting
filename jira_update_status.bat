@echo off

REM Set your JIRA details
@REM set JIRA_USERNAME=prithishspinox@gmail.com

REM Here in JIRA_API_TOKEN you need to convert "your_jira_email:API_TOKEN" (dnt include "") into Base 64 .
REM like mine pritishspinox@gmail.com:ATATT3xFfGF0Q8uOe_hp3rZ_tQR_8XO7ruHCpDwZqqT4Alp4VmRm6A2CCB9dNg9-h_3_6HGvpIuMzogT1SN3PQkNsivddx0RXr495CcY6w1SsI8Rbsr957II94eBMSzXq3CjSCxgzq32idZW0dE9A23TED--KQWhRXj-TLE8xZ5t_odGS9i4pxE=261BF7BD

set JIRA_API_TOKEN=cHJpdGlzaHNwaW5veEBnbWFpbC5jb206QVRBVFQzeEZmR0YwUTh1T2VfaHAzclpfdFFSXzhYTzdydUhDcER3WnFxVDRBbHA0Vm1SbTZBMkNDQjlkTmc5LWhfM182SEd2cEl1TXpvZ1QxU04zUFFrTnNpdmRkeDBSWHI0OTVDY1k2dzFTc0k4UmJzcjk1N0lJOTRlQk1TelhxM0NqU0N4Z3pxMzJpZFpXMGRFOUEyM1RFRC0tS1FXaFJYai1UTEU4eFo1dF9vZEdTOWk0cHhFPTI2MUJGN0JE
set JIRA_BASE_URL=https://pritishhukayu.atlassian.net/rest/api/2/issue


REM Set the JIRA issue key and the new status transition ID
set ISSUE_KEY=DEMO-1
set TRANSITION_ID=41
REM Replace TRANSITION_ID with the desired transition ID for the new status

REM Build the JSON payload for the status update
set PAYLOAD={ "transition": { "id": "%TRANSITION_ID%" } }

REM Update the issue status using cURL
echo %PAYLOAD% > payload.json
curl --location "%JIRA_BASE_URL%/%ISSUE_KEY%/transitions" ^
--header "Accept: application/json" ^
--header "Content-Type: application/json" ^
--header "Authorization: Basic %JIRA_API_TOKEN%" ^
--data @payload.json
