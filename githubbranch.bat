@echo off
REM Checks repo existance , duplicate branch check and create branch if all validations passed.


set GITHUB_USERNAME=pritishhukayu
set GITHUB_REPO=Test1
set NEW_BRANCH_NAME=batch7
set ACCESS_TOKEN=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

REM Check if the repository exists using curl
curl -s -o nul -w "%%{http_code}" -X GET -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%" > response.txt

REM Read the HTTP status code from the response file
set /p HTTP_STATUS=<response.txt

REM Check the HTTP status code to verify repository existence
if %HTTP_STATUS% neq 200 (
    echo Error: Failed to verify repository existence.
    exit /b 1
)

REM Check if the branch already exists
curl -s -o nul -w "%%{http_code}" -X GET -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/%NEW_BRANCH_NAME%" > response.txt

REM Read the HTTP status code for branch existence
set /p BRANCH_STATUS=<response.txt

REM Check the HTTP status code for branch existence
if %BRANCH_STATUS% equ 200 (
    echo Error: Branch with the name %NEW_BRANCH_NAME% already exists.
    exit /b 1
)

REM Retrieve SHA of the main branch using PowerShell and store it in a temporary file
powershell -command "(Invoke-RestMethod -Uri 'https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/main' -Headers @{Authorization='token %ACCESS_TOKEN%'}).object.sha" > temp_sha.txt

REM Read the SHA from the temporary file
set /p SHA=<temp_sha.txt

REM Check if SHA is retrieved successfully
if not defined SHA (
    echo Error: Failed to retrieve SHA of the main branch.
    exit /b 1
)

REM Check the length of the retrieved SHA
set "SHA_LENGTH=%SHA:~0,40%"

REM Check if the retrieved SHA has at least 40 characters
if "%SHA_LENGTH%" == "" (
    echo Error: The retrieved SHA does not have sufficient characters.
    exit /b 1
)

REM Create the new branch using the retrieved SHA
curl -s -o nul -w "%%{http_code}" -X POST -H "Authorization: token %ACCESS_TOKEN%" -H "Content-Type: application/json" -d "{\"ref\":\"refs/heads/%NEW_BRANCH_NAME%\",\"sha\":\"%SHA%\"}" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs" > response.txt

REM Read the HTTP status code from the response file
set /p HTTP_STATUS=<response.txt

REM Check the HTTP status code for branch creation
if %HTTP_STATUS% neq 201 (
    echo Error: Failed to create the new branch.
    exit /b 1
)

echo Branch %NEW_BRANCH_NAME% created successfully.
exit /b 0
