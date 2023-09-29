; -----------------------------------------------------------------------------
; ZX0 decoder by Einar Saukas & introspec
; "Turbo" version (126 bytes, 21% faster)
; -----------------------------------------------------------------------------
; Parameters:
;   HL: source address (compressed data)
;   DE: destination address (decompressing)
;   C: Num rows
; -----------------------------------------------------------------------------

dzx0_turbo_dcp:
        ld      bc, $ffff               ; preserve default offset 1
        ld      (dzx0t_last_offset+1), bc
        inc     bc
        ld      a, $80
        jr      dzx0t_literals
dzx0t_new_offset:
        ld      c, $fe                  ; prepare negative offset
        add     a, a
        jp      nz, dzx0t_new_offset_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_new_offset_skip:
        call    nc, dzx0t_elias         ; obtain offset MSB
        inc     c
        ret     z                       ; check end marker
        ld      b, c
        ld      c, (hl)                 ; obtain offset LSB
        inc     hl
        rr      b                       ; last offset bit becomes first length bit
        rr      c
        ld      (dzx0t_last_offset+1), bc ; preserve new offset
        ld      bc, 1                   ; obtain length
        call    nc, dzx0t_elias
        inc     bc
dzx0t_copy:
        push    hl                      ; preserve source
dzx0t_last_offset:
        ld      hl, 0                   ; restore offset
        add     hl, de                  ; calculate destination - offset
        ;ldir                            ; copy from offset
        call    dzx0t_ldir_line_back 
        pop     hl                      ; restore source
        add     a, a                    ; copy from literals or new offset?
        jr      c, dzx0t_new_offset
dzx0t_literals:
        inc     c                       ; obtain length
        add     a, a
        jp      nz, dzx0t_literals_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_literals_skip:
        call    nc, dzx0t_elias
        ;ldir                            ; copy literals
        call    dzx0t_ldir_line
        add     a, a                    ; copy from last offset or new offset?
        jr      c, dzx0t_new_offset
        inc     c                       ; obtain length
        add     a, a
        jp      nz, dzx0t_last_offset_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0t_last_offset_skip:
        call    nc, dzx0t_elias
        jp      dzx0t_copy
dzx0t_elias:
        add     a, a                    ; interlaced Elias gamma coding
        rl      c
        add     a, a
        jr      nc, dzx0t_elias
        ret     nz
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
        add     a, a
        rl      c
        add     a, a
        ret     c
dzx0t_elias_loop:
        add     a, a
        rl      c
        rl      b
        add     a, a
        jr      nc, dzx0t_elias_loop
        ret     nz
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
        jr      nc, dzx0t_elias_loop
        ret
; -----------------------------------------------------------------------------

;(DE)=(HL),HL=HL+1, LDI till BC=0 
dzx0t_ldir_line:
        ex af, af'
dzx0t_next_iteration:
        push bc
        push de
        call ConvDEToScreenAddress
        ld a, (hl)
        ld (de), a
        inc hl
        pop de
        inc de
        pop bc
        dec bc
        ld a, b
        or c
        jp nz, dzx0t_next_iteration
        ex af, af'
        ret

dzx0t_ldir_line_back:
        ex af, af'
dzx0t_next_iteration_back:
        push bc
        push de
        push hl
        call ConvHLDEToScreenAddress
        ld a, (hl)
        ld (de), a
        pop hl
        inc hl
        pop de
        inc de
        pop bc
        dec bc
        ld a, b
        or c
        jp nz, dzx0t_next_iteration_back
        ex af, af'
        ret


;0   1   0   R4  R3  N2  N1  N0  | R2  R1  R0  C4  C3  C2  C1  C0
;0   1   0   R4  R3  R2  R1  R0  | N2  N1  N0  C4  C3  C2  C1  C0

ConvHLDEToScreenAddress:
        ld a, l
        rlca
        rlca
        rlca
        and %00000111
        ld c, a
        ld a, h
        rrca
        rrca
        rrca
        and %11100000
        ld b, a
        ld a, %11111000
        and h
        or c
        ld h, a
        ld a, %00011111
        and l
        or b
        ld l, a
ConvDEToScreenAddress:
        ld a, e
        rlca
        rlca
        rlca
        and %00000111
        ld c, a
        ld a, d
        rrca
        rrca
        rrca
        and %11100000
        ld b, a
        ld a, %11111000
        and d
        or c
        ld d, a
        ld a, %00011111
        and e
        or b
        ld e, a
        ret
