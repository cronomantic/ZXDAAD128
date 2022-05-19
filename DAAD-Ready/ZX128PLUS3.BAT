@echo off

REM ----  VARIABLES ---- 
CALL CONFIG.BAT
IF exist CUSTOM.BAT CALL CUSTOM.BAT

REM ----  CHECK IF LANG IS SET ---- 
IF  NOT DEFINED LANG (
        ECHO.
        ECHO.
        setlocal EnableDelayedExpansion
        CHOICE /C ESGPF /N /M "--- Please select (E)nglish, (S)panish, (G)erman, (F)rench or (P)ortuguese"
        SET LANG=EN
        SET BASELANG=EN
        IF ERRORLEVEL 2 (
            SET LANG=ES
            SET BASELANG=ES
        )
        IF ERRORLEVEL 3 (
            SET LANG=DE
            SET BASELANG=EN
        )
       IF ERRORLEVEL 4 (
            SET LANG=PT
            SET BASELANG=ES
        )
        IF ERRORLEVEL 5 (
            SET LANG=FR
            SET BASELANG=EN
        )
   
        ECHO SET LANG=!LANG!>>CONFIG.BAT
        ECHO SET BASELANG=!BASELANG!>>CONFIG.BAT
    )
echo Language: %LANG% %BASELANG%

REM ----  SET CHARACTERS PER LINE ---- 
IF  NOT DEFINED CHARSLINE (
        SET CHARSLINE=42
)
echo Characters per line: %CHARSLINE%

IF NOT exist %GAME%.DSF COPY TOOLS\DRC\BLANK_%LANG%.DSF %GAME%.DSF

REM ---- GET RESOURCES ---- 
tools\cecho\cecho {0B}----------------------------------------------------------------------{07}
echo.

REM  ---- PREPARE IMAGES ----
tools\cecho\cecho {06}Preparing images (if any){07}
ECHO.
CD IMAGES
for /L %%i in (0, 1, 9) do (CALL :CHECK_IF_COMPRESS 00%%i.SCR 00%%i.DCP && (..\TOOLS\ZXDAAD128\DCP -f 00%%i.SCR 00%%i.DCP > nul 2>&1))
for /L %%i in (10, 1, 99) do (CALL :CHECK_IF_COMPRESS 0%%i.SCR 0%%i.DCP && (..\TOOLS\ZXDAAD128\DCP -f 0%%i.SCR 0%%i.DCP > nul 2>&1))
for /L %%i in (100, 1, 256) do (CALL :CHECK_IF_COMPRESS %%i.SCR %%i.DCP && (..\TOOLS\ZXDAAD128\DCP -f %%i.SCR %%i.DCP > nul 2>&1))
CD ..
tools\cecho\cecho {02}[OK]{07}
ECHO.

tools\cecho\cecho {0B}----------------------------------------------------------------------{07}
echo.
tools\cecho\cecho {06}Compiling [Frontend]{07}
echo.
TOOLS\DRC\DRF zx esxdos %GAME%.DSF zx128
IF ERRORLEVEL 1 GOTO ERROR
tools\cecho\cecho {02}[OK]{07}
ECHO.
tools\cecho\cecho {0B}----------------------------------------------------------------------{07}
echo.
tools\cecho\cecho {06}Compiling [Backend]{07}
echo.
PHP\PHP TOOLS\ZXDAAD128\DRB128.PHP -o %GAME% PLUS3 %LANG% %BASELANG% %CHARSLINE% %GAME%.json ASSETS\CHARSET\%FONT6%
IF ERRORLEVEL 1 GOTO ERROR
tools\cecho\cecho {02}[OK]{07}
ECHO.
tools\cecho\cecho {0B}----------------------------------------------------------------------{07}
echo.

REM --- PREPARE DISK FILE ----
tools\cecho\cecho {06}Preparing release files{07}
ECHO.
SET BANKFILES= 
IF exist %GAME%.AD0 SET BANKFILES=%BANKFILES% %GAME%.AD0
IF exist %GAME%.AD1 SET BANKFILES=%BANKFILES% %GAME%.AD1
IF exist %GAME%.AD3 SET BANKFILES=%BANKFILES% %GAME%.AD3
IF exist %GAME%.AD4 SET BANKFILES=%BANKFILES% %GAME%.AD4
IF exist %GAME%.AD6 SET BANKFILES=%BANKFILES% %GAME%.AD6
IF exist %GAME%.AD7 SET BANKFILES=%BANKFILES% %GAME%.AD7
SET LOADING_SCREEN=
if exist IMAGES\DAAD.SCR SET LOADING_SCREEN=-s IMAGES\DAAD.SCR
PHP\PHP TOOLS\ZXDAAD128\DAADMAKERPLUS3.PHP %LOADING_SCREEN% %BANKFILES%
IF ERRORLEVEL 1 GOTO ERROR
IF exist %GAME%.DSK DEL %GAME%.DSK
TOOLS\CPCDiskXP\CPCDiskXP -File disk -NewDskFormat 1 -AddToNewDsk %GAME%.DSK > nul 2>&1
TOOLS\CPCDiskXP\CPCDiskXP -File daad.bin -AddToExistingDsk %GAME%.DSK > nul 2>&1
for /L %%i in (0, 1, 9) do IF exist IMAGES\00%%i.DCP TOOLS\CPCDiskXP\CPCDiskXP -File IMAGES\00%%i.DCP -AddToExistingDsk %GAME%.DSK
for /L %%i in (10, 1, 99) do IF exist IMAGES\0%%i.DCP TOOLS\CPCDiskXP\CPCDiskXP -File IMAGES\0%%i.DCP -AddToExistingDsk %GAME%.DSK
for /L %%i in (100, 1, 255) do IF exist IMAGES\%%i.DCP TOOLS\CPCDiskXP\CPCDiskXP -File IMAGES\%%i.DCP -AddToExistingDsk %GAME%.DSK
MOVE %GAME%.DSK RELEASE\ZX128PLUS3 > nul 2>&1
tools\cecho\cecho {02}[OK]{07}
ECHO.

REM ----  CLEANING ---- 
DEL %GAME%.AD? > nul 2>&1
DEL %GAME%.json > nul 2>&1
DEL disk > nul 2>&1
DEL daad.bin > nul 2>&1

REM ---- TESTER ---- 
tools\cecho\cecho {03}
ECHO "Press any key to run emulator, or Ctrl+C to cancel." 
ECHO "To exit ZEsarUX emulator, press F5, then F10." 
tools\cecho\cecho {07}


PAUSE
cd TOOLS\ZESARUX
zesarux --noconfigfile --quickexit --zoom 2 --machine P341 --realvideo --nosplash --forcevisiblehotkeys --forceconfirmyes  --nowelcomemessage  --cpuspeed 100 "..\..\RELEASE\ZX128PLUS3\%GAME%.DSK"
CD ..\..
GOTO END

REM ---- Check if the file to compress is already compressed or is newer
:CHECK_IF_COMPRESS
  IF not exist %1 exit /b 1
  IF not exist %2 exit /b 0
  FOR %%i IN (%1) DO SET DATE1=%%~ti
  FOR %%i IN (%2) DO SET DATE2=%%~ti
  IF "%DATE1%"=="%DATE2%" exit /b 0
  FOR /F %%i IN ('DIR /B /O:D %1 %2') DO SET NEWEST=%%i
  IF "%2"=="%NEWEST%" exit /b 1
  exit /b 0

:ERROR
:ERROR
tools\cecho\cecho {04}
ECHO "Compile error, please check"
tools\cecho\cecho {07}
PAUSE
:END

REM ----  CLEANING ---- 
DEL %GAME%.AD? > nul 2>&1
DEL %GAME%.json > nul 2>&1
DEL disk > nul 2>&1
DEL daad.bin > nul 2>&1
