#ifndef __ZXBDAAD__
#define __ZXBDAAD__

'
' (C) Cronomantic 2022 - This code is released under the GPL v3 license
'
'  Acknowledgments:
'
'  Inspired by MSX-DAAD by NataliaPC (some code comes from here): https://github.com/nataliapc/msx2daad
'  Utodev & Co. for the necessary info & tools about DAAD: https://github.com/daad-adventure-writer
'  RCS is created by Einar Saukas: https://github.com/einar-saukas/RCS
'  ZX0 is created by Einar Saukas: https://github.com/einar-saukas/ZX0
'  Printing routines by Britlion.
'

#include once <winscroll.bas>
#include once <alloc.bas>
#include once <memcopy.bas>

#pragma push(case_insensitive)
#pragma case_insensitive = TRUE

'---------------------------------------------------------------------
#ifndef FONT32
#ifndef FONT42
#define FONT42
#endif
#endif
'---------------------------------------------------------------------
#ifndef LANG_ES
#ifndef LANG_EN
#define LANG_EN
#endif
#endif
'---------------------------------------------------------------------
CONST ROM48KBASIC AS uByte = %00010000

#ifndef PLUS3
  #ifndef TAPE
    #define TAPE
  #endif
#else
  #include once "plus3dos.bas"
  #define SCR_BUFF_ADDR ($F000-$1B06)
  #define SCR_BUFF_BANK 6
#endif
'---------------------------------------------------------------------
#ifndef SCREEN_WIDTH
  #define SCREEN_WIDTH  256
#endif
#ifndef SCREEN_HEIGHT
  #define SCREEN_HEIGHT 192
#endif
'---------------------------------------------------------------------
#ifndef FONT32
  #define FONTWIDTH 6
#else
  #define FONTWIDTH 8
#endif

#ifndef FONTHEIGHT
  #define FONTHEIGHT 8
#endif

#define MAX_COLUMNS (SCREEN_WIDTH/FONTWIDTH)
#define MAX_LINES   (SCREEN_HEIGHT/FONTHEIGHT)
'---------------------------------------------------------------------
#include once "DaadDefines.bas"
'---------------------------------------------------------------------
#define TRUE  1
#define FALSE 0
#define NULL  0

#ifndef CREATE_ATTRIB
#define CREATE_ATTRIB(ink, paper, bright, flash) (ink + (paper << 3) + (bright << 6) + (flash << 7))
#endif
'---------------------------------------------------------------------

CONST LastKAddress AS uInteger  = 23560
CONST FlagsAddress AS uInteger  = 23611
CONST AttrAddress AS uInteger   = 23693
CONST FramesAddress AS uInteger = 23672
CONST ErrNrAddress AS uInteger  = 23609
CONST CurrBankAddress AS uInteger = $5b5c

DIM LastK AS uByte AT LastKAddress
DIM AttrD AS uByte AT AttrAddress
DIM Frames AS uInteger AT FramesAddress
DIM ErrNr AS uInteger AT ErrNrAddress
DIM currBank AS uByte AT CurrBankAddress


DIM NextCondactPtr AS uInteger AT $6000 'First, pointer to the DDB start
'Later, it will store a pointer to the end of the end of the GetCurrentCondact routine
'We reuse the DDB header as the token buffer (32 bytes) later

'---------------------------------------------------------------------
'COpy of the header... DO NOT MOVE, MODIFY OR ADD ANOTHER VARIABLE----------
DIM DdbVersion    AS uByte     ' 0x00 | 1 byte  | DAAD version number (1 for Aventura Original and Jabato, 1989, 2 for the rest, 3 for ZX128 format)
DIM DdbCtl        AS uByte     ' 0x02 | 1 byte  | Always contains CTL value: 95d (ASCII '_')
DIM DdbNumObjDsc  AS uByte     ' 0x03 | 1 byte  | Number of object descriptions
DIM DdbNumLocDsc  AS uByte     ' 0x04 | 1 byte  | Number of location descriptions
DIM DdbNumUsrMsg  AS uByte     ' 0x05 | 1 byte  | Number of user messages
DIM DdbNumSysMsg  AS uByte     ' 0x06 | 1 byte  | Number of system messages
DIM DdbNumPrc     AS uByte     ' 0x07 | 1 byte  | Number of processes
DIM DdbTokensPos  AS uInteger  ' 0x08 | 2 bytes | Compressed text position
DIM DdbPrcLstPos  AS uInteger  ' 0x0A | 2 bytes | Process list position
DIM DdbObjLstPos  AS uInteger  ' 0x0C | 2 bytes | Objects lookup list position
DIM DdbLocLstPos  AS uInteger  ' 0x0E | 2 bytes | Locations lookup list position
DIM DdbUsrMsgPos  AS uInteger  ' 0x10 | 2 bytes | User messages lookup list position
DIM DdbSysMsgPos  AS uInteger  ' 0x12 | 2 bytes | System messages lookup list position
DIM DdbConLstPos  AS uInteger  ' 0x14 | 2 bytes | Connections lookup list position
DIM DdbVocPos     AS uInteger  ' 0x16 | 2 bytes | Vocabulary
DIM DdbObjLocLst  AS uInteger  ' 0x18 | 2 bytes | Objects "initialy at" list position
DIM DdbObjNamePos AS uInteger  ' 0x1A | 2 bytes | Object names positions
DIM DdbObjAttrPos AS uInteger  ' 0x1C | 2 bytes | Object weight and container/wearable attributes
DIM DdbObjExtrPos AS uInteger  ' 0x1E | 2 bytes | Extra object attributes

' New header fields
DIM DdbXmes0Pos   AS uInteger  ' 0x20 | 2 bytes | Position of Extra messages (file 0)
DIM DdbXmes1Pos   AS uInteger  ' 0x22 | 2 bytes | Position of Extra messages (file 1)
DIM DdbXmes2Pos   AS uInteger  ' 0x24 | 2 bytes | Position of Extra messages (file 2)
DIM DdbXmes3Pos   AS uInteger  ' 0x26 | 2 bytes | Position of Extra messages (file 3)

DIM DdbXmes0Bnk   AS uByte     ' 0x28 | 1 byte  | Number of bank of extra messages (file 0)
DIM DdbXmes1Bnk   AS uByte     ' 0x29 | 1 byte  | Number of bank of extra messages (file 1)
DIM DdbXmes2Bnk   AS uByte     ' 0x2A | 1 byte  | Number of bank of extra messages (file 2)
DIM DdbXmes3Bnk   AS uByte     ' 0x2B | 1 byte  | Number of bank of extra messages (file 3)

DIM DdbFntPos     AS uInteger  ' 0x2C | 2 bytes | Position of the font
DIM DdbImgIdxPos  AS uInteger  ' 0x2E | 2 bytes | Position of the image index
DIM DdbObjBuffer  AS uInteger  ' 0x30 | 2 bytes | Object buffer
DIM DdbNumImgs    AS uByte     ' 0x32 | 1 byte  | Number of images
DIM DdbBnkObjDsc  AS uByte     ' 0x33 | 1 byte  | Number of bank of object descriptions
DIM DdbBnkLocDsc  AS uByte     ' 0x34 | 1 byte  | Number of bank of location descriptions
DIM DdbBnkUsrMsg  AS uByte     ' 0x35 | 1 byte  | Number of bank of user messages
DIM DdbBnkSysMsg  AS uByte     ' 0x36 | 1 byte  | Number of bank of system messages
DIM DdbBnkFnt     AS uByte     ' 0x37 | 1 byte  | Number of bank of the Character set
DIM DdbBnkImgIdx  AS uByte     ' 0x38 | 1 byte  | Number of bank of the image index
DIM DdbCursor     AS uByte     ' 0x39 | 1 byte  | Code of the character used as cursor
'Until here...

#define SIZE_HEADER          $3A
#define PALETTE_OFFSET       SIZE_HEADER
#define VECTOR_OFFSET        PALETTE_OFFSET+16
'---------------------------------------------------------------------
DIM tmpTok AS uInteger  'We reuse the header as the token buffer (32 bytes)
'-----------------------------------------------------------------------------

DIM flags(0 TO 511) AS uByte

DIM cwinX AS uByte
DIM cwinY AS uByte
DIM cwinW AS uByte
DIM cwinH AS uByte
DIM ccursorX AS uByte
DIM ccursorY AS uByte
DIM cwinMode AS uByte

DIM winX(0 TO WINDOWS_NUM-1) AS uByte
DIM winY(0 TO WINDOWS_NUM-1) AS uByte
DIM winW(0 TO WINDOWS_NUM-1) AS uByte
DIM winH(0 TO WINDOWS_NUM-1) AS uByte
DIM cursorX(0 TO WINDOWS_NUM-1) AS uByte
DIM cursorY(0 TO WINDOWS_NUM-1) AS uByte
DIM winMode(0 TO WINDOWS_NUM-1) AS uByte
DIM winAttr(0 TO WINDOWS_NUM-1) AS uByte

DIM lastPicId AS uInteger
DIM lastPicLocation AS uInteger
DIM lastPicBank AS uByte
DIM lastPicShow AS uByte = FALSE                       'True if last location picture was drawed.
DIM savedPosX AS uByte
DIM savedPosY AS uByte

DIM offsetText AS uByte = FALSE
DIM printedLines AS uByte = 0
DIM checkPrintedLinesinUse AS uByte = FALSE
DIM doingPrompt AS uByte = FALSE
DIM lastPrompt AS uByte

DIM borderScr AS uByte = 0

DIM previousVerb AS uByte = NULLWORD

DIM tmpMsg AS uInteger
DIM ramSave AS uInteger

'Object entries
DIM objLocation AS uInteger
DIM objAttr AS uInteger  'bits0-5:Weight|bit6:IsContainer|bit7:IsWorn
DIM objExtAttr2 AS uInteger
DIM objExtAttr1 AS uInteger
DIM objNounId AS uInteger
DIM objAdjetiveId AS uInteger

#define LS_BUFFER0_LEN TEXT_BUFFER_LEN/2+1
#define LS_BUFFER1_LEN TEXT_BUFFER_LEN/4+1

DIM lsBuffer0(0 TO LS_BUFFER0_LEN-1) AS uByte ' Logical sentence buffer [type+id] for PARSE 0
DIM lsBuffer1(0 TO LS_BUFFER1_LEN-1) AS uByte ' Logical sentence buffer [type+id] for PARSE 1

DECLARE SUB printBase10(value AS uInteger)
DECLARE SUB printObjectMsgModif(num AS uByte, modif AS uByte)
DECLARE SUB printOutMsg(strPtr AS uInteger)
DECLARE SUB printSystemMsg(num AS uByte)
DECLARE SUB errorCode(cod AS uByte)
DECLARE SUB doCLS()


FUNCTION FASTCALL Rand() AS uInteger
ASM
PROC
    LOCAL _loop

    LD HL,(23672) ;get data from frames
    LD A, R
    AND %11
    INC A
    LD B, A
_loop:
    LD A,H
    RRA
    LD A,L
    RRA
    XOR H
    LD H,A
    LD A,L
    RRA
    LD A,H
    RRA
    XOR L
    LD L,A
    XOR H
    LD H,A
    DJNZ _loop
ENDP
END ASM
END FUNCTION

FUNCTION FASTCALL SetRAMBank(nbank AS uByte) AS uByte
ASM
PROC
    AND %00010111                 ;mask correct bytes
    LD B, A
    LD A,($5b5c)                  ; Previous value of the port
    PUSH AF                       ; Saving in stack
    AND %11101000                 ; Change only bank bits
    OR B                          ; Select bank on B
    LD BC,$7ffd
    DI
    LD ($5b5c),A
    OUT (C),A                     ;update port
    EI
    POP AF                        ;Recovering previous value
ENDP
END ASM
END FUNCTION


SUB FASTCALL resetSys()
ASM
PROC
    XOR A
    LD BC, $7ffd
    DI
    OUT (C),A          ;update port
    LD B,$1F           ;BC=1FFD
    OUT (C),A          ;update port
    LD HL, 0
    EX (SP), HL
ENDP
END ASM
END SUB

FUNCTION memAlloc(s AS uInteger) AS uInteger

  LET s = callocate(s)
  IF s = NULL THEN errorCode(9)
  RETURN s

END FUNCTION

FUNCTION ToUpper(c AS uByte) AS uByte
  IF c >= 97 AND c <= 122 THEN
    LET c = c - 97
    LET c = c + 65
  END IF
  RETURN c
END FUNCTION

FUNCTION ToLower(c AS uByte) AS uByte
  IF c >= 65 AND c <= 90 THEN
    LET c = c - 65
    LET c = c + 97
  END IF
  RETURN c
END FUNCTION

FUNCTION strnicmp(s1 AS uInteger, s2 AS uInteger, n AS uInteger) AS uByte

  DIM l1, l2 AS uInteger
  DIM n1, n2 AS uInteger
  DIM c1, c2 AS uByte

  IF n = 0 THEN RETURN 0

  IF (s1 bOR s2) = 0 THEN RETURN 0
  IF s1 = 0 OR s2 = 0 THEN RETURN 1

  DO
    LET c1 = ToUpper(PEEK s1)
    LET c2 = ToUpper(PEEK s2)
    IF c1 <> c2 THEN RETURN 1
    IF c1 = 0 THEN EXIT DO
    LET s1 = s1 + 1
    LET s2 = s2 + 1
    LET n = n - 1
  LOOP WHILE n <> 0

  RETURN 0

END FUNCTION

FUNCTION strcmp(str1 AS uInteger, str2 AS uInteger, count AS uByte) AS Byte

  DIM c1, c2 AS uByte
  DO WHILE count > 0
    LET c1 = PEEK(str1)
    LET c2 = PEEK(str2)
    IF c1 > c2 THEN RETURN 1
    IF c1 < c2 THEN RETURN -1
    LET str1 = str1 + 1
    LET str2 = str2 + 1
    LET count = count - 1
  LOOP
  RETURN 0

END FUNCTION

FUNCTION strchr(s AS uInteger, c AS uByte) AS uInteger

  DIM p AS uByte

  DO
    LET p = PEEK s
    IF p = c THEN RETURN s
    LET s = s + 1
  LOOP WHILE p

  RETURN 0

END FUNCTION

'==============================================================================
SUB FASTCALL DecompressPicture(addr AS uInteger)
ASM
PROC
    LOCAL EndDecompressPicture, HasMirroring
    LOCAL no_mirror, NLinesPxl, NLinesAtt
    LOCAL loop1, loop2, loop3, loop4, loop5
    LOCAL mirr_leave
    
    LD E, (HL)         ;Get the size of the compressed pixel data
    INC HL
    LD D, (HL)
    INC HL
    INC HL
    INC HL             ;Skip Att Size
    LD A, (HL)         ;Num Lines Pxl
    INC HL
    LD (NLinesPxl+1), A
    LD A, (HL)         ;Num Lines Att
    INC HL             ;Skip to beginning of pixel data
    LD (HasMirroring), A
    AND $7F
    LD (NLinesAtt+1), A
    EXX
    RRCA
    RRCA
    RRCA
    LD L, A
    AND %00011111
    LD H, A
    LD A, %11100000
    AND L
    LD L, A          ; 32 * Num Att Lines
    DEC HL           ; 32 * Num Att Lines - 1
    PUSH HL
    ;To hide the decompression, we set all the attributes
    ;with the same color of ink and paper
    LD A, (23693)      ;Get ATTR
    AND %11111000      ;Mask INK
    LD B, A            ;Saving on b
    RRCA
    RRCA
    RRCA               ;Move PAPER to the left
    AND %00000111      ;Mask new INK
    OR B               ;Set new INK the same as PAPER
    LD HL, $5800
    LD (HL), A         ;Sets the color on ATTRMEM
    LD DE, $5801
    POP BC             ;Recover num of atts to draw...
    LDIR               ;Put the screen on the paper color
    EXX
    EX DE, HL          ;Gets the pointer of the file to DE
    ADD HL, DE         ;Add to the current pointer to obtain on HL the pointer to Attribute data
    PUSH HL
    EX DE, HL          ;HL: Pointer to pixel data, DE: pointer to attr data
    LD DE, $4000
    PUSH DE
    ;CALL dzx0_turbo_dcp
    CALL dzx0_standard_dcp
    POP DE
;---------------------------------------
    LD A, (HasMirroring)
    AND $80
    JR Z, no_mirror
NLinesPxl:
    LD B, 192
loop2:
    LD C, B
    LD HL, 31
    ADD HL, DE
    PUSH DE
    LD B, 16
loop1:
    LD A, (DE)
    INC DE
    ;inverting the byte
    EXX  
    LD B, 8
loop5:
    RRA
    RL C
    DJNZ loop5
    LD A, C
    EXX
    LD (HL), A
    DEC HL
    DJNZ loop1

    POP HL
    LD DE, $4000
    LD A, $E0
    AND L
    LD L, A
    OR A
    SBC HL, DE
    INC H
    LD A,H
    AND $07
    JR NZ, mirr_leave
    XOR A                   ;Clear carry
    LD A,H
    SUB $08
    LD H,A
    LD A,L
    ADD A,$20
    LD L,A
    JR NC, mirr_leave
    LD A,H
    ADD A,$08
    LD H,A
mirr_leave:
    ADD HL, DE
    EX DE, HL

    LD B, C
    DJNZ loop2
no_mirror:
;---------------------------------------
    POP HL
    LD DE, $5800
    PUSH DE
    CALL dzx0_standard ;Decompress attributes
    POP DE
;---------------------------------------
    LD A, (HasMirroring)
    AND $80
    JP Z, EndDecompressPicture
NLinesAtt:
    LD B, 24
loop4:
    LD C, B
    LD HL, 31
    ADD HL, DE
    LD B, 16
loop3:
    LD A, (DE)
    INC DE
    LD (HL), A
    DEC HL
    DJNZ loop3
    LD HL, 16
    ADD HL, DE
    EX DE, HL
    LD B, C
    DJNZ loop4
    JP EndDecompressPicture

HasMirroring:
    DEFB 0

;include once "./asm/dzx0_turbo_dcp.asm"
#include once "./asm/dzx0_standard_dcp.asm"
#include once "./asm/dzx0_standard.asm"


EndDecompressPicture:
ENDP
END ASM
END SUB

FUNCTION preparePicture(idx AS uByte) AS uByte

  DIM ptr AS uInteger
  DIM b, c, res, numI AS uByte
  'DIM currentWindow AS uByte = flags(fCurWin)

  LET c = 0
  LET res = FALSE
  LET ptr = DdbImgIdxPos
  LET numI = DdbNumImgs

  LET lastPicShow = (lastPicId = CAST(uInteger, idx))

  IF lastPicShow THEN RETURN TRUE

  LET b = SetRAMBank(DdbBnkImgIdx bOR ROM48KBASIC)
  DO WHILE c < numI
    IF PEEK(ptr) = idx THEN
      LET lastPicBank = PEEK(ptr + 1)
      LET lastPicLocation = PEEK(uInteger, ptr + 2)
      LET lastPicId = CAST(uInteger, idx)
      LET res = TRUE
      GOTO EndPreparePicture
    END IF
    LET ptr = ptr + 4
    LET c = c + 1
  LOOP

EndPreparePicture:
  SetRAMBank(b)
  RETURN res

END FUNCTION


#ifndef TAPE
FUNCTION loadXPicture(idx AS uByte) AS uByte

  DIM scrSize AS uInteger AT SCR_BUFF_ADDR
  DIM attSize AS uInteger AT SCR_BUFF_ADDR + 2
  DIM size AS uInteger
  DIM b, h AS uByte
  DIM c AS Byte

  IF lastPicId = CAST(uInteger, idx) THEN RETURN TRUE

  'Get the name of the file
  LET b = idx
  FOR c = 2 TO 0 STEP -1
    POKE (@XpictureFilename + c), ((b MOD 10) + $30)
    LET b = b / 10
  NEXT c

  LET b = SetRAMBank(SCR_BUFF_BANK bOR ROM48KBASIC)

XpicturePlus3:
  LET h = 1
  IF Plus3DOSOpen(@XpictureFilename, h, 3, 2, 0) <> 0 THEN GOTO ErrorloadXpicture2
  LET size = Plus3DOSRead(h, SCR_BUFF_BANK, SCR_BUFF_ADDR, 6)
  IF size <> 0 THEN GOTO ErrorloadXpicture
  LET size = Plus3DOSRead(h, SCR_BUFF_BANK, SCR_BUFF_ADDR + 6, scrSize + attSize)
  Plus3DOSClose(h)
  IF size <> 0 THEN GOTO ErrorloadXpicture2

  SetRAMBank(b)
  LET lastPicId = CAST(uInteger, idx) bOR 256
  LET lastPicLocation = SCR_BUFF_ADDR
  LET lastPicBank = SCR_BUFF_BANK
  RETURN TRUE

ErrorloadXpicture:
  Plus3DOSClose(h)

ErrorloadXpicture2:
  SetRAMBank(b)
  lastPicId = NO_LASTPICTURE
  RETURN FALSE

XpictureFilename:
ASM
  DEFB $30, $30, $30, $2E, $44, $43, $50, $FF
END ASM

END FUNCTION
#endif

SUB showBufferedPicture()

  DIM b AS uByte
  'DIM currentWindow AS uByte = flags(fCurWin)

  IF lastPicId = NO_LASTPICTURE THEN errorCode(8)
  LET b = SetRAMBank(lastPicBank bOR ROM48KBASIC)
  DecompressPicture(lastPicLocation)
  SetRAMBank(b)

END SUB

'==============================================================================

SUB FASTCALL WaitForKey()
  LET LastK = 0
  DO LOOP UNTIL (PEEK LastKAddress) <> 0
END SUB

SUB clearBox(x as uByte, y as uByte, width as uByte, height as uByte)
' This subroutine will blank the pixels for a box, measured in Character Squares
' from print positions X,Y to X + Width, Y + height.
'
' Expected to be useful for clearing a window of space - perhaps in a game.
' because of this THE ERROR CHECKING IS NONEXISTENT.
' Please make sure you send sensible data -
' 0 < x < 32, 0 < y < 23, x + width < 32 and y + height < 23
' Britlion 2012.

ASM
PROC
LOCAL BLPaintHeightLoop, BLPaintWidthLoop, BLPaintWidthExitLoop
LOCAL clearbox_outer_loop, clearbox_mid_loop, clearbox_inner_loop
LOCAL clearbox_row_skip, check_width, check_height, start_clear_box
LOCAL t1, t2

check_height:
    ld a,(IX+11)   ; height
    ld b, a
t1: add a,(IX+7)   ; ypos
    cp 24+1
    jr c, check_width
    dec b
    ld a, b
    jr t1
check_width:
    ld a,(IX+9)    ; get width
    ld c, a
t2: add a,(IX+5)   ; xpos
    cp 32+1
    jr c, start_clear_box
    dec c
    ld a, c
    jr t2

start_clear_box:
    ld (IX+9), c    ; get width
    ld (IX+11), b    ; get height

    ld      a,(IX+7)   ;ypos
    rrca
    rrca
    rrca               ; Multiply by 32
    ld      l,a        ; Pass to L
    and     3          ; Mask with 00000011
    add     a,88       ; 88 * 256 = 22528 - start of attributes. Change this if you are working with a buffer or somesuch.
    ld      h,a        ; Put it in the High Byte
    ld      a,l        ; We get y value *32
    and     224        ; Mask with 11100000
    ld      l,a        ; Put it in L
    ld      a,(IX+5)   ; xpos
    add     a,l        ; Add it to the Low byte
    ld      l,a        ; Put it back in L, and we're done. HL=Address.

    push HL            ; save address
    LD A, (23693)      ; attribute
    LD DE,32
    LD c,(IX+11)       ; height

BLPaintHeightLoop:
    LD b,(IX+9)        ; width

BLPaintWidthLoop:
    LD (HL),a          ; paint a character
    INC L              ; Move to the right (Note that we only would have to inc H if we are crossing from the right edge to the left, and we shouldn't be needing to do that)
    DJNZ BLPaintWidthLoop

BLPaintWidthExitLoop:
    POP HL             ; recover our left edge
    DEC C
    JR Z, BLPaintHeightExitLoop

    ADD HL,DE          ; move 32 down
    PUSH HL            ; save it again
    JP BLPaintHeightLoop

BLPaintHeightExitLoop:

    ld b,(IX+5)     ;' get x value
    ld c,(IX+7)     ;' get y value

    ld a, c         ;' Set HL to screen byte for this character.
    and 24
    or 64
    ld h, a
    ld a, c
    and 7
    rra
    rra
    rra
    rra
    add a, b
    ld l, a

    ld b,(IX+11)   ;' get height
    ld c,(IX+9)     ;' get width

clearbox_outer_loop:
    xor a
    push bc       ;' save height.
    push hl       ;' save screen address.
    ld d, 8       ;' 8 rows to a character.

clearbox_mid_loop:
    ld e,l        ;' save screen byte lower half.
    ld b,c        ;' get width.

clearbox_inner_loop:
    ld (hl), a    ;' write out a zero to the screen.

    inc l         ;' go right.
    djnz clearbox_inner_loop    ;' repeat.

    ld l,e        ;' recover screen byte
    inc h         ;' down a row

    dec d
    jp nz, clearbox_mid_loop  ;' repeat for this row.

    pop hl        ;' get back address at start of line
    pop bc        ;' get back char count.

    ld a, 32      ;' Go down to next character row.
    add a, l
    ld l, a
    jp nc, clearbox_row_skip

    ld a, 8
    add a, h
    ld h, a

clearbox_row_skip:
    djnz clearbox_outer_loop

ENDP
END ASM
END SUB

#ifdef FONT32
SUB FASTCALL putGlyph32(x AS uByte, y AS uByte, chrptr AS uInteger)
ASM
PROC
    LOCAL drawchar8_loop

    POP HL             ; Recovering return address
    POP BC             ; B = Y
    EX (SP),HL         ; Recuperamos el caracter a dibujar de HL
    LD C, A            ; C = X

    ;;; Calculamos las coordenadas destino de pantalla en DE:
    LD A, B
    AND $18
    ADD A, $40
    LD D, A
    LD A, B
    AND 7
    RRCA
    RRCA
    RRCA
    ADD A, C
    LD E, A              ; DE contiene ahora la direccion destino.

    EX DE, HL          ; Intercambiamos DE y HL (DE=origen, HL=destino)

    ;;; Dibujar 7 scanlines (DE) -> (HL) y bajar scanline (y DE++)
    LD B, 7            ; 7 scanlines a dibujar

drawchar8_loop:
    LD A, (DE)         ; Tomamos el dato del caracter
    LD (HL), A         ; Establecemos el valor en videomemoria
    INC DE             ; Incrementamos puntero en caracter
    INC H              ; Incrementamos puntero en pantalla (scanline+=1)
    DJNZ drawchar8_loop

    ;;; La octava iteracion (8o scanline) aparte, para evitar los INCs
    LD A, (DE)         ; Tomamos el dato del caracter
    LD (HL), A         ; Establecemos el valor en videomemoria

    LD A, H            ; Recuperamos el valor inicial de HL
    SUB 7              ; Restando los 7 "INC H"'s realizados

    ;;; Calcular posicion destino en area de atributos en DE.
                       ; Tenemos A = H
    RRCA               ; Codigo de Get_Attr_Offset_From_Image
    RRCA
    RRCA
    AND 3
    OR $58
    LD D, A
    LD E, L

    ;;; Escribir el atributo en memoria
    LD A, (23693)
    LD (DE), A         ; Escribimos el atributo en memoria
ENDP
END ASM
END SUB

#else

SUB FASTCALL putGlyph42(x AS uByte, y AS uByte, chrptr AS uInteger)
ASM
PROC

    POP HL
    POP DE         ; Get Y on D
    POP BC         ; Recovering pointer to glyph
    PUSH HL

; x is already on A
    sla a          ;  Shift Left Arithmetic - *2
    ld l, a          ; put x*2 into L
    sla a          ; make it x*4
    add a, l           ; (x*2)+(x*4)=6x
    ld l, a          ; put 6x into L [Since we're in a 6 pixel font, L now contains the # of first pixel we're interested in]
    srl a          ; divide by 2
    srl a          ; divide by another 2 (/4)
    srl a          ; divide by another 2 (/8)
    ld e, a          ; Put the result in e (Since the screen has 8 pixel bytes, pixel/8 = which char pos along our first pixel is in)
    ld a, l          ; Grab our pixel number again
    and 7          ; And do mod 8 [So now we have how many pixels into the character square we're starting at]
    ;-- push af          ; Save A
    ex af, af'
    ld a, d          ; Put y Coord into A'
    sra a          ; Divide by 2
    sra a          ; Divide by another 2 (/4 total)
    sra a          ; Divide by another 2 (/8) [Gives us a 1/3 of screen number]
    add a, 88       ; Add in start of screen attributes high byte
    ld h, a          ; And put the result in H
    ld a, d          ; grab our Y co-ord again
    and 7          ; Mod 8 (why? *I thought to give a line in this 1/3 of screen, but we're in attrs here)
    rrca              ;
    rrca
    rrca              ; Bring the bottom 3 bits to the top - Multiply by 32
      ; (since there are 32 bytes across the screen), here, in other words. [Faster than 5 SLA instructions]
    add a, e           ; add in our x coordinate byte to give us a low screen byte
    ld l, a             ; Put the result in L. So now HL -> screen byte at the top of the character

    ld a, (23693)    ; ATTR P     Permanent current colours, etc (as set up by colour statements).
    ld e, a          ; Copy ATTR into e
    ld (hl), e       ; Drop ATTR value into screen
    inc hl          ; Go to next position along
    ;-- DAAD does'nt do this check, it seems
    ;-- pop af          ; Pull how many pixels into this square we are
    ;-- cp 3              ; It more than 2?
    ;-- jr c, hop1       ; No? It all fits in this square - jump changing the next attribute

    ld (hl), e       ; 63446 Must be yes - we're setting the attributes in the next square too.

LOCAL hop1
hop1:
    dec hl          ; Back up to last position
    ld a, d          ; Y Coord into A'
    and 248          ; Turn it into 0,8 or 16. (y=0-23)
    add a, 64       ; Turn it into 64,72,80  [40,48,50 Hex] for high byte of screen pos
    ld h, a          ; Stick it in H
    push hl          ; Save it
    exx              ; Swap registers
    pop hl          ; Put it into H'L'
    exx              ; Swap Back
    ld a, 8

LOCAL hop4
hop4:
    push af          ; Save Accumulator
    ld a, (bc)       ; Grab a byte of workspace
    exx              ; Swap registers
    push hl          ; Save h'l'
    ld c, 0          ; put 0 into c'
    ld de, 1023       ; Put 1023 into D'E'
    ex af, af'       ; Swap AF
    and a          ; Flags on A
    jr z, hop3       ; If a is zero jump forward
    ld b, a          ; A -> B
    ex af, af'       ; Swap to A'F'

LOCAL hop2
hop2:; Slides a byte right to the right position in the block (and puts leftover bits in the left side of c)
    and a          ; Clear Carry Flag
    rra              ; Rotate Right A
    rr c              ; Rotate right C (Rotates a carry flag off A and into C)
    scf              ; Set Carry Flag
    rr d              ; Rotate Right D
    rr e              ; Rotate Right E (D flows into E, with help from the carry bit)
    djnz hop2       ; Decrement B and loop back

    ex af, af'

LOCAL hop3
hop3:
    ex af, af'
    ld b, a
    ld a, (hl)
    and d
    or b
    ld (hl), a       ; Write out our byte
    inc hl           ; Go one byte right
    ld a, (hl)       ; Bring it in
    and e
    or c             ; mix those leftover bits into the next block
    ld (hl), a       ; Write it out again
    pop hl
    inc h            ; Next line
    exx
    inc bc           ; Next workspace byte
    pop af
    dec a
    jr nz, hop4      ; And go back!

ENDP
END ASM
END SUB
#endif

SUB FASTCALL setFrames(v AS uInteger)
ASM
    DI
    LD (23672), HL
    EI
END ASM
END SUB
'==============================================================================
/'
 ' Function: waitForTimeout
 ' --------------------------------
 ' Wait for a timeout or key pressed
 '
 ' @param timeFlag  A mask to compare with Timer Flag.
 ' @return          Boolean for timeout if reached or not.
 '/
FUNCTION waitForTimeout(timerFlag AS uInteger) AS uByte

  DIM timeout AS uInteger

  LET timeout = CAST(uInteger, flags(fTime)) * 50
  LET LastK = 0
  IF flags(fTIFlags) bAND timerFlag THEN
    LET flags(fTIFlags) = (TIME_TIMEOUT bXOR 255) bAND flags(fTIFlags)
    setFrames(0)
    DO WHILE (PEEK LastKAddress) = 0
      ASM
      HALT
      END ASM
      IF Frames > timeout THEN
        LET flags(fTIFlags) = TIME_TIMEOUT bOR flags(fTIFlags)
        RETURN TRUE
      END IF
    LOOP
  ELSE
    WaitForKey()
  END IF
  RETURN FALSE

END FUNCTION
'==============================================================================
SUB popCurrentWindow(w AS uByte)

  LET cwinX = winX(w)
  LET cwinY = winY(w)
  LET cwinW = winW(w)
  LET cwinH = winH(w)
  LET ccursorX = cursorX(w)
  LET ccursorY = cursorY(w)
  LET cwinMode = winMode(w)
  LET AttrD = winAttr(w)

END SUB

SUB pushCurrentWindow(w AS uByte)

  LET winX(w) = cwinX
  LET winY(w) = cwinY
  LET winW(w) = cwinW
  LET winH(w) = cwinH
  LET cursorX(w) = ccursorX
  LET cursorY(w) = ccursorY
  LET winMode(w) = cwinMode
  LET winAttr(w) = AttrD

END SUB
'==============================================================================

#ifdef FONT32
  #define PRINT_GLYPH(x, y, a) putGlyph32(x, y, a)
#else
  #define PRINT_GLYPH(x, y, a) putGlyph42(x, y, a)
#endif

FUNCTION GetCharAddress(c AS uByte) AS uInteger

  DIM add AS uInteger

  LET add = (CAST(uInteger, c) * 8) + DdbFntPos
  IF (cwinMode bAND MODE_FORCEGCHAR) OR offsetText THEN LET add = add + (128 * 8)
  RETURN add

END FUNCTION

#ifndef FONT32
SUB PRIVATEconvertCoords42(ByRef x AS uByte, ByRef w AS uByte)

  DIM xo, xd, xd2 AS uByte

  LET xo = x
  LET xd = xo + w
  LET xo = ((xo << 1) + (xo << 2)) >> 3  ' x = x * 6 / 8
  LET xd2 = (xd << 1)
  LET xd = (xd2 + (xd << 2)) >> 3
  IF (xd2 bAND 7) THEN LET xd = xd + 1 ' 2 * x MOD 8
  LET x = xo
  LET w = xd - xo

END SUB
#endif

/'
SUB clearCurrentLine()
#ifdef FONT32

  clearBox(cwinX, cwinY, cwinW, 1)

#else

  DIM x, w AS uByte

  LET x = cwinX
  LET w = cwinW
  PRIVATEconvertCoords42(x, w)
  clearBox(x, cwinY, w, 1)

#endif
END SUB
'/

SUB clearCurrentLine()

  DIM charAdd AS uInteger
  DIM px, py, b AS uByte

  LET charAdd = GetCharAddress(32)
  LET py = ccursorY + cwinY
  LET px = ccursorX

  LET b = SetRAMBank(DdbBnkFnt bOR ROM48KBASIC)
  DO UNTIL px >= cwinW
    PRINT_GLYPH(px + cwinX, py, charAdd)
    LET px = px + 1
  LOOP
  SetRAMBank(b)

END SUB

SUB scrollUp()

  DIM charAdd AS uInteger
  DIM px, py, b AS uByte

  LET charAdd = GetCharAddress(32)
  LET py = cwinH + cwinY - 1
  LET px = 0

#ifdef FONT32
  WinScrollUp(cwinY, cwinX, cwinW, cwinH)
#else
  DIM x, w AS uByte
  LET x = cwinX
  LET w = cwinW
  PRIVATEconvertCoords42(x, w)
  WinScrollUp(cwinY, x, w, cwinH)
#endif

  LET b = SetRAMBank(DdbBnkFnt bOR ROM48KBASIC)
  DO UNTIL px >= cwinW
    PRINT_GLYPH(px + cwinX, py, charAdd)
    LET px = px + 1
  LOOP
  SetRAMBank(b)

END SUB


SUB checkPrintedLines()

  DIM oldTmpMsg AS uInteger
  DIM oldTmpTok AS uInteger

  IF checkPrintedLinesinUse THEN RETURN
  IF (cwinMode bAND MODE_DISABLEMORE) THEN RETURN
  IF (cwinH = 1) THEN RETURN

  LET checkPrintedLinesinUse = TRUE

  LET printedLines = printedLines + 1
  IF (printedLines >= (cwinH - 1)) THEN
    IF ccursorY >= cwinH THEN
      LET ccursorX = 0
      LET ccursorY = ccursorY - 1
      scrollUp()
    END IF
    'Print SYS32 "More..."
    LET oldTmpMsg = tmpMsg
    LET oldTmpTok = tmpTok
    LET tmpMsg = memAlloc(TEXT_BUFFER_LEN*2)
    LET tmpTok = tmpMsg + TEXT_BUFFER_LEN
    printSystemMsg(32)
    deallocate(tmpMsg)
    LET tmpTok = oldTmpTok
    LET tmpMsg = oldTmpMsg
    waitForTimeout(TIME_MORE)
    LET printedLines = 0
    LET ccursorX = 0
    clearCurrentLine()
  END IF
  LET checkPrintedLinesinUse = FALSE

END SUB


SUB printChar(c AS uByte)

  DIM b AS uByte

  IF c = 11 THEN ' \b    Clear screen
    doCLS()
  ELSEIF c = 12 THEN '\k    Wait for a key
    WaitForKey()
    LET printedLines = 0
  ELSEIF c = 14 THEN '\g    Enable graphical charset (128-255)
    LET offsetText = TRUE
  ELSEIF c = 15 THEN '\t    Enable text charset (0-127)
    LET offsetText = FALSE
  ELSE
    IF c = 13 THEN '\n newline
      clearCurrentLine() 'Original DAAD interpreter seems to do this...
      LET ccursorX = 0
      LET ccursorY = ccursorY + 1
      checkPrintedLines()
    ELSE
      'IF ccursorX = 0 THEN clearCurrentLine()
      LET b = SetRAMBank(DdbBnkFnt bOR ROM48KBASIC)
      PRINT_GLYPH(ccursorX + cwinX, ccursorY + cwinY, GetCharAddress(c))
      SetRAMBank(b)
      LET ccursorX = ccursorX + 1
      IF ccursorX >= cwinW THEN
        LET ccursorX = 0
        LET ccursorY = ccursorY + 1
        checkPrintedLines()
      END IF
    END IF
    IF ccursorY >= cwinH THEN
      LET ccursorY = ccursorY - 1
      scrollUp()
    END IF
  END IF

END SUB


SUB printOutMsg(strPtr AS uInteger)

  DIM st, aux, pointer AS uInteger
  DIM c, d AS uByte

  IF strPtr = NULL THEN RETURN

  LET aux = NULL
  LET pointer = strPtr

  LET c = PEEK(pointer)
  DO WHILE c <> 0
    IF c = 32 OR NOT aux THEN
      'Check if next word can be printed in current line
      LET aux = pointer + 1
      LET d = PEEK(aux)
      DO
        IF d = 0 THEN EXIT DO
        IF d = 32 THEN EXIT DO
        IF d = 13 THEN EXIT DO
        IF d = 10 THEN EXIT DO
        LET aux = aux + 1
        LET d = PEEK(aux)
      LOOP
      LET d = cwinW - ccursorX
      LET aux = (aux - (pointer + 1))
      IF aux >= CAST(uInteger, d) THEN
        IF c = 32 THEN
          LET c = 13
        ELSE
          printChar(13) 'NEWLINE
        END IF
      END IF
    END IF
    IF doingPrompt OR strPtr = pointer OR NOT(c = 32 AND ccursorX = 0) THEN
      printChar(c)
    END IF
    LET pointer = pointer + 1
    LET c = PEEK(pointer)
  LOOP

END SUB

/'
 ' Function: errorCode
 ' --------------------------------
 ' Show a system error (see DAAD manual section 4.3)
 '
 ' Print "Game error n" where n is one of:
 '      0 - Invalid object number
 '      1 - Illegal assignment to HERE (Flag 38)
 '      2 - Attempt to set object to loc 255
 '      3 - Limit reached on PROCESS calls
 '      4 - Attempt to nest DOALL
 '      5 - Illegal CondAct (corrupt or old db!)
 '      6 - Invalid process call
 '      7 - Invalid message number
 '      8 - Invalid PICTURE (drawstring only)
 '      9 - Can't allocate memory
 '/
SUB errorCode(cod AS uByte)

  LET AttrD = CREATE_ATTRIB(2, 6, 1, 1)
  printOutMsg(@ErrorCodeText)
  printBase10(cod)
  DO LOOP

ErrorCodeText:
ASM
  DEFB $0D, $47, $61, $6D, $65, $20, $45, $72, $72, $6F, $72, $3A, $00
END ASM
END SUB

'==============================================================================

/'
'DO NOT DELETE, conserve for future reference
'Get the token descompressed on tmpTok
SUB getToken(num AS uByte)

  DIM p, i AS uInteger
  DIM c AS uByte

  LET p = DdbTokensPos
  LET i = tmpTok

  'Skip previous tokens
  DO WHILE num
    IF ((PEEK p) > 127) THEN LET num = num - 1
    LET p = p + 1
    IF NOT num THEN EXIT DO
  LOOP

  'Copy selected token
  DO
    LET c = PEEK p
    POKE i, (c bAND $7f)
    LET i = i + 1
    LET p = p + 1
  LOOP WHILE c < 127
  POKE i, 0 'End of token

END SUB
'/

'Get the token descompressed on tmpTok (Accelerated version in ASM)
SUB FASTCALL getToken(num AS uByte, tokensPtr AS uInteger, buffPtr AS uInteger)
ASM
PROC
    LOCAL loop1, tokenFound, loop2

    POP HL                    ;Get return address
    EX (SP), HL               ;Exchange with the pointer to tokens database
    OR A
    JR Z, tokenFound
    LD B, A
loop1:
    LD A, (HL)
    INC HL
    CP 128
    JR C, loop1               ; A < 128 don't decrement b
    DJNZ loop1                ; Decrease B IF A > 127
tokenFound:
    EX DE, HL                 ;DE = Token address
    POP HL                    ;Get return address
    EX (SP), HL               ;Exchange with the pointer to buffer HL = ptr to buffer
loop2:
    LD A, (DE)
    LD C, A                   ; C character
    AND $7F
    LD (HL), A
    INC DE
    INC HL
    LD A, C                  ;Loop if c < 127
    CP 127
    JR C, loop2
    XOR A
    LD (HL), A               ;Null at the end...
ENDP
END ASM
END SUB

'Uncompress a tokenized string and print it.
SUB printMsg(tokStrPtr AS uInteger, doPrint AS uByte)

  DIM i, token AS uInteger
  DIM c, t AS uByte

  LET i = tmpMsg
  POKE tmpMsg, 0
  DO
    LET c = 255 - PEEK(tokStrPtr)
    LET tokStrPtr = tokStrPtr + 1
    IF c bAND $80 THEN
      getToken(c bAND (255 bXOR 128), DdbTokensPos, tmpTok)
      LET token = tmpTok
      LET t = PEEK(token)
      DO WHILE t <> 0
        POKE i, t
        LET i = i + 1
        IF doPrint THEN
          IF t = 32 OR t = 10 OR t = 13 THEN
            POKE i, 0
            printOutMsg(tmpMsg)
            LET i = tmpMsg
          END IF
        END IF
        LET token = token + 1
        LET t = PEEK(token)
      LOOP
    ELSE
      IF doPrint
#ifdef LANG_ES
        IF (c = 95 OR c = 64) THEN '(c=='_' || c=='@')
#else
        IF (c = 95) THEN '(c=='_')
#endif
          printObjectMsgModif(flags(fCONum), c)
          LET i = tmpMsg
          CONTINUE DO
        END IF
      END IF
      POKE i, c
      LET i = i + 1
      IF c = 32 OR c = 10 THEN
        IF c = 10 THEN
          LET i = i - 1
          POKE i, 0
        END IF
        IF doPrint THEN
          POKE i, 0
          printOutMsg(tmpMsg)
          LET i = tmpMsg
        END IF
      END IF
    END IF
  LOOP WHILE c <> $0A  ' = 255 - 0xf5

END SUB

/'
FUNCTION getSizeMessage(ByVal ptr AS uInteger) AS uInteger

  DIM s AS uInteger

  LET s = 1
  DO WHILE PEEK ptr <> (10 bXOR $FF) '\n offuscated
    LET s = s + 1
    LET ptr = ptr + 1
  LOOP

  RETURN s

END FUNCTION
'/

FUNCTION FASTCALL getSizeMessage(ByVal ptr AS uInteger) AS uInteger
ASM
PROC
    LOCAL loop1, endL

    LD DE, 1       ;DE=counter, HL=pointer
loop1:
    LD A, (HL)
    CP $F5         ;(10 bXOR $FF) '\n offuscated
    JR Z, endL
    INC HL
    INC DE
    JR loop1
endL:
    EX DE, HL      ;Move counter to HL
ENDP
END ASM
END FUNCTION


SUB getMessage(num AS uByte, doPrint AS uByte, msgIdxBnk AS uByte, msgIdxPtr AS uInteger)

  DIM ptr, dest, s AS uInteger
  DIM b AS uByte

  LET b = SetRAMBank(msgIdxBnk bOR ROM48KBASIC)

  LET ptr = msgIdxPtr + 2 * CAST(uInteger, num)
  LET ptr = PEEK(uInteger, ptr)

  'Get size to allocate memory
  LET s = getSizeMessage(ptr)

  dest = allocate(s)
  MemCopy(ptr, dest, s)
  SetRAMBank(b)

  printMsg(dest, doPrint)
  deallocate(dest)

END SUB

SUB getSystemMsg(num AS uByte)

  IF num > DdbNumSysMsg THEN RETURN
  getMessage(num, FALSE, DdbBnkSysMsg, DdbSysMsgPos)

END SUB

SUB printSystemMsg(num AS uByte)

  IF num > DdbNumSysMsg THEN RETURN
  getMessage(num, TRUE, DdbBnkSysMsg, DdbSysMsgPos)

END SUB

SUB printUserMsg(num AS uByte)

  IF num > DdbNumUsrMsg THEN errorCode(7)
  getMessage(num, TRUE, DdbBnkUsrMsg, DdbUsrMsgPos)

END SUB

SUB printLocationMsg(num AS uByte)

  IF num > DdbNumLocDsc THEN errorCode(1)
  getMessage(num, TRUE, DdbBnkLocDsc, DdbLocLstPos)

END SUB

FUNCTION printMaluvaExtraMsg(lsb AS uByte, msb AS uByte, doPrint AS uByte) AS uByte

  DIM ptr, dest, s AS uInteger
  DIM b, ba AS uByte

  LET ba = (msb >> 6) bAND %11
  LET ptr = CAST(uInteger, msb bAND %00111111)
  LET ptr = (ptr << 8) bOR lsb

  IF ba = 3 THEN
    LET dest = DdbXmes3Pos
    LET b = DdbXmes3Bnk
  ELSEIF ba = 2 THEN
    LET dest = DdbXmes2Pos
    LET b = DdbXmes2Bnk
  ELSEIF ba = 1 THEN
    LET dest = DdbXmes1Pos
    LET b = DdbXmes1Bnk
  ELSE
    LET dest = DdbXmes0Pos
    LET b = DdbXmes0Bnk
  END IF

  IF dest = 0 THEN RETURN FALSE

  LET ptr = dest + ptr
  LET ba = SetRAMBank(b bOR ROM48KBASIC)

  'Get size to allocate memory
  LET s = getSizeMessage(ptr)

  dest = allocate(s)
  MemCopy(ptr, dest, s)
  SetRAMBank(ba)

  printMsg(dest, doPrint)
  deallocate(dest)

  RETURN TRUE

END FUNCTION


'Advance until a dot is found and cut everything after that
FUNCTION FASTCALL cutMsgUntilDot(ini AS uInteger) AS uInteger
ASM
PROC
    LOCAL l1, l2, l3

    push hl
l1:
    ld a, (hl)
    cp 0        ;Found EOS
    jr z, l3
    cp 46       ;Found Dot character
    jr z, l2
    cp 10       ;Found EOL
    jr z, l2
    inc hl
    jr l1
l2:
    xor a
    ld (hl), a  ; Set EOS at the end
l3:
    pop hl      ; Restore value
ENDP
END ASM
END FUNCTION

'Skip spaces until an different character is found
FUNCTION FASTCALL skipSpaces(ini AS uInteger) AS uInteger
ASM
PROC
    LOCAL l1, l2
l1:
    ld a, (hl)
    cp 32         ;Non-Space detected
    jr nz, l2
    inc hl
    jr l1
l2:
ENDP
END ASM
END FUNCTION

'Finds the end of the current word
FUNCTION FASTCALL findEndOfWord(ini AS uInteger) AS uInteger
ASM
PROC
    LOCAL l1, l2
l1:
    ld a, (hl)
    cp 0        ;Found EOS
    jr z, l2
    cp 32       ;Found space
    jr z, l2
    cp 13       ;Found CR
    jr z, l2
    inc hl
    jr l1
l2:
ENDP
END ASM
END FUNCTION


' -------------------------------
' Extract object message, change the article and print it:
' "Un palo" -> "El palo"
' "Una linterna" -> "La linterna"
' "A lantern" -> "Lantern"
'
' @param num        Number of object name.
' @param modif      Modifier for uppercase.
' @return           none.
' -------------------------------
#ifdef LANG_ES
SUB printObjectMsgModif(num AS uByte, modif AS uByte)

  DIM ini AS uInteger
  DIM c AS uByte

  IF num >= DdbNumObjDsc THEN RETURN
  getMessage(num, FALSE, DdbBnkObjDsc, DdbObjLstPos)

  LET ini = skipSpaces(tmpMsg)

  IF NOT strnicmp(@MsgModifStrings + 0, ini, 3) '"Un " -> "El "
    IF modif = 64 THEN LET c = 69 ELSE LET c = 101 ''@'?'E':'e'
    POKE ini + 0, c    'e'
    POKE ini + 1, 108  'l'
  ELSEIF NOT strnicmp(@MsgModifStrings + 4, ini, 3) '"una" -> " La"
    IF modif = 64 THEN LET c = 76 ELSE LET c = 108 ''@'?'L':'l'
    LET ini = ini + 1
    POKE ini, c 'l'
  END IF

  cutMsgUntilDot(ini)
  printOutMsg(ini)

  GOTO ENDMsgModifStrings:

MsgModifStrings:
ASM
  DEFB 117, 110, 32, 0 ;"un "
  DEFB 117, 110, 97, 0 ;"una"
END ASM

ENDMsgModifStrings:
END SUB
#endif

#ifdef LANG_EN
SUB printObjectMsgModif(num AS uByte, modif AS uByte)

  DIM ptr AS uInteger
  DIM c AS uByte

  IF num >= DdbNumObjDsc THEN RETURN
  getMessage(num, FALSE, DdbBnkObjDsc, DdbObjLstPos)

  LET ptr = skipSpaces(tmpMsg)
  LET ptr = findEndOfWord(ptr)
  LET ptr = skipSpaces(ptr)

  cutMsgUntilDot(ptr)
  printOutMsg(ptr)

END SUB
#endif

SUB printObjectMsg(num AS uByte, cut AS uByte)

  DIM p AS uInteger

  IF num > DdbNumObjDsc THEN errorCode(0)
  getMessage(num, FALSE, DdbBnkObjDsc, DdbObjLstPos)

  IF cut THEN
    LET p = skipSpaces(tmpMsg)
    POKE p, (ToLower(PEEK(p)))
    cutMsgUntilDot(p)
  ELSE
    LET p = tmpMsg
  END IF

  printOutMsg(p)

END SUB

'-----------------------------------------------------------------------
SUB printBase10(value AS uInteger)

  IF value < 10 THEN
    printChar($30 + CAST(uByte, value))
    RETURN
  END IF

  printBase10(value/10)
  printChar($30 + CAST(uByte, value MOD 10))

END SUB

'==============================================================================
' Return the object ID by Noun+Adjc ID.
' noun      Noun ID.
' adjc      Adjective ID, or NULLWORD to disable adjective filter.
' location      Location where the object must be, LOC_HERE to disable location filter
' returns the Object ID if found or NULLWORD.
FUNCTION getObjectId(noun AS uByte, adjc AS uByte, location AS uByte) AS uByte

  DIM i AS uByte
  DIM loc AS uByte

  IF DdbNumObjDsc = 0 THEN RETURN NULLWORD

  LET loc = CAST(uByte, location) 'Gets the location on LSB

  FOR i = 0 TO DdbNumObjDsc-1
    IF (noun <> NULLWORD AND PEEK(objNounId + i) = noun) AND _
       (adjc = NULLWORD OR PEEK(objAdjetiveId + i) = adjc) THEN ''If 'adjc' not needed or 'adjc' matchs

      'It's in anywhere
      IF location = LOC_HERE THEN
        RETURN i
      END IF

      'Its placed in 'location'
      IF PEEK(objLocation + i) = loc THEN
        RETURN i
      END IF

    END IF
  NEXT i

  RETURN NULLWORD

END FUNCTION


'Return the weight of a object by ID. Also can return
'the total weight of location or carried/worn objects
'if objno is NULLWORD.
'
'objno          Object ID or NULLWORD.
'
'Returns the weight of one or a sum of objects.
'
FUNCTION getObjectWeight(objno AS uByte) AS uByte

  DIM weight AS uInteger = 0
  DIM i, j AS uByte
  DIM loc, att AS uByte

  IF DdbNumObjDsc = 0 THEN RETURN 0
  FOR i = 0 TO DdbNumObjDsc-1
    IF objno = NULLWORD OR objno = i THEN
      LET loc = PEEK(objLocation + i)
      LET att = PEEK(objAttr + i)
      IF (objno <> NULLWORD OR _
         (objno = NULLWORD AND ((loc = LOC_CARRIED) OR (loc = LOC_WORN)))) THEN
        IF (att bAND OBJ_IS_CONTAINER_MASK) AND ((att bAND OBJ_WEIGHT_MASK) <> 0) THEN
          FOR j = 0 TO DdbNumObjDsc-1
            IF PEEK(objLocation + j) = i THEN LET weight = weight + getObjectWeight(j)
          NEXT j
        END IF
        LET weight = (att bAND OBJ_WEIGHT_MASK) + weight
      END IF
    END IF
  NEXT i

  IF weight > 255 THEN RETURN 255

  RETURN CAST(uByte, weight)

END FUNCTION



' Modify DAAD flags to reference the last object used
' in a logical sentence.
SUB referencedObject(objno AS uByte)

  DIM att AS uByte
  DIM l, w, c, wr, a, a1 AS uByte

  LET flags(fCONum) = objno                         '' Flag 51
  IF objno <> NULLWORD THEN
    LET att = PEEK(objAttr + objno)
    LET flags(fCOLoc)    = PEEK(objLocation + objno)            '' Flag 54
    LET flags(fCOWei)    = att bAND OBJ_WEIGHT_MASK   '' Flag 55
    LET flags(fCOCon)    = (flags(fCOCon) bAND %01111111) bOR ((att bAND OBJ_IS_CONTAINER_MASK) << 1) ' Flag 56
    LET flags(fCOWR)     = (flags(fCOWR) bAND %01111111)  bOR (att bAND OBJ_IS_WORN_MASK)   'Flag 57
    LET flags(fCOAtt)    = PEEK(objExtAttr2 + objno)'' Flag 58
    LET flags(fCOAtt+1)  = PEEK(objExtAttr1 + objno)' Flag 59
  ELSE
    LET flags(fCOLoc)   = 0
    LET flags(fCOWei)   = 0
    LET flags(fCOCon)   = 0
    LET flags(fCOWR)    = 0
    LET flags(fCOAtt)   = 0
    LET flags(fCOAtt+1) = 0
  END IF

END SUB

SUB initObjects()

  DIM objLo AS uInteger
  DIM objAt AS uInteger
  DIM objE2 AS uInteger
  DIM objE1 AS uInteger
  DIM objNo AS uInteger
  DIM objAd AS uInteger
  DIM pLoc, endP  AS uInteger
  DIM pAtt, pEatt AS uInteger
  DIM pNam  AS uInteger
  DIM f AS uByte

  LET f = 0

  LET pLoc = DdbObjLocLst
  LET pAtt = DdbObjAttrPos
  LET pEatt = DdbObjExtrPos
  LET pNam = DdbObjNamePos

  LET objLo = objLocation
  LET objAt = objAttr
  LET objE2 = objExtAttr2
  LET objE1 = objExtAttr1
  LET objNo = objNounId
  LET objAd = objAdjetiveId
  LET endP = DdbObjLocLst + CAST(uInteger, DdbNumObjDsc)

  DO WHILE pLoc < endP
    IF PEEK(pLoc) = LOC_CARRIED THEN LET f = f + 1
    POKE objLo, (PEEK(pLoc)) : LET objLo = objLo + 1 : LET pLoc = pLoc + 1
    POKE objAt, (PEEK(pAtt)) : LET objAt = objAt + 1 : LET pAtt = pAtt + 1
    POKE objE1, (PEEK(pEatt)) : LET objE1 = objE1 + 1 : LET pEatt = pEatt + 1
    POKE objE2, (PEEK(pEatt)) : LET objE2 = objE2 + 1 : LET pEatt = pEatt + 1
    POKE objNo, (PEEK(pNam)) : LET objNo = objNo + 1 : LET pNam = pNam + 1
    POKE objAd, (PEEK(pNam)) : LET objAd = objAd + 1 : LET pNam = pNam + 1
  LOOP
  LET flags(fNOCarr) = f

END SUB

'==============================================================================

SUB PutInputEcho(c AS uByte, keepPos AS uByte)

  DIM b AS uByte

  IF keepPos THEN
    LET b = SetRAMBank(DdbBnkFnt bOR ROM48KBASIC)
    PRINT_GLYPH(ccursorX + cwinX, ccursorY + cwinY, GetCharAddress(c))
    SetRAMBank(b)
  ELSE
    printChar(c)
  END IF

END SUB

SUB prompt(printPromptMsg AS uByte)

  DIM p, extChars AS uInteger
  DIM c, f AS uByte
  DIM newPrompt AS uByte
  DIM prevCursorY AS uByte


  IF flags(fInStream) <> 0 THEN
    pushCurrentWindow(flags(fCurWin))
    popCurrentWindow(flags(fInStream))
  END IF

  LET p = tmpMsg

  IF printPromptMsg THEN
    LET newPrompt = flags(fPrompt)
    IF NOT newPrompt THEN
      DO
        LET newPrompt = (CAST(uByte, rand()) bAND %11) + 2
      LOOP WHILE newPrompt = lastPrompt
    END IF
    printSystemMsg(newPrompt)
    LET lastPrompt = newPrompt
  END IF

  LET doingPrompt = TRUE
  LET printedLines = 0

  printSystemMsg(33)  'Prompt
  'LET prevCursorY = ccursorY
  PutInputEcho(DdbCursor, TRUE)

  POKE p, 0
  DO
    LET LastK = 0
    'Check first char Timeout flag
    IF p = tmpMsg THEN
      IF (waitForTimeout(TIME_FIRSTCHAR)) THEN GOTO retContinue
    END IF
    DO WHILE PEEK LastKAddress = 0
      ASM
      HALT
      END ASM
    LOOP
    LET c = PEEK LastKAddress
'To make click sound
ASM
PROC
    LOCAL PIP
    LOCAL NO_CLICK
    LOCAL BEEPER

    PIP EQU 23609
    BEEPER EQU 0x3B5
    ld a, (PIP)
    cp 0xFF
    jr z, NO_CLICK
    push ix
    ld e, a
    ld d, 0
    ld hl, 0x00C8
    CALL BEEPER
    pop ix
NO_CLICK:
ENDP
END ASM

    IF (c = 13 OR c = 32) AND p <= tmpMsg THEN
      LET c = 0
      CONTINUE DO
    END IF
    IF c = 12 THEN '' Back space (BS)
      IF (p <= tmpMsg) THEN CONTINUE DO
      PutInputEcho(32, TRUE)
      LET p = p - 1
      POKE p, 0
      IF ccursorX > 0 THEN
        LET ccursorX = ccursorX - 1
      ELSE
        LET ccursorX = cwinW - 1
        LET ccursorY = ccursorY - 1
      END IF
      PutInputEcho(DdbCursor, TRUE)
    ELSEIF c >= 32 OR c = 13 THEN
      IF (p - tmpMsg) >= TEXT_BUFFER_LEN THEN CONTINUE DO
      IF c = 13 THEN PutInputEcho(32, TRUE)
      PutInputEcho(c, FALSE)
      IF c <> 13 THEN PutInputEcho(DdbCursor, TRUE)
      POKE p, ToUpper(c)
      LET p = p + 1
    END IF
  LOOP WHILE c <> 13
  POKE (p - 1), 0

retContinue:

  'Clear input stream window if flag is enabled
  LET f = flags(fTIFlags)
  IF (f bAND TIME_CLEAR) THEN doCLS()

  'Echo input to current window if flag is enabled
  IF (f bAND TIME_INPUT) THEN
    LET p = tmpMsg
    LET tmpMsg = memAlloc(TEXT_BUFFER_LEN)
    printSystemMsg(33)
    deallocate(tmpMsg)
    LET tmpMsg = p
    printOutMsg(tmpMsg)
    printChar(13) 'NEWLINE
  END IF

  IF flags(fInStream) <> 0 THEN
    pushCurrentWindow(flags(fInStream))
    popCurrentWindow(flags(fCurWin))
    LET printedLines = 0
''  ELSE
    'LET printedLines = (ccursorY-prevCursorY)
  END IF

  ' Reset variables
  LET doingPrompt = FALSE

END SUB
'==============================================================================
'Clear pending logical sentences if any.
SUB clearLogicalSentences()

  MemSet(@lsBuffer0(0), 0, LS_BUFFER0_LEN)
  MemSet(@lsBuffer1(0), 0, LS_BUFFER1_LEN)
  LET previousVerb = NULLWORD

END SUB

' Set the flags with the current logical sentence.
FUNCTION populateLogicalSentence(parseMode AS uByte) AS uByte

  DIM p, c AS uByte
  DIM type, id, adj, obj AS uByte
  DIM ret, pron, n, v AS uByte

 'Clear parser flags
  LET flags(fVerb) = NULLWORD
  LET flags(fNoun1) = NULLWORD
  LET flags(fAdject1) = NULLWORD
  LET flags(fAdverb) = NULLWORD
  LET flags(fPrep) = NULLWORD
  LET flags(fNoun2) = NULLWORD
  LET flags(fAdject2) = NULLWORD

  LET p = 0
  LET c = 0
  LET adj = fAdject1
  LET ret = FALSE
  LET pron = FALSE

  DO WHILE p < LS_BUFFER0_LEN 'End of buffer

    LET id = lsBuffer0(p)
    IF id = 0 THEN EXIT DO 'Read token 0
    LET type = lsBuffer0(p+1)
    IF type = CONJUNCTION THEN EXIT DO 'Is a conjuntion
    IF type = SEPARATOR THEN EXIT DO 'Is a separator

    IF type = PRONOUNVERB AND flags(fVerb) = NULLWORD AND NOT pron THEN 'Verb with pronoun
      LET flags(fVerb) = id
      LET pron = TRUE
    ELSEIF type = VERB AND flags(fVerb) = NULLWORD THEN 'VERB
      LET flags(fVerb) = id
    ELSEIF type = PRONOUN AND flags(fNoun1) = NULLWORD AND NOT pron THEN 'Pronoun
      LET pron = TRUE
    ELSEIF type = NOUN AND flags(fNoun1) = NULLWORD AND NOT pron THEN 'NOUN1
      LET flags(fNoun1) = id
    ELSEIF type = NOUN AND flags(fNoun2) = NULLWORD THEN 'NOUN2
      LET flags(fNoun2) = id
      LET adj = fAdject2
    ELSEIF type = ADVERB AND flags(fAdverb) = NULLWORD THEN 'ADVERB
      LET flags(fAdverb) = id
    ELSEIF type = PREPOSITION AND flags(fPrep) = NULLWORD THEN 'PREP
      LET flags(fPrep) = id
    ELSEIF type = ADJECTIVE AND adj = fAdject1 AND flags(fAdject1) = NULLWORD THEN 'ADJ1
      LET flags(fAdject1) = id
    ELSEIF type = ADJECTIVE AND adj = fAdject2 AND flags(fAdject2) = NULLWORD THEN 'ADJ2
      LET flags(fAdject2) = id
    END IF

    LET p = p + 2
  LOOP

  LET v = flags(fVerb)
  LET n = flags(fNoun1)

  IF parseMode = 0 THEN
    ' word that works like noun and verb
    IF v = NULLWORD AND n <> NULLWORD AND (n < FIRST_NON_CONVERTIBLE_NOUN) THEN
      LET v = n
      LET flags(fVerb) = v
    END IF
  END IF

  ' Missing verb but present noun, replace with previous verb
  IF v = NULLWORD AND n <> NULLWORD AND previousVerb <> NULLWORD THEN
    LET v = previousVerb
    LET flags(fVerb) = previousVerb
  END IF

  IF n <> NULLWORD AND n >= FIRST_NON_PROPER_NOUN THEN
    LET flags(fCPNoun) = n
    LET flags(fCPAdject) = flags(fAdject1)
  END IF

  IF n = NULLWORD AND pron THEN
    LET flags(fNoun1) = flags(fCPNoun)
    LET flags(fAdject1) = flags(fCPAdject)
  END IF

  IF flags(fNoun2) <> NULLWORD THEN
    LET obj = getObjectId(flags(fNoun2), flags(fAdject2), LOC_HERE)
    IF obj <> NULLWORD THEN
      LET flags(fO2Num) = obj
      LET flags(fO2Loc) = PEEK(objLocation + obj)
      LET flags(fO2Con) = (PEEK(objAttr + obj) bAND OBJ_IS_CONTAINER_MASK) << 1
      LET flags(fO2Att) = PEEK(objExtAttr1 + obj)
      LET flags(fO2Att+1) = PEEK(objExtAttr2 + obj)
    ELSE
      LET flags(fO2Num) = LOC_NOTCREATED ' TODO: check default values when Object2 is undefined
      LET flags(fO2Loc) = LOC_NOTCREATED
      LET flags(fO2Con) = 0
      LET flags(fO2Att) = 0
      LET flags(fO2Att+1) = 0
    END IF
  END IF

  'Preserve verb to be used by next sentence
  IF v <> NULLWORD THEN LET previousVerb = v

nextLogicalSentence:
  'Skipping conjuntion or separator
  IF p < LS_BUFFER0_LEN AND id <> 0 AND (type = CONJUNCTION OR type = SEPARATOR) THEN
    LET p = p + 2
  END IF

  ' Move next logical sentence to start of logical sentence buffer.
  IF p < LS_BUFFER0_LEN THEN
    LET c = LS_BUFFER0_LEN - p
    MemMove(@lsBuffer0(p), @lsBuffer0(0), c)
  END IF

  LET lsBuffer0(c) = 0
  LET lsBuffer0(c+1) = 0

  RETURN (v <> NULLWORD) OR (n <> NULLWORD)

END FUNCTION

'Chech if the word exists on the vocabulary
FUNCTION checkWordVoc(ByVal ptr AS uInteger, ByVal wlen AS uByte, _
                      ByRef id AS uByte, ByRef type AS uByte) AS uByte

  DIM voc AS uInteger
  DIM tmpVoc(0 TO 4) AS uByte
  DIM i, v AS uByte

  IF wlen > 5 THEN LET wlen = 5

  MemSet(@tmpVoc(0), 32, 5)
  MemCopy(ptr, @tmpVoc(0), wlen)
  FOR i = 0 TO 4
    LET tmpVoc(i) = 255 - tmpVoc(i)
  NEXT i

  'Search it in VOCabulary table
  LET voc = DdbVocPos
  LET v = PEEK voc
  DO WHILE v
    IF NOT strcmp(@tmpVoc(0), voc, 5) THEN
      LET id = PEEK(voc + 5)
      LET type = PEEK(voc + 6)
      RETURN TRUE
    END IF
    LET voc = voc + 7
    LET v = PEEK(voc)
  LOOP

  RETURN FALSE

END FUNCTION


FUNCTION FASTCALL isSeparator(c AS uByte) AS uByte
ASM
PROC
  LOCAL endS

  LD C, TRUE
  CP $2E         ; '.'
  JR Z, endS
  CP $2C         ; ','
  JR Z, endS
  CP $3B         ; ';'
  JR Z, endS
  CP $3A         ; ':'
  JR Z, endS
  LD C, FALSE
endS:
  LD A, C

ENDP
END ASM
END FUNCTION

'Parse the words in user entry text and compare them with vocabulary table.
SUB parser()

  DIM p, p2 AS uInteger
  DIM lsBuffer, aux AS uInteger
  DIM c, c2, pron, wlen, l2 AS uByte
  DIM id, type, id2, type2 AS uByte

  LET lsBuffer = @lsBuffer0(0)
  LET aux = NULL
  LET p = tmpMsg

  'Clear logical sentences buffer
  clearLogicalSentences()

  LET c = PEEK p
  DO WHILE c

    IF c = 34 THEN '"'
      IF aux = NULL THEN
        LET aux = lsBuffer
        LET lsBuffer = @lsBuffer1(0)
      ELSE
        LET lsBuffer = aux
        LET aux = NULL
      END IF
    ELSEIF isSeparator(c) THEN
        POKE lsBuffer, c : LET lsBuffer = lsBuffer + 1
        POKE lsBuffer, SEPARATOR : LET lsBuffer = lsBuffer + 1 'Phony type for separators
    ELSEIF c <> 32 THEN 'Space

      'Find end of the word
      LET p2 = p
      LET c2 = PEEK p2
      DO WHILE c2
        IF c2 = 32 THEN EXIT DO
        IF c2 = 34 THEN EXIT DO
        IF isSeparator(c2) THEN EXIT DO
        LET p2 = p2 + 1
        LET c2 = PEEK p2
      LOOP

      LET wlen = CAST(uByte, p2-p)
      IF checkWordVoc(p, wlen, id, type) THEN

#ifdef LANG_ES
      'In spanish, check pronominal sufixes
        IF type = VERB THEN
          LET pron = FALSE
          IF NOT strcmp(p2-2, @pronominalsString, 2) THEN 'LO
            LET pron = TRUE
            LET l2 = wlen - 2
          ELSEIF NOT strcmp(p2-2, @pronominalsString+3, 2) THEN 'LA
            LET pron = TRUE
            LET l2 = wlen - 2
          ELSEIF NOT strcmp(p2-3, @pronominalsString+6, 3) THEN 'LOS
            LET pron = TRUE
            LET l2 = wlen - 3
          ELSEIF NOT strcmp(p2-3, @pronominalsString+10, 3) THEN 'LAS
            LET pron = TRUE
            LET l2 = wlen - 3
          END IF
          IF pron THEN
            'If we have a word ending with pronominal suffixes, we need to check whether the word is a verb
            'also without the termination, to avoid the HABLA bug where "LA" is part of the verb habLAr and
            'not a suffix. So first we remove the termination & then check if still can be recognized as a verb
            IF checkWordVoc(p, l2, id2, type2) THEN
              IF id2 = id AND type2 = type THEN
                LET type = PRONOUNVERB 'Phony type for verbs with pronominal suffix
              END IF
            END IF
            'Please notice the word has to be first recognized as verb, so all Spanish verbs which are not
            '5 characters long should have synonyms including the suffix or part of it: DAR->DARLO, COGE->COGEL
          END IF
        END IF
#endif
        POKE lsBuffer, id : LET lsBuffer = lsBuffer + 1
        POKE lsBuffer, type : LET lsBuffer = lsBuffer + 1
      END IF

      LET p = p2
      LET c = c2
      CONTINUE DO

    END IF

    LET p = p + 1
    LET c = PEEK p
  LOOP

  RETURN

'--------------------------------
pronominalsString:
ASM
  DEFB $4C, $4F, $0 ; 'LO'
  DEFB $4C, $41, $0 ; 'LA'
  DEFB $4C, $4F, $53, $0 ; 'LOS'
  DEFB $4C, $41, $53, $0 ; 'LAS'
END ASM

END SUB

'
' Function: getLogicalSentence
' --------------------------------
' Get the first logical sentence from parsed user entry
' and fill noun, verbs, adjectives, etc.
' If no sentences prompt to user.
' Returns <> 0 if any logical sentence found.
FUNCTION getLogicalSentence() AS uByte

  DIM c AS uByte

  'If not logical sentences in buffer we ask the user again
  IF NOT lsBuffer0(0) THEN
    prompt(TRUE)
    parser()
  END IF

  RETURN populateLogicalSentence(0)

END FUNCTION

'Copy sentence between "..." if any typed. True if any logical sentence found.
' --------------------------------
FUNCTION useLiteralSentence() AS uByte

  MemCopy(@lsBuffer1(0), @lsBuffer0(0), LS_BUFFER1_LEN)
  LET previousVerb = NULLWORD

  RETURN populateLogicalSentence(1)

END FUNCTION
'==============================================================================
' Process call stack
DIM numProc(0 TO NUM_PROCS-1) AS uByte                 'Process number
DIM entryIniProc(0 TO NUM_PROCS-1) AS uInteger         'First entry in current PROCess
DIM entryProc(0 TO NUM_PROCS-1) AS uInteger            'Current entry in current PROCess
DIM condactIniProc(0 TO NUM_PROCS-1) AS uInteger       'First condact in current entry
DIM condactProc(0 TO NUM_PROCS-1) AS uInteger          'Current condact in current entry
DIM entryDOALLProc(0 TO NUM_PROCS-1) AS uInteger       'Entry where is located the DOALL
DIM condactDOALLProc(0 TO NUM_PROCS-1) AS uInteger     'Next condact to the DOALL (NULL if not in a loop)
DIM nobjDOALLProc(0 TO NUM_PROCS-1) AS uByte           'Number of processed objects after DOALL
DIM continueEntryProc(0 TO NUM_PROCS-1) AS uByte       'Boolean to check if a Process entry must continue or a condition fails.
DIM currProc AS uByte = $FF                            'Current process
DIM indirection AS uByte = FALSE                       'True if the current condact use indirection for the first argument.
DIM isDone AS uByte = FALSE                            'Variable for ISDONE/ISNOTDONE condacts.

' 0:not count for ISDONE | 1:count for ISDONE
DIM condactFlagList(0 TO 127) AS uByte => {_
  0, 0, 0, 0, 0,_   ' 0-4
  0, 0, 0, 0, 0,_   ' 5-9
  0, 0, 0, 0, 0,_   ' 10-14
  0, 0, 0, 1, 1,_   ' 15-19
  0, 1, 1, 1, 1,_   ' 20-24
  1, 1, 1, 1, 1,_   ' 25-29
  1, 1, 1, 1, 1,_   ' 30-34
  1, 1, 1, 1, 1,_   ' 35-39
  1, 1, 1, 1, 1,_   ' 40-44
  1, 1, 1, 1, 1,_   ' 45-49
  1, 1, 1, 1, 1,_   ' 50-54
  0, 1, 1, 0, 0,_   ' 55-59
  1, 1, 1, 1, 1,_   ' 60-64
  1, 1, 1, 0, 0,_   ' 65-69
  0, 1, 1, 1, 1,_   ' 70-74
  0, 0, 1, 1, 0,_   ' 75-79
  0, 1, 1, 1, 1,_   ' 80-84
  1, 1, 1, 0, 1,_   ' 85-89
  1, 1, 1, 1, 1,_   ' 90-94
  1, 1, 1, 1, 1,_   ' 95-99
  1, 1, 1, 0, 1,_   ' 100-104
  1, 0, 1, 0, 1,_   ' 105-109
  1, 0, 0, 0, 0,_   ' 110-114
  0, 0, 1, 1, 1,_   ' 115-119
  1, 1, 1, 1, 1,_   ' 120-124
  1, 1, 1 _         ' 125-127
}

'#define pPROC condactProc(currProc)
'-----------------------------------------------------------------------
SUB doCLS()
/'
#ifndef FONT42

  clearBox(cwinX, cwinY, cwinW, cwinH)

#else

  DIM x, w AS uByte

  LET x = cwinX
  LET w = cwinW
  PRIVATEconvertCoords42(x, w)
  clearBox(x, cwinY, w, cwinH)

#endif
'/
  clearBox(cwinX, cwinY, cwinW, cwinH)
  LET ccursorX = 0
  LET ccursorY = 0
  LET lastPicId = NO_LASTPICTURE
  LET lastPicLocation = 0
  LET lastPicBank = 0
  LET lastPicShow = FALSE
  LET printedLines = 0
END SUB
'-----------------------------------------------------------------------
SUB pushPROC(proc AS uByte)

  DIM ptr AS uInteger

  LET currProc = currProc + 1

  IF currProc >= NUM_PROCS THEN errorCode(3)
  IF proc > DdbNumPrc THEN errorCode(6)

  'Get process address
  LET ptr = DdbPrcLstPos + 2 * CAST(uInteger, proc)
  LET ptr = PEEK(uInteger, ptr)
  LET numProc(currProc) = proc
  LET entryIniProc(currProc) = ptr
  LET entryProc(currProc) = ptr - 4
  LET condactDOALLProc(currProc) = NULL
  LET continueEntryProc(currProc) = FALSE
  LET isDone = FALSE

END SUB

FUNCTION popPROC() AS uByte

  IF currProc > 0 THEN
    LET numProc(currProc) = 0
    LET entryIniProc(currProc) = 0
    LET entryProc(currProc) = 0
    LET condactIniProc(currProc) = 0
    LET condactProc(currProc) = 0
    LET entryDOALLProc(currProc) = 0
    LET condactDOALLProc(currProc) = 0
    LET continueEntryProc(currProc)  = 0
    LET nobjDOALLProc(currProc) = 0
  END IF
  LET currProc = currProc - 1

  RETURN (currProc <> $FF)

END FUNCTION

SUB stepPROCEntryCondacts(stp AS Byte)

  LET entryProc(currProc) = entryProc(currProc) + 4 * CAST(Integer, stp)
  LET continueEntryProc(currProc) = FALSE

END SUB


FUNCTION getCondOrValueAndInc() AS uByte

  DIM pPROC AS uInteger

  LET pPROC = condactProc(currProc)
  LET condactProc(currProc) = pPROC + 1

  RETURN PEEK(pPROC)

END FUNCTION


FUNCTION getValueOrIndirection() AS uByte

  DIM value AS uByte

  LET value = getCondOrValueAndInc()
  IF indirection THEN LET value = flags(value)

  RETURN value

END FUNCTION

SUB FASTCALL PRIVATETapeOp( doSave AS uByte, nameAddr AS uInteger, _
                            size AS uInteger, address AS uInteger)
ASM
PROC
    LOCAL loop1, endStr

    POP HL        ; Return Address
    EX (SP), HL   ; Exchange with nameAddr
    EX AF, AF'    ; Save LD
    INC HL        ; Advance
    PUSH HL       ; Save position of the size
    INC HL        ; to the actual beginnig of the string
    LD BC, $0C00  ; B Counts until 12, C is the actual character counter
loop1:
    LD A, (HL)
    OR A
    JR Z, endStr  ;Found NULL character
    INC C         ;C is the char counter
    INC HL
    DJNZ loop1
endStr:
    POP HL        ;Restore HL+1 for the string size
    LD (HL), C    ;Storing the string size
    DEC HL
    XOR A
    LD (HL), A    ;Sets to zero
    EX AF, AF'
    OR A          ;tests if save is zero
    JP NZ, SAVE_CODE
    INC A         ;Sets 1 for Load OP
    JP LOAD_CODE
ENDP
#include once "tape.asm"

END ASM
END SUB

FUNCTION PRIVATESaveOption(c AS uByte) AS uByte

#ifdef TAPE

  IF c <> 1 THEN LET c = 1
  RETURN c

#else

  IF c = 2 THEN
    RETURN 2
  ELSEIF c = 1
    RETURN 1
  END IF

  printSystemMsg(62)
  printChar(13) 'NEWLINE
  clearLogicalSentences()
  prompt(FALSE)
  LET c = PEEK(tmpMsg)
  getSystemMsg(54) 'tape
  IF PEEK(tmpMsg) = c THEN RETURN 1
  getSystemMsg(55) 'disk
  IF PEEK(tmpMsg) = c THEN RETURN 2
  RETURN 0

#endif

END FUNCTION

FUNCTION PRIVATEGetFilename() AS uInteger

  DIM tmp, buff AS uInteger

  printSystemMsg(60)
  printChar(13) 'NEWLINE
  clearLogicalSentences()

  LET tmp = tmpMsg
  LET buff = memAlloc(TEXT_BUFFER_LEN + 2)
  LET tmpMsg = buff + 2
  prompt(FALSE)
  LET tmpMsg = tmp

  RETURN buff

END FUNCTION


FUNCTION FASTCALL PRIVATEPrepareDiscFilename(ptr AS uInteger) AS uInteger
ASM
PROC
    LOCAL loop1, endStr, Extension, EndF

    INC HL
    INC HL
    PUSH HL
    LD B, $08  ; B Counts until 8
loop1:
    LD A, (HL)
    OR A
    JR Z, endStr  ;Found NULL character
    INC HL
    DJNZ loop1
endStr:
    LD DE, Extension
    EX DE, HL
    LD BC, 5
    LDIR
    JR EndF
Extension:
    DEFB $2E, $53, $41, $56, $FF ; ".SAV"
EndF:
    POP HL
ENDP
END ASM
END FUNCTION


SUB PRIVATEDoSAVE(opt AS uByte)

  DIM sav, size, buff, buff2 AS uInteger
  DIM ioerr AS uByte
  DIM h AS Byte

  LET opt = PRIVATESaveOption(opt)
  IF opt = 0 THEN RETURN

  LET ioerr = FALSE
  LET size = 256 + DdbNumObjDsc
  LET sav = memAlloc(512)
  MemCopy(@flags(0), sav, size)

  LET buff = PRIVATEGetFilename()

  IF opt = 1 THEN 'TAPE
    printSystemMsg(61)
    WaitForKey()
    PRIVATETapeOp(TRUE, buff, size, sav)
    BORDER(borderScr)
  ELSE
#ifdef PLUS3
    LET buff2 = PRIVATEPrepareDiscFilename(buff)
    LET h = Plus3DOSOpen(buff2, 0, 3, 4, 2)
    IF h <> 0 THEN
      LET ioerr = TRUE
    ELSE
      LET buff2 = Plus3DOSWrite(0, 0, sav, size)
      LET h = Plus3DOSClose(0)
      LET ioerr = (buff2 <> 0) OR (h <> 0)
    END IF
    deallocate(buff)
#else
    LET ioerr = TRUE
#endif
  END IF
  deallocate(sav)

  IF ioerr THEN 'Error
    printSystemMsg(57)
    WaitForKey()
  END IF

  LET continueEntryProc(currProc) = NOT ioerr

END SUB

SUB PRIVATEDoLOAD(opt AS uByte)

  DIM sav, size, buff, buff2 AS uInteger
  DIM ioerr AS uByte
  DIM h AS Byte

  LET opt = PRIVATESaveOption(opt)
  IF opt = 0 THEN RETURN

  LET ioerr = FALSE
  LET size = 256 + DdbNumObjDsc
  LET sav = memAlloc(512)
  LET buff = PRIVATEGetFilename()

  IF opt = 1 THEN 'TAPE
    LET ErrNr = 0
    printSystemMsg(61)
    WaitForKey()
    PRIVATETapeOp(FALSE, buff, size, sav)
    BORDER(borderScr)
    IF ErrNr = 26 THEN LET ioerr = TRUE
  ELSE 'DISC
#ifdef PLUS3
    LET buff2 = PRIVATEPrepareDiscFilename(buff)
    LET h = Plus3DOSOpen(buff2, 0, 3, 2, 0)
    IF h <> 0 THEN
      LET ioerr = TRUE
    ELSE
      LET buff2 = Plus3DOSRead(0, 0, sav, size)
      LET h = Plus3DOSClose(0)
      LET ioerr = (buff2 <> 0) OR (h <> 0)
    END IF
    deallocate(buff)
#else
    LET ioerr = TRUE
#endif
  END IF

  IF ioerr THEN 'Error
    printSystemMsg(57)
    flags(fPlayer) = 0
    PRIVATEDoRESTART()
  ELSE
    MemCopy(sav, @flags(0), size)
  END IF
  deallocate(sav)

END SUB

SUB PRIVATEDoRESET()
  initObjects()
END SUB

SUB PRIVATEDoRESTART()
  DO WHILE (popPROC()) LOOP 'popPROC() cancel the current DOALL
  pushPROC(0)
  continueEntryProc(currProc) = FALSE
END SUB

SUB PRIVATEDoEND()

  DIM c AS uByte

  printSystemMsg(13)
  clearLogicalSentences()
  prompt(FALSE)
  LET c = PEEK(tmpMsg)
  getSystemMsg(31)
  IF PEEK(tmpMsg) = c THEN resetSys()
  'Initializing the game
  initFlags()
  PRIVATEDoRESET()
  PRIVATEDoRESTART()
END SUB

FUNCTION PRIVATEGetObjectLocParam() AS uByte

  DIM d AS uInteger
  LET d = CAST(uInteger, getValueOrIndirection())
  RETURN PEEK(objLocation + d)

END FUNCTION

FUNCTION PRIVATECheckLocHERE(loc AS uByte) AS uByte

  IF loc = LOC_HERE THEN 
    RETURN flags(fPlayer)
  ELSE
    RETURN loc
  END IF

END FUNCTION

SUB PRIVATEDoALL()

  DIM pPROC AS uInteger
  DIM objno, locno AS uByte

  LET objno = flags(fDAObjNo) + 1
  LET locno = PRIVATECheckLocHERE(PEEK(condactDOALLProc(currProc) - 1))
  IF PEEK(condactDOALLProc(currProc) - 2) > 127 THEN LET locno = flags(locno)
  DO WHILE (PEEK(objLocation + objno) <> locno OR _
    (PEEK(objNounId + objno) = flags(fNoun2) AND PEEK(objAdjetiveId + objno) = flags(fAdject2)))
    LET objno = objno + 1
    IF objno >= DdbNumObjDsc THEN
      LET condactDOALLProc(currProc) = NULL
      IF nobjDOALLProc(currProc) = 0 THEN
        printSystemMsg(8)
      END IF
      PRIVATEDoDONE()
      RETURN
    END IF
  LOOP

  LET flags(fDAObjNo) = objno
  LET flags(fCONum) = objno
  LET flags(fNoun1) = PEEK(objNounId + objno)
  LET flags(fAdject1) = PEEK(objAdjetiveId + objno)
  ' LET objno = objno + 1
  LET nobjDOALLProc(currProc) = nobjDOALLProc(currProc) + 1
  LET condactProc(currProc) = condactDOALLProc(currProc)
  LET entryProc(currProc) = entryDOALLProc(currProc)

END SUB

SUB PRIVATEDoDONE()
  IF condactDOALLProc(currProc) THEN
    PRIVATEDoALL()
  ELSE
    isDone = TRUE
    popPROC()
  END IF
END SUB

/'
-Si es en LISTAT continuo: el objeto no cambiar (ES) ni recorta (EN) artÃ­culos, pero corta a partir del punto
-Si es en LISTAT normal: el objeto  se lista tal cual, no cambia nada
- SI es en un sÃ­mbolo "_" o "@" el objeto se muestra solo hasta el punto, reemplazando (ES) o recortando (EN) el artÃ­culo

En ES cambia la primera palabra solo si es un, una, unos, unas (por el , la, los , las).
En inglÃ©s borra la primera palabra, da igual cual sea
'/

SUB PRIVATEDoLISTAT(loc AS uByte, listobj AS uByte)

  DIM i AS uInteger
  DIM flag, cont AS uByte
  DIM lastFound AS uByte = NULLWORD

  LET flag = (F53_LISTED bXOR $FF) bAND flags(fOFlags)
  LET cont = (flag bAND F53_CONT)

  FOR i = 0 TO DdbNumObjDsc
    IF i = DdbNumObjDsc OR PEEK(objLocation + i) = loc THEN
      IF lastFound <> NULLWORD THEN
        IF listobj AND NOT (flag bAND F53_LISTED) THEN
          printSystemMsg(1) '"Also can see:"
          IF NOT cont THEN printChar(13)
        END IF
        IF (flag bAND F53_LISTED) AND cont THEN
          IF i < DdbNumObjDsc THEN
            printSystemMsg(46)'", "
          ELSE
            printSystemMsg(47)'" y "
          END IF
        END IF
        printObjectMsg(lastFound, cont)
        IF NOT cont THEN printChar(13)
        LET flag = F53_LISTED bOR flag
      END IF
      LET lastFound = i
    END IF
  NEXT i
  LET flags(fOFlags) = flag
END SUB

SUB PRIVATEDoHASAT(value AS uByte, negate AS uByte)

  DIM bit, flagValue AS uByte

  LET bit = 1 << (value MOD 8)
  LET flagValue = flags((fCOAtt+1)-(value>>3)) bAND bit
  IF negate THEN LET flagValue = NOT flagValue
  continueEntryProc(currProc) = flagValue

END SUB

SUB PRIVATEDoWEAR(objno AS uByte)

  DIM loc, att, carr AS uByte

  LET carr = flags(fNOCarr)
  LET loc = PEEK(objLocation + objno)
  LET att = PEEK(objAttr + objno)
  referencedObject(objno)
  IF loc = flags(fPlayer) THEN
    printSystemMsg(49)
  ELSEIF loc = LOC_WORN THEN
    printSystemMsg(29)
  ELSEIF loc <> LOC_CARRIED THEN
    printSystemMsg(28)
  ELSEIF NOT (att bAND OBJ_IS_WORN_MASK) THEN
    printSystemMsg(40)
  ELSE
    printSystemMsg(37)
    POKE (objLocation + objno), LOC_WORN
    IF carr THEN LET flags(fNOCarr) = carr - 1
    RETURN
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEDoREMOVE(objno AS uByte)
  DIM loc, att, carr, maxC, fp AS uByte

  LET carr = flags(fNOCarr)
  LET maxC = flags(fMaxCarr)
  LET fp = flags(fPlayer)
  LET loc = PEEK(objLocation + objno)
  LET att = PEEK(objAttr + objno)
  referencedObject(objno)
  IF loc = LOC_CARRIED OR loc = fp THEN
    printSystemMsg(50)
  ELSEIF loc <> fp AND loc <> LOC_WORN THEN
    printSystemMsg(23)
  ELSEIF NOT (att bAND OBJ_IS_WORN_MASK) THEN
    printSystemMsg(41)
  ELSEIF carr >= maxC THEN
    printSystemMsg(42)
  ELSE
    printSystemMsg(38)
    POKE (objLocation + objno), LOC_CARRIED
    flags(fNOCarr) = carr + 1
    RETURN
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEDoGET(objno AS uByte)

  DIM loc, carr AS uByte

  LET carr = flags(fNOCarr)
  LET loc = PEEK(objLocation + objno)
  referencedObject(objno)
  IF (loc = LOC_CARRIED OR loc = LOC_WORN) THEN
    printSystemMsg(25)
  ELSEIF loc <> flags(fPlayer) THEN
    printSystemMsg(26)
  ELSEIF ((getObjectWeight(NULLWORD) + getObjectWeight(objno)) > flags(fStrength)) THEN
    printSystemMsg(43)
  ELSEIF (carr >= flags(fMaxCarr)) THEN
    printSystemMsg(27)
    condactDOALLProc(currProc) = NULL
  ELSE
    printSystemMsg(36)
    POKE (objLocation + objno), LOC_CARRIED
    LET flags(fNOCarr) = carr + 1
    RETURN
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEDoDROP(objno AS uByte)

  DIM loc, fp, carr AS uByte

  LET carr = flags(fNOCarr)
  LET fp = flags(fPlayer)
  LET loc = PEEK(objLocation + objno)
  referencedObject(objno)
  IF loc = LOC_CARRIED THEN
    printSystemMsg(39)
    POKE (objLocation + objno), fp
    IF carr THEN LET flags(fNOCarr) = carr - 1
    RETURN
  ELSEIF loc = LOC_WORN THEN
    printSystemMsg(24)
  ELSEIF loc = fp THEN
    printSystemMsg(49)
  ELSE
    printSystemMsg(28)
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEDoPUTIN(objno AS uByte, locno AS uByte)

  DIM loc, fp, carr AS uByte

  LET carr = flags(fNOCarr)
  LET fp = flags(fPlayer)
  LET loc = PEEK(objLocation + objno)
  referencedObject(objno) 'TODO: check if must be referenced
  IF loc = LOC_WORN THEN
    printSystemMsg(24)
  ELSEIF loc = fp THEN
    printSystemMsg(49)
  ELSEIF loc <> fp AND loc <> LOC_CARRIED THEN
    printSystemMsg(28)
  ELSE
    POKE (objLocation + objno), PRIVATECheckLocHERE(locno)
    IF carr THEN LET flags(fNOCarr) = carr - 1
    printSystemMsg(44)
    printChar(32)
    printObjectMsgModif(flags(fO2Num), 95) '"_"
    printSystemMsg(51)
    RETURN
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEDoTAKEOUT(objno AS uByte, locno AS uByte)
  DIM loc, fp, carr AS uByte

  LET locno = PRIVATECheckLocHERE(locno)
  LET carr = flags(fNOCarr)
  LET fp = flags(fPlayer)
  LET loc = PEEK(objLocation + objno)
  referencedObject(objno)
  IF loc = LOC_WORN OR loc = LOC_CARRIED THEN
    printSystemMsg(25)
  ELSEIF loc = fp THEN
    printSystemMsg(45)
    printChar(32)
    printObjectMsg(locno, FALSE)
    printSystemMsg(51)
  ELSEIF loc <> fp AND loc <> locno THEN
    printSystemMsg(52)
    printChar(32)
    printObjectMsg(locno, FALSE)
    printSystemMsg(51)
  ELSEIF loc <> LOC_WORN AND loc <> LOC_CARRIED AND _
    ((getObjectWeight(NULLWORD) + getObjectWeight(objno)) > flags(fStrength)) THEN
    printSystemMsg(43)
  ELSEIF carr >= flags(fMaxCarr) THEN
    printSystemMsg(27)
    condactDOALLProc(currProc) = NULL
  ELSE
    printSystemMsg(36)
    POKE (objLocation + objno), LOC_CARRIED
    LET flags(fNOCarr) = carr + 1
    RETURN
  END IF
  clearLogicalSentences()
  PRIVATEDoDONE()

END SUB

SUB PRIVATEAutoEND(msgOK AS uByte, msgKO AS uByte)

  DIM objno AS uByte

  LET objno = getObjectId(flags(fNoun1), flags(fAdject1), LOC_HERE)
  IF objno <> NULLWORD OR flags(fNoun1) = NULLWORD THEN
    printSystemMsg(msgOK)
  ELSE
    printSystemMsg(msgKO)
  END IF

END SUB

FUNCTION PRIVATEcheckLocCARRWORNHERE() AS uByte

  DIM noun, adjc, objno AS uByte

  LET noun = flags(fNoun1)
  LET adjc = flags(fAdject1)
  LET objno = getObjectId(noun, adjc, LOC_CARRIED)   'CARRIED
  IF objno = NULLWORD THEN
    LET objno = getObjectId(noun, adjc, LOC_WORN)   'WORN
    IF objno = NULLWORD THEN
      LET objno = getObjectId(noun, adjc, flags(fPlayer)) 'HERE
    END IF
  END IF
  RETURN objno

END FUNCTION

SUB PRIVATEwindowCheck()

  IF ((cwinW + cwinX) > MAX_COLUMNS) THEN LET cwinW = (MAX_COLUMNS - cwinX)
  IF ((cwinH + cwinY) > MAX_LINES) THEN LET cwinH = (MAX_LINES - cwinY)

END SUB

SUB PRIVATEDoBEEP()

  DIM duration AS Float
  DIM tone AS Byte
  DIM c AS uByte

  LET c = getCondOrValueAndInc()
  LET tone = CAST(Byte, (c >> 1)) - 60
  LET c = getValueOrIndirection()
  LET duration = c
  'LET duration = duration * 0.02
  LET duration = duration * 0.01

  BEEP duration, tone

END SUB

FUNCTION PRIVATEGetColor() AS uByte

  DIM c AS uByte
  DIM b AS uByte = 0
  DIM f AS uByte = 0

  LET c = getValueOrIndirection() bAND %1111
  LET c = PEEK(tmpTok + PALETTE_OFFSET + c) bAND %11111
  IF (c bAND %01000) THEN LET b = 1
  IF (c bAND %10000) THEN LET f = 1
  BRIGHT b : FLASH f
  RETURN (c bAND %111)

END FUNCTION
'==============================================================================
SUB initFlags()

  'Sets attributes
  'LET AttrD = CREATE_ATTRIB(7, 0, 0, 0)

  'Set window data
  MemSet(@winX(0), 0, WINDOWS_NUM)
  MemSet(@winY(0), 0, WINDOWS_NUM)
  MemSet(@cursorX(0), 0, WINDOWS_NUM)
  MemSet(@cursorY(0), 0, WINDOWS_NUM)
  MemSet(@winW(0), MAX_COLUMNS, WINDOWS_NUM)
  MemSet(@winH(0), MAX_LINES, WINDOWS_NUM)
  MemSet(@winMode(0), 0, WINDOWS_NUM)
  MemSet(@winAttr(0), CREATE_ATTRIB(7, 0, 0, 0), WINDOWS_NUM)

  LET lastPicId = NO_LASTPICTURE

  'Sets Current window
  LET flags(fCurWin) = 0
  popCurrentWindow(0)
  'LET cwinH = 25
  'LET cwinW = 43
  'PRIVATEwindowCheck()

  'Sets border
  LET borderScr = 0
  BORDER 0

  'Clear flag of player location
  LET flags(fPlayer) = 0

  'Initialize last onscreen picture
  LET lastPicShow = FALSE

  'Clear logical sentences
  clearLogicalSentences()

  LET doingPrompt = FALSE

END SUB

'==============================================================================
'Makes a call to an address, but the content of the registers must be supplied:
'   A  - Value of first parameter (may be indirected, in which case you will get the contents 
'        of the flag in A.)
'   HL - Points at the Flag given by the first parameter (or the flag given by the 
'        contents of the flag if ind
'   DE - Points at the Object location given by the first parameter.
'   IX - Address of Flag 0, 256 bytes after this are the objects.
'   BC - points at the second parameter of the call, you can advance this pointer and leave it 
'        pointing at the last inline parameter if you wish.
FUNCTION FASTCALL doCALL(a AS uByte, hl AS uInteger, de AS uInteger,_
                    bc AS uInteger, callAddr AS uInteger) AS uInteger
ASM
PROC
    LOCAL jumpIsr
    
    POP HL
    EX (SP), HL
    LD (jumpIsr+1), HL    ;Call Address
    POP HL                ;Return Address
    POP BC                ;Value of BC
    POP DE                ;Value of DE
    EX (SP), HL           ;Exchange return address with HL

    PUSH IY
    PUSH IX
    LD IX, (FlagsPtr)     ;Gets pointer to flags
jumpIsr:
    CALL 0                ;Calling address
    POP IX
    POP IY
    LD L, C
    LD H, B               ;Returns BC as pointer to next condact
ENDP
END ASM
END FUNCTION

FUNCTION FASTCALL jumpToBank(bnk AS uByte, value AS uByte) AS uByte
ASM
PROC
    POP HL
    EX (SP), HL      ;Recover parameter
    OR %00010000     ;Enable 48krom
    CALL _SetRAMBank
    PUSH AF          ;Save old bank
    LD A, H
    PUSH IX
    CALL $C000
    POP IX
    LD H, A
    POP AF
    CALL _SetRAMBank ;Restore bank
    LD A, H          ;Save Result
ENDP
END ASM
END FUNCTION

' Sets the interrupt vector and sets the custom interrupt rountine.
SUB FASTCALL setupIM(flagsAddr AS uInteger, vectorIntAddr AS uInteger)
ASM
PROC
    ;Set vectors
    LD (FlagsPtr), HL
    POP HL
    EX (SP), HL
    LD (IntVectorPtr), HL

    ;Setup interrupt
    DI
    LD HL,IMvect
    LD DE,IMvect+1
    LD BC,257
    LD A,H
    LD I,A
    LD (HL),A
    LDIR
    LD H,A
    LD L,A
    LD A,$C3
    LD (HL),A
    INC HL
    LD DE,ISR
    LD (HL),E
    INC HL
    LD (HL),D
    IM 2
    EI
ENDP
END ASM
END SUB

'-------------------------------------------------------------------------------

#ifdef PLUS3
InitPlus3Disc()
#else
ASM
    DI
    LD BC,$1FFD                   ;BC=1FFD
    LD A,($5B67)                  ;Rom 2 selection (+3dos / 48 basic)
    AND %11111000
    OR %00000100
    OUT (C),A                     ;update port
    LD ($5B67),A                  ;update system var
END ASM
  SetRAMBank(ROM48KBASIC)
#endif
'-------------------------------------------------------------------------------
DIM currCondact AS uByte

SUB GetCurrentContact()

  DIM pPROC AS uInteger

  LET pPROC = condactProc(currProc)
  LET condactProc(currProc) = pPROC + 1
  LET currCondact = PEEK(pPROC)

'ASM
'  ld l, (ix-2)
'  ld h, (ix-1)
'  ld a, (hl)
'END ASM

END SUB
'-------------------------------------------------------------------------------
'===============================================================================
' Main Program starts here:
'===============================================================================

'Initialization
'0x00 | 1 byte  | DAAD version number (1 for Aventura Original and Jabato, 1989, 2 for the rest, 3 for ZX128 format)
'0x01 | 1 byte  | High nibble: target machine | Low nibble: target language
'0x02 | 1 byte  | Always contains CTL value: 95d (ASCII '_')

#define DDBHeaderAddress NextCondactPtr
LET tmpTok = DDBHeaderAddress 'Reusing the original DDB header as the token buffer
LET DdbVersion = PEEK(DDBHeaderAddress)
LET DdbCtl = PEEK(DDBHeaderAddress + 2)
MemCopy(DDBHeaderAddress + 3, @DdbNumObjDsc, SIZE_HEADER - $3) 'Moving header data to variables
#undef DDBHeaderAddress
ASM
  ld hl, _GetCurrentContact__leave  ;Pointer to the end of advancement to next condact subroutine
  ld (_NextCondactPtr), hl          ;Store at $6000
END ASM

'Check header data
IF (DdbVersion <> 3) OR (DdbCtl <> 95) THEN resetSys()

'Apparently, token table starts one byte after the token pointer (Why Tim?, Why?)
LET DdbTokensPos = DdbTokensPos + 1 'Skip first token

LET ramSave = memAlloc(512) '256 bytes for Flags + 256 bytes for Objects location

'Get memory for objects
LET objLocation = @flags(256)
LET objAttr = DdbObjBuffer
LET objExtAttr2  = objAttr + DdbNumObjDsc
LET objExtAttr1  = objExtAttr2 + DdbNumObjDsc
LET objNounId  = objExtAttr1 + DdbNumObjDsc
LET objAdjetiveId  = objNounId + DdbNumObjDsc

'Get memory for tmpTok & tmpMsg
LET tmpMsg = memAlloc(TEXT_BUFFER_LEN)

'Instead of this, I reuse the header space for tokens
'LET tmpTok = memAlloc(32)

LET checkPrintedLinesinUse = FALSE

'-------------------------------------------------------------------------------
'Initalize flags
initFlags()
'-------------------------------------------------------------------------------
'Initialize Process
MemSet(@numProc(0), 0, NUM_PROCS)
MemSet(@entryIniProc(0), 0, NUM_PROCS * 2)
MemSet(@entryProc(0), 0, NUM_PROCS * 2)
MemSet(@condactIniProc(0), 0, NUM_PROCS * 2)
MemSet(@condactProc(0), 0, NUM_PROCS * 2)
MemSet(@entryDOALLProc(0), 0, NUM_PROCS * 2)
MemSet(@condactDOALLProc(0), 0, NUM_PROCS * 2)
MemSet(@continueEntryProc(0), 0, NUM_PROCS)
MemSet(@nobjDOALLProc(0), 0, NUM_PROCS)
LET currProc = $FF
'-------------------------------------------------------------------------------
'Setting interrupt routine
setupIM(@flags(0), PEEK(uInteger, tmpTok + VECTOR_OFFSET + 4))
'-------------------------------------------------------------------------------
'Process 0 first to execute...
pushPROC(0)
'-------------------------------------------------------------------------------
'Process execution
DIM ePROC AS uInteger
DIM pPROC, total, addr AS uInteger
DIM ccVerb, ccNoun, ccAdjc AS uByte
DIM objno, locno, flagno, flagno2 AS uByte
DIM cVerb, cNoun AS uByte
DIM c AS uByte

'Initialize & Clear ISDONE flags
LET isDone = FALSE
LET continueEntryProc(currProc) = FALSE

DO
  GetCurrentContact()

  'Execute condacts until 0xff (entry end) is found
  DO WHILE continueEntryProc(currProc) AND currCondact <> $FF

    LET indirection = INDIRECTION_MASK bAND currCondact
    LET currCondact = CONDACT_MASK bAND currCondact

    ON (currCondact) GOTO _
      condactAT,       condactNOTAT,     condactATGT,      condactATLT,      condactPRESENT,  _ ' 0-4
      condactABSENT,   condactWORN,      condactNOTWORN,   condactCARRIED,   condactNOTCARR,  _ ' 5-9
      condactCHANCE,   condactZERO,      condactNOTZERO,   condactEQ,        condactGT,       _ ' 10-14
      condactLT,       condactADJECT1,   condactADVERB,    condactSFX,       condactDESC,     _ ' 15-19
      condactQUIT,     condactEND,       condactDONE,      condactOK,        condactANYKEY,   _ ' 20-24
      condactSAVE,     condactLOAD,      condactDPRINT,    condactDISPLAY,   condactCLS,      _ ' 25-29
      condactDROPALL,  condactAUTOG,     condactAUTOD,     condactAUTOW,     condactAUTOR,    _ ' 30-34
      condactPAUSE,    condactSYNONYM,   condactGOTO,      condactMESSAGE,   condactREMOVE,   _ ' 35-39
      condactGET,      condactDROP,      condactWEAR,      condactDESTROY,   condactCREATE,   _ ' 40-44
      condactSWAP,     condactPLACE,     condactSET,       condactCLEAR,     condactPLUS,     _ ' 45-49
      condactMINUS,    condactLET,       condactNEWLINE,   condactPRINT,     condactSYSMESS,  _ ' 50-54
      condactISAT,     condactSETCO,     condactSPACE,     condactHASAT,     condactHASNAT,   _ ' 55-59
      condactLISTOBJ,  condactEXTERN,    condactRAMSAVE,   condactRAMLOAD,   condactBEEP,     _ ' 63-64
      condactPAPER,    condactINK,       condactBORDER,    condactPREP,      condactNOUN2,    _ ' 65-69
      condactADJECT2,  condactADD,       condactSUB,       condactPARSE,     condactLISTAT,   _ ' 70-74
      condactPROCESS,  condactSAME,      condactMES,       condactWINDOW,    condactNOTEQ,    _ ' 75-79
      condactNOTSAME,  condactMODE,      condactWINAT,     condactTIME,      condactPICTURE,  _ ' 80-84
      condactDOALL,    condactMOUSE,     condactGFX,       condactISNOTAT,   condactWEIGH,    _ ' 85-89
      condactPUTIN,    condactTAKEOUT,   condactNEWTEXT,   condactABILITY,   condactWEIGHT,   _ ' 90-94
      condactRANDOM,   condactINPUT,     condactSAVEAT,    condactBACKAT,    condactPRINTAT,  _ ' 95-99
      condactWHATO,    condactCALL,      condactPUTO,      condactNOTDONE,   condactAUTOP,    _ ' 100-104
      condactAUTOT,    condactMOVE,      condactWINSIZE,   condactREDO,      condactCENTRE,   _ ' 105-109
      condactEXIT,     condactINKEY,     condactBIGGER,    condactSMALLER,   condactISDONE,   _ ' 110-114
      condactISNDONE,  condactSKIP,      condactRESTART,   condactTAB,       condactCOPYOF,   _ ' 115-119
      condactNOT_USED, condactCOPYOO,    condactNOT_USED,  condactCOPYFO,    condactNOT_USED, _ ' 120-124
      condactCOPYFF,   condactCOPYBF,    condactRESET
NextCondact:
    LET isDone = isDone bOR condactFlagList(currCondact)
    LET currCondact = getCondOrValueAndInc()
  LOOP
  DO
  'Search the first entry that VERB + NOUN'
    LET entryProc(currProc) = entryProc(currProc) + 4
    LET ePROC = entryProc(currProc)
    cVerb = PEEK(ePROC)
    cNoun = PEEK(ePROC + 1)
    IF cVerb = 0 THEN 'Entry end
      popPROC()
      EXIT DO
    ELSE
      'Next Entry of condacts
      LET ePROC = PEEK(uInteger, ePROC + 2)
      LET condactIniProc(currProc) = ePROC
      LET condactProc(currProc) = ePROC
    END IF
  LOOP UNTIL ((cVerb = NULLWORD OR cVerb = flags(fVerb)) AND (cNoun = NULLWORD OR cNoun = flags(fNoun1)))
  LET continueEntryProc(currProc) = TRUE
LOOP

resetSys() 'Just in case...

'=============================================================================
condactAT:
'Succeeds if the current location is the same as locno.
#ifndef DISABLE_AT
  LET continueEntryProc(currProc) = (getValueOrIndirection() = flags(fPlayer))
#endif
  GOTO NextCondact
'=============================================================================
condactNOTAT:
'Succeeds if the current location is different to locno.
#ifndef DISABLE_NOTAT
  LET continueEntryProc(currProc) = (getValueOrIndirection() <> flags(fPlayer))
#endif
  GOTO NextCondact
'=============================================================================
condactATGT:
'Succeeds if the current location is greater than locno.
#ifndef DISABLE_ATGT
  LET continueEntryProc(currProc) = (flags(fPlayer) > getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactATLT:
'Succeeds if the current location is less than locno.
#ifndef DISABLE_ATLT
  LET continueEntryProc(currProc) = (flags(fPlayer) < getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactPRESENT:
'Succeeds if Object objno. is carried (254), worn (253) or at the current
'location [fPlayer]
#ifndef DISABLE_PRESENT
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = (objno > LOC_NOTCREATED OR objno = flags(fPlayer))
#endif
  GOTO NextCondact
'=============================================================================
condactABSENT:
'Succeeds if Object objno. is not carried (254), not worn (253) and not at
'the current location [fPlayer].
#ifndef DISABLE_ABSENT
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = NOT (objno > LOC_NOTCREATED OR objno = flags(fPlayer))
#endif
  GOTO NextCondact
'=============================================================================
condactWORN:
'Succeeds if object objno. is worn
#ifndef DISABLE_WORN
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = (objno = LOC_WORN)
#endif
  GOTO NextCondact
'=============================================================================
condactNOTWORN:
'Succeeds if Object objno. is not worn.
#ifndef DISABLE_NOTWORN
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = (objno <> LOC_WORN)
#endif
  GOTO NextCondact
'=============================================================================
condactCARRIED:
'Succeeds if Object objno. is carried'
#ifndef DISABLE_CARRIED
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = (objno = LOC_CARRIED)
#endif
  GOTO NextCondact
'=============================================================================
condactNOTCARR:
'Succeeds if Object objno. is not carried'
#ifndef DISABLE_NOTCARR
  LET objno = PRIVATEGetObjectLocParam()
  LET continueEntryProc(currProc) = (objno <> LOC_CARRIED)
#endif
  GOTO NextCondact
'=============================================================================
condactCHANCE:
'Succeeds if percent is less than or equal to a random number in the range
'1-100 (inclusive). Thus a CHANCE 50 condition would allow PAW to look at the
'next CondAct only if the random number generated was between 1 and 50, a 50%
'chance of success.
#ifndef DISABLE_CHANCE
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = ((rand() MOD 100) + 1) < flagno
#endif
  GOTO NextCondact
'=============================================================================
condactZERO:
'Succeeds if Flag flagno. is set to zero.
#ifndef DISABLE_ZERO
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(flagno) = 0)
#endif
  GOTO NextCondact
'=============================================================================
condactNOTZERO:
'Succeeds if Flag flagno. is not set to zero.
#ifndef DISABLE_NOTZERO
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(flagno) <> 0)
#endif
  GOTO NextCondact
'=============================================================================
condactEQ:
'Succeeds if Flag flagno. is equal to value.
#ifndef DISABLE_EQ
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(flagno) = getCondOrValueAndInc())
#endif
  GOTO NextCondact
'=============================================================================
condactGT:
'Succeeds if Flag flagno. is greater than value.
#ifndef DISABLE_GT
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(flagno) > getCondOrValueAndInc())
#endif
  GOTO NextCondact
'=============================================================================
condactLT:
'Succeeds if Flag flagno. is set to less than value.
#ifndef DISABLE_LT
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(flagno) < getCondOrValueAndInc())
#endif
  GOTO NextCondact
'=============================================================================
condactADJECT1:
'Succeeds if the first noun's adjective in the current LS is word.
#ifndef DISABLE_ADJECT1
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(fAdject1) = flagno)
#endif
  GOTO NextCondact
'=============================================================================
condactADVERB:
'Succeeds if the adverb in the current LS is word.
#ifndef DISABLE_ADVERB
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(fAdverb) = flagno)
#endif
  GOTO NextCondact
'=============================================================================
condactSFX:
#ifndef DISABLE_SFX
  LET c = getValueOrIndirection()
  LET total = condactProc(currProc)
  LET addr = PEEK(uInteger, tmpTok + VECTOR_OFFSET + 2)
  IF addr <> 0 THEN 
    LET total = doCALL(c, @flags(c), (objLocation + c), total, addr)
  ELSE
    LET total = total + 1
  END IF
  condactProc(currProc) = total
#endif
  GOTO NextCondact
'=============================================================================
condactDESC:
'Prints the text for location locno. without a NEWLINE.
#ifndef DISABLE_DESC
  printLocationMsg(getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactQUIT:
'SM12 ("Are you sure?") is printed and called. Will succeed if the player replies
'starts with the first letter of SM30 ("Y") to then the remainder of the entry is
'discarded is carried out.
#ifndef DISABLE_QUIT
  printSystemMsg(12)
  clearLogicalSentences()
  prompt(FALSE)
  LET c = PEEK(tmpMsg)
  getSystemMsg(30)
  LET continueEntryProc(currProc) = (PEEK(tmpMsg) = c)
#endif
  GOTO NextCondact
'=============================================================================
condactEND:
'SM13 ("Would you like to play again?") is printed and the input routine called.
'Any DOALL loop and sub-process calls are cancelled. If the reply does not start
'with the first character of SM31 a jump is made to Initialise.
'Otherwise the player is returned to the operating system - by doing the command
'EXIT 0.
#ifndef DISABLE_END
  PRIVATEDoEND()
#endif
  GOTO NextCondact
'=============================================================================
condactDONE:
'This action jumps to the end of the process table and flags to DAAD that an
'action has been carried out. i.e. no more condacts or entries are considered.
'A return will thus be made to the previous calling process table, or to the
'start point of any active DOALL loop.
#ifndef DISABLE_DONE
  PRIVATEDoDONE()
#endif
  GOTO NextCondact
'=============================================================================
condactOK:
'/*  'SM15 ("OK") is printed and action DONE is performed.
#ifndef DISABLE_OK
  printSystemMsg(15)
  PRIVATEDoDONE()
#endif
  GOTO NextCondact
'=============================================================================
condactANYKEY:
''SM16 ("Press any key to continue") is printed and the keyboard is scanned until
'a key is pressed or until the timeout duration has elapsed if enabled.
#ifndef DISABLE_ANYKEY
  printSystemMsg(16)
  waitForTimeout(TIME_ANYKEY)
  LET LastK = 0
  LET printedLines = 0
#endif
  GOTO NextCondact
'=============================================================================
condactSAVE:
'This action saves the current game position on disc or tape. SM60 ("Type in
'name of file.") is printed and the input routine is called to get the filename
'from the player. If the supplied filename is not acceptable SM59 ("File name
'error.") is printed - this is not checked on 8 bit machines, the file name
'is MADE acceptable!
#ifndef DISABLE_SAVE
  PRIVATEDoSAVE(getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactLOAD:
'This action loads a game position from disc or tape. A filename is obtained
'in the same way as for SAVE. A variety of errors may appear on each machine
'if the file is not found or suffers a load error. Usually 'I/O Error'. The
'next action is carried out only if the load is successful. Otherwise a system
'clear, GOTO 0, RESTART is carried out.
#ifndef DISABLE_LOAD
  PRIVATEDoLOAD(getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactDPRINT:
'Will print the contents of flagno and flagno+1 as a two byte number.
#ifndef DISABLE_DPRINT
  LET locno = getValueOrIndirection()
  printBase10((CAST(uInteger,flags(locno+1))<<8) bOR flags(locno))
#endif
  GOTO NextCondact
'=============================================================================
condactDISPLAY:
'If value=0 then the last buffered picture is placed onscreen.
'If value !=0 and the picture is not a subroutine then the given window area
'is cleared. This is normally used with indirection and a flag to check and
'display darkness.
#ifndef DISABLE_DISPLAY
  LET flagno = getValueOrIndirection()
  LET c = flags(fCurWin)
  IF flagno THEN
    doCLS()
  ELSEIF lastPicId <> NO_LASTPICTURE THEN
    showBufferedPicture()
  END IF
#endif
  GOTO NextCondact
'=============================================================================
condactCLS:
''Clears the current window.
#ifndef DISABLE_CLS
  doCLS()
#endif
  GOTO NextCondact
'=============================================================================
condactDROPALL:
'All objects which are carried or worn are created at the current location (i.e.
'all objects are dropped) and Flag 1 is set to 0. This is included for
'compatibility with older writing systems.
'Note that a DOALL 254 will carry out a true DROP ALL, taking care of any special
'actions included.
#ifndef DISABLE_DROPALL
  LET c = $FF
  DO
    LET c = c + 1
    LET locno = PEEK(objLocation + c)
    IF locno = LOC_CARRIED OR locno = LOC_WORN THEN
      POKE (objLocation + c), flags(fPlayer)
    END IF
  LOOP WHILE (c < DdbNumObjDsc)
  LET flags(fNOCarr) = 0
#endif
  GOTO NextCondact
'=============================================================================
condactAUTOG:
'A search for the object number represented by Noun(Adjective)1 is made in
'the object definition section in order of location priority; here, carried,
'worn. i.e. The player is more likely to be trying to GET an object that is
'at the current location than one that is carried or worn. If an object is
'found its number is passed to the GET action. Otherwise if there is an
'object in existence anywhere in the game or if Noun1 was not in the
'vocabulary then SM26 ("There isn't one of those here.") is printed. Else
'SM8 ("I can't do that.") is printed (i.e. It is not a valid object but does
'exist in the game). Either way actions NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOG
  LET ccNoun = flags(fNoun1)
  LET ccAdjc = flags(fAdject1)
  LET objno = getObjectId(ccNoun, ccAdjc, flags(fPlayer))' HERE
  IF objno = NULLWORD THEN
    LET objno = getObjectId(ccNoun, ccAdjc, LOC_CARRIED)    ' CARRIED
    IF objno = NULLWORD THEN
      objno = getObjectId(ccNoun, ccAdjc, LOC_WORN)     ' WORN
    END IF
  END IF
  IF objno <> NULLWORD THEN
    PRIVATEDoGET(objno)
  ELSE
    PRIVATEAutoEND(26, 8) 'OK:"There isn't one of those here." KO:"I can't do that"
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
'=============================================================================
condactAUTOD:
'A search for the object number represented by Noun(Adjective)1 is made in
'the object definition section in order of location priority; carried, worn,
'here. i.e. The player is more likely to be trying to DROP a carried object
'than one that is worn or here. If an object is found its number is passed
'to the DROP action. Otherwise if there is an object in existence anywhere
'in the game or if Noun1 was not in the vocabulary then SM28 ("I don't have
'one of those.") is printed. Else SM8 ("I can't do that.") is printed (i.e.
'It is not a valid object but does exist in the game). Either way actions
'NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOD
  LET objno = PRIVATEcheckLocCARRWORNHERE()
  IF objno <> NULLWORD THEN
    PRIVATEDoDROP(objno)
  ELSE
    PRIVATEAutoEND(28, 8) ' OK:"I don't have one of these" KO:"I can't do that"
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
'=============================================================================
condactAUTOW:
'A search for the object number represented by Noun(Adjective)1 is made in
'the object definition section in order of location priority; carried, worn,
'here. i.e. The player is more likely to be trying to WEAR a carried object
'than one that is worn or here. If an object is found its number is passed
'to the WEAR action. Otherwise if there is an object in existence anywhere
'in the game or if Noun1 was not in the vocabulary then SM28 ("I don't have
'one of those.") is printed. Else SM8 ("I can't do that.") is printed (i.e.
'It is not a valid object but does exist in the game). Either way actions
'NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOW
  LET objno = PRIVATEcheckLocCARRWORNHERE()
  IF objno <> NULLWORD THEN
    PRIVATEDoWEAR(objno)
  ELSE
    PRIVATEAutoEND(28, 8) ' OK:"I don't have one of these" KO:"I can't do that"
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
'=============================================================================
condactAUTOR:
'A search for the object number represented by Noun(Adjective)1 is made in
'the object definition section in order of location priority; worn, carried,
'here. i.e. The player is more likely to be trying to REMOVE a worn object
'than one that is carried or here. If an object is found its number is passed
'to the REMOVE action. Otherwise if there is an object in existence anywhere
'in the game or if Noun1 was not in the vocabulary then SM23 ("I'm not
'wearing one of those.") is printed. Else SM8 ("I can't do that.") is printed
'(i.e. It is not a valid object but does exist in the game). Either way
'actions NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOR
  LET ccNoun = flags(fNoun1)
  LET ccAdjc = flags(fAdject1)
  LET objno = getObjectId(ccNoun, ccAdjc, LOC_WORN)         'WORN
  IF objno = NULLWORD THEN
    LET objno = getObjectId(ccNoun, ccAdjc, LOC_CARRIED)    ' CARRIED
    IF objno = NULLWORD THEN
      objno = getObjectId(ccNoun, ccAdjc,flags(fPlayer))    ' HERE
    END IF
  END IF
  IF objno <> NULLWORD THEN
    PRIVATEDoREMOVE(objno)
  ELSE
    PRIVATEAutoEND(23, 8) ' OK:"I don't have one of these" KO:"I can't do that"
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
'=============================================================================
condactPAUSE:
'Pauses for value/50 secs. However, if value is zero then the pause is for
'256/50 secs.
#ifndef DISABLE_PAUSE
  LET total = getValueOrIndirection()
  if total = 0 THEN LET total = 256
  setFrames(0)
  DO WHILE (Frames < total)
ASM
    HALT
END ASM
  LOOP
#endif
  GOTO NextCondact
'=============================================================================
condactSYNONYM:
'Substitutes the given verb and noun in the LS. Nullword (Usually '_') can be
'used to suppress substitution for one or the other - or both I suppose! e.g.
'        MATCH    ON         SYNONYM LIGHT MATCH
'        STRIKE   MATCH      SYNONYM LIGHT _
'        LIGHT    MATCH      ....                 ; Actions...
'will switch the LS into a standard format for several different entries.
'Allowing only one to deal with the actual actions.
#ifndef DISABLE_SYNONYM
  LET c = getValueOrIndirection()
  IF c <> NULLWORD LET flags(fVerb) = c
  LET c = getCondOrValueAndInc()
  IF c <> NULLWORD LET flags(fNoun1) = c
#endif
  GOTO NextCondact
'=============================================================================
condactGOTO:
'Changes the current location to locno. This effectively sets flag 38 to the value
'locno.
#ifndef DISABLE_GOTO
  LET flagno = getValueOrIndirection()
  LET flags(fPlayer) = flagno
#endif
  GOTO NextCondact
'=============================================================================
condactMESSAGE:
'/*  'Prints Message mesno., then carries out a NEWLINE action.
#ifndef DISABLE_MESSAGE
  LET flagno = getValueOrIndirection()
  printUserMsg(flagno)
  printChar(13) 'NEWLINE
#endif
  GOTO NextCondact
'=============================================================================
condactREMOVE:
'  If Object objno. is carried or at the current location (but not worn) then
'SM50 ("I'm not wearing the _.") is printed and actions NEWTEXT & DONE are
'performed.
'
'If Object objno. is not at the current location, SM23 ("I'm not wearing one
'of those.") is printed and actions NEWTEXT & DONE are performed.
'
'If Object objno. is not wearable (and thus removable) then SM41 ("I can't
'remove the _.") is printed and actions NEWTEXT & DONE are performed.
'
'If the maximum number of objects is being carried (Flag 1 is greater than,
'or the same as, Flag 37), SM42 ("I can't remove the _. My hands are full.")
'is printed and actions NEWTEXT & DONE are performed.
'
'Otherwise the position of Object objno. is changed to carried. Flag 1 is
'incremented and SM38 ("I've removed the _.") printed.
#ifndef DISABLE_REMOVE
  LET objno = getValueOrIndirection()
  PRIVATEDoREMOVE(objno)
#endif
  GOTO NextCondact
'=============================================================================
condactGET:
'  If Object objno. is worn or carried, SM25 ("I already have the _.") is printed
'  and actions NEWTEXT & DONE are performed.
'
'  If Object objno. is not at the current location, SM26 ("There isn't one of
'  those here.") is printed and actions NEWTEXT & DONE are performed.
'
'  If the total weight of the objects carried and worn by the player plus
'  Object objno. would exceed the maximum conveyable weight (Flag 52) then SM43
'  ("The _ weighs too much for me.") is printed and actions NEWTEXT & DONE are
'  performed.
'
'  If the maximum number of objects is being carried (Flag 1 is greater than,
'  or the same as, Flag 37), SM27 ("I can't carry any more things.") is printed
'  and actions NEWTEXT & DONE are performed. In addition any current DOALL loop
'  is cancelled.
'
'  Otherwise the position of Object objno. is changed to carried, Flag 1 is
'  incremented and SM36 ("I now have the _.") is printed.
#ifndef DISABLE_GET
  LET objno = getValueOrIndirection()
  PRIVATEDoGET(objno)
#endif
  GOTO NextCondact
'=============================================================================
condactDROP:
'  If Object objno. is worn then SM24 ("I can't. I'm wearing the _.") is
'  printed and actions NEWTEXT & DONE are performed.
'
'  If Object objno. is at the current location (but neither worn nor carried),
'  SM49 ("I don't have the _.") is printed and actions NEWTEXT & DONE are
'  performed.
'
'  If Object objno. is not at the current location then SM28 ("I don't have one
'  of those.") is printed and actions NEWTEXT & DONE are performed.
'
'  Otherwise the position of Object objno. is changed to the current location,
'  Flag 1 is decremented and SM39 ("I've dropped the _.") is printed.
#ifndef DISABLE_DROP
  LET objno = getValueOrIndirection()
  PRIVATEDoDROP(objno)
#endif
  GOTO NextCondact
'=============================================================================
condactWEAR:
'If Object objno. is at the current location (but not carried or worn) SM49
'("I don't have the _.") is printed and actions NEWTEXT & DONE are
'performed.
'
'If Object objno. is worn, SM29 ("I'm already wearing the _.") is printed
'and actions NEWTEXT & DONE are performed.
'
'If Object objno. is not carried, SM28 ("I don't have one of those.") is
'printed and actions NEWTEXT & DONE are performed.
'
'If Object objno. is not wearable (as specified in the object definition
'section) then SM40 ("I can't wear the _.") is printed and actions NEWTEXT &
'DONE are performed.
'
'Otherwise the position of Object objno. is changed to worn, Flag 1 is
'decremented and SM37 ("I'm now wearing the _.") is printed.
#ifndef DISABLE_WEAR
  LET objno = getValueOrIndirection()
  PRIVATEDoWEAR(objno)
#endif
  GOTO NextCondact
'=============================================================================
condactDESTROY:
'The position of Object objno. is changed to not-created and Flag 1 is
'decremented if the object was carried.
#ifndef DISABLE_DESTROY
  LET objno = getValueOrIndirection()
  LET c = PEEK(objLocation + objno)
  LET flagno = flags(fNOCarr)
  referencedObject(objno)
  IF (c = LOC_CARRIED AND flagno <> 0) THEN LET flags(fNOCarr) = flagno - 1
  POKE (objLocation + objno), LOC_NOTCREATED
#endif
  GOTO NextCondact
'=============================================================================
condactCREATE:
'The position of Object objno. is changed to the current location and Flag 1
'is decremented if the object was carried.
#ifndef DISABLE_CREATE
  LET objno = getValueOrIndirection()
  LET c = PEEK(objLocation + objno)
  LET flagno = flags(fNOCarr)
  referencedObject(objno)
  IF (c = LOC_CARRIED AND flagno <> 0) THEN LET flags(fNOCarr) = flagno - 1
  POKE (objLocation + objno), flags(fPlayer)
#endif
  GOTO NextCondact
'=============================================================================
condactSWAP:
'The positions of the two objects are exchanged. Flag 1 is not adjusted. The
'currently referenced object is set to be Object objno 2.
#ifndef DISABLE_SWAP
  LET objno = getValueOrIndirection()
  LET locno = getCondOrValueAndInc()
  LET c = PEEK(objLocation + objno)
  POKE (objLocation + objno), PEEK(objLocation + locno)
  POKE (objLocation + locno), c
  referencedObject(locno)
#endif
  GOTO NextCondact
'=============================================================================
condactPLACE:
'The position of Object objno. is changed to Location locno. Flag 1 is
'decremented if the object was carried. It is incremented if the object is
'placed at location 254 (carried).
#ifndef DISABLE_PLACE
  LET objno = getValueOrIndirection()
  LET c = PEEK(objLocation + objno)
  LET flagno = flags(fNOCarr)
  referencedObject(objno)
  IF c = LOC_CARRIED AND flagno <> 0 THEN LET flagno = flagno - 1
  LET flagno2 = PRIVATECheckLocHERE(getCondOrValueAndInc())
  POKE (objLocation + objno), flagno2
  IF flagno2 = LOC_CARRIED THEN LET flags(fNOCarr) = flagno + 1
  LET flags(fNOCarr) = flagno
#endif
  GOTO NextCondact
'=============================================================================
condactSET:
'Flag flagno. is set to 255.
#ifndef DISABLE_SET
  LET flagno = getValueOrIndirection()
  LET flags(flagno) = $FF
#endif
  GOTO NextCondact
'=============================================================================
condactCLEAR:
'Flag flagno. is cleared to 0.
#ifndef DISABLE_CLEAR
  LET flagno = getValueOrIndirection()
  LET flags(flagno) = 0
#endif
  GOTO NextCondact
'=============================================================================
condactPLUS:
'Flag flagno. is increased by value. If the result exceeds 255 the flag is
'set to 255.
#ifndef DISABLE_PLUS
  LET flagno = getValueOrIndirection()
  LET total = CAST(uInteger, getCondOrValueAndInc())
  LET total = flags(flagno) + total
  IF total > 255 THEN LET total = 255
  LET flags(flagno) = CAST(uByte, total)
#endif
  GOTO NextCondact
'=============================================================================
condactMINUS:
'Flag flagno. is decreased by value. If the result is negative the flag is
'' set to 0.
#ifndef DISABLE_MINUS
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET c = flags(flagno)
  IF flagno2 > c THEN LET c = 0 ELSE LET c = c - flagno2
  LET flags(flagno) = c
#endif
  GOTO NextCondact
'=============================================================================
condactLET:
'/*  'Flag flagno. is set to value.
#ifndef DISABLE_LET
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET flags(flagno) = flagno2
#endif
  GOTO NextCondact
' =============================================================================
'Prints a carriage return/line feed.
condactNEWLINE:
#ifndef DISABLE_NEWLINE
  printChar(13) 'NEWLINE
#endif
  GOTO NextCondact
' =============================================================================
condactPRINT:
'The decimal contents of Flag flagno. are displayed without leading or
'trailing spaces.
#ifndef DISABLE_PRINT
  printBase10(flags(getValueOrIndirection()))
#endif
  GOTO NextCondact
'=============================================================================
condactSYSMESS:
'Prints System Message sysno.
#ifndef DISABLE_SYSMESS
  printSystemMsg(getValueOrIndirection())
#endif
  GOTO NextCondact
'=============================================================================
condactISAT:
'Succeeds if Object objno. is at Location locno.
#ifndef DISABLE_ISAT
  LET objno = PEEK(objLocation + getValueOrIndirection())
  LET locno = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = ((objno = locno) OR ((locno = LOC_HERE) AND (objno = flags(fPlayer))))
#endif
  GOTO NextCondact
'=============================================================================
condactSETCO:
'Sets the currently referenced object to objno.
#ifndef DISABLE_SETCO
  referencedObject(getValueOrIndirection())
#endif
  GOTO NextCondact
' =============================================================================
'Will simply print a space to the current output stream. Shorter than MES Space!
condactSPACE:
#ifndef DISABLE_SPACE
  printChar(32)
#endif
  GOTO NextCondact
' =============================================================================
condactHASAT:
'Checks the attribute specified by value. 0-15 are the object attributes for
'the current object. There are also several attribute numbers specified as
'symbols in SYMBOLS.SCE which check certain parts of the DAAD system flags
#ifndef DISABLE_HASAT
  PRIVATEDoHASAT(getValueOrIndirection, FALSE)
#endif
  GOTO NextCondact
condactHASNAT:
#ifndef DISABLE_HASNAT
  PRIVATEDoHASAT(getValueOrIndirection, TRUE)
#endif
  GOTO NextCondact
' =============================================================================
condactLISTOBJ:
'If any objects are present then SM1 ("I can also see:") is printed, followed
'by a list of all objects present at the current location.
'If there are no objects then nothing is printed.
#ifndef DISABLE_LISTOBJ
  PRIVATEDoLISTAT(flags(fPlayer), TRUE)
  LET flagno = flags(fOFlags)
  IF (flagno bAND F53_LISTED) THEN
    IF (flagno bAND F53_CONT) THEN
      printSystemMsg(48)'".\n"
    END IF
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactEXTERN:
#ifndef DISABLE_EXTERN
  'Maluva emulation
  LET c = getValueOrIndirection() 'parameter 1
  LET flagno = getCondOrValueAndInc() 'operation
  LET flagno2 = TRUE
  LET locno = flags(fMALUVA)

  IF flagno = 3 THEN 'XMESSAGE
    LET objno = getCondOrValueAndInc() 'parameter 2 (MSB)
    LET flagno2 = printMaluvaExtraMsg(c, objno, TRUE)
  ELSEIF flagno = 0 THEN 'XPICTURE
#ifdef TAPE
    LET flagno2 = preparePicture(c)
    IF flagno2 THEN showBufferedPicture()
#else
    LET flagno2 = loadXPicture(c)
    IF flagno2 THEN showBufferedPicture()
#endif
  ELSEIF flagno = 1 THEN 'XSAVE
    PRIVATEDoSAVE(c)
    GOTO NextCondact
  ELSEIF flagno = 2 THEN 'XLOAD
    PRIVATEDoLOAD(c)
    GOTO NextCondact
  ELSEIF flagno = 7 THEN 'XUNDONE
    LET isDone = FALSE
    GOTO NextCondact
  /'
  ELSEIF flagno = 4 THEN 'XPART

  ELSEIF flagno = 6 THEN 'XSPLITSCR

  ELSEIF flagno = 8 THEN 'XNEXTCLS

  ELSEIF flagno = 9 THEN 'XNEXTRST

  ELSEIF flagno = 10 THEN 'XSPEED
'/
  ELSEIF flagno = 100 THEN 'Custom Condact Jump to Bank
    'Changes to bank n and calls $c000
    LET objno = getCondOrValueAndInc() 'parameter 2
    LET flagno2 = jumpToBank(c, objno)
  ELSE 'Unknown command, call to extern
    LET addr = PEEK(uInteger, tmpTok + VECTOR_OFFSET + 0)
    IF addr <> 0 THEN 
      LET condactProc(currProc) = 1 + _
          doCALL(c, @flags(c), (objLocation + c), condactProc(currProc)-1, addr)
    END IF
    GOTO NextCondact
  END IF

  IF flagno2 THEN
    LET locno = locno bAND %01111111
  ELSE
    LET locno = locno bOR %10000000
  END IF

  IF (locno bAND 1) THEN LET isDone = flagno2

  LET flags(fMALUVA) = locno

#endif
  GOTO NextCondact
' =============================================================================
condactRAMSAVE:
'In a similar way to SAVE this action saves all the information relevant to
'the game in progress not onto disc but into a memory buffer. This buffer is
'of course volatile and will be destroyed when the machine is turned off
'which should be made clear to the player. The next action is always carried
'out.
#ifndef DISABLE_RAMSAVE
  MemCopy(@flags(0), ramSave, 256 + DdbNumObjDsc)
#endif
  GOTO NextCondact
' =============================================================================
condactRAMLOAD:
'This action is the counterpart of RAMSAVE and allows the saved buffer to be
'restored. The parameter specifies the last flag to be reloaded which can be
'used to preserve values over a restore.
'Note 1: The RAM actions could be used to implement an OOPS command that is
'common on other systems to take back the previous move; by creating an entry
'in the main loop which does an automatic RAMSAVE every time the player enters
'a move.
'Note 2: These four actions allow the next Condact to be carried out. They
'should normally always be followed by a RESTART or describe in order that
'the game state is restored to an identical position.
#ifndef DISABLE_RAMLOAD
  LET pPROC = CAST(uInteger, getValueOrIndirection()) + 1
  MemCopy(ramSave, @flags(0), pPROC + DdbNumObjDsc)
#endif
  GOTO NextCondact
' =============================================================================
condactBEEP:
  PRIVATEDoBEEP()
  GOTO NextCondact
' =============================================================================
condactPAPER:
' Set paper colour acording to the lookup table given in the graphics editors
#ifndef DISABLE_PAPER
  PAPER(PRIVATEGetColor())
#endif
  GOTO NextCondact
' =============================================================================
condactINK:
' Set text colour acording to the lookup table given in the graphics editors
#ifndef DISABLE_INK
  INK(PRIVATEGetColor())
#endif
  GOTO NextCondact
' =============================================================================
condactBORDER:
#ifndef DISABLE_BORDER
  'Set border colour acording to the lookup table given in the graphics editors.'
  LET borderScr = getValueOrIndirection() bAND %111
  BORDER(borderScr)
#endif
  GOTO NextCondact
' =============================================================================
condactPREP:
'Succeeds if the preposition in the current LS is word.
#ifndef DISABLE_PREP
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(fPrep) = flagno)
#endif
  GOTO NextCondact
' =============================================================================
condactNOUN2:
' Succeeds if the second noun in the current LS is word.
#ifndef DISABLE_NOUN2
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(fNoun2) = flagno)
#endif
  GOTO NextCondact
' =============================================================================
condactADJECT2:
'Succeeds if the second noun's adjective in the current LS is word.
#ifndef DISABLE_ADJECT2
  LET flagno = getValueOrIndirection()
  LET continueEntryProc(currProc) = (flags(fAdject2) = flagno)
#endif
  GOTO NextCondact
' =============================================================================
condactADD:
'Flag flagno 2 has the contents of Flag flagno 1 added to it. If the result
'exceeds 255 the flag is set to 255.
#ifndef DISABLE_ADD
  LET flagno = getValueOrIndirection()
  LET total = flags(flagno)
  LET flagno2 = getCondOrValueAndInc()
  LET total = total + CAST(uInteger, flags(flagno2))
  IF total > 255 THEN LET total = 255
  LET flags(flagno2) = CAST(uByte, total)
#endif
  GOTO NextCondact
' =============================================================================
condactSUB:
'Flag flagno 2 has the contents of Flag flagno 1 subtracted from it. If the
'result is negative the flag is set to 0.
#ifndef DISABLE_SUB
  LET flagno = getValueOrIndirection()
  LET flagno = flags(flagno)
  LET flagno2 = getCondOrValueAndInc()
  LET c = flags(flagno2)
  IF flagno > c THEN LET c = 0 ELSE LET c = c - flagno
  LET flags(flagno2) = c
#endif
  GOTO NextCondact
' =============================================================================
condactPARSE:
'The parameter 'n' controls which level of string indentation is to be
'searched. At the moment only two are supported by the interpreters so only
'the values 0 and 1 are valid.
'  0 - Parse the main input line for the next LS.
'  1 - Parse any string (phrase enclosed in quotes [""]) that was contained
'      in the last LS extracted.
#ifndef DISABLE_PARSE
  IF getValueOrIndirection() = 0 THEN 'PARSE 0
    continueEntryProc(currProc) = NOT getLogicalSentence()
  ELSE 'PARSE 1
    continueEntryProc(currProc) = NOT useLiteralSentence()
  END IF
  isDone = FALSE
#endif
  GOTO NextCondact
' =============================================================================
condactLISTAT:
'If any objects are present then they are listed. Otherwise SM53 ("nothing.")
'is printed - note that you will usually have to precede this action with a
'message along the lines of "In the bag is:" etc.
#ifndef DISABLE_LISTAT
  PRIVATEDoLISTAT(getValueOrIndirection(), FALSE)
  LET flagno = flags(fOFlags)
  IF (flagno bAND F53_LISTED) THEN
    IF (flagno bAND F53_CONT) THEN
      printSystemMsg(51)'".\n"
    END IF
  ELSE
    printSystemMsg(53)'"Nada.\n"
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactPROCESS:
' This powerful action transfers the attention of DAAD to the specified Process
'table number. Note that it is a true subroutine call and any exit from the
'new table (e.g. DONE, OK etc) will return control to the condact which follows
'the calling PROCESS action. A sub-process can call (nest) further process' to
' a depth of 10 at which point a run time error will be generated.
#ifndef DISABLE_PROCESS
  pushPROC(getValueOrIndirection())
#endif
  GOTO NextCondact
' =============================================================================
condactSAME:
'Succeeds if Flag flagno 1 has the same value as Flag flagno 2.
#ifndef DISABLE_SAME
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = (flags(flagno) = flags(flagno2))
#endif
  GOTO NextCondact
' =============================================================================
condactMES:
'Prints Message mesno.
#ifndef DISABLE_MES
  printUserMsg(getValueOrIndirection())
#endif
  GOTO NextCondact
' =============================================================================
condactWINDOW:
'Selects window (0-7) as current print output stream.
#ifndef DISABLE_WINDOW
  LET c = getValueOrIndirection()
  IF c >= WINDOWS_NUM THEN GOTO NextCondact
  LET flagno = flags(fCurWin)
  pushCurrentWindow(flagno)
  popCurrentWindow(c)
  LET flags(fCurWin) = c
#endif
  GOTO NextCondact
' =============================================================================
condactNOTEQ:
'Succeeds if Flag flagno. is not equal to value.
#ifndef DISABLE_NOTEQ
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = (flags(flagno) <> flagno2)
#endif
  GOTO NextCondact
' =============================================================================
condactNOTSAME:
'Succeeds if Flag flagno 1 does not have the same value as Flag flagno 2.
#ifndef DISABLE_NOTSAME
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = (flags(flagno) <> flags(flagno2))
#endif
  GOTO NextCondact
' =============================================================================
condactMODE:
'Allows the current window to have its operation flags changed. In order to
'calculate the number to use for the option just add the numbers shown next
'to each item to achieve the required bitmask combination:
'  1 - Use the upper character set. (A permanent ^G)
'  2 - SM32 ("More...") will not appear when the window fills.
'e.g. MODE 3 stops the 'More...' prompt and causes all to be translated to
'the 128-256 range.
#ifndef DISABLE_MODE
  LET flagno = getValueOrIndirection()
  LET cwinMode = flagno bAND %11
#endif
  GOTO NextCondact
' =============================================================================
condactWINAT:
'Sets current window to start at given line and column. Height and width to fit
'available screen.
#ifndef DISABLE_WINAT
  LET cwinY = getValueOrIndirection()
  LET cwinX = getCondOrValueAndInc()
  PRIVATEwindowCheck()
  LET ccursorX = 0
  LET ccursorY = 0
  LET lastPicShow = FALSE
  LET lastPicId = NO_LASTPICTURE
  LET printedLines = 0
#endif
  GOTO NextCondact
' =============================================================================
condactTIME:
'Allows input to be set to 'timeout' after a specific duration in 1 second
'intervals, i.e. the Process 2 table will be called again if the player types
'nothing for the specified period. This action alters flags 48 & 49. 'option'
'allows this to also occur on ANYKEY and the "More..." prompt. In order to
'calculate the number to use for the option just add the numbers shown next to
'each item to achieve the required combination;
'    1 - While waiting for first character of Input only.
'    2 - While waiting for the key on the "More..." prompt.
'    4 - While waiting for the key on the ANYKEY action.
'e.g. TIME 5 6 (option = 2+4) will allow 5 seconds of inactivity on behalf of
'the player on input, ANYKEY or "More..." and between each key press. Whereas
'TIME 5 3 (option = 1+2) allows it only on the first character of input and on
'"More...".
'TIME 0 0 will stop timeouts (default).
#ifndef DISABLE_TIME
  LET flags(fTime) = getValueOrIndirection()        '<duration> Timeout duration required
  LET c = (getCondOrValueAndInc() bAND $07)         '<option> Timeout Control bitmask flags
  LET flags(fTIFlags) = (flags(fTIFlags) bAND $f8) bOR c
#endif
  GOTO NextCondact
' =============================================================================
condactPICTURE:
'Will load into the picture buffer the given picture. If there no corresponding
'picture the next entry will be carried out, if there is then the next CondAct
'is executed.
#ifndef DISABLE_PICTURE
  LET flagno = getValueOrIndirection()

#ifdef TAPE
  LET continueEntryProc(currProc) = preparePicture(flagno)
#endif
#ifndef TAPE
  LET continueEntryProc(currProc) = loadXPicture(flagno)
#endif

#endif
  GOTO NextCondact
' =============================================================================
condactDOALL:
'Another powerful action which allows the implementation 'ALL' type command.
'
'   1 - An attempt is made to find an object at Location locno.
'       If this is unsuccessful the DOALL is cancelled and action DONE is performed.
'   2 - The object number is converted into the LS Noun1 (and Adjective1 if present)
'       by reference to the object definition section. If Noun(Adjective)1 matches
'       Noun(Adjective)2 then a return is made to step 1. This implements the "Verb
'       ALL EXCEPT object" facility of the parser.
'   3 - The next condact and/or entry in the table is then considered. This
'       effectively converts a phrase of "Verb All" into "Verb object" which is
'       then processed by the table as if the player had typed it in.
'   4 - When an attempt is made to exit the current table, if the DOALL is still
'       active (i.e. has not been cancelled by an action) then the attention of
'       DAAD is returned to the DOALL as from step 1; with the object search
'       continuing from the next highest object number to that just considered.
'
'   The main ramification of the search method through the object definition
'   section is; objects which have the Same Noun(Adjective) description (where the
'   game works out which object is referred to by its presence) must be checked for
'   in ascending order of object number, or one of them may be missed.
'   Use the of DOALL to implement things like OPEN ALL must account for fact that
'   doors are often flags only and would have to bemade into objects if they were to
'   be included in a DOALL.
#ifndef DISABLE_DOALL
  IF condactDOALLProc(currProc) THEN errorCode(4)
  LET pPROC = condactProc(currProc) + 1
  LET condactDOALLProc(currProc) = pPROC
  LET condactProc(currProc) = pPROC
  LET entryDOALLProc(currProc) = entryProc(currProc)
  LET nobjDOALLProc(currProc) = 0
  LET flags(fDAObjNo) = $FF

  PRIVATEDoALL()
#endif
  GOTO NextCondact
' =============================================================================
condactMOUSE:
  GOTO condactNOT_USED

condactGFX:
  'TODO
  GOTO condactNOT_USED
' =============================================================================
condactISNOTAT:
'Succeeds if Object objno. is not at Location locno
#ifndef DISABLE_ISNOTAT
  LET flagno = getValueOrIndirection()
  LET objno = PEEK(objLocation + flagno)
  LET locno = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = NOT ((objno = locno) OR ((locno = LOC_HERE) AND (objno = flags(fPlayer))))
#endif
  GOTO NextCondact
' =============================================================================
condactWEIGH:
'The true weight of Object objno. is calculated (i.e. if it is a container,
'any objects inside have their weight added - don't forget that nested
'containers stop adding their contents after ten levels) and the value is
'placed in Flag flagno. This will have a maximum value of 255 which will not
'be exceeded. If Object objno. is a container of zero weight, Flag flagno
'will be cleared as objects in zero weight containers, also weigh zero!
#ifndef DISABLE_WEIGH
  LET objno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET c = getObjectWeight(objno)
  LET flags(flagno2) = c
#endif
  GOTO NextCondact
' =============================================================================
condactPUTIN:
'  If Object objno. is worn then SM24 ("I can't. I'm wearing the _.") is
'  printed and actions NEWTEXT & DONE are performed.
'
'  If Object objno. is at the current location (but neither worn nor carried),
'  SM49 ("I don't have the _.") is printed and actions NEWTEXT & DONE are
'  performed.
'
'  If Object objno. is not at the current location, but not carried, then SM28
'  ("I don't have one of those.") is printed and actions NEWTEXT & DONE are
'  performed.
'
'  Otherwise the position of Object objno. is changed to Location locno.
'  Flag 1 is decremented and SM44 ("The _ is in the"), a description of Object
'  locno. and SM51 (".") is printed.
#ifndef DISABLE_PUTIN
  LET objno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  PRIVATEDoPUTIN(objno, flagno2)
#endif
  GOTO NextCondact
' =============================================================================
condactTAKEOUT:
'  If Object objno. is worn or carried, SM25 ("I already have the _.") is printed
'  and actions NEWTEXT & DONE are performed.
'
'  If Object objno. is at the current location, SM45 ("The _ isn't in the"), a
'  description of Object locno. and SM51 (".") is printed and actions NEWTEXT &
'  DONE are performed.
'
'  If Object objno. is not at the current location and not at Location locno.
'  then SM52 ("There isn't one of those in the"), a description of Object locno.
'  and SM51 (".") is printed and actions NEWTEXT & DONE are performed.
'
'  If Object locno. is not carried or worn, and the total weight of the objects
'  carried and worn by the player plus Object objno. would exceed the maximum
'  conveyable weight (Flag 52) then SM43 ("The _ weighs too much for me.") is
'  printed and actions NEWTEXT & DONE are performed.
'
'  If the maximum number of objects is being carried (Flag 1 is greater than,
'  or the same as, Flag 37), SM27 ("I can't carry any more things.") is printed
'  and actions NEWTEXT & DONE are performed. In addition any current DOALL loop
'  is cancelled.
'
'  Otherwise the position of Object objno. is changed to carried, Flag 1 is
'  incremented and SM36 ("I now have the _.") is printed.Note: No check is made,
'  by either PUTIN or TAKEOUT, that Object locno. is actually present. This must
'  be carried out by you if required.
#ifndef DISABLE_TAKEOUT
  LET objno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  PRIVATEDoTAKEOUT(objno, flagno2)
#endif
  GOTO NextCondact
' =============================================================================
condactNEWTEXT:
'Forces the loss of any remaining phrases on the current input line. You
'would use this to prevent the player continuing without a fresh input
'should something go badly for his situation. e.g. the GET action carries
'out a NEWTEXT if it fails to get the required object for any reason, to
'prevent disaster with a sentence such as:
'    GET SWORD AND KILL ORC WITH IT
'as attacking the ORC without the sword may be dangerous!
#ifndef DISABLE_NEWTEXT
  clearLogicalSentences()
#endif
  GOTO NextCondact
' =============================================================================
condactABILITY:
'This sets Flag 37, the maximum number of objects conveyable, to value 1 and
'Flag 52, the maximum weight of objects the player may carry and wear at any
'one time (or their strength), to be value 2 .
'No checks are made to ensure that the player is not already carrying more
'than the maximum. GET and so on, which check the values, will still work
'correctly and prevent the player carrying any more objects, even if you set
'the value lower than that which is already carried!
#ifndef DISABLE_ABILITY
  LET flags(fMaxCarr) = getValueOrIndirection()
  LET flags(fStrength) = getCondOrValueAndInc()
#endif
  GOTO NextCondact
' =============================================================================
condactWEIGHT:
'Calculates the true weight of all objects carried and worn by the player
'(i.e. any containers will have the weight of their contents added up to a
'maximum of 255), this value is then placed in Flag flagno.
'This would be useful to ensure the player was not carrying too much weight
'to cross a bridge without it collapsing etc.
#ifndef DISABLE_WEIGHT
  LET flagno = getValueOrIndirection()
  LET flags(flagno) = getObjectWeight(NULLWORD)
#endif
  GOTO NextCondact
' =============================================================================
condactRANDOM:
'Flag flagno. is set to a number from the Pseudo-random sequence from 1
'to 100
#ifndef DISABLE_RANDOM
  LET flagno = getValueOrIndirection()
  LET flags(flagno) = (rand() MOD 100) + 1
#endif
  GOTO NextCondact
' =============================================================================
condactINPUT:
'  The 'stream' parameter will set the bulk of input to come from the given
'  window/stream. A value of 0 for 'stream' will not use the graphics stream
'  as might be expected, but instead causes input to come from the current
'  stream when the input occurs.
'  Bitmask options:
'    1 - Clear window after input.
'    2 - Reprint input line in current stream when complete.
'    4 - Reprint current text of input after a timeout.
#ifndef DISABLE_INPUT
  '//'TODO: INPUT not fully implemented
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  IF flagno >= WINDOWS_NUM THEN GOTO NextCondact
  LET flags(fInStream) = flagno
  LET flagno2 = (flagno2 bAND $07) << 3
  LET flags(fTIFlags) = (flags(fTIFlags) bAND $c7) bOR flagno2
#endif
  GOTO NextCondact
' =============================================================================
condactSAVEAT:
#ifndef DISABLE_SAVEAT
  LET savedPosX = ccursorX
  LET savedPosY = ccursorY
#endif
  GOTO NextCondact
' =============================================================================
condactBACKAT:
#ifndef DISABLE_BACKAT
  LET ccursorX = savedPosX
  LET ccursorY = savedPosY
#endif
  GOTO NextCondact
' =============================================================================
condactPRINTAT:
'Sets current print position to given point if in current window. If not then
'print position becomes top left of window.
#ifndef DISABLE_PRINTAT
  LET ccursorY = getValueOrIndirection()
  LET ccursorX = getCondOrValueAndInc()
  IF ccursorX >= cwinW OR ccursorY >= cwinH THEN
    LET ccursorX = 0
    LET ccursorY = 0
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactWHATO:
'A search for the object number represented by Noun(Adjective)1 is made in
'the object definition section in order of location priority; carried, worn,
'here. This is because it is assumed any use of WHATO will be related to
'carried objects rather than any that are worn or here. If an object is found
'its number is placedin flag 51, along with the standard current object
'parameters in flags 54-57. This allows you to create other auto actions (the
'tutorial gives an example of this for dropping objects in the tree). */
#ifndef DISABLE_WHATO
  LET objno = PRIVATEcheckLocCARRWORNHERE()
  IF objno = NULLWORD THEN LET objno = getObjectId(flags(fNoun1), flags(fAdject1), LOC_HERE)
  referencedObject(objno)
#endif
  GOTO NextCondact
' =============================================================================
condactCALL:
#ifndef DISABLE_CALL
  LET objno = getCondOrValueAndInc()
  LET addr = (CAST(uInteger, getCondOrValueAndInc()) << 8) bOR objno
  LET condactProc(currProc) = doCALL(0, 0, 0, condactProc(currProc), addr)
#endif
  GOTO NextCondact
' =============================================================================
condactPUTO:
'The position of the currently referenced object (i.e. that object whose
'number is given in flag 51), is changed to be Location locno. Flag 54
'remains its old location. Flag 1 is decremented if the object was carried.
'It is incremented if the object is placed at location 254 (carried). */
#ifndef DISABLE_PUTO
  LET objno = flags(fCONum)
  LET locno = PEEK(objLocation + objno)
  LET c = flags(fNOCarr)
  IF locno = LOC_CARRIED AND c <> 0 THEN LET c = c - 1
  LET locno = PRIVATECheckLocHERE(getValueOrIndirection())
  POKE (objLocation + objno), locno
  IF locno = LOC_CARRIED THEN LET c = c + 1
  LET flags(fNOCarr) = c
#endif
  GOTO NextCondact
' =============================================================================
condactNOTDONE:
'This action jumps to the end of the process table and flags PAW that #no#
'action has been carried out. i.e. no more condacts or entries are considered.
'A return will thus be made to the previous calling process table or to the
'start point of any active DOALL loop. This will cause PAW to print one of the
'"I can't" messages if needed. i.e. if no other action is carried out and no
'entry is present in the connections section for the current Verb.
#ifndef DISABLE_NOTDONE
  IF condactDOALLProc(currProc) THEN
    PRIVATEDoALL()
  ELSE
    isDone = FALSE
    popPROC()
  END IF
#endif
GOTO NextCondact
' =============================================================================
condactAUTOP:
'A search for the object number represented by Noun(Adjective)1 is made in the
'object definition section in order of location priority; carried, worn, here.
'i.e. The player is more likely to be trying to PUT a carried object inside
'another than one that is worn or here. If an object is found its number is
'passed to the PUTIN action. Otherwise if there is an object in existence
'anywhere in the game or if Noun1 was not in the vocabulary then SM28 ("I don't
'have one of those.") is printed. Else SM8 ("I can't do that.") is printed
'(i.e. It is not a valid object but does exist in the game). Either way actions
'NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOP
  LET objno = PRIVATEcheckLocCARRWORNHERE()
  IF objno <> NULLWORD THEN
    PRIVATEDoPUTIN(objno, getValueOrIndirection())
  ELSE
    PRIVATEAutoEND(28, 8)'OK:"I don't have one of these" KO:"I can't do that")
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactAUTOT:
'A search for the object number represented by Noun(Adjective)1 is made in the
'object definition section in order of location priority; in container,
'carried, worn, here. i.e. The player is more likely to be trying to get an
'object out of a container which is actually in there than one that is carried,
'worn or here. If an object is found its number is passed to the TAKEOUT action.
'Otherwise if there is an object in existence anywhere in the game or if Noun1
'was not in the vocabulary then SM52 ("There isn't one of those in the"), a
'description of Object locno. and SM51 (".") is printed. Else SM8 ("I can't do
'that.") is printed (i.e. It is not a valid object but does exist in the game).
'Either way actions NEWTEXT & DONE are performed
#ifndef DISABLE_AUTOT
  LET locno = getValueOrIndirection()
  LET ccNoun = flags(fNoun1)
  LET ccAdjc = flags(fAdject1)
  LET objno = getObjectId(ccNoun, ccAdjc, locno) 'On Location
  IF objno = NULLWORD THEN
    LET objno = getObjectId(ccNoun, ccAdjc, LOC_CARRIED) ' CARRIED
    IF objno = NULLWORD THEN
      LET objno = getObjectId(ccNoun, ccAdjc, LOC_WORN)      'WORN
      IF objno = NULLWORD THEN
        LET objno = getObjectId(ccNoun, ccAdjc, flags(fPlayer)) 'HERE
      END IF
    END IF
  END IF
  IF objno <> NULLWORD THEN
    PRIVATEDoTAKEOUT(objno, locno)
  ELSE
    LET objno = getObjectId(ccNoun, ccAdjc, LOC_HERE)
    IF objno <> NULLWORD OR ccNoun = NULLWORD THEN
      printSystemMsg(52)                 '' "There isn't one of those in the"
      printObjectMsg(locno, FALSE)       '' Print locno object description
      printSystemMsg(51)                 '' "."
    ELSE
      printSystemMsg(8)                  '' "I can't do that"
    END IF
    clearLogicalSentences()
    PRIVATEDoDONE()
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactMOVE:
'This is a very powerful action designed to manipulate PSI's. It allows the
'current LS Verb to be used to scan the connections section for the location
'given in Flag flagno.
'If the Verb is found then Flag flagno is changed to be the location number
'associated with it, and the next condact is considered.
'If the verb is not found, or the original location number was invalid, then
'PAW considers the next entry in the table - if present.
#ifndef DISABLE_MOVE
  LET flagno = getValueOrIndirection()
  LET ccVerb = flags(fVerb)

  IF ccVerb < 14 THEN
    LET pPROC = PEEK(uInteger, (DdbConLstPos + 2 * CAST(uInteger, flags(fPlayer))))
    LET c = PEEK(pPROC)
    DO WHILE c <> $FF
      IF c = ccVerb THEN
        LET flags(flagno) = PEEK(pPROC + 1)
        GOTO NextCondact
      END IF
      LET pPROC = pPROC + 2
      LET c = PEEK(pPROC)
    LOOP
  END IF
  LET continueEntryProc(currProc) = FALSE
#endif
  GOTO NextCondact
' =============================================================================
condactWINSIZE:
#ifndef DISABLE_WINSIZE
  LET cwinH = getValueOrIndirection()
  LET cwinW = getCondOrValueAndInc()
  PRIVATEwindowCheck()
  LET ccursorX = 0
  LET ccursorY = 0
  LET lastPicShow = FALSE
  LET lastPicId = NO_LASTPICTURE
  LET printedLines = 0
#endif
  GOTO NextCondact
' =============================================================================
'Will restart the currently executing table (Incomplete?)
condactREDO:
#ifndef DISABLE_REDO
  LET pPROC = entryIniProc(currProc)
  LET entryProc(currProc) = pPROC
  LET pPROC = PEEK(uInteger, pPROC + 2)
  LET condactIniProc(currProc) = pPROC
  LET condactProc(currProc) = pPROC
#endif
  GOTO NextCondact
' =============================================================================
condactCENTRE:
'Will ensure the current window is centered for the current column width of the
'screen. (Does not affect line position).
#ifndef DISABLE_CENTRE
  LET c = flags(fCurWin)
  LET winX(c) = (MAX_COLUMNS - winW(c)) >> 1
#endif
  GOTO NextCondact
' =============================================================================
condactEXIT:
'If value is 0 then will return directly to the operating system.
'Any value other than 0 will restart the whole game. Note that unlike RESTART
'which only restarts processing, this will clear and reset windows etc. The
'non zero numbers actually specify a part number to jump to on AUTOLOAD
'versions. Only the PCW supports this feature at the moment. It will probably
'be added to PC as part of the HYPERCARD work. So if you intend using it as a
'reset ensure you use your PART number as the non zero value! */
#ifndef DISABLE_EXIT
  IF NOT getValueOrIndirection() THEN resetSys()
  initFlags()
  PRIVATEDoRESET()
  PRIVATEDoRESTART()
#endif
  GOTO NextCondact
' =============================================================================
condactINKEY:
' Is a condition which will be satisfied if the player is pressing a key.
' In 16Bit machines Flags Key1 and Key2 (60 & 61) will be a standard IBM ASCII
' code pair.
' On 8 bit only Key1 will be valid, and the code will be machine specific
#ifndef DISABLE_INKEY
  LET flagno = (PEEK LastKAddress)
  IF flagno <> 0 THEN
    LET flags(fKey1) = flagno
    POKE LastKAddress, 0
  END IF
  LET continueEntryProc(currProc) = flagno <> 0
#endif
  GOTO NextCondact
' =============================================================================
condactBIGGER:
'Will be true if flagno 1 is larger than flagno 2
#ifndef DISABLE_BIGGER
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = (flags(flagno) > flags(flagno2))
#endif
  GOTO NextCondact
' =============================================================================
condactSMALLER:
'Will be true if flagno 1 is smaller than flagno 2 */
#ifndef DISABLE_SMALLER
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET continueEntryProc(currProc) = (flags(flagno) < flags(flagno2))
#endif
  GOTO NextCondact
' =============================================================================
condactISDONE:
'Succeeds if the last table ended by exiting after executing at least one
'Action. This is useful to test for a single succeed/fail boolean value from
'a Sub-Process. A DONE action will cause the 'done' condition, as will any
'condact causing exit, or falling off the end of the table - assuming at
'least one CondAct (other than NOTDONE) was done.
'See also ISNDONE and NOTDONE actions.
#ifndef DISABLE_ISDONE
  LET continueEntryProc(currProc) = isDone
#endif
  GOTO NextCondact
' =============================================================================
condactISNDONE:
'Succeeds if the last table ended without doing anything or with a NOTDONE
'action.
#ifndef DISABLE_ISNDONE
  LET continueEntryProc(currProc) = NOT isDone
#endif
  GOTO NextCondact
' =============================================================================
condactSKIP:
'  Skip a distance of -128 to 128, or to the specified label. Will move the
'  current entry in a table back or fore. 0 means next entry (so is meaningless).
'  -1 means restart current entry (Dangerous).
#ifndef DISABLE_SKIP
  stepPROCEntryCondacts(CAST(Byte, getValueOrIndirection()))
#endif
  GOTO NextCondact
' =============================================================================
condactRESTART:
'Will cancel any DOALL loop, any sub-process calls and make a jump
''  to execute process 0 again from the start.
#ifndef DISABLE_RESTART
  PRIVATEDoRESTART()
#endif
  GOTO NextCondact
' =============================================================================
condactTAB:
'Sets current print position to given column on current line.
#ifndef DISABLE_TAB
  LET ccursorX = getValueOrIndirection()
  IF ccursorX >= cwinW THEN
    LET ccursorX = 0
  END IF
#endif
  GOTO NextCondact
' =============================================================================
condactCOPYOF:
'The position of Object objno. is copied into Flag flagno. This could be used
'to examine the location of an object in a comparison with another flag value.
#ifndef DISABLE_COPYOF
  LET objno = PEEK(objLocation + getValueOrIndirection())
  LET flags(getCondOrValueAndInc()) = objno
#endif
  GOTO NextCondact
' =============================================================================
condactCOPYOO:
'The position of Object objno2 is set to be the same as the position of
'Object Objno1. The currently referenced object is set to be Object objno2
#ifndef DISABLE_COPYOO
  LET objno = getValueOrIndirection()
  LET c = getCondOrValueAndInc()
  POKE (objLocation + c), PEEK(objLocation + objno)
  referencedObject(c)
#endif
  GOTO NextCondact
' =============================================================================
condactCOPYFO:
'The position of Object objno. is set to be the contents of Flag flagno. An
'attempt to copy from a flag containing 255 will result in a run time error.
'Setting an object to an invalid location will still be accepted as it
'presents no danger to the operation of PAW.
#ifndef DISABLE_COPYFO
  LET flagno = getValueOrIndirection()
  LET flagno = flags(flagno)
  LET objno = getCondOrValueAndInc()
  POKE (objLocation + objno), flagno
  IF flagno = 255 THEN errorCode(2)
#endif
  GOTO NextCondact
' =============================================================================
condactCOPYFF:
'The contents of Flag flagno 1 is copied to Flag flagno 2.
#ifndef DISABLE_COPYFF
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET flags(flagno2) = flags(flagno)
#endif
  GOTO NextCondact
' =============================================================================
condactCOPYBF:
' Same as COPYFF but the source and destination are reversed, so that
'indirection can be used.
#ifndef DISABLE_COPYBF
  LET flagno = getValueOrIndirection()
  LET flagno2 = getCondOrValueAndInc()
  LET flags(flagno) = flags(flagno2)
#endif
  GOTO NextCondact
' =============================================================================
condactRESET:
'This Action bears no resemblance to the one with the same name in PAW. It has
'the pure function of placing all objects at the position given in the Object
'start table. It also sets the relevant flags dealing with no of objects
'carried etc.
#ifndef DISABLE_RESET
  PRIVATEDoRESET()
#endif
  GOTO NextCondact
' =============================================================================
condactNOT_USED:
  errorCode(5)
'==============================================================================
'==============================================================================
'Interrupt routine
ASM

FlagsPtr:
    DEFW 0          ;Pointer to flags

IntVectorPtr:       ;Value of INT vector on DDB
    DEFW 0

ISR:
PROC
    LOCAL jumpIsr

    PUSH HL
    PUSH BC
    PUSH DE
    PUSH IX
    PUSH IY
    PUSH AF                       ; Saving context

    LD A, %00010000               ; Sets Bank 0
    CALL _SetRAMBank
    PUSH AF

    ;Interrupt vector
    LD IX, (FlagsPtr)
    LD HL, (IntVectorPtr)
    LD (jumpIsr+1), HL
    LD A, H
    OR L
jumpIsr:
    CALL NZ, 0           ; Calling INT routine, on HL is the routine address

    POP AF               ; Recover bank from stack
    CALL _SetRAMBank     ; Restore current bank

    POP AF               ; Restoring context
    POP IY
    POP IX
    POP DE
    POP BC
    POP HL
    JP $38               ;Default IM1 address

ENDP
EndISR:
    ALIGN 256
IMvect:
    DEFS 258,$AD    ;Interrupt vector
END ASM
'==============================================================================
/'
SUB copyCompressedPicture(bankOrig AS uByte , size AS uInteger, origAddr AS uInteger)

  CONST BuffSize AS uInteger = 512
   
  DIM destAddr AS uInteger = $C500  'Decompression buffer
  DIM buffer, csize AS uInteger
  DIM b, bankDest AS uByte

  LET buffer = callocate(BuffSize)
  LET b = currBank
  LET bankDest = DdbBnkImgIdx bOR ROM48KBASIC
  LET bankOrig = bankOrig bOR ROM48KBASIC

  DO UNTIL size = 0
    IF size >= BuffSize THEN
      LET csize = BuffSize
    ELSE
      LET csize = size
    END IF
    SetRAMBank(bankOrig)
    MemCopy(origAddr, buffer, csize)
    SetRAMBank(bankDest)
    MemCopy(buffer, destAddr, csize)
    LET origAddr = origAddr + csize
    LET destAddr = destAddr + csize
    LET size = size - csize
  LOOP

  SetRAMBank(b)
  deallocate(buffer)

END SUB
LET DdbImgIdxPos=@copyCompressedPicture
'/
#pragma pop(case_insensitive)
#endif
