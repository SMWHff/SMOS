@echo on
set file_path=%1
set file_name=%~nx1
set suffix=%~x1

REM ����MD5ֵ
certutil -hashfile %file_path% md5|findstr /v CertUtil|findstr /v MD5 >>md5.tmp
set /p hash=<md5.tmp
set hash=%hash: =%
del md5.tmp

REM �����ļ�
echo f|xcopy "%file_path%" "%~dp0img\%hash%%suffix%" /s /c /d /y

REM GIT�ϴ�
cd "%~dp0"
git status
git add .
git commit -m "�ϴ�ͼƬ %file_name%"
git push

REM ���ü��а�
set URL=http://cdn.jsdelivr.net/gh/SMWHff/SMOS@master/Img/%file_name%
echo|set/p=%URL%|clip
echo.
echo.
echo ��ͼƬ��������
echo %URL%
echo.
echo.
pause
