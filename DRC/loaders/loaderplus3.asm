    DEVICE ZXSPECTRUM48

INIT_ADDR  EQU  $6002
BNK0_ADDR  EQU  $6000
BNKN_ADDR  EQU  $C000
SCR_ADDR   EQU  16384
SCR_SIZE   EQU  6912

DOS_OPEN      EQU $0106
DOS_READ      EQU $0112
DOS_SET_1346  EQU $013f
DOS_CLOSE     EQU $0109
DOS_OFF_MOTOR EQU $019c

    ORG 23755

LINEA0:
    DB 0,0 ;NUMERO DE LINEA
    DW SIZE_LINE0 - 4 ;TAMAÑO
    DB 234 ;TOKEN DE REM

SIZE_TABLE:
    DS 2 * 7, 0

START:
    DI
    LD SP, BNK0_ADDR-2
    CALL INIT_STATE

    LD BC, $0001 ;B: FICHERO 0 , C: MODO DE LECTURA
    LD DE, $0001 ;HA DE EXISTIR EL ARCHIVO, CARGAR SIN CABECERA
    LD HL, FILENAME
    CALL DOS_OPEN

_intro:
    LD DE, (SIZE_TABLE + 0) ;BYTES A LEER
    LD A, D
    OR E
    JR Z, _bank0
    LD BC, $0000 ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, SCR_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank0:
    LD DE, (SIZE_TABLE + 2)
    LD A, D
    OR E
    JR Z, _bank1
    LD BC, $0000     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNK0_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank1:
    LD DE, (SIZE_TABLE + 4)
    LD A, D
    OR E
    JR Z, _bank3
    LD BC, $0001     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNKN_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank3:
    LD DE, (SIZE_TABLE + 6)
    LD A, D
    OR E
    JR Z, _bank4
    LD BC, $0003     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNKN_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank4:
    LD DE, (SIZE_TABLE + 8)
    LD A, D
    OR E
    JR Z, _bank6
    LD BC, $0004     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNKN_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank6:
    LD DE, (SIZE_TABLE + 10)
    LD A, D
    OR E
    JR Z, _bank7
    LD BC, $0006     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNKN_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

_bank7:
    LD DE, (SIZE_TABLE + 12)
    LD A, D
    OR E
    JR Z, END_LOAD
    LD BC, $0007     ;B: FICHERO,  C: RAM A PAGINAR
    LD HL, BNKN_ADDR ;DIRECCION DONDE CARGAR
    CALL DOS_READ

END_LOAD:
    LD B, 0
    CALL DOS_CLOSE
    CALL DOS_OFF_MOTOR
    CALL MAINROM ;rom interprete 48k
    LD C, 0
    CALL SETRAM
    JP INIT_ADDR

FILENAME:
    DB "DAAD.BIN", $ff

;en C se indica la pagina de ram
SETRAM:
    LD A,(23388)
    AND %11111000
    OR C
    LD BC,$7FFD
    OUT (C),A
    LD (23388),A
    RET

MAINROM:
    LD A,(23388)
    SET 4,A
    LD BC,$7FFD
    OUT (C),A
    LD (23388),A
    LD A,(23399)
    RES 0,A
    SET 2,A
    LD B, $1F ;BC=$1FFD
    OUT (C),A
    LD (23399),A
    RET


;Y el siguiente codigo solo se ejecuta al inicio
;y puede ser pisado por la pila posteriormente
INIT_STATE:
    XOR A
    OUT (254), A                    ;Black border
    LD HL, SCR_ADDR                 ;pixels
    LD DE, SCR_ADDR+1               ;pixels + 1
    LD BC, SCR_SIZE                 ;T
    LD (HL), L                      ;pone el primer byte a '0' ya que HL = 16384 = $4000  por tanto L = 0
    LDIR                            ;copia

    LD A, (23388)
    LD BC, $7FFD
    AND %11101000                 ;SELECCION DE ROM0
    OR %00000111                  ;SELECCION DE RAM7
    OUT (C),A
    LD (23388),A
    LD B, $1F                     ;BC=1FFD
    LD A, (23399)
    AND %11111000
    OR %00000100                  ;SELECCION DE ROM2
    OUT (C),A
    LD (23399),A
    LD HL, $7800                  ;H 120, L 0
                                  ;8 last buffers of RAM 6
                                  ;0 for Ram Disc
    LD DE, $7808                  ;H 120, L 8
                                  ;8 last buffers of RAM 6
                                  ;4kb
    JP DOS_SET_1346

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

    SAVEBIN "loader3.bin", 23755, SIZEOFBASIC
