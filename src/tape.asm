
#ifndef __TAPE__
#define __TAPE__

; Boriel

#include once <error.asm>
#include once <free.asm>

LOAD_CODE:
; This function will implement the LOAD CODE Routine
; Parameters in the stack are HL => String with LOAD name
; (only first 12 chars will be taken into account)
; DE = START address of CODE to save
; BC = Length of data in bytes
; A = 1 => LOAD 0 => Verify

    PROC

    push namespace core

    LOCAL LOAD_CONT, LOAD_CONT2, LOAD_CONT3
    LOCAL LD_BYTES
    LOCAL LOAD_HEADER
    LOCAL LD_LOOK_H
    LOCAL HEAD1
    LOCAL TMP_HEADER
    LOCAL LD_NAME
    LOCAL LD_CH_PR
    LOCAL LOAD_END
    LOCAL VR_CONTROL, VR_CONT_1, VR_CONT_2
    LOCAL MEM0
    LOCAL TMP_SP

MEM0  EQU 5C92h ; Temporary memory buffer
HEAD1 EQU MEM0 + 8 ; Uses CALC Mem for temporary storage
    ; Must skip first 8 bytes used by
    ; PRINT routine
TMP_HEADER EQU HEAD1 + 17 ; Temporary HEADER2 pointer storage
TMP_SP EQU TMP_HEADER + 2 ; Temporary SP storage

#ifdef __ENABLE_BREAK__
LD_BYTES EQU 0556h ; ROM Routine LD-BYTES
#endif

TMP_FLAG EQU 23655 ; Uses BREG as a Temporary FLAG

    ex af, af' ;Save the Operation
    pop af   ; Return address
    pop bc   ; data length in bytes
    pop de   ; address start
    push af  ; save ret address again
    ex af, af' ;Recover the operation
    ;Filename string on HL

__LOAD_CODE: ; INLINE version
    push ix ; saves IX
    ld (TMP_FLAG), a ; Stores verify/load flag

    ; Prepares temporary 1st header descriptor
    ld ix, HEAD1
    ld (ix + 0), 3     ; ZXBASIC ALWAYS uses CODE
    ld (ix + 1), 0FFh  ; Wildcard for empty string

    ld (ix + 11), c
    ld (ix + 12), b ; Store length in bytes
    ld (ix + 13), e
    ld (ix + 14), d ; Store address in bytes

    push hl  ; String ptr to be freed later

    ld a, h
    or l
    ld b, h
    ld c, l
    jr z, LOAD_HEADER ; NULL STRING => LOAD ""

    ld c, (hl)
    inc hl
    ld b, (hl)
    inc hl

    ld a, b
    or c
    jr z, LOAD_CONT2 ; NULL STRING => LOAD ""

    ; Fill with blanks
    push hl
    push bc
    ld hl, HEAD1 + 2
    ld de, HEAD1 + 3
    ld bc, 8
    ld (hl), ' '
    ldir
    pop bc
    pop hl

LOAD_HEADER:
    ex de, hl  ; Saves HL in DE
    ld hl, 10
    or a
    sbc hl, bc ; Test BC > 10?
    ex de, hl  ; Retrieve HL
    jr nc, LOAD_CONT ; Ok BC <= 10
    ld bc, 10 ; BC at most 10 chars

LOAD_CONT:
    ld de, HEAD1 + 1
    ldir     ; Copy String block NAME in header

LOAD_CONT2:
    pop hl   ; String ptr
    call MEM_FREE

    ld hl, 0
    add hl, sp
    ld (TMP_SP), hl
    ld bc, -18
    add hl, bc
    ld sp, hl

LOAD_CONT3:
    ld (TMP_HEADER), hl
    push hl
    pop ix

;; LD-LOOK-H --- RIPPED FROM ROM at 0x767
LD_LOOK_H:
    push ix                 ; save IX
    ld de, 17               ; seventeen bytes
    xor a                   ; reset zero flag
    scf                     ; set carry flag

    call LD_BYTES           ; routine LD-BYTES loads a header from tape
    ; to second descriptor.
    pop ix                  ; restore IX
    jr nc, LD_LOOK_H        ; loop back to LD-LOOK-H until header found.

    ld c, 80h               ; C has bit 7 set to indicate header type mismatch as
    ; a default startpoint.

    ld a, (ix + 0)          ; compare loaded type
    cp 3                    ; with expected bytes header
    jr nz, LD_TYPE          ; forward to LD-TYPE with mis-match.

    ld c, -10               ; set C to minus ten - will count characters
    ; up to zero.
LD_TYPE:
    cp 4                    ; check if type in acceptable range 0 - 3.
    jr nc, LD_LOOK_H        ; back to LD-LOOK-H with 4 and over.
    ; else A indicates type 0-3.

    ld hl, HEAD1 + 1        ; point HL to 1st descriptor.
    ld de, (TMP_HEADER)     ; point DE to 2nd descriptor.
    ld b, 10                ; the count will be ten characters for the
    ; filename.

    ld a, (hl)              ; fetch first character and test for
    inc a                   ; value 255.
    jr nz, LD_NAME          ; forward to LD-NAME if not the wildcard.

;   but if it is the wildcard, then add ten to C which is minus ten for a type
;   match or -128 for a type mismatch. Although characters have to be counted
;   bit 7 of C will not alter from state set here.

    ld a, c                 ; transfer $F6 or $80 to A
    add a, b                ; add 10
    ld c, a                 ; place result, zero or -118, in C.

;   At this point we have either a type mismatch, a wildcard match or ten
;   characters to be counted. The characters must be shown on the screen.

;; LD-NAME
LD_NAME:
    inc de                  ; address next input character
    ld a, (de)              ; fetch character
    cp (hl)                 ; compare to expected
    inc hl                  ; address next expected character
    jr nz, LD_CH_PR         ; forward to LD-CH-PR with mismatch

    inc c                   ; increment matched character count

;; LD-CH-PR
LD_CH_PR:
    djnz LD_NAME            ; loop back to LD-NAME for ten characters.

    bit 7, c                ; test if all matched
    jr nz, LD_LOOK_H        ; back to LD-LOOK-H if not

;   else print a terminal carriage return.

    ld a, (HEAD1)
    cp 03                   ; Only "bytes:" header is used un ZX BASIC
    jr nz, LD_LOOK_H

    ; Ok, ready to check for bytes start and end

VR_CONTROL:
    ld e, (ix + 11)         ; fetch length of new data
    ld d, (ix + 12)         ; to DE.

    ld hl, HEAD1 + 11
    ld a, (hl)              ; fetch length of old data (orig. header)
    inc hl
    ld h, (hl)              ; to HL
    ld l, a
    or h                    ; check length of old for zero. (Carry reset)
    jr z, VR_CONT_1         ; forward to VR-CONT-1 if length unspecified
    ; e.g. LOAD "x" CODE
    sbc hl, de
    jr nz, LOAD_ERROR       ; Lengths don't match

VR_CONT_1:
;    ld hl, HEAD1 + 13       ; fetch start of old data (orig. header)
;    ld a, (hl)
;    inc hl
;    ld h, (hl)
;    ld l, a
;    or h                    ; check start for zero (unspecified)
;    jr nz, VR_CONT_2        ; Jump if there was a start

;Ignore the header address on tape, we will use our own destination address
    ld l, (ix + 13)         ; otherwise use destination in header
    ld h, (ix + 14)         ; and load code at addr. saved from

VR_CONT_2:
    push hl
    pop ix                  ; Transfer load addr to IX

    ld a, (TMP_FLAG)        ; load verify/load flag
    sra a                   ; shift bit 0 to Carry (1 => Load, 0 = Verify), A = 0
    dec a                   ; a = 0xFF (Data)
    call LD_BYTES
    jr c, LOAD_END         ; if carry, load/verification was ok

LOAD_ERROR:
    ; Sets ERR_NR with Tape Loading, and returns
    ld a, ERROR_TapeLoadingErr
    ld (ERR_NR), a

LOAD_END:
    ld hl, (TMP_SP)
    ld sp, hl               ; Recovers stack
    pop ix                  ; Recovers stack frame pointer
    ret

#ifndef __ENABLE_BREAK__
    LOCAL LD_BYTES_RET
    LOCAL LD_BYTES_ROM
    LOCAL LD_BYTES_NOINTER

LD_BYTES_ROM EQU 0562h

LD_BYTES:

    inc d
    ex af, af'
    dec d
    ld a, r
    push af
    di
    call 0562h

LD_BYTES_RET:
    ; Restores DI / EI state
    ex af, af'
    pop af
    jp po, LD_BYTES_NOINTER
    ei

LD_BYTES_NOINTER:
    ex af, af'
    ret
#endif
    pop namespace
    ENDP

;--------------------------------------------------------------------------


SAVE_CODE:
PROC
    push namespace core

    LOCAL MEMBOT
    LOCAL SAVE_CONT
    LOCAL ROM_SAVE
    LOCAL __ERR_EMPTY
    LOCAL SAVE_STOP
    LOCAL STR_PTR
    LOCAL SAVE_EMPTY_ERROR

    MEMBOT EQU 23698 ; Use the CALC mem to store header
    STR_PTR EQU MEMBOT + 17

    pop af   ; Return address
    pop bc   ; data length in bytes
    pop de   ; address start
    push af  ; save ret address again


    ld (STR_PTR), hl

; This function will call the ROM SAVE CODE Routine
; Parameters in the stack are HL => String with SAVE name
; (only first 12 chars will be taken into account)
; DE = START address of CODE to save
; BC = Length of data in bytes

__SAVE_CODE: ; INLINE version
    ld a, b
    or c
    jr z, SAVE_EMPTY_ERROR    ; Return if block length == 0

    push ix
    ld a, h
    or l
    jr z, __ERR_EMPTY  ; Return if NULL STRING

    ld ix, MEMBOT
    ld (ix + 00), 3 ; CODE

    ld (ix + 11), c
    ld (ix + 12), b ; Store long in bytes
    ld (ix + 13), e
    ld (ix + 14), d ; Store address in bytes

    push hl
    ld bc, 9
    ld HL, MEMBOT + 1
    ld DE, MEMBOT + 2
    ld (hl), ' '
    ldir   ; Fill the filename with blanks
    pop hl

    ld c, (hl)
    inc hl
    ld b, (hl)
    inc hl
    ld a, b
    or c

__ERR_EMPTY:
    ld a, ERROR_InvalidFileName
    jr z, SAVE_STOP        ; Return if str len == 0

    ex de, hl  ; Saves HL in DE
    ld hl, 10
    or a
    sbc hl, bc  ; Test BC > 10?
    ex de, hl
    jr nc, SAVE_CONT ; Ok BC <= 10
    ld bc, 10 ; BC at most 10 chars

SAVE_CONT:
    ld de, MEMBOT + 1
    ldir     ; Copy String block NAME
    ld hl, (STR_PTR)
    call MEM_FREE
    ld l, (ix + 13)
    ld h, (ix + 14)    ; Restores start of bytes

    ld a, r
    push af
    call ROM_SAVE

    LOCAL NO_INT
    pop af
    jp po, NO_INT
    ei
NO_INT:
    ; Recovers ECHO_E since ROM SAVE changes it
    ld hl, 1821h
    ld (23682), hl
    pop ix
    ret

SAVE_EMPTY_ERROR:
    ld a, ERROR_InvalidArg

SAVE_STOP:
    pop ix
    push af
    ld hl, (STR_PTR)
    call MEM_FREE
    pop af
    jp __STOP

    LOCAL CHAN_OPEN
    LOCAL PO_MSG
    LOCAL WAIT_KEY
    LOCAL SA_BYTES
    LOCAL SA_CHK_BRK
    LOCAL SA_CONT

    CHAN_OPEN EQU 1601h
    PO_MSG EQU 0C0Ah
    WAIT_KEY EQU 15D4h
    SA_BYTES EQU 04C6h

ROM_SAVE:
    push hl
    ;ld a, 0FDh
    ;call CHAN_OPEN
    ;xor a
    ;ld de, 09A1h
    ;call PO_MSG
    ;set 5, (iy + 02h)
    ;call WAIT_KEY
    push ix
    ld de, 0011h
    xor a
    call SA_BYTES
    pop ix

    call SA_CHK_BRK
    jr c, SA_CONT
    pop ix
    ret

SA_CONT:
    ei
    ld b, 32h

LOCAL SA_1_SEC
SA_1_SEC:
    halt
    djnz SA_1_SEC

    ld e, (ix + 0Bh)
    ld d, (ix + 0Ch)
    ld a, 0FFh
    pop ix
    call SA_BYTES

SA_CHK_BRK:
    ld b, a
    ld a, (5C48h)
    and 38h
    rrca
    rrca
    rrca
    out (0FEh), a
    ld a, 7Fh
    in a, (0FEh)
    rra
    ld a, b
    ret

    pop namespace
ENDP

#endif
