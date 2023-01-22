@echo off
set file_path=%1
set file_name=%~nx1
xcopy "%file_path%" "%~dp0\img\" /s /c /d /y
cd "%~dp0"
git status
git add .
git commit -m "%file_name%"
git push
echo http://cdn.jsdelivr.net/gh/SMWHff/SMOS@master/Img/%file_name% | clip
pause