@echo off
set file_name=%~nx0
git status
git add .
git commit -m "%file_name%"
git push
pause