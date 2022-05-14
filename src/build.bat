@echo off
title Build Test
set InitialPath=%PATH%
PATH = %~dp0\..\zxbasic;%PATH%
color 0B
echo --------------------------------

set start_addr=0x6002
zxbc -o ..\bin\ZXD128_TAPE_EN_C42.ZDI --mmap ZXD128_TAPE_EN_C42.map --optimize 4 --org %start_addr% -H 2048 --explicit --strict -D LANG_EN -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_TAPE_EN_C42.ZDI"
zxbc -o ..\bin\ZXD128_TAPE_ES_C42.ZDI --mmap ZXD128_TAPE_ES_C42.map --optimize 4 --org %start_addr% -H 2048 --explicit --strict -D LANG_ES -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_TAPE_ES_C42.ZDI"
zxbc -o ..\bin\ZXD128_PLUS3_EN_C42.ZDI --mmap ZXD128_PLUS3_EN_C42.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_PLUS3_EN_C42.ZDI"
zxbc -o ..\bin\ZXD128_PLUS3_ES_C42.ZDI --mmap ZXD128_PLUS3_ES_C42.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_PLUS3_ES_C42.ZDI"
zxbc -o ..\bin\ZXD128_TAPE_EN_C32.ZDI --mmap ZXD128_TAPE_EN_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_TAPE_EN_C32.ZDI"
zxbc -o ..\bin\ZXD128_TAPE_ES_C32.ZDI --mmap ZXD128_TAPE_ES_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_TAPE_ES_C32.ZDI"
zxbc -o ..\bin\ZXD128_PLUS3_EN_C32.ZDI --mmap ZXD128_PLUS3_EN_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_PLUS3_EN_C32.ZDI"
zxbc -o ..\bin\ZXD128_PLUS3_ES_C32.ZDI --mmap ZXD128_PLUS3_ES_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "..\bin\ZXD128_PLUS3_ES_C32.ZDI"

echo --------------------------------
echo Hecho
PATH=%InitialPath%
set InitialPath=
goto :EOF

:error
echo --------------------------------
color 0C
PATH=%InitialPath%
set InitialPath=
echo Fallo con error #%errorlevel%.
pause
exit /b %errorlevel%

:create_start_file
  set header_size=0x3A
  set offset=(13*2) + 16
  set size=%~z1
  set /a addr="%size% + %start_addr% + %offset% + %header_size%"
  set dest=%~d1%~p1%~n1.ASM
  echo START_EXTERN EQU %addr% > %dest%
  set dest=
  set addr=
  set header_size=
  set offset=
  exit /b 0
