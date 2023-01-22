@echo off
set file_path=%0
set file_name=%~nx0
copy %file_path% "./img/%file_name%"
cd "E:\AppData\Roaming\GitHub\smos"
git status
git add .
git commit -m "%file_name%"
git push
pause