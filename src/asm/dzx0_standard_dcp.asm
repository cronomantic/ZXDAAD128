; -----------------------------------------------------------------------------
; ZX0 decoder by Einar Saukas & Urusergi
; "Standard" version (68 bytes only)
; -----------------------------------------------------------------------------
; Parameters:
;   HL: source address (compressed data)
;   A: Number of lines
; -----------------------------------------------------------------------------

dzx0_standard_dcp:
        exx
        ld      b, 32                   ; Number of bytes to copy
        exx
        ld      bc, $ffff               ; preserve default offset 1
        push    bc
        inc     bc
        ld      a, $80
dzx0s_dcp_literals:
        call    dzx0s_dcp_elias         ; obtain length
        call    dzx0s_ldir_line         ; copy literals
        add     a, a                    ; copy from last offset or new offset?
        jr      c, dzx0s_dcp_new_offset
        call    dzx0s_dcp_elias         ; obtain length
dzx0s_dcp_copy:
        ex      (sp), hl                ; preserve source, restore offset
        push    hl                      ; preserve offset
        add     hl, de                  ; calculate destination - offset
        call    dzx0s_ldir_line_back    ; copy from offset
        pop     hl                      ; restore offset
        ex      (sp), hl                ; preserve offset, restore source
        add     a, a                    ; copy from literals or new offset?
        jr      nc, dzx0s_dcp_literals
dzx0s_dcp_new_offset:
        pop     bc                      ; discard last offset
        ld      c, $fe                  ; prepare negative offset
        call    dzx0s_dcp_elias_loop        ; obtain offset MSB
        inc     c
        ret     z                       ; check end marker
        ld      b, c
        ld      c, (hl)                 ; obtain offset LSB
        inc     hl
        rr      b                       ; last offset bit becomes first length bit
        rr      c
        push    bc                      ; preserve new offset
        ld      bc, 1                   ; obtain length
        call    nc, dzx0s_dcp_elias_backtrack
        inc     bc
        jr      dzx0s_dcp_copy
dzx0s_dcp_elias:
        inc     c                       ; interlaced Elias gamma coding
dzx0s_dcp_elias_loop:
        add     a, a
        jr      nz, dzx0s_dcp_elias_skip
        ld      a, (hl)                 ; load another group of 8 bits
        inc     hl
        rla
dzx0s_dcp_elias_skip:
        ret     c
dzx0s_dcp_elias_backtrack:
        add     a, a
        rl      c
        rl      b
        jr      dzx0s_dcp_elias_loop
; -----------------------------------------------------------------------------
;(DE)=(HL),HL=HL+1, LDI till BC=0 
dzx0s_ldir_line:
        ex af, af'
dzx0s_next_iteration:
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
        jp nz, dzx0s_next_iteration
        ex af, af'
        ret

dzx0s_ldir_line_back:
        ex af, af'
dzx0s_next_iteration_back:
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
        jp nz, dzx0s_next_iteration_back
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
