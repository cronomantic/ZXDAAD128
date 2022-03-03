#ifndef __PLUS3DOS__
#define __PLUS3DOS__

' (C) Cronomantic 2022 - This code is released under the GPL v3 license

DECLARE FUNCTION FASTCALL SetRAMBank(nbank AS uByte) AS uByte


SUB FASTCALL InitPlus3Disc()

  SetRAMBank(7)
ASM

DOS_OPEN      EQU $0106
DOS_CLOSE     EQU $0109
DOS_ABANDON   EQU $010C
DOS_READ      EQU $0112
DOS_WRITE     EQU $0115
DOS_SET_1346  EQU $013f
DOS_OFF_MOTOR EQU $019c
DOS_ON_MOTOR  EQU $0196

    DI
    LD BC,$1FFD                   ;BC=1FFD
    LD A,($5B67)                  ;Rom 2 selection (+3dos / 48 basic)
    AND %11111000
    OR %00000100
    OUT (C),A                     ;update port
    LD ($5B67),A                  ;update system var
    ;Set buffers
    LD HL, $7800                  ;H 120, L 0
                                  ;8 last buffers of RAM 6
                                  ;0 for Ram Disc
    LD DE, $7808                  ;H 120, L 8
                                  ;8 last buffers of RAM 6
                                  ;4kb
    PUSH IX
    CALL DOS_SET_1346
    POP IX
    EI
END ASM
  SetRAMBank(ROM48KBASIC)

END SUB

FUNCTION Plus3DOSOpen(fname as uInteger, fileNumber AS uByte, accessMode AS uByte, _
                    openAction AS uByte, createAction AS uByte) AS Byte

  DIM b, r AS uByte

  /'
  IF openAction > 4 THEN RETURN -1
  IF createAction > 2 THEN RETURN -2
  IF fileNumber > 15 THEN RETURN -3
  IF fname = 0 THEN RETURN -4
  LET accessMode = accessMode bAND %111
  '/
  LET r = 0
  LET b = SetRAMBank(7)

ASM
PROC
    LOCAL endOpen

    LD L, (IX+4)  ; Filename
    LD H, (IX+5)
    LD B, (IX+7)  ; FIlenumber
    LD C, (IX+9)  ; Access Mode
    LD D, (IX+13) ; Create action
    LD E, (IX+11) ; Open action
    PUSH IX
    CALL DOS_OPEN ; Not carry -> Error
    POP IX
    JR C, endOpen
    INC A         ;ErrorNo + 1
    LD (IX-2), A  ;Return value
endOpen:   
ENDP
END ASM

  SetRAMBank(b)
  RETURN r

END FUNCTION

FUNCTION Plus3DOSClose(fileNumber AS uByte) AS Byte

  DIM b, r AS uByte

  LET r = 0
  'IF fileNumber > 15 THEN RETURN -1
  LET b = SetRAMBank(7)

ASM
PROC
    LOCAL endClose

    LD B, (IX+5)
    PUSH IX
    CALL DOS_CLOSE
    POP IX
    JR C, endClose
    INC A         ;ErrorNo + 1
    LD (IX-2), A  ;Return value
    LD B, (IX+5)
    PUSH IX
    CALL DOS_ABANDON
    POP IX
endClose:
ENDP
END ASM

  SetRAMBank(b)
  RETURN r

END FUNCTION

FUNCTION Plus3DOSRead(fileNumber AS uByte, nBank AS uByte, _
                      addr AS uInteger, size AS uInteger) AS uInteger

  DIM num AS uInteger
  DIM b AS uByte

  LET num = 0
  'IF fileNumber > 15 THEN RETURN size
  LET b = SetRAMBank(7)
ASM
PROC    
    LOCAL endRead

    LD B, (IX+5)    ;Filenumber
    LD C, (IX+7)    ;Bank
    LD L, (IX+8)    ;Addr
    LD H, (IX+9)
    LD E, (IX+10)   ;Size
    LD D, (IX+11)
    PUSH IX
    CALL DOS_READ
    POP IX
    JR C, endRead
    LD (IX-3), E
    LD (IX-2), D
endRead:
ENDP
END ASM
  SetRAMBank(b)
  RETURN num

END FUNCTION

FUNCTION Plus3DOSWrite(fileNumber AS uByte, nBank AS uByte, _
                       addr AS uInteger, size AS uInteger) AS uInteger

  DIM num AS uInteger
  DIM b AS uByte

  LET num = 0
  'IF fileNumber > 15 THEN RETURN size
  LET b = SetRAMBank(7)
ASM
PROC
    LOCAL endWrite

    LD B, (IX+5)    ;Filenumber
    LD C, (IX+7)    ;Bank
    LD L, (IX+8)    ;Addr
    LD H, (IX+9)
    LD E, (IX+10)   ;Size
    LD D, (IX+11)
    PUSH IX
    CALL DOS_WRITE
    POP IX
    JR C, endWrite
    LD (IX-3), E
    LD (IX-2), D
endWrite:
ENDP
END ASM
  SetRAMBank(b)
  RETURN num

END FUNCTION

#endif