@echo off
title Build Test
set InitialPath=%PATH%
PATH = %~dp0\..\zxbasic;%PATH%
color 0B
echo --------------------------------

zxbc -o ..\bin\ZXD128_TAPE_EN_C42.ZDI --mmap ZXD128_TAPE_EN_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_TAPE_ES_C42.ZDI --mmap ZXD128_TAPE_ES_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_ESXDOS_EN_C42.ZDI --mmap ZXD128_ESXDOS_EN_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D ESXDOS -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_ESXDOS_ES_C42.ZDI --mmap ZXD128_ESXDOS_ES_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D ESXDOS -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_PLUS3_EN_C42.ZDI --mmap ZXD128_PLUS3_EN_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_PLUS3_ES_C42.ZDI --mmap ZXD128_PLUS3_ES_C42.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_TAPE_EN_C32.ZDI --mmap ZXD128_TAPE_EN_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D FONT32 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_TAPE_ES_C32.ZDI --mmap ZXD128_TAPE_ES_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D FONT32 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_ESXDOS_EN_C32.ZDI --mmap ZXD128_ESXDOS_EN_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D ESXDOS -D FONT32 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_ESXDOS_ES_C32.ZDI --mmap ZXD128_ESXDOS_ES_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D ESXDOS -D FONT32 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_PLUS3_EN_C32.ZDI --mmap ZXD128_PLUS3_EN_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error
zxbc -o ..\bin\ZXD128_PLUS3_ES_C32.ZDI --mmap ZXD128_PLUS3_ES_C32.map --optimize 4 --org 0x6002  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error

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