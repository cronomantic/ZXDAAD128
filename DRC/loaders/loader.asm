    DEVICE ZXSPECTRUM48

INIT_ADDR  EQU  $6002
BNK0_ADDR  EQU  $6000
BNKN_ADDR  EQU  $C000
SCR_ADDR   EQU  16384
SCR_SIZE   EQU  6912

PROG       EQU  $5C53
LD_BLOCK   EQU  $0802
LD_BYTES   EQU  $0556
REPORT_R   EQU  $0806
PORT_128   EQU  $7FFD
BANK_VAR   EQU  $5b5c


    ORG 23755

LINEA0:
    DB 0,0 ;NUMERO DE LINEA
    DW SIZE_LINE0 - 4 ;TAMAÑO
    DB 234 ;TOKEN DE REM
SIZE_TABLE:
    DS 2 * 7, 0
   ; Clear screen
START:
    DI
    LD SP, BNK0_ADDR-2
    CALL INIT_STATE
    
    LD A,(BANK_VAR)
    PUSH AF
_intro:
    LD DE, (SIZE_TABLE + 0)
    LD A, D
    OR E
    JR Z, _bank0
    LD A, 0 | %00010000
    LD IX, SCR_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank0:
    LD DE, (SIZE_TABLE + 2)
    LD A, D
    OR E
    JR Z, _bank1
    LD A, 0 | %00010000
    LD IX, BNK0_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank1:
    LD DE, (SIZE_TABLE + 4)
    LD A, D
    OR E
    JR Z, _bank3
    LD A, 1 | %00010000
    LD IX, BNKN_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank3:
    LD DE, (SIZE_TABLE + 6)
    LD A, D
    OR E
    JR Z, _bank4
    LD A, 3 | %00010000
    LD IX, BNKN_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank4:
    LD DE, (SIZE_TABLE + 8)
    LD A, D
    OR E
    JR Z, _bank6
    LD A, 4 | %00010000
    LD IX, BNKN_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank6:
    LD DE, (SIZE_TABLE + 10)
    LD A, D
    OR E
    JR Z, _bank7
    LD A, 6 | %00010000
    LD IX, BNKN_ADDR
    CALL BANK_CHANGE
    CALL LOAD

_bank7:
    LD DE, (SIZE_TABLE + 12)
    LD A, D
    OR E
    JR Z, RUN
    LD A, 7 | %00010000
    LD IX, BNKN_ADDR
    CALL BANK_CHANGE
    CALL LOAD

RUN:
    LD A, 0 | %00010000
    CALL BANK_CHANGE
    JP INIT_ADDR                    ;Jump to destination

BANK_CHANGE:
    DI
    LD BC, PORT_128                 ; Set Port
    OUT (C), A                      ; Output Port
    LD (BANK_VAR), A
    EI
    RET

LOAD:                               ; HL = address, DE = size
    SCF                             ; Set Carry Flag -> CF=1 -> LOAD
    LD A, $FF                       ; A = 0xFF (cargar datos)
    CALL LD_BYTES                   ; Load block
    RET C
    POP HL                          ;Return address, not necessary
    XOR A
    CALL BANK_CHANGE
    JP 0                            ;reset

INIT_STATE:
    XOR A
    OUT (254), A                    ;Black border
    LD HL, SCR_ADDR                 ;pixels
    LD DE, SCR_ADDR+1               ;pixels + 1
    LD BC, SCR_SIZE                 ;T
    LD (HL), L                      ;pone el primer byte a '0' ya que HL = 16384 = $4000  por tanto L = 0
    LDIR                            ;copia
    RET

SIZE_LINE0 = $ - LINEA0
LINEA10:
    DB 0,10
    DW SIZE_LINE10 - 4
    DB 253 ;CLEAR
    DB '.',14,0,0 ;SHORTNUMBER
    DW BNK0_ADDR - 1
    DB 0 ;FIN DEL SHORTNUMBER
    DB ':'
    DB 242 ;PAUSE
    DB 192 ;USR
    DB '.',14,0,0 ;SHORTNUMBER
    DW START
    DB 0 ;FIN DEL SHORTNUMBER
    DB 13

SIZE_LINE10 = $ - LINEA10
SIZEOFBASIC = $ - 23755

    SAVEBIN "loader.bin", 23755, SIZEOFBASIC

