@echo off
title Build Test
set InitialPath=%PATH%
rem make sure you have zxbasic on the PATH variable.
rem or uncomment the line below and set the correct path to your Boriel's ZXBasic instalation
rem PATH = %~dp0\..\zxbasic;%PATH%
color 0B
echo --------------------------------

zxbc -o %~dp0\..\bin\ZXD128_EN.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_EN ZXDAAD128.bas  || goto :error
zxbc -o %~dp0\..\bin\ZXD128_ES.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_ES ZXDAAD128.bas  || goto :error
zxbc -o %~dp0\..\bin\ZXD128_ESXDOS_EN.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_EN -D ESXDOS ZXDAAD128.bas  || goto :error
zxbc -o %~dp0\..\bin\ZXD128_ESXDOS_ES.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_ES -D ESXDOS ZXDAAD128.bas  || goto :error
zxbc -o %~dp0\..\bin\ZXD128_PLUS3_EN.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_EN -D PLUS3 ZXDAAD128.bas  || goto :error
zxbc -o %~dp0\..\bin\ZXD128_PLUS3_ES.ZDI --optimize 4 --org 0x6002  -H 3072 --explicit --strict -D LANG_ES -D PLUS3 ZXDAAD128.bas  || goto :error

echo --------------------------------
echo Hecho
PATH=%InitialPath%
set InitialPath=
goto :EOF
echo Hecho


:error
echo --------------------------------
color 0C
PATH=%InitialPath%
set InitialPath=
echo Fallo con error #%errorlevel%.
pause
exit /b %errorlevel%