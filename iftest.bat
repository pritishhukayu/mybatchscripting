@ECHO OFF
IF EXIST "myfile.txt" (
    ECHO myfile.txt exists
) ELSE (
    ECHO myfile.txt does not exist
)
