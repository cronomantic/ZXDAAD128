@echo off
title Build Test
set InitialPath=%PATH%
PATH = %~dp0\..\sjasmplus;%~dp0\..\zxbasic;%~dp0\..\zxbasic\python;%PATH%
color 0B
echo --------------------------------

set start_addr=0x6002


zxbc -o ZXD128_TAPE_EN_C42.BIN --mmap ZXD128_TAPE_EN_C42.map --optimize 4 --org %start_addr% -H 2048 --explicit --strict -D LANG_EN -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_TAPE_EN_C42.BIN" "ZXD128_TAPE_EN_C42.map"
zxbc -o ZXD128_TAPE_ES_C42.BIN --mmap ZXD128_TAPE_ES_C42.map --optimize 4 --org %start_addr% -H 2048 --explicit --strict -D LANG_ES -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_TAPE_ES_C42.BIN" "ZXD128_TAPE_ES_C42.map"
zxbc -o ZXD128_PLUS3_EN_C42.BIN --mmap ZXD128_PLUS3_EN_C42.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_PLUS3_EN_C42.BIN" "ZXD128_PLUS3_EN_C42.map"
zxbc -o ZXD128_PLUS3_ES_C42.BIN --mmap ZXD128_PLUS3_ES_C42.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT42 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_PLUS3_ES_C42.BIN" "ZXD128_PLUS3_ES_C42.map"
zxbc -o ZXD128_TAPE_EN_C32.BIN --mmap ZXD128_TAPE_EN_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_TAPE_EN_C32.BIN" "ZXD128_TAPE_EN_C32.map"
zxbc -o ZXD128_TAPE_ES_C32.BIN --mmap ZXD128_TAPE_ES_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_TAPE_ES_C32.BIN" "ZXD128_TAPE_ES_C32.map"
zxbc -o ZXD128_PLUS3_EN_C32.BIN --mmap ZXD128_PLUS3_EN_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_EN -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_PLUS3_EN_C32.BIN" "ZXD128_PLUS3_EN_C32.map"
zxbc -o ZXD128_PLUS3_ES_C32.BIN --mmap ZXD128_PLUS3_ES_C32.map --optimize 4 --org %start_addr%  -H 2048 --explicit --strict -D LANG_ES -D PLUS3 -D FONT32 ZXDAAD128.bas  || goto :error
call :create_start_file "ZXD128_PLUS3_ES_C32.BIN" "ZXD128_PLUS3_ES_C32.map"
python build_drb128.py || goto :error
sjasmplus %~dp0\asm\loader.asm --sym=%~dp0\asm\loader.sym  || goto :error
sjasmplus %~dp0\asm\loaderplus3.asm --sym=%~dp0\asm\loaderplus3.sym  || goto :error
python build_DAADMaker128.py || goto :error
python build_DAADMakerPlus3.py || goto :error
COPY /Y %~dp0\drb128.php %~dp0\..\DRC\|| goto :error
COPY /Y %~dp0\DAADMaker128.php %~dp0\..\DRC\|| goto :error
COPY /Y %~dp0\DAADMakerPlus3.php %~dp0\..\DRC\|| goto :error
COPY /Y %~dp0\..\DRC\drb128.php  %~dp0\..\DAAD-Ready\TOOLS\ZXDAAD128  || goto :error
COPY /Y %~dp0\..\DRC\DAADMaker128.php  %~dp0\..\DAAD-Ready\TOOLS\ZXDAAD128  || goto :error
COPY /Y %~dp0\..\DRC\DAADMakerPlus3.php  %~dp0\..\DAAD-Ready\TOOLS\ZXDAAD128  || goto :error
COPY /Y %~dp0\..\DCP\DCP.EXE  %~dp0\..\DAAD-Ready\TOOLS\ZXDAAD128  || goto :error
MOVE /Y ZXD128_*.ASM %~dp0\asm\

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
  set palette_size=16
  set externs_size=(13*2)
  set size=%~z1
  set dest=%~d1%~p1%~n1_LABELS.ASM
  set /a addr="%size% + %start_addr%"
  echo DDB_HEADER EQU %addr% > %dest%
  set /a addr="%addr% + %header_size%"
  echo START_PALETTE EQU %addr% >> %dest%
  set /a addr="%addr% + %palette_size%"
  echo VECT_EXTERN EQU %addr% >> %dest%
  set /a addr+=2
  echo VECT_SFX EQU %addr% >> %dest%
  set /a addr+=2
  echo VECT_INT EQU %addr% >> %dest%
  set /a addr+=2
  for /L %%i in (0, 1, 9) do (call :set_user_vector %%i)
  echo START_DDB EQU %addr% >> %dest%
  for /F "tokens=1* delims=: " %%x in ('type %2') do (CALL :print_address %%y %%x >> %dest%)
  exit /b 0

:print_address
  set _aux=%1
  set _aux=%_aux:.=_%
  echo %_aux% EQU $%2
  exit /b 0

:set_user_vector
  (echo VECT_%1 EQU %addr% >> %dest%) & set /a addr+=2
  exit /b 0
