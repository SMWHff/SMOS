@echo on
set file_path=%1
set file_name=%~nx1
set suffix=%~x1

REM 计算MD5值
certutil -hashfile %file_path% md5|findstr /v CertUtil|findstr /v MD5 >>md5.tmp
set /p hash=<md5.tmp
set hash=%hash: =%
del md5.tmp

REM 复制文件
echo f|xcopy "%file_path%" "%~dp0img\%hash%%suffix%" /s /c /d /y

REM GIT上传
cd "%~dp0"
git status
git add .
git commit -m "上传图片 %file_name%"
git push

REM 设置剪切板
set URL=http://cdn.jsdelivr.net/gh/SMWHff/SMOS@master/Img/%file_name%
echo|set/p=%URL%|clip
echo.
echo.
echo 【图片外链】：
echo %URL%
echo.
echo.
pause
