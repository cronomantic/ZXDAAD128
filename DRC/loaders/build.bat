@echo off
title Build
set InitialPath=%PATH%
PATH = %~dp0\sjasmplus-1.19.0.win;%PATH%

echo --------------------------------
rem python -m compileall %~dp0\zxbasic
rem tup || goto :error

sjasmplus loader.asm --lst=loader.lst || goto :error
sjasmplus loaderplus3.asm --lst=loaderplus3.lst || goto :error

echo --------------------------------
echo Hecho
PATH=%InitialPath%
set InitialPath=
goto :EOF

:error
echo --------------------------------
PATH=%InitialPath%
set InitialPath=
echo Fallo con error #%errorlevel%.
pause
exit /b %errorlevel%