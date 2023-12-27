@echo off

REM Set variables
set GITHUB_USERNAME=pritishhukayu
set GITHUB_REPO=Test1
set BASE_BRANCH=main
set BRANCH_TO_MERGE=batch4
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

REM Check if the base branch exists
curl -s -o nul -w "%%{http_code}" -X GET -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/%BASE_BRANCH%" > base_branch_response.txt

REM Read the HTTP status code for base branch existence
set /p BASE_BRANCH_STATUS=<base_branch_response.txt

REM Check the HTTP status code for base branch existence
if %BASE_BRANCH_STATUS% neq 200 (
    echo Error: Base branch %BASE_BRANCH% does not exist.
    exit /b 1
)

REM Check if the branch to merge exists
curl -s -o nul -w "%%{http_code}" -X GET -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/%BRANCH_TO_MERGE%" > branch_to_merge_response.txt

REM Read the HTTP status code for branch to merge existence
set /p BRANCH_TO_MERGE_STATUS=<branch_to_merge_response.txt

REM Check the HTTP status code for branch to merge existence
if %BRANCH_TO_MERGE_STATUS% neq 200 (
    echo Error: Branch %BRANCH_TO_MERGE% does not exist.
    exit /b 1
)

REM Get the base branch SHA
for /f "tokens=*" %%a in ('curl -s -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/%BASE_BRANCH%" ^| findstr /C:"\"sha\""' ) do (
    set "BASE_BRANCH_SHA=%%a"
)

REM Get the branch to merge SHA
for /f "tokens=*" %%b in ('curl -s -H "Authorization: token %ACCESS_TOKEN%" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/git/refs/heads/%BRANCH_TO_MERGE%" ^| findstr /C:"\"sha\""' ) do (
    set "BRANCH_TO_MERGE_SHA=%%b"
)

REM Merge the branches
curl -X POST -H "Authorization: token %ACCESS_TOKEN%" -H "Accept: application/vnd.github.v3+json" -d "{\"base\":\"%BASE_BRANCH%\",\"head\":\"%BRANCH_TO_MERGE%\",\"commit_message\":\"Merging %BRANCH_TO_MERGE% into %BASE_BRANCH%\"}" "https://api.github.com/repos/%GITHUB_USERNAME%/%GITHUB_REPO%/merges" > merge_response.txt

REM Check if merge was successful
findstr /C:"\"sha\"" merge_response.txt > nul
if %errorlevel% neq 0 (
    echo Error: Failed to merge %BRANCH_TO_MERGE% into %BASE_BRANCH%.
    exit /b 1
)

echo Branch %BRANCH_TO_MERGE% has been merged into %BASE_BRANCH% successfully.
exit /b 0
