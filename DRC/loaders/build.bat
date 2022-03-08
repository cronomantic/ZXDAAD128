@echo off
title Build
set InitialPath=%PATH%
PATH = %~dp0\..\..\zxbasic;%~dp0\..\..\zxbasic\python;%~dp0\..\..\usr\local\wbin;%~dp0\..\..\tap_tools\bin\Release;%~dp0\..\..\bin;%~dp0\..\..\deps\ZX0\win;%~dp0\..\..\deps\RCS\win;%~dp0\..\..\PHP;%~dp0\..\..\FPC\3.2.2\bin\i386-win32;%PATH%

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