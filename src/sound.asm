
; ----------------------------------------------------------------------------
SoundInit:
        lda #$00
        sta SND_MASTERCTRL
        lda #$30
        sta SND_SQUARE1_TIMER
        sta SND_SQUARE2_TIMER
        sta SND_NOISE_TIMER
        lda #$80
        sta SND_TRIANGLE_TIMER
        lda #$08
        sta SND_SQUARE1_LENGTH
        sta SND_SQUARE2_LENGTH
        lda #$00
        sta $0566
        lda #$FF
        ldx #$00
@Clear:
        sta $056C,x
        inx
        cpx #$08
        bcc @Clear
        lda #$0F
        sta SND_MASTERCTRL
        rts

SoundPlay:
        @TempDataPointer = $F0
        ldx     #$01
        stx     SoundIsPlaying
        ; stop playing sounds by passing a value >= $E0 to soundplay
        cmp     #$E0
        bcs     @ClearRemainingChannels
        asl     a
        tax
        lda     SoundPointers,x
        sta     @TempDataPointer
        lda     SoundPointers+1,x
        sta     @TempDataPointer+1
        ldy     #$00
@LE2E4:
        lda     (@TempDataPointer),y
        bmi     @Done
        iny
        tax
        cmp     #$04
        bcc     @LE2F4
        lda     (@TempDataPointer),y
        iny
        sta     $055E
@LE2F4:
        lda     @SoundChannelOffsets,x
        tax
        lda     #$80
        sta     $0574,x
        lda     #$00
        sta     $0579,x
        lda     #$01
        sta     $057A,x
        lda     #$0C
        sta     $057B,x
        lda     (@TempDataPointer),y
        iny
        sta     $057C,x
        lda     (@TempDataPointer),y
        iny
        sta     $057D,x
        lda     UnknownSoundDataPointers
        sta     $0582,x
        lda     UnknownSoundDataPointers+1
        sta     $0583,x
        lda     #$0C
        sta     $058A,x
        lda     #$80
        sta     $058C,x
        jmp     @LE2E4

; ----------------------------------------------------------------------------
@ClearRemainingChannels:
        sta $F0
        ldx #$00
        ldy #$05
@ClearNext:
        lsr $F0
        bcc @DontClearChannel
        lda #$00
        sta $0574,x
@DontClearChannel:
        txa
        clc
        ; advance X to next sound channel
        adc #$1C
        tax
        dey
        bne @ClearNext
@Done:
        lda #$00
        sta SoundIsPlaying
        rts

@SoundChannelOffsets:
        .byte $00
        .byte $1C
        .byte $38
        .byte $54
        .byte $70

; ----------------------------------------------------------------------------
SoundUpdate:
        lda     #$30                            ; E353 A9 30                    .0
        sta     $0567                           ; E355 8D 67 05                 .g.
        sta     $0568                           ; E358 8D 68 05                 .h.
        sta     $056A                           ; E35B 8D 6A 05                 .j.
        lda     #$80                            ; E35E A9 80                    ..
        sta     $0569                           ; E360 8D 69 05                 .i.
        lda     $4A                             ; E363 A5 4A                    .J
        bne     LE3AB                           ; E365 D0 44                    .D
        ldx     #$00                            ; E367 A2 00                    ..
        lda     $0574                           ; E369 AD 74 05                 .t.
        bpl     LE378                           ; E36C 10 0A                    ..
        sta     $F2                             ; E36E 85 F2                    ..
        jsr     LE424                           ; E370 20 24 E4                  $.
        lda     $F2                             ; E373 A5 F2                    ..
        sta     $0574                           ; E375 8D 74 05                 .t.
LE378:
        ldx     #$1C                            ; E378 A2 1C                    ..
        lda     $0590                           ; E37A AD 90 05                 ...
        bpl     LE389                           ; E37D 10 0A                    ..
        sta     $F2                             ; E37F 85 F2                    ..
        jsr     LE479                           ; E381 20 79 E4                  y.
        lda     $F2                             ; E384 A5 F2                    ..
        sta     $0590                           ; E386 8D 90 05                 ...
LE389:
        ldx     #$38                            ; E389 A2 38                    .8
        lda     $05AC                           ; E38B AD AC 05                 ...
        bpl     LE39A                           ; E38E 10 0A                    ..
        sta     $F2                             ; E390 85 F2                    ..
        jsr     LE4CE                           ; E392 20 CE E4                  ..
        lda     $F2                             ; E395 A5 F2                    ..
        sta     $05AC                           ; E397 8D AC 05                 ...
LE39A:
        ldx     #$54                            ; E39A A2 54                    .T
        lda     $05C8                           ; E39C AD C8 05                 ...
        bpl     LE3AB                           ; E39F 10 0A                    ..
        sta     $F2                             ; E3A1 85 F2                    ..
        jsr     LE524                           ; E3A3 20 24 E5                  $.
        lda     $F2                             ; E3A6 A5 F2                    ..
        sta     $05C8                           ; E3A8 8D C8 05                 ...
LE3AB:
        ldx     #$70                            ; E3AB A2 70                    .p
        lda     $05E4                           ; E3AD AD E4 05                 ...
        bpl     LE3D9                           ; E3B0 10 27                    .'
        sta     $F2                             ; E3B2 85 F2                    ..
        lda     $055E                           ; E3B4 AD 5E 05                 .^.
        bne     LE3BF                           ; E3B7 D0 06                    ..
        .byte   $20,$24,$E4,$4C,$D4,$E3         ; E3B9 20 24 E4 4C D4 E3         $.L..
; ----------------------------------------------------------------------------
LE3BF:
        cmp     #$02                            ; E3BF C9 02                    ..
        bcs     LE3C9                           ; E3C1 B0 06                    ..
        jsr     LE479                           ; E3C3 20 79 E4                  y.
        jmp     LE3D4                           ; E3C6 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3C9:
        bne     LE3D1                           ; E3C9 D0 06                    ..
        jsr     LE4CE                           ; E3CB 20 CE E4                  ..
        jmp     LE3D4                           ; E3CE 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3D1:
        jsr     LE524                           ; E3D1 20 24 E5                  $.
LE3D4:
        lda     $F2                             ; E3D4 A5 F2                    ..
        sta     $05E4                           ; E3D6 8D E4 05                 ...
LE3D9:
        ldx     #$00                            ; E3D9 A2 00                    ..
LE3DB:
        lda     LE417,x                         ; E3DB BD 17 E4                 ...
        tay                                     ; E3DE A8                       .
        lda     $055F,x                         ; E3DF BD 5F 05                 ._.
        cmp     $056C,x                         ; E3E2 DD 6C 05                 .l.
        bne     LE3F2                           ; E3E5 D0 0B                    ..
        lda     $0560,x                         ; E3E7 BD 60 05                 .`.
        cmp     $056D,x                         ; E3EA DD 6D 05                 .m.
        beq     LE401                           ; E3ED F0 12                    ..
        .byte   $BD,$5F,$05                     ; E3EF BD 5F 05                 ._.
; ----------------------------------------------------------------------------
LE3F2:
        sta     $056C,x                         ; E3F2 9D 6C 05                 .l.
        sta     SND_SQUARE1_TIMER,y                         ; E3F5 99 00 40                 ..@
        lda     $0560,x                         ; E3F8 BD 60 05                 .`.
        sta     $056D,x                         ; E3FB 9D 6D 05                 .m.
        sta     SND_SQUARE1_LENGTH,y                         ; E3FE 99 01 40                 ..@
LE401:
        inx                                     ; E401 E8                       .
        inx                                     ; E402 E8                       .
        cpx     #$08                            ; E403 E0 08                    ..
        bcc     LE3DB                           ; E405 90 D4                    ..
LE407:
        lda     LE417,x                         ; E407 BD 17 E4                 ...
        tay                                     ; E40A A8                       .
        lda     $055F,x                         ; E40B BD 5F 05                 ._.
        sta     SND_SQUARE1_TIMER,y                         ; E40E 99 00 40                 ..@
        inx                                     ; E411 E8                       .
        cpx     #$0C                            ; E412 E0 0C                    ..
        bcc     LE407                           ; E414 90 F1                    ..
        rts                                     ; E416 60                       `

; ----------------------------------------------------------------------------
LE417:
        .byte   $02,$03,$06,$07,$0A,$0B,$0E,$0F ; E417 02 03 06 07 0A 0B 0E 0F  ........
        .byte   $00,$04,$08,$0C,$15             ; E41F 00 04 08 0C 15           .....
; ----------------------------------------------------------------------------
LE424:
        lda     #$30                            ; E424 A9 30                    .0
        sta     $0567                           ; E426 8D 67 05                 .g.
        dec     $057A,x                         ; E429 DE 7A 05                 .z.
        bne     LE43B                           ; E42C D0 0D                    ..
        lda     #$00                            ; E42E A9 00                    ..
        sta     $056B                           ; E430 8D 6B 05                 .k.
        jsr     LE5E9                           ; E433 20 E9 E5                  ..
        bit     $F2                             ; E436 24 F2                    $.
        bvc     LE451                           ; E438 50 17                    P.
        rts                                     ; E43A 60                       `

; ----------------------------------------------------------------------------
LE43B:
        bit     $F2                             ; E43B 24 F2                    $.
        bvc     LE440                           ; E43D 50 01                    P.
        rts                                     ; E43F 60                       `

; ----------------------------------------------------------------------------
LE440:
        jsr     LE560                           ; E440 20 60 E5                  `.
        lda     #$20                            ; E443 A9 20                    . 
        bit     $F2                             ; E445 24 F2                    $.
        beq     LE44C                           ; E447 F0 03                    ..
        .byte   $4C,$51,$E4                     ; E449 4C 51 E4                 LQ.
; ----------------------------------------------------------------------------
LE44C:
        lsr     a                               ; E44C 4A                       J
        bit     $F2                             ; E44D 24 F2                    $.
        beq     LE451                           ; E44F F0 00                    ..
LE451:
        lda     $0578,x                         ; E451 BD 78 05                 .x.
        ora     $058C,x                         ; E454 1D 8C 05                 ...
        ora     #$30                            ; E457 09 30                    .0
        sta     $0567                           ; E459 8D 67 05                 .g.
        lda     $0576,x                         ; E45C BD 76 05                 .v.
        sta     $055F                           ; E45F 8D 5F 05                 ._.
        lda     $0577,x                         ; E462 BD 77 05                 .w.
        lsr     a                               ; E465 4A                       J
        ror     $055F                           ; E466 6E 5F 05                 n_.
        lsr     a                               ; E469 4A                       J
        ror     $055F                           ; E46A 6E 5F 05                 n_.
        lsr     a                               ; E46D 4A                       J
        ror     $055F                           ; E46E 6E 5F 05                 n_.
        lsr     a                               ; E471 4A                       J
        ror     $055F                           ; E472 6E 5F 05                 n_.
        sta     $0560                           ; E475 8D 60 05                 .`.
        rts                                     ; E478 60                       `

; ----------------------------------------------------------------------------
LE479:
        lda     #$30                            ; E479 A9 30                    .0
        sta     $0568                           ; E47B 8D 68 05                 .h.
        dec     $057A,x                         ; E47E DE 7A 05                 .z.
        bne     LE490                           ; E481 D0 0D                    ..
        lda     #$00                            ; E483 A9 00                    ..
        sta     $056B                           ; E485 8D 6B 05                 .k.
        jsr     LE5E9                           ; E488 20 E9 E5                  ..
        bit     $F2                             ; E48B 24 F2                    $.
        bvc     LE4A6                           ; E48D 50 17                    P.
        rts                                     ; E48F 60                       `

; ----------------------------------------------------------------------------
LE490:
        bit     $F2                             ; E490 24 F2                    $.
        bvc     LE495                           ; E492 50 01                    P.
        rts                                     ; E494 60                       `

; ----------------------------------------------------------------------------
LE495:
        jsr     LE560                           ; E495 20 60 E5                  `.
        lda     #$20                            ; E498 A9 20                    . 
        bit     $F2                             ; E49A 24 F2                    $.
        beq     LE4A1                           ; E49C F0 03                    ..
        .byte   $4C,$A6,$E4                     ; E49E 4C A6 E4                 L..
; ----------------------------------------------------------------------------
LE4A1:
        lsr     a                               ; E4A1 4A                       J
        bit     $F2                             ; E4A2 24 F2                    $.
        beq     LE4A6                           ; E4A4 F0 00                    ..
LE4A6:
        lda     $0578,x                         ; E4A6 BD 78 05                 .x.
        ora     $058C,x                         ; E4A9 1D 8C 05                 ...
        ora     #$30                            ; E4AC 09 30                    .0
        sta     $0568                           ; E4AE 8D 68 05                 .h.
        lda     $0576,x                         ; E4B1 BD 76 05                 .v.
        sta     $0561                           ; E4B4 8D 61 05                 .a.
        lda     $0577,x                         ; E4B7 BD 77 05                 .w.
        lsr     a                               ; E4BA 4A                       J
        ror     $0561                           ; E4BB 6E 61 05                 na.
        lsr     a                               ; E4BE 4A                       J
        ror     $0561                           ; E4BF 6E 61 05                 na.
        lsr     a                               ; E4C2 4A                       J
        ror     $0561                           ; E4C3 6E 61 05                 na.
        lsr     a                               ; E4C6 4A                       J
        ror     $0561                           ; E4C7 6E 61 05                 na.
        sta     $0562                           ; E4CA 8D 62 05                 .b.
        rts                                     ; E4CD 60                       `

; ----------------------------------------------------------------------------
LE4CE:
        lda     #$80                            ; E4CE A9 80                    ..
        sta     $0569                           ; E4D0 8D 69 05                 .i.
        dec     $057A,x                         ; E4D3 DE 7A 05                 .z.
        bne     LE4E5                           ; E4D6 D0 0D                    ..
        lda     #$01                            ; E4D8 A9 01                    ..
        sta     $056B                           ; E4DA 8D 6B 05                 .k.
        jsr     LE5E9                           ; E4DD 20 E9 E5                  ..
        bit     $F2                             ; E4E0 24 F2                    $.
        bvc     LE4FB                           ; E4E2 50 17                    P.
        rts                                     ; E4E4 60                       `

; ----------------------------------------------------------------------------
LE4E5:
        bit     $F2                             ; E4E5 24 F2                    $.
        bvc     LE4EA                           ; E4E7 50 01                    P.
        rts                                     ; E4E9 60                       `

; ----------------------------------------------------------------------------
LE4EA:
        jsr     LE560                           ; E4EA 20 60 E5                  `.
        lda     #$20                            ; E4ED A9 20                    . 
        bit     $F2                             ; E4EF 24 F2                    $.
        beq     LE4F6                           ; E4F1 F0 03                    ..
        .byte   $4C,$FB,$E4                     ; E4F3 4C FB E4                 L..
; ----------------------------------------------------------------------------
LE4F6:
        lsr     a                               ; E4F6 4A                       J
        bit     $F2                             ; E4F7 24 F2                    $.
        beq     LE4FB                           ; E4F9 F0 00                    ..
LE4FB:
        lda     $0578,x                         ; E4FB BD 78 05                 .x.
        cmp     #$0F                            ; E4FE C9 0F                    ..
        bcc     LE523                           ; E500 90 21                    .!
        lda     #$FF                            ; E502 A9 FF                    ..
        sta     $0569                           ; E504 8D 69 05                 .i.
        lda     $0576,x                         ; E507 BD 76 05                 .v.
        sta     $0563                           ; E50A 8D 63 05                 .c.
        lda     $0577,x                         ; E50D BD 77 05                 .w.
        lsr     a                               ; E510 4A                       J
        ror     $0563                           ; E511 6E 63 05                 nc.
        lsr     a                               ; E514 4A                       J
        ror     $0563                           ; E515 6E 63 05                 nc.
        lsr     a                               ; E518 4A                       J
        ror     $0563                           ; E519 6E 63 05                 nc.
        lsr     a                               ; E51C 4A                       J
        ror     $0563                           ; E51D 6E 63 05                 nc.
        sta     $0564                           ; E520 8D 64 05                 .d.
LE523:
        rts                                     ; E523 60                       `

; ----------------------------------------------------------------------------
LE524:
        lda     #$30                            ; E524 A9 30                    .0
        sta     $056A                           ; E526 8D 6A 05                 .j.
        dec     $057A,x                         ; E529 DE 7A 05                 .z.
        bne     LE53B                           ; E52C D0 0D                    ..
        lda     #$02                            ; E52E A9 02                    ..
        sta     $056B                           ; E530 8D 6B 05                 .k.
        jsr     LE5E9                           ; E533 20 E9 E5                  ..
        bit     $F2                             ; E536 24 F2                    $.
        bvc     LE551                           ; E538 50 17                    P.
        .byte   $60                             ; E53A 60                       `
; ----------------------------------------------------------------------------
LE53B:
        bit     $F2                             ; E53B 24 F2                    $.
        bvc     LE540                           ; E53D 50 01                    P.
        .byte   $60                             ; E53F 60                       `
; ----------------------------------------------------------------------------
LE540:
        jsr     LE560                           ; E540 20 60 E5                  `.
        lda     #$20                            ; E543 A9 20                    . 
        bit     $F2                             ; E545 24 F2                    $.
        beq     LE54C                           ; E547 F0 03                    ..
        .byte   $4C,$51,$E5                     ; E549 4C 51 E5                 LQ.
; ----------------------------------------------------------------------------
LE54C:
        lsr     a                               ; E54C 4A                       J
        bit     $F2                             ; E54D 24 F2                    $.
        beq     LE551                           ; E54F F0 00                    ..
LE551:
        lda     $0578,x                         ; E551 BD 78 05                 .x.
        ora     #$30                            ; E554 09 30                    .0
        sta     $056A                           ; E556 8D 6A 05                 .j.
        lda     $0577,x                         ; E559 BD 77 05                 .w.
        sta     $0565                           ; E55C 8D 65 05                 .e.
        rts                                     ; E55F 60                       `

; ----------------------------------------------------------------------------
LE560:
        lda     $F2                             ; E560 A5 F2                    ..
        eor     #$01                            ; E562 49 01                    I.
        and     #$05                            ; E564 29 05                    ).
        bne     LE5B1                           ; E566 D0 49                    .I
        lda     #$02                            ; E568 A9 02                    ..
        bit     $F2                             ; E56A 24 F2                    $.
        bne     LE579                           ; E56C D0 0B                    ..
        dec     $057E,x                         ; E56E DE 7E 05                 .~.
        bne     LE5B1                           ; E571 D0 3E                    .>
        inc     $F2                             ; E573 E6 F2                    ..
        inc     $F2                             ; E575 E6 F2                    ..
        bne     LE583                           ; E577 D0 0A                    ..
LE579:
        lda     $057E,x                         ; E579 BD 7E 05                 .~.
        beq     LE5E8                           ; E57C F0 6A                    .j
        dec     $057E,x                         ; E57E DE 7E 05                 .~.
        bne     LE5E8                           ; E581 D0 65                    .e
LE583:
        lda     $057F,x                         ; E583 BD 7F 05                 ...
        and     #$3F                            ; E586 29 3F                    )?
        cmp     #$2F                            ; E588 C9 2F                    ./
        bcc     LE5A3                           ; E58A 90 17                    ..
        ldy     #$01                            ; E58C A0 01                    ..
        sbc     #$30                            ; E58E E9 30                    .0
        eor     #$FF                            ; E590 49 FF                    I.
        clc                                     ; E592 18                       .
        adc     $0578                           ; E593 6D 78 05                 mx.
        bcs     LE59B                           ; E596 B0 03                    ..
        dey                                     ; E598 88                       .
        lda     #$00                            ; E599 A9 00                    ..
LE59B:
        sta     $0578,x                         ; E59B 9D 78 05                 .x.
        tya                                     ; E59E 98                       .
        sta     $057E,x                         ; E59F 9D 7E 05                 .~.
        rts                                     ; E5A2 60                       `

; ----------------------------------------------------------------------------
LE5A3:
        dec     $0578,x                         ; E5A3 DE 78 05                 .x.
        bpl     LE5AD                           ; E5A6 10 05                    ..
        lda     #$00                            ; E5A8 A9 00                    ..
        sta     $0578,x                         ; E5AA 9D 78 05                 .x.
LE5AD:
        sta     $057E,x                         ; E5AD 9D 7E 05                 .~.
        rts                                     ; E5B0 60                       `

; ----------------------------------------------------------------------------
LE5B1:
        lda     $0580,x                         ; E5B1 BD 80 05                 ...
        beq     LE5E8                           ; E5B4 F0 32                    .2
        dec     $0580,x                         ; E5B6 DE 80 05                 ...
        bne     LE5E8                           ; E5B9 D0 2D                    .-
LE5BB:
        lda     $0582,x                         ; E5BB BD 82 05                 ...
        sta     $F6                             ; E5BE 85 F6                    ..
        lda     $0583,x                         ; E5C0 BD 83 05                 ...
        sta     $F7                             ; E5C3 85 F7                    ..
        lda     $0581,x                         ; E5C5 BD 81 05                 ...
        tay                                     ; E5C8 A8                       .
        lda     ($F6),y                         ; E5C9 B1 F6                    ..
        iny                                     ; E5CB C8                       .
        pha                                     ; E5CC 48                       H
        tya                                     ; E5CD 98                       .
        sta     $0581,x                         ; E5CE 9D 81 05                 ...
        pla                                     ; E5D1 68                       h
        tay                                     ; E5D2 A8                       .
        and     #$0F                            ; E5D3 29 0F                    ).
        sec                                     ; E5D5 38                       8
        sbc     $0579,x                         ; E5D6 FD 79 05                 .y.
        bcs     LE5DD                           ; E5D9 B0 02                    ..
        lda     #$00                            ; E5DB A9 00                    ..
LE5DD:
        sta     $0578,x                         ; E5DD 9D 78 05                 .x.
        tya                                     ; E5E0 98                       .
        lsr     a                               ; E5E1 4A                       J
        lsr     a                               ; E5E2 4A                       J
        lsr     a                               ; E5E3 4A                       J
        lsr     a                               ; E5E4 4A                       J
        sta     $0580,x                         ; E5E5 9D 80 05                 ...
LE5E8:
        rts                                     ; E5E8 60                       `

; ----------------------------------------------------------------------------
LE5E9:
        lda     $057C,x                         ; E5E9 BD 7C 05                 .|.
        sta     $F0                             ; E5EC 85 F0                    ..
        lda     $057D,x                         ; E5EE BD 7D 05                 .}.
        sta     $F1                             ; E5F1 85 F1                    ..
        lda     $057B,x                         ; E5F3 BD 7B 05                 .{.
        sta     $057A,x                         ; E5F6 9D 7A 05                 .z.
        lda     $F2                             ; E5F9 A5 F2                    ..
        tay                                     ; E5FB A8                       .
        and     #$B3                            ; E5FC 29 B3                    ).
        sta     $F2                             ; E5FE 85 F2                    ..
        tya                                     ; E600 98                       .
        and     #$04                            ; E601 29 04                    ).
        asl     a                               ; E603 0A                       .
        ora     $F2                             ; E604 05 F2                    ..
        sta     $F2                             ; E606 85 F2                    ..
LE608:
        jsr     LE89B                           ; E608 20 9B E8                  ..
        cmp     #$80                            ; E60B C9 80                    ..
        bcc     LE669                           ; E60D 90 5A                    .Z
        cmp     #$C0                            ; E60F C9 C0                    ..
        bcs     LE622                           ; E611 B0 0F                    ..
        and     #$7F                            ; E613 29 7F                    ).
        tay                                     ; E615 A8                       .
        lda     LE978,y                         ; E616 B9 78 E9                 .x.
        sta     $057A,x                         ; E619 9D 7A 05                 .z.
        sta     $057B,x                         ; E61C 9D 7B 05                 .{.
        jmp     LE608                           ; E61F 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE622:
        cmp     #$E0                            ; E622 C9 E0                    ..
        bcs     LE638                           ; E624 B0 12                    ..
        sbc     #$BE                            ; E626 E9 BE                    ..
        sta     $058D,x                         ; E628 9D 8D 05                 ...
        lda     $F0                             ; E62B A5 F0                    ..
        sta     $058E,x                         ; E62D 9D 8E 05                 ...
        lda     $F1                             ; E630 A5 F1                    ..
        sta     $058F,x                         ; E632 9D 8F 05                 ...
        jmp     LE608                           ; E635 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE638:
        sbc     #$EC                            ; E638 E9 EC                    ..
        bcs     LE65A                           ; E63A B0 1E                    ..
        adc     #$0D                            ; E63C 69 0D                    i.
        sta     $058D,x                         ; E63E 9D 8D 05                 ...
        lda     $F0                             ; E641 A5 F0                    ..
        sta     $058E,x                         ; E643 9D 8E 05                 ...
        lda     $F1                             ; E646 A5 F1                    ..
        sta     $058F,x                         ; E648 9D 8F 05                 ...
        jsr     LE89B                           ; E64B 20 9B E8                  ..
        pha                                     ; E64E 48                       H
        jsr     LE89B                           ; E64F 20 9B E8                  ..
        sta     $F1                             ; E652 85 F1                    ..
        pla                                     ; E654 68                       h
        sta     $F0                             ; E655 85 F0                    ..
        jmp     LE608                           ; E657 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE65A:
        asl     a                               ; E65A 0A                       .
        tay                                     ; E65B A8                       .
        lda     LE7BA,y                         ; E65C B9 BA E7                 ...
        sta     $F4                           ; E65F 85 F4                    ..
        lda     LE7BB,y                         ; E661 B9 BB E7                 ...
        sta     $F5                             ; E664 85 F5                    ..
        jmp     ($F4)                         ; E666 6C F4 00                 l..

; ----------------------------------------------------------------------------
LE669:
        tay                                     ; E669 A8                       .
        and     #$40                            ; E66A 29 40                    )@
        beq     LE674                           ; E66C F0 06                    ..
        lda     $F2                             ; E66E A5 F2                    ..
        ora     #$04                            ; E670 09 04                    ..
        sta     $F2                             ; E672 85 F2                    ..
LE674:
        tya                                     ; E674 98                       .
        and     #$3F                            ; E675 29 3F                    )?
        cmp     #$3F                            ; E677 C9 3F                    .?
        bne     LE684                           ; E679 D0 09                    ..
        lda     $F2                             ; E67B A5 F2                    ..
        ora     #$40                            ; E67D 09 40                    .@
        sta     $F2                             ; E67F 85 F2                    ..
        jmp     LE7AF                           ; E681 4C AF E7                 L..

; ----------------------------------------------------------------------------
LE684:
        lda     $056B                           ; E684 AD 6B 05                 .k.
        cmp     #$02                            ; E687 C9 02                    ..
        bne     LE694                           ; E689 D0 09                    ..
        sty     $F7                             ; E68B 84 F7                    ..
        lda     #$00                            ; E68D A9 00                    ..
        sta     $F6                             ; E68F 85 F6                    ..
        jmp     LE6CF                           ; E691 4C CF E6                 L..

; ----------------------------------------------------------------------------
LE694:
        tya                                     ; E694 98                       .
        and     #$30                            ; E695 29 30                    )0
        lsr     a                               ; E697 4A                       J
        sta     $F4                           ; E698 85 F4                    ..
        lsr     a                               ; E69A 4A                       J
        adc     $F4                           ; E69B 65 F4                    e.
        sta     $F4                           ; E69D 85 F4                    ..
        tya                                     ; E69F 98                       .
        and     #$0F                            ; E6A0 29 0F                    ).
        adc     $F4                           ; E6A2 65 F4                    e.
        adc     $058A,x                         ; E6A4 7D 8A 05                 }..
        ldy     #$00                            ; E6A7 A0 00                    ..
LE6A9:
        cmp     #$0C                            ; E6A9 C9 0C                    ..
        bcc     LE6B2                           ; E6AB 90 05                    ..
        sbc     #$0C                            ; E6AD E9 0C                    ..
        iny                                     ; E6AF C8                       .
        bne     LE6A9                           ; E6B0 D0 F7                    ..
LE6B2:
        sty     $F4                           ; E6B2 84 F4                    ..
        asl     a                               ; E6B4 0A                       .
        tay                                     ; E6B5 A8                       .
        lda     LE8A6,y                         ; E6B6 B9 A6 E8                 ...
        sta     $F6                             ; E6B9 85 F6                    ..
        lda     LE8A7,y                         ; E6BB B9 A7 E8                 ...
        sta     $F7                             ; E6BE 85 F7                    ..
        lda     $F4                           ; E6C0 A5 F4                    ..
        sta     $058B,x                         ; E6C2 9D 8B 05                 ...
        beq     LE6CF                           ; E6C5 F0 08                    ..
        tay                                     ; E6C7 A8                       .
LE6C8:
        lsr     $F7                             ; E6C8 46 F7                    F.
        ror     $F6                             ; E6CA 66 F6                    f.
        dey                                     ; E6CC 88                       .
        bne     LE6C8                           ; E6CD D0 F9                    ..
LE6CF:
        lda     $F6                             ; E6CF A5 F6                    ..
        sta     $0584,x                         ; E6D1 9D 84 05                 ...
        lda     $F7                             ; E6D4 A5 F7                    ..
        sta     $0585,x                         ; E6D6 9D 85 05                 ...
        lda     #$20                            ; E6D9 A9 20                    . 
        bit     $F2                             ; E6DB 24 F2                    $.
        beq     LE73E                           ; E6DD F0 5F                    ._
        .byte   $A9,$00,$85,$F4,$A5,$F6,$38,$FD ; E6DF A9 00 85 F4 A5 F6 38 FD  ......8.
        .byte   $76,$05,$A8,$A5,$F7,$FD,$77,$05 ; E6E7 76 05 A8 A5 F7 FD 77 05  v.....w.
        .byte   $B0,$0E,$E6,$F4,$49,$FF,$48,$98 ; E6EF B0 0E E6 F4 49 FF 48 98  ....I.H.
        .byte   $49,$FF,$69,$01,$A8,$68,$69,$00 ; E6F7 49 FF 69 01 A8 68 69 00  I.i..hi.
        .byte   $84,$F6,$85,$F7,$BD,$89,$05,$9D ; E6FF 84 F6 85 F7 BD 89 05 9D  ........
        .byte   $88,$05,$85,$F5,$A9,$00,$A0,$10 ; E707 88 05 85 F5 A9 00 A0 10  ........
        .byte   $06,$F6,$26,$F7,$2A,$C5,$F5,$90 ; E70F 06 F6 26 F7 2A C5 F5 90  ..&.*...
        .byte   $04,$E5,$F5,$E6,$F6,$88,$D0,$F0 ; E717 04 E5 F5 E6 F6 88 D0 F0  ........
        .byte   $A4,$F6,$A5,$F7,$C6,$F4,$D0,$0D ; E71F A4 F6 A5 F7 C6 F4 D0 0D  ........
        .byte   $49,$FF,$48,$98,$49,$FF,$18,$69 ; E727 49 FF 48 98 49 FF 18 69  I.H.I..i
        .byte   $01,$A8,$68,$69,$00,$9D,$87,$05 ; E72F 01 A8 68 69 00 9D 87 05  ..hi....
        .byte   $98,$9D,$86,$05,$4C,$64,$E7     ; E737 98 9D 86 05 4C 64 E7     ....Ld.
; ----------------------------------------------------------------------------
LE73E:
        lda     $F6                             ; E73E A5 F6                    ..
        sta     $0576,x                         ; E740 9D 76 05                 .v.
        lda     $F7                             ; E743 A5 F7                    ..
        sta     $0577,x                         ; E745 9D 77 05                 .w.
        lda     #$10                            ; E748 A9 10                    ..
        bit     $F2                             ; E74A 24 F2                    $.
        beq     LE764                           ; E74C F0 16                    ..
        .byte   $BD,$86,$05,$85,$F4,$BD,$87,$05 ; E74E BD 86 05 85 F4 BD 87 05  ........
        .byte   $85,$F5,$A0,$00,$B1,$F4,$9D,$88 ; E756 85 F5 A0 00 B1 F4 9D 88  ........
        .byte   $05,$A9,$01,$9D,$89,$05         ; E75E 05 A9 01 9D 89 05        ......
; ----------------------------------------------------------------------------
LE764:
        lda     #$08                            ; E764 A9 08                    ..
        bit     $F2                             ; E766 24 F2                    $.
        bne     LE7AF                           ; E768 D0 45                    .E
        lda     $F2                             ; E76A A5 F2                    ..
        and     #$FD                            ; E76C 29 FD                    ).
        sta     $F2                             ; E76E 85 F2                    ..
        lda     #$00                            ; E770 A9 00                    ..
        sta     $0581,x                         ; E772 9D 81 05                 ...
        jsr     LE5BB                           ; E775 20 BB E5                  ..
        lda     $F2                             ; E778 A5 F2                    ..
        eor     #$01                            ; E77A 49 01                    I.
        and     #$05                            ; E77C 29 05                    ).
        bne     LE7AF                           ; E77E D0 2F                    ./
        lda     $057A,x                         ; E780 BD 7A 05                 .z.
        lsr     a                               ; E783 4A                       J
        sta     $F4                           ; E784 85 F4                    ..
        lda     $057F,x                         ; E786 BD 7F 05                 ...
        asl     a                               ; E789 0A                       .
        bcs     LE79A                           ; E78A B0 0E                    ..
        asl     a                               ; E78C 0A                       .
        bcs     LE7A1                           ; E78D B0 12                    ..
        lda     $F4                           ; E78F A5 F4                    ..
        lsr     a                               ; E791 4A                       J
        clc                                     ; E792 18                       .
        adc     $F4                           ; E793 65 F4                    e.
        sta     $F4                           ; E795 85 F4                    ..
        jmp     LE7A1                           ; E797 4C A1 E7                 L..

; ----------------------------------------------------------------------------
LE79A:
        lsr     $F4                           ; E79A 46 F4                    F.
        asl     a                               ; E79C 0A                       .
        bcc     LE7A1                           ; E79D 90 02                    ..
        lsr     $F4                           ; E79F 46 F4                    F.
LE7A1:
        sec                                     ; E7A1 38                       8
        lda     $F4                           ; E7A2 A5 F4                    ..
        bne     LE7A7                           ; E7A4 D0 01                    ..
        clc                                     ; E7A6 18                       .
LE7A7:
        lda     $057A,x                         ; E7A7 BD 7A 05                 .z.
        sbc     $F4                           ; E7AA E5 F4                    ..
        sta     $057E,x                         ; E7AC 9D 7E 05                 .~.
LE7AF:
        lda     $F0                             ; E7AF A5 F0                    ..
        sta     $057C,x                         ; E7B1 9D 7C 05                 .|.
        lda     $F1                             ; E7B4 A5 F1                    ..
        sta     $057D,x                         ; E7B6 9D 7D 05                 .}.
        rts                                     ; E7B9 60                       `

; ----------------------------------------------------------------------------
LE7BA:
        .byte   $E2                             ; E7BA E2                       .
LE7BB:
        .byte   $E7,$F6,$E7,$FF,$E7,$08,$E8,$15 ; E7BB E7 F6 E7 FF E7 08 E8 15  ........
        .byte   $E8,$1E,$E8,$2B,$E8,$3A,$E8,$90 ; E7C3 E8 1E E8 2B E8 3A E8 90  ...+.:..
        .byte   $E8,$90,$E8,$90,$E8,$90,$E8,$43 ; E7CB E8 90 E8 90 E8 90 E8 43  .......C
        .byte   $E8,$52,$E8,$64,$E8,$90,$E8,$90 ; E7D3 E8 52 E8 64 E8 90 E8 90  .R.d....
        .byte   $E8,$90,$E8,$90,$E8,$93,$E8     ; E7DB E8 90 E8 90 E8 93 E8     .......
; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E7E2 20 9B E8                  ..
        asl     a                               ; E7E5 0A                       .
        tay                                     ; E7E6 A8                       .
        lda     UnknownSoundDataPointers,y                         ; E7E7 B9 FD E8                 ...
        sta     $0582,x                         ; E7EA 9D 82 05                 ...
        lda     UnknownSoundDataPointers+1,y                         ; E7ED B9 FE E8                 ...
        sta     $0583,x                         ; E7F0 9D 83 05                 ...
        jmp     LE608                           ; E7F3 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E7F6 20 9B E8                  ..
        sta     $058C,x                         ; E7F9 9D 8C 05                 ...
        jmp     LE608                           ; E7FC 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E7FF 20 9B E8                  ..
        sta     $0579,x                         ; E802 9D 79 05                 .y.
        jmp     LE608                           ; E805 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E808 20 9B E8                  ..
        clc                                     ; E80B 18                       .
        adc     $0579,x                         ; E80C 7D 79 05                 }y.
        sta     $0579,x                         ; E80F 9D 79 05                 .y.
        jmp     LE608                           ; E812 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E815 20 9B E8                  ..
        sta     $058A,x                         ; E818 9D 8A 05                 ...
        jmp     LE608                           ; E81B 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E81E 20 9B E8                  ..
        clc                                     ; E821 18                       .
        adc     $058A,x                         ; E822 7D 8A 05                 }..
        sta     $058A,x                         ; E825 9D 8A 05                 ...
        jmp     LE608                           ; E828 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E82B 20 9B E8                  ..
        sta     $057F,x                         ; E82E 9D 7F 05                 ...
        lda     $F2                             ; E831 A5 F2                    ..
        ora     #$01                            ; E833 09 01                    ..
        sta     $F2                             ; E835 85 F2                    ..
        jmp     LE608                           ; E837 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        lda     $F2                             ; E83A A5 F2                    ..
        and     #$FE                            ; E83C 29 FE                    ).
        sta     $F2                             ; E83E 85 F2                    ..
        jmp     LE608                           ; E840 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E843 20 9B E8                  ..
        pha                                     ; E846 48                       H
        jsr     LE89B                           ; E847 20 9B E8                  ..
        sta     $F1                             ; E84A 85 F1                    ..
        pla                                     ; E84C 68                       h
        sta     $F0                             ; E84D 85 F0                    ..
        jmp     LE608                           ; E84F 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        dec     $058D,x                         ; E852 DE 8D 05                 ...
        beq     LE861                           ; E855 F0 0A                    ..
        lda     $058E,x                         ; E857 BD 8E 05                 ...
        sta     $F0                             ; E85A 85 F0                    ..
        lda     $058F,x                         ; E85C BD 8F 05                 ...
        sta     $F1                             ; E85F 85 F1                    ..
LE861:
        jmp     LE608                           ; E861 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        dec     $058D,x                         ; E864 DE 8D 05                 ...
        beq     LE881                           ; E867 F0 18                    ..
        .byte   $BD,$8E,$05,$85,$F4,$BD,$8F,$05 ; E869 BD 8E 05 85 F4 BD 8F 05  ........
        .byte   $85,$F5,$A0,$02,$B1,$F4,$85,$F0 ; E871 85 F5 A0 02 B1 F4 85 F0  ........
        .byte   $C8,$B1,$F4,$85,$F1,$4C,$08,$E6 ; E879 C8 B1 F4 85 F1 4C 08 E6  .....L..
; ----------------------------------------------------------------------------
LE881:
        lda     $058E,x                         ; E881 BD 8E 05                 ...
        clc                                     ; E884 18                       .
        adc     #$02                            ; E885 69 02                    i.
        sta     $F0                             ; E887 85 F0                    ..
        lda     $058F,x                         ; E889 BD 8F 05                 ...
        adc     #$00                            ; E88C 69 00                    i.
        sta     $F1                             ; E88E 85 F1                    ..
        jmp     LE608                           ; E890 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        lda     #$00                            ; E893 A9 00                    ..
        sta     $F2                             ; E895 85 F2                    ..
        sta     $0574,x                         ; E897 9D 74 05                 .t.
        rts                                     ; E89A 60                       `

; ----------------------------------------------------------------------------
LE89B:
        ldy     #$00                            ; E89B A0 00                    ..
        lda     ($F0),y                         ; E89D B1 F0                    ..
        inc     $F0                             ; E89F E6 F0                    ..
        bne     LE8A5                           ; E8A1 D0 02                    ..
        inc     $F1                             ; E8A3 E6 F1                    ..
LE8A5:
        rts                                     ; E8A5 60                       `

; ----------------------------------------------------------------------------
LE8A6:
        .byte   $E4                             ; E8A6 E4                       .
LE8A7:
        .byte   $6A,$E4,$64,$3A,$5F,$E2,$59,$D7 ; E8A7 6A E4 64 3A 5F E2 59 D7  j.d:_.Y.
        .byte   $54,$14,$50,$95,$4B,$57,$47,$56 ; E8AF 54 14 50 95 4B 57 47 56  T.P.KWGV
        .byte   $43,$8F,$3F,$FD,$3B,$A0,$38     ; E8B7 43 8F 3F FD 3B A0 38     C.?.;.8



MusicMapScreen                 = $00
MusicEncounterScreen           = $01
MusicFinaleScreen              = $02
MusicBonusScreenStart          = $03
MusicOutroScreen               = $04
MusicGameOverScreen            = $05
MusicTitleScreen               = $06
MusicStartEncounter            = $07
SFXEncounterBoatFire           = $08
SFXBonusPlaneFire              = $09
SFXEncounterSubmarineFire      = $0A
SFXEncounterHarpoonFire        = $0B
SFXEncounterJawsHit            = $0C
SFXEncounterJawsHarpoonHit     = $0D
SFXEncounterEnemyDeath         = $0E
SFXEncounterBoatDespawn        = $0F
SFXFinaleMiss                  = $10
SFXEncounterBoatDespawnDupe    = $11
SFXPlayerDeath                 = $12
SFXSilent                      = $13
SFXMapTrackerPulse             = $14
SFXEncounterPickup             = $15
SFXPause                       = $16
SFXFinaleStrobe                = $17
SFXFinaleHit                   = $18
SFXUnknown2                    = $19
MusicBonusScreenEnd            = $1A
MusicIntroScreen               = $1B
MusicMapScreenDupe             = $1C
MusicPortPowerup               = $1D
SFXPortNeedMoreConchShells     = $1E
SFXSTOP                        = $FF

SoundPointers:
        .addr MusicMapScreenData
        .addr MusicEncounterScreenData
        .addr MusicFinaleScreenData
        .addr MusicBonusScreenStartData
        .addr MusicOutroScreenData
        .addr MusicGameOverScreenData                         ; unused music?
        .addr MusicTitleScreenData
        .addr MusicStartEncounterData
        .addr SFXEncounterBoatFireData
        .addr SFXBonusPlaneFireData
        .addr SFXEncounterSubmarineFireData
        .addr SFXEncounterHarpoonFireData
        .addr SFXEncounterJawsHitData
        .addr SFXEncounterJawsHarpoonHitData
        .addr SFXEncounterEnemyDeathData
        .addr SFXEncounterBoatDespawnData
        .addr SFXFinaleMissData
        .addr SFXEncounterBoatDespawnData              ; unused duplicate?
        .addr SFXPlayerDeathData
        .addr SFXSilentData
        .addr SFXMapTrackerPulseData
        .addr SFXEncounterPickupData
        .addr SFXPauseData
        .addr SFXFinaleStrobeData
        .addr SFXFinaleHitData
        .addr SFXUnknown2Data                          ; unused chime?
        .addr MusicBonusScreenEndData
        .addr MusicIntroScreenData
        .addr MusicMapScreenData
        .addr MusicPortPowerupData
        .addr SFXPortNeedMoreConchShellsData

SFXSilentData:
        .byte $FF

UnknownSoundDataPointers:
        .addr UnknownSoundData01Data
        .addr UnknownSoundData02Data
        .addr UnknownSoundData03Data
        .addr UnknownSoundData04Data
        .addr UnknownSoundData05Data
        .addr UnknownSoundData06Data
        .addr UnknownSoundData07Data
        .addr UnknownSoundData08Data
        .addr UnknownSoundData09Data
        .addr UnknownSoundData10Data

UnknownSoundData01Data:
        .byte $13,$17,$1B,$7F,$3E,$3D,$3C,$3B,$3A,$39,$38,$37,$46,$45,$54,$53,$52,$51,$00
        
UnknownSoundData02Data:
        .byte $18,$0F

UnknownSoundData03Data:
        .byte $18,$2F,$1B,$17,$13,$00
        
UnknownSoundData04Data:
        .byte $1C,$1D,$1E,$FF,$8E,$8D,$7C,$7B,$8A,$89,$88,$87,$86,$85,$04
        
UnknownSoundData05Data:
        .byte $0F

UnknownSoundData06Data:
        .byte $7F,$4E,$4D,$4C,$8B,$8A,$C9,$C8,$C7,$C6,$05
        
UnknownSoundData07Data:
        .byte $8F,$4E,$3D,$2C,$1B,$1A,$19,$18,$17,$16,$15,$14,$03
        
UnknownSoundData08Data:
        .byte $FA,$4B,$4C,$3D,$3E,$FF,$FE,$8D,$8C,$8B,$0A

UnknownSoundData09Data:
        .byte $2F,$2E,$3D,$4C,$4B,$8A,$F9,$F8,$F7,$06
        
UnknownSoundData10Data:
        .byte $1F,$1D,$1B,$1A,$1C,$1A,$18,$00,$1A,$17,$14,$18,$14,$16,$04



LE978:
.byte   $04,$06,$08,$0C,$10,$18,$20,$30
.byte   $40,$60,$80,$0A,$14,$03,$02,$01
.byte   $03,$04,$06,$09,$0C,$12,$18,$24
.byte   $30,$48,$60,$08,$09,$03,$02,$01
.byte   $9A,$E9


MusicMapScreenData:
.byte   $00,$A4,$E9,$01,$DC,$E9
.byte   $02,$EB,$E9,$FF,$EC,$08,$ED,$00
.byte   $EE,$0D,$F0,$00,$F2,$C2,$E0,$E1
.byte   $E9,$EF,$FE,$E0,$E1,$E9,$EF,$FE
.byte   $E0,$E1,$E9,$EF,$FE,$E0,$E1,$E9
.byte   $EF,$FE,$E0,$E1,$E9,$EF,$02,$E0
.byte   $E1,$E9,$EF,$02,$E0,$E1,$E9,$EF
.byte   $02,$E0,$E1,$E9,$EF,$02,$E0,$E1
.byte   $E9,$F8,$A4,$E9,$80,$3F,$F8,$A4
.byte   $E9,$82,$22,$32,$22,$27,$22,$32
.byte   $22,$27,$FA,$EC,$04,$8A,$57,$17
.byte   $55,$15,$54,$14,$53,$13,$F8,$EB
.byte   $E9

MusicEncounterScreenData:
.byte   $00,$03,$EA,$01,$61,$EA,$02
.byte   $C1,$EA,$FF,$EC,$07,$ED,$00,$EE
.byte   $07,$F0,$09,$F2,$CA,$C1,$84,$16
.byte   $15,$14,$58,$88,$18,$17,$16,$F9
.byte   $EC,$05,$F2,$48,$82,$1A,$19,$18
.byte   $17,$16,$85,$3F,$88,$3F,$86,$3F
.byte   $84,$EF,$04,$18,$18,$EF,$FB,$18
.byte   $18,$EF,$FA,$18,$18,$EF,$07,$82
.byte   $13,$84,$18,$82,$1A,$EF,$FA,$23
.byte   $EF,$06,$85,$3F,$84,$3F,$82,$23
.byte   $22,$21,$22,$18,$3F,$86,$3F,$84
.byte   $EF,$04,$18,$18,$EF,$FB,$18,$18
.byte   $EF,$FA,$18,$18,$EF,$07,$F8,$03
.byte   $EA,$EC,$07,$ED,$40,$EE,$07,$F0
.byte   $09,$F2,$CA,$C1,$87,$1A,$84,$61
.byte   $88,$61,$8A,$21,$F9,$EC,$05,$F2
.byte   $48,$82,$23,$3F,$3F,$3F,$23,$85
.byte   $3F,$84,$3F,$1A,$18,$82,$13,$3F
.byte   $86,$3F,$84,$EF,$04,$21,$21,$EF
.byte   $FB,$21,$21,$EF,$FA,$21,$21,$EF
.byte   $07,$82,$18,$84,$21,$82,$23,$EF
.byte   $FA,$28,$EF,$06,$85,$3F,$84,$3F
.byte   $1A,$18,$82,$13,$3F,$86,$3F,$84
.byte   $EF,$04,$21,$21,$EF,$FB,$21,$21
.byte   $EF,$FA,$21,$21,$EF,$07,$F8,$61
.byte   $EA,$E0,$64,$F5,$F2,$81,$CF,$86
.byte   $0A,$F9,$CF,$07,$F9,$F8,$C1,$EA

MusicGameOverScreenData:
.byte   $00,$DA,$EA,$01,$08,$EB,$02,$36
.byte   $EB,$FF,$EC,$06,$ED,$00,$EE,$05
.byte   $F0,$0C,$F2,$C3,$94,$12,$22,$15
.byte   $25,$96,$17,$94,$19,$62,$22,$32
.byte   $25,$35,$96,$27,$94,$29,$3F,$92
.byte   $32,$30,$3F,$27,$25,$3F,$27,$25
.byte   $27,$25,$94,$24,$20,$20,$22,$FF
.byte   $EC,$06,$ED,$00,$EE,$05,$F0,$0C
.byte   $F2,$C3,$94,$09,$19,$12,$22,$96
.byte   $14,$94,$15,$19,$19,$29,$22,$32
.byte   $96,$24,$94,$25,$3F,$92,$2B,$29
.byte   $3F,$24,$22,$3F,$22,$22,$22,$22
.byte   $94,$20,$17,$17,$19,$FF,$E0,$64
.byte   $F5,$94,$12,$12,$22,$12,$96,$20
.byte   $94,$19,$57,$17,$96,$15,$14,$94
.byte   $15,$96,$10,$92,$12,$12,$96,$3F
.byte   $92,$12,$12,$96,$3F,$94,$10,$92
.byte   $10,$3F,$F3,$8E,$72,$70,$6A,$68
.byte   $66,$65,$64,$63,$62,$FF

SFXPlayerDeathData:
.byte $00,$72
.byte   $EB,$01,$70,$EB,$03,$8E,$EB,$FF
.byte   $82,$3F,$EC,$04,$ED,$00,$EE,$02
.byte   $F0,$20,$CF,$8F,$60,$5E,$5C,$5A
.byte   $58,$56,$54,$52,$50,$48,$46,$44
.byte   $02,$F1,$F7,$F9,$00,$FF,$EC,$05
.byte   $EE,$02,$81,$49,$4A,$4B,$4C,$4D
.byte   $0E,$FF


MusicPortPowerupData:
.byte $00,$A4,$EB,$01,$C2,$EB
.byte   $02,$E0,$EB,$FF,$EC,$07,$ED,$80
.byte   $EE,$02,$F0,$00,$F2,$F2,$94,$25
.byte   $24,$23,$22,$20,$1B,$20,$22,$25
.byte   $24,$27,$26,$29,$28,$29,$2B,$98
.byte   $30,$FF,$EC,$07,$ED,$80,$EE,$02
.byte   $F0,$00,$F2,$F2,$94,$20,$20,$1A
.byte   $1A,$17,$17,$17,$1B,$20,$20,$22
.byte   $22,$24,$24,$25,$27,$98,$27,$FF
.byte   $E0,$64,$F5,$94,$10,$17,$0A,$15
.byte   $07,$12,$07,$07,$10,$17,$12,$19
.byte   $14,$1B,$15,$17,$F3,$9F,$20,$1B
.byte   $1A,$19,$18,$17,$16,$15,$14,$13
.byte   $12,$11,$10,$FF

SFXPortNeedMoreConchShellsData:
.byte $00,$0D,$EC,$01
.byte   $0B,$EC,$FF,$F0,$01,$EC,$04,$ED
.byte   $00,$C3,$82,$15,$80,$3F,$F9,$EE
.byte   $0F,$FF

MusicBonusScreenEndData:
.byte $00,$24,$EC,$01,$3C,$EC
.byte   $02,$54,$EC,$FF,$EC,$05,$ED,$00
.byte   $EE,$04,$F0,$0C,$F2,$C1,$94,$19
.byte   $1B,$19,$15,$19,$1B,$20,$22,$20
.byte   $1B,$3F,$20,$FF,$EC,$05,$ED,$00
.byte   $EE,$04,$F0,$0C,$F2,$C1,$94,$15
.byte   $17,$15,$12,$15,$17,$19,$1B,$17
.byte   $17,$3F,$17,$FF,$E0,$64,$F5,$98
.byte   $15,$17,$94,$20,$17,$3F,$20,$FF

SFXUnknown2Data:
.byte   $04,$01,$65,$EC,$FF,$EC,$06,$ED
.byte   $80,$F0,$18,$EE,$00,$C3,$8F,$10
.byte   $20,$EF,$03,$F9,$EE,$00,$C3,$8F
.byte   $14,$24,$EF,$03,$F9,$EE,$00,$C3
.byte   $8F,$17,$27,$EF,$03,$F9,$EE,$00
.byte   $C3,$8F,$20,$30,$EF,$03,$F9,$FF

MusicIntroScreenData:
.byte   $00,$9A,$EC,$01,$BE,$EC,$02,$E2
.byte   $EC,$FF,$EC,$05,$ED,$C0,$F0,$0C
.byte   $F2,$C1,$EE,$03,$C1,$84,$17,$9B
.byte   $19,$84,$3F,$9B,$19,$84,$3F,$9B
.byte   $19,$96,$22,$F9,$98,$20,$22,$84
.byte   $29,$9B,$27,$96,$29,$FF,$EC,$05
.byte   $ED,$C0,$F0,$0C,$F2,$C1,$EE,$03
.byte   $C1,$84,$14,$9B,$14,$84,$3F,$9B
.byte   $14,$84,$3F,$9B,$14,$96,$19,$F9
.byte   $98,$19,$1B,$84,$24,$9B,$24,$96
.byte   $24,$FF,$E0,$64,$F5,$C7,$96,$09
.byte   $F9,$98,$15,$17,$84,$09,$9B,$19
.byte   $84,$09,$9B,$19,$07,$09,$07,$09
.byte   $FF


SFXEncounterEnemyDeathData:
.byte $04,$01,$FE,$EC,$FF,$EC,$06
.byte   $ED,$C0,$EE,$00,$F0,$0C,$8F,$C5
.byte   $60,$30,$02,$F1,$03,$EF,$01,$F9
.byte   $FF


MusicBonusScreenStartData:
.byte $00,$1B,$ED,$01,$93,$ED,$02
.byte   $11,$EE,$FF,$EC,$08,$ED,$00,$EE
.byte   $05,$F0,$0C,$F2,$C2,$82,$12,$14
.byte   $E0,$5B,$ED,$22,$17,$86,$17,$17
.byte   $84,$1B,$59,$8A,$59,$87,$19,$84
.byte   $19,$86,$17,$84,$3F,$82,$12,$14
.byte   $E0,$5B,$ED,$22,$17,$86,$17,$17
.byte   $84,$16,$57,$8A,$57,$87,$17,$84
.byte   $19,$86,$17,$84,$19,$82,$12,$14
.byte   $F8,$28,$ED,$84,$17,$17,$82,$12
.byte   $84,$14,$82,$12,$87,$20,$84,$5B
.byte   $88,$5B,$84,$1B,$82,$1B,$22,$1B
.byte   $19,$17,$3F,$22,$32,$32,$22,$32
.byte   $32,$84,$3F,$87,$17,$84,$57,$88
.byte   $57,$84,$17,$3F,$EF,$FC,$22,$62
.byte   $22,$EF,$04,$17,$86,$17,$3F,$84
.byte   $22,$62,$FA,$EC,$08,$ED,$C0,$EE
.byte   $05,$F0,$0C,$F2,$C2,$84,$3F,$E0
.byte   $DA,$ED,$17,$12,$86,$12,$12,$84
.byte   $14,$54,$88,$55,$84,$15,$15,$14
.byte   $52,$87,$12,$84,$12,$86,$10,$84
.byte   $0B,$3F,$E0,$DA,$ED,$17,$12,$86
.byte   $12,$12,$84,$12,$52,$12,$22,$27
.byte   $22,$29,$86,$2B,$84,$27,$30,$27
.byte   $2B,$27,$29,$86,$2B,$84,$27,$F8
.byte   $9F,$ED,$82,$22,$32,$32,$22,$32
.byte   $32,$84,$3F,$87,$17,$84,$57,$88
.byte   $57,$84,$17,$86,$3F,$82,$12,$14
.byte   $84,$17,$17,$82,$12,$84,$14,$82
.byte   $12,$87,$20,$84,$5B,$88,$5B,$84
.byte   $1B,$3F,$EF,$FC,$17,$57,$17,$EF
.byte   $04,$12,$86,$12,$3F,$84,$17,$55
.byte   $FA,$EC,$04,$F0,$18,$F2,$C1,$82
.byte   $02,$04,$E0,$46,$EE,$03,$82,$03
.byte   $3F,$03,$3F,$03,$3F,$03,$3F,$03
.byte   $3F,$03,$3F,$03,$3F,$84,$02,$86
.byte   $02,$84,$02,$04,$86,$04,$84,$04
.byte   $05,$86,$05,$84,$05,$06,$86,$06
.byte   $82,$02,$04,$F8,$1A,$EE,$84,$07
.byte   $82,$07,$3F,$84,$07,$82,$07,$3F
.byte   $07,$3F,$07,$3F,$84,$07,$82,$07
.byte   $3F,$07,$3F,$07,$3F,$84,$07,$82
.byte   $07,$3F,$07,$3F,$0B,$12,$0B,$09
.byte   $02,$04,$84,$05,$82,$05,$3F,$84
.byte   $05,$82,$05,$3F,$05,$3F,$05,$3F
.byte   $84,$05,$82,$05,$3F,$05,$3F,$05
.byte   $3F,$84,$05,$82,$05,$3F,$05,$85
.byte   $3F,$84,$05,$44,$04,$82,$04,$3F
.byte   $04,$3F,$04,$3F,$04,$3F,$04,$3F
.byte   $84,$04,$43,$FA


MusicOutroScreenData:
.byte $00,$A6,$EE,$01
.byte   $BA,$EF,$02,$34,$F1,$FF,$EC,$07
.byte   $ED,$C0,$EE,$05,$F0,$0C,$F2,$C2
.byte   $8A,$3F,$3F,$3F,$89,$3F,$84,$3F
.byte   $82,$16,$17,$E0,$99,$EF,$84,$3F
.byte   $82,$17,$19,$E0,$99,$EF,$86,$12
.byte   $84,$10,$14,$3F,$86,$17,$84,$17
.byte   $19,$17,$1B,$20,$1B,$86,$17,$84
.byte   $14,$86,$17,$84,$16,$86,$17,$19
.byte   $84,$1B,$86,$20,$84,$1B,$19,$17
.byte   $87,$24,$86,$22,$82,$10,$12,$14
.byte   $16,$17,$84,$19,$82,$1B,$86,$20
.byte   $22,$24,$84,$22,$86,$1B,$84,$19
.byte   $82,$1B,$19,$17,$14,$84,$14,$17
.byte   $87,$3F,$84,$14,$17,$1B,$88,$62
.byte   $84,$22,$17,$86,$19,$ED,$80,$8A
.byte   $62,$88,$22,$8C,$20,$1B,$85,$20
.byte   $87,$1B,$84,$17,$86,$19,$84,$1B
.byte   $54,$14,$12,$87,$12,$82,$12,$14
.byte   $16,$17,$84,$19,$86,$17,$84,$14
.byte   $86,$17,$82,$53,$14,$84,$17,$14
.byte   $86,$19,$84,$1B,$86,$14,$84,$12
.byte   $86,$22,$20,$84,$1B,$87,$19,$82
.byte   $23,$85,$24,$88,$22,$84,$3F,$82
.byte   $12,$14,$16,$17,$84,$19,$8A,$62
.byte   $88,$22,$8C,$27,$26,$85,$27,$86
.byte   $24,$84,$20,$87,$22,$84,$24,$5B
.byte   $1B,$19,$88,$19,$86,$1B,$89,$17
.byte   $86,$22,$89,$1B,$84,$24,$22,$86
.byte   $27,$84,$24,$22,$86,$27,$64,$24
.byte   $27,$84,$27,$87,$29,$8A,$67,$86
.byte   $27,$84,$16,$82,$16,$16,$84,$17
.byte   $FF,$87,$22,$82,$16,$17,$84,$22
.byte   $20,$1B,$20,$17,$82,$16,$57,$86
.byte   $17,$3F,$84,$12,$14,$87,$15,$82
.byte   $12,$14,$84,$15,$17,$19,$3F,$89
.byte   $12,$FA,$E0,$07,$F1,$E0,$07,$F1
.byte   $E0,$07,$F1,$E0,$07,$F1,$E0,$07
.byte   $F1,$E0,$07,$F1,$E0,$22,$F1,$ED
.byte   $80,$EE,$06,$84,$12,$82,$22,$22
.byte   $84,$20,$1B,$82,$19,$12,$17,$19
.byte   $EE,$00,$02,$04,$06,$07,$E0,$07
.byte   $F1,$E0,$07,$F1,$E0,$22,$F1,$ED
.byte   $40,$EE,$06,$EC,$08,$84,$12,$22
.byte   $12,$20,$12,$1B,$12,$19,$ED,$80
.byte   $F2,$B5,$82,$20,$20,$27,$27,$30
.byte   $30,$37,$37,$30,$32,$30,$32,$30
.byte   $32,$30,$32,$1B,$1B,$27,$27,$2B
.byte   $2B,$37,$37,$2B,$30,$2B,$30,$2B
.byte   $30,$2B,$30,$19,$19,$26,$26,$32
.byte   $32,$36,$36,$30,$32,$30,$32,$30
.byte   $32,$30,$32,$ED,$40,$F2,$C1,$EC
.byte   $07,$84,$27,$26,$24,$87,$30,$86
.byte   $2B,$82,$19,$1B,$20,$22,$24,$84
.byte   $26,$ED,$80,$F2,$B5,$82,$27,$36
.byte   $37,$36,$34,$32,$37,$36,$37,$ED
.byte   $40,$F2,$C1,$86,$30,$84,$2B,$27
.byte   $ED,$80,$F2,$B5,$82,$36,$37,$36
.byte   $37,$36,$37,$36,$37,$84,$20,$24
.byte   $82,$34,$34,$37,$37,$34,$34,$37
.byte   $37,$84,$34,$37,$EC,$07,$ED,$40
.byte   $F2,$C1,$88,$6B,$84,$2B,$24,$86
.byte   $26,$F0,$0C,$ED,$80,$EC,$09,$C5
.byte   $82,$32,$30,$2B,$29,$30,$2B,$29
.byte   $27,$2B,$29,$27,$24,$29,$27,$24
.byte   $22,$F9,$EC,$08,$ED,$80,$86,$19
.byte   $84,$17,$87,$16,$82,$16,$85,$17
.byte   $88,$19,$84,$3F,$82,$0B,$10,$12
.byte   $14,$84,$16,$EC,$09,$ED,$80,$C2
.byte   $82,$32,$30,$2B,$29,$30,$2B,$29
.byte   $27,$2B,$29,$27,$24,$29,$27,$24
.byte   $22,$F9,$32,$30,$2B,$29,$30,$2B
.byte   $29,$27,$2B,$29,$27,$24,$EC,$07
.byte   $ED,$00,$86,$19,$89,$14,$86,$1B
.byte   $89,$17,$84,$20,$1B,$86,$24,$84
.byte   $20,$1B,$86,$24,$60,$20,$24,$84
.byte   $24,$87,$24,$8A,$62,$86,$22,$84
.byte   $10,$82,$10,$10,$84,$12,$FF,$EC
.byte   $09,$ED,$00,$EE,$02,$F0,$00,$F3
.byte   $82,$07,$06,$04,$02,$07,$06,$04
.byte   $02,$07,$06,$04,$02,$04,$06,$07
.byte   $09,$FA,$82,$05,$04,$02,$00,$05
.byte   $04,$02,$00,$05,$04,$02,$00,$02
.byte   $04,$05,$07,$FA,$E0,$64,$F5,$E0
.byte   $02,$F2,$E0,$02,$F2,$E0,$02,$F2
.byte   $E0,$02,$F2,$E0,$02,$F2,$E0,$02
.byte   $F2,$E0,$08,$F2,$E0,$02,$F2,$E0
.byte   $02,$F2,$E0,$08,$F2,$84,$10,$10
.byte   $17,$10,$3F,$82,$12,$14,$84,$17
.byte   $19,$84,$17,$17,$3F,$17,$3F,$82
.byte   $1B,$20,$1B,$19,$84,$17,$12,$12
.byte   $19,$12,$3F,$82,$16,$17,$84,$19
.byte   $22,$14,$14,$24,$14,$3F,$14,$86
.byte   $12,$84,$10,$10,$87,$3F,$82,$20
.byte   $1B,$19,$17,$84,$14,$0B,$0B,$3F
.byte   $86,$17,$14,$84,$10,$09,$09,$87
.byte   $3F,$84,$0B,$86,$10,$84,$12,$12
.byte   $3F,$3F,$3F,$14,$86,$16,$E0,$11
.byte   $F2,$87,$10,$84,$10,$88,$10,$87
.byte   $0B,$84,$0B,$88,$0B,$87,$09,$84
.byte   $09,$88,$09,$86,$12,$85,$22,$82
.byte   $12,$84,$12,$12,$14,$16,$E0,$11
.byte   $F2,$84,$3F,$10,$10,$20,$10,$3F
.byte   $86,$10,$84,$3F,$0B,$0B,$1B,$0B
.byte   $3F,$86,$0B,$84,$09,$19,$19,$09
.byte   $09,$19,$19,$0B,$86,$12,$85,$22
.byte   $82,$12,$84,$12,$12,$14,$16,$17
.byte   $86,$3F,$84,$14,$3F,$12,$3F,$10
.byte   $86,$07,$84,$06,$82,$06,$06,$84
.byte   $07,$FF,$86,$17,$17,$17,$17,$FA
.byte   $15,$15,$15,$15,$12,$12,$12,$12
.byte   $FA,$87,$17,$84,$17,$87,$17,$84
.byte   $56,$16,$16,$86,$16,$8C,$16,$16
.byte   $85,$16,$87,$14,$84,$14,$87,$14
.byte   $84,$52,$12,$12,$86,$12,$3F,$12
.byte   $FA


MusicFinaleScreenData:
.byte $00,$3B,$F2,$01,$82,$F2,$02
.byte   $BD,$F2,$FF,$EC,$07,$ED,$C0,$EE
.byte   $03,$F0,$0C,$E0,$76,$F2,$9A,$16
.byte   $E0,$76,$F2,$99,$16,$94,$15,$14
.byte   $EC,$05,$F2,$B5,$ED,$90,$EE,$05
.byte   $C1,$92,$18,$18,$18,$18,$18,$3F
.byte   $18,$18,$18,$18,$18,$3F,$96,$22
.byte   $F9,$F3,$96,$26,$25,$24,$23,$23
.byte   $22,$21,$20,$F8,$3B,$F2,$92,$48
.byte   $12,$98,$58,$94,$18,$17,$92,$18
.byte   $17,$FA,$EC,$05,$F2,$35,$ED,$90
.byte   $EE,$07,$F0,$18,$C3,$94,$23,$33
.byte   $3F,$23,$33,$3F,$23,$33,$F9,$F0
.byte   $0C,$F2,$B5,$EC,$05,$EE,$05,$C1
.byte   $92,$17,$17,$17,$17,$17,$3F,$17
.byte   $17,$17,$17,$17,$3F,$96,$21,$F9
.byte   $F3,$96,$22,$21,$20,$1B,$19,$19
.byte   $19,$19,$F8,$82,$F2,$EC,$04,$F2
.byte   $91,$F0,$0C,$C1,$94,$17,$18,$15
.byte   $18,$17,$18,$15,$18,$96,$17,$18
.byte   $15,$18,$F9,$C1,$94,$12,$13,$0B
.byte   $13,$12,$13,$0B,$0B,$F9,$96,$07
.byte   $12,$11,$0A,$94,$19,$0A,$17,$1A
.byte   $19,$1A,$1A,$1A,$F8,$BD,$F2

SFXFinaleStrobeData:
.byte $04
.byte   $03,$F4,$F2,$FF,$EC,$01,$EE,$00
.byte   $F2,$44,$80,$04,$F4,$18,$85,$0F
.byte   $FF

SFXFinaleMissData:
.byte $03,$05,$F3,$FF,$EC,$07,$EE
.byte   $01,$8E,$0F,$0D,$4B,$49,$47,$45
.byte   $03,$FF


SFXEncounterHarpoonFireData:
.byte $04,$01,$1A,$F3,$03,$2E
.byte   $F3,$FF,$EC,$06,$ED,$40,$EE,$04
.byte   $F0,$1C,$8F,$1A,$2A,$3A,$C2,$69
.byte   $59,$F1,$F5,$F9,$29,$FF,$EC,$06
.byte   $EE,$02,$8F,$4F,$4D,$4B,$49,$47
.byte   $45,$43,$01,$FF

SFXBonusPlaneFireData:
.byte  $04,$01,$44,$F3
.byte   $03,$5C,$F3,$FF,$EC,$06,$ED,$80
.byte   $EE,$00,$F0,$04,$F3,$8F,$C2,$78
.byte   $70,$68,$60,$58,$50,$08,$EE,$02
.byte   $F1,$07,$F9,$FF,$EC,$06,$EE,$00
.byte   $8D,$45,$03,$FF


SFXEncounterBoatFireData:
.byte $04,$02,$69,$F3
.byte   $FF,$E0,$64,$F5,$F3,$F0,$1C,$8F
.byte   $35,$37,$39,$F0,$0C,$C9,$2A,$F1
.byte   $FF,$F9,$8F,$C8,$69,$F1,$FE,$F9
.byte   $20,$FF

SFXEncounterSubmarineFireData:
.byte $04,$03,$87,$F3,$FF,$EC
.byte   $00,$EE,$00,$8E,$4F,$4D,$4B,$48
.byte   $06,$FF


MusicStartEncounterData:
.byte $00,$9C,$F3,$01,$B3,$F3
.byte   $02,$CA,$F3,$FF,$EC,$01,$ED,$00
.byte   $EE,$00,$F0,$F7,$F2,$01,$81,$24
.byte   $23,$22,$21,$81,$13,$14,$13,$14
.byte   $13,$14,$FF,$EC,$01,$ED,$00,$EE
.byte   $00,$F0,$F7,$F2,$01,$81,$1B,$1A
.byte   $19,$18,$81,$08,$09,$08,$09,$08
.byte   $09,$FF,$EC,$01,$F0,$F7,$F2,$01
.byte   $F8,$BD,$F3

SFXEncounterJawsHarpoonHitData:
.byte $04,$01,$DD,$F3,$FF
.byte   $F0,$FC,$F8,$DF,$F3,$F0,$00,$EC
.byte   $06,$ED,$80,$EE,$00,$F2,$C2,$8F
.byte   $06,$10,$16,$20,$C2,$20,$24,$27
.byte   $30,$EF,$03,$F9,$FF


SFXEncounterJawsHitData:
.byte $04,$01,$D8
.byte   $F3,$03,$FD,$F3,$FF,$EC,$06,$EE
.byte   $00,$8D,$44,$02,$FF


SFXEncounterBoatDespawnData:
.byte $04,$01,$0D
.byte   $F4,$03,$1E,$F4,$FF,$EC,$06,$EE
.byte   $00,$F0,$00,$F3,$8F,$C5,$20,$21
.byte   $EE,$01,$F0,$FF,$F9,$FF,$EC,$06
.byte   $EE,$00,$F3,$C2,$8F,$0E,$0D,$F9
.byte   $8E,$47,$46,$45,$82,$44,$43,$42
.byte   $00,$FF

SFXFinaleHitData:
.byte $01,$0D,$F4,$03,$1E,$F4
.byte   $00,$3F,$F4,$02,$53,$F4,$FF,$EC
.byte   $06,$ED,$00,$EE,$00,$F0,$20,$8E
.byte   $C4,$10,$20,$14,$24,$17,$27,$EF
.byte   $03,$F9,$FF,$E0,$64,$F5,$8F,$10
.byte   $13,$12,$17,$0A,$12,$17,$10,$12
.byte   $20,$1B,$19,$17,$15,$13,$11,$FF


SFXMapTrackerPulseData:
.byte   $04,$01,$6D,$F4,$FF,$EC,$04,$ED
.byte   $40,$F0,$0E,$EE,$00,$8F,$0A,$1A
.byte   $10,$20,$14,$24,$82,$3F,$8F,$C4
.byte   $13,$19,$23,$29,$EF,$04,$F9,$FF
.byte   $04,$02,$90,$F4,$03,$A7,$F4,$FF
.byte   $EC,$04,$F0,$04,$8F,$06,$0A,$12
.byte   $14,$17,$19,$22,$25,$82,$3F,$8E
.byte   $27,$25,$23,$21,$1B,$18,$FF,$EC
.byte   $08,$EE,$05,$F2,$F1,$8F,$4A,$48
.byte   $47,$46,$45,$43,$02,$82,$3F,$8F
.byte   $46,$47,$49,$0D,$3F,$C2,$EF,$05
.byte   $8F,$47,$49,$0D,$3F,$F9,$FF


SFXEncounterPickupData:
.byte $04
.byte   $01,$CC,$F4,$FF,$EC,$06,$ED,$80
.byte   $EE,$01,$F0,$0C,$C3,$8E,$25,$35
.byte   $27,$37,$29,$39,$2B,$3B,$F1,$00
.byte   $EF,$04,$F9,$FF

SFXPauseData:
.byte $04,$01,$E9,$F4
.byte   $FF,$EC,$06,$ED,$80,$EE,$01,$F0
.byte   $0C,$C3,$8E,$27,$37,$F9,$FF


MusicTitleScreenData:
.byte $00
.byte   $FE,$F4,$01,$34,$F5,$FF,$EC,$05
.byte   $ED,$00,$F2,$C1,$F0,$F4,$C3,$EE
.byte   $09,$94,$17,$18,$EE,$07,$94,$17
.byte   $18,$EE,$06,$94,$17,$18,$EE,$03
.byte   $94,$17,$18,$EE,$03,$17,$18,$15
.byte   $18,$17,$18,$15,$18,$F9,$C7,$94
.byte   $17,$18,$EF,$02,$F9,$DD,$9A,$3F
.byte   $F9,$F8,$FE,$F4,$EC,$07,$ED,$C0
.byte   $EE,$02,$F0,$0C,$9A,$3F,$3F,$3F
.byte   $3F,$92,$18,$22,$9A,$68,$99,$68
.byte   $94,$28,$92,$18,$22,$99,$68,$94
.byte   $28,$92,$18,$22,$94,$28,$92,$22
.byte   $28,$94,$32,$98,$3F,$DF,$9A,$3F
.byte   $F9,$F8,$34,$F5,$EC,$04,$F0,$0C
.byte   $F2,$C1,$FA,$00,$00,$00,$00,$00
.byte   $00,$00,$00,$00,$01,$00,$00,$00
.byte   $00,$00,$3F,$1F,$1F,$0F,$0F,$07
