SoundChannelLen = $1C
SoundChannel0 = $0574 + (SoundChannelLen * 0)
SoundChannel1 = $0574 + (SoundChannelLen * 1)
SoundChannel2 = $0574 + (SoundChannelLen * 2)
SoundChannel3 = $0574 + (SoundChannelLen * 3)
SoundChannel4 = $0574 + (SoundChannelLen * 4)

SoundChannelStatus  = SoundChannel0 + $00
SoundChannel_01     = SoundChannel0 + $01
SoundChannel_02     = SoundChannel0 + $02
SoundChannel_03     = SoundChannel0 + $03
SoundChannel_04     = SoundChannel0 + $04
SoundChannel_05     = SoundChannel0 + $05
SoundChannel_06     = SoundChannel0 + $06
SoundChannel_07     = SoundChannel0 + $07
SoundChannelDataPtr = SoundChannel0 + $08
SoundChannel_0A     = SoundChannel0 + $0A
SoundChannel_0B     = SoundChannel0 + $0B
SoundChannel_0C     = SoundChannel0 + $0C
SoundChannel_0D     = SoundChannel0 + $0D
SoundChannelUnkPtr  = SoundChannel0 + $0E
SoundChannel_10     = SoundChannel0 + $10
SoundChannel_11     = SoundChannel0 + $11
SoundChannel_12     = SoundChannel0 + $12
SoundChannel_13     = SoundChannel0 + $13
SoundChannel_14     = SoundChannel0 + $14
SoundChannel_15     = SoundChannel0 + $15
SoundChannel_16     = SoundChannel0 + $16
SoundChannel_17     = SoundChannel0 + $17
SoundChannel_18     = SoundChannel0 + $18
SoundChannel_19     = SoundChannel0 + $19
SoundChannel_1A     = SoundChannel0 + $1A
SoundChannel_1B     = SoundChannel0 + $1B



SND_Sq0Duty              = $4000
SND_Sq0Sweep             = $4001
SND_Sq0Timer             = $4002
SND_Sq0Length            = $4003
SND_Sq1Duty              = $4004
SND_Sq1Sweep             = $4005
SND_Sq1Timer             = $4006
SND_Sq1Length            = $4007
SND_TrgLinear            = $4008
SND_TrgTimer             = $400A
SND_TrgLength            = $400B
SND_NoiseVolume          = $400C
SND_NoisePeriod          = $400E
SND_NoiseLength          = $400F
SND_DmcFreq              = $4010
SND_DmcCounter           = $4011
SND_DmcAddress           = $4012
SND_DmcLength            = $4013
SND_ApuStatus            = $4015

SoundStatus              = $055D
SoundV55E                = $055E
SoundV5E4                = $05E4

NextSND_Sq0Timer         = $055F
NextSND_Sq0Length        = $0560
NextSND_Sq1Timer         = $0561
NextSND_Sq1Length        = $0562
NextSND_TrgTimer         = $0563
NextSND_TrgLength        = $0564
NextSND_NoisePeriod      = $0565
NextSND_NoiseLength      = $0566
NextSND_Sq0Duty          = $0567
NextSND_Sq1Duty          = $0568
NextSND_TrgLinear        = $0569
NextSND_NoiseVolume      = $056A
NextSND_ApuStatus        = $056B

PrevSND_Sq0Timer         = $056C
PrevSND_Sq0Length        = $056D
PrevSND_Sq1Timer         = $056E
PrevSND_Sq1Length        = $056F
PrevSND_TrgTimer         = $0570
PrevSND_TrgLength        = $0571
PrevSND_NoisePeriod      = $0572
PrevSND_NoiseLength      = $0573


; ----------------------------------------------------------------------------
SoundInit:
        ; reset sound registers
        lda #$00
        sta SND_ApuStatus
        lda #$30
        sta SND_Sq0Duty
        sta SND_Sq1Duty
        sta SND_NoiseVolume
        lda #$80
        sta SND_TrgLinear
        lda #$08
        sta SND_Sq0Sweep
        sta SND_Sq1Sweep
        lda #$00
        sta NextSND_NoiseLength
        lda #$FF
        ; clear out memory for apu register copies
        ldx #$00
@Clear:
        sta PrevSND_Sq0Timer,x
        inx
        cpx #$08
        bcc @Clear
        ; enable all but dmc channels
        lda #%00001111
        sta SND_ApuStatus
        rts

SoundPlay:
        @TempDataPointer = $F0
        ; stop sound engine
        ldx #1
        stx SoundStatus
        ; values >= $E0 are used to stop sound channels
        cmp #%11100000
        bcs @ClearChannels
        asl a
        tax
        ; locate data for the sound to play
        lda SoundPointers,x
        sta @TempDataPointer
        lda SoundPointers+1,x
        sta @TempDataPointer+1
        ldy #$00
@ContinueReading:
        ; if next value has its high byte set, we've finished reading
        lda (@TempDataPointer),y
        bmi @Done
        iny
        ; otherwise the first byte is the next sound channel
        tax
        cmp #$04
        bcc @ReadNextSoundChannel
        ; some kind of special handling for sound effects?
        lda (@TempDataPointer),y
        iny
        sta SoundV55E
@ReadNextSoundChannel:
        ; find offset to requested sound channel
        lda @SoundChannelOffsets,x
        tax
        ; initialize some state for the channel
        lda #$80
        sta SoundChannelStatus,x
        lda #$00
        sta SoundChannel_05,x
        lda #$01
        sta SoundChannel_06,x
        lda #$0C
        sta SoundChannel_07,x
        ; copy pointer to the data for this sound channel
        lda (@TempDataPointer),y
        iny
        sta SoundChannelDataPtr,x
        lda (@TempDataPointer),y
        iny
        sta SoundChannelDataPtr+1,x
        ; copy pointer to unknown sound data
        lda UnknownSoundDataPointers
        sta SoundChannelUnkPtr,x
        lda UnknownSoundDataPointers+1
        sta SoundChannelUnkPtr+1,x
        ; and initialize some more values
        lda #$0C
        sta SoundChannel_16,x
        lda #$80
        sta SoundChannel_18,x
        ; read next sound channel
        jmp @ContinueReading

@ClearChannels:
        @SoundChannelsToStop = $F0
        sta @SoundChannelsToStop
        ldx #$00
        ; loop through each sound channel
        ldy #$05
@ClearNext:
        ; if the bit for this channel is not set, skip it
        lsr @SoundChannelsToStop
        bcc @DontClearChannel
        ; clear the active flag on this channel
        lda #$00
        sta SoundChannelStatus,x
@DontClearChannel:
        ; advance X to next sound channel
        txa
        clc
        adc #SoundChannelLen
        tax
        ; and continue looping
        dey
        bne @ClearNext
@Done:
        ; activate sound engine
        lda #0
        sta SoundStatus
        rts

@SoundChannelOffsets:
        .byte SoundChannel0 - SoundChannel0
        .byte SoundChannel1 - SoundChannel0
        .byte SoundChannel2 - SoundChannel0
        .byte SoundChannel3 - SoundChannel0
        .byte SoundChannel4 - SoundChannel0

; ----------------------------------------------------------------------------
SoundUpdate:
        lda #$30
        sta NextSND_Sq0Duty
        sta NextSND_Sq1Duty
        sta NextSND_NoiseVolume
        lda #$80
        sta NextSND_TrgLinear
        ; if music is disabled, only run channel 4
        lda MusicStatus
        bne @RunChannel4
@RunChannel0:
        ldx #SoundChannelLen*0
        lda SoundChannelStatus
        bpl @RunChannel1
        sta $F2
        jsr SoundRunChannel0
        lda $F2
        sta SoundChannelStatus
@RunChannel1:
        ldx #SoundChannelLen*1
        lda SoundChannel1
        bpl @RunChannel2
        sta $F2
        jsr SoundRunChannel1
        lda $F2
        sta SoundChannel1
@RunChannel2:
        ldx #SoundChannelLen*2
        lda SoundChannel2
        bpl @RunChannel3
        sta $F2
        jsr SoundRunChannel2
        lda $F2
        sta SoundChannel2
@RunChannel3:
        ldx #SoundChannelLen*3
        lda SoundChannel3
        bpl @RunChannel4
        sta $F2
        jsr SoundRunChannel3
        lda $F2
        sta SoundChannel3
@RunChannel4:
        ldx #SoundChannelLen*4
        lda SoundChannel4
        bpl LE3D9
        sta $F2
        lda SoundV55E
        bne LE3BF
        jsr SoundRunChannel0
        jmp LE3D4
; ----------------------------------------------------------------------------
LE3BF:
        cmp     #$02                            ; E3BF C9 02                    ..
        bcs     LE3C9                           ; E3C1 B0 06                    ..
        jsr     SoundRunChannel1                           ; E3C3 20 79 E4                  y.
        jmp     LE3D4                           ; E3C6 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3C9:
        bne     LE3D1                           ; E3C9 D0 06                    ..
        jsr     SoundRunChannel2                           ; E3CB 20 CE E4                  ..
        jmp     LE3D4                           ; E3CE 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3D1:
        jsr     SoundRunChannel3                           ; E3D1 20 24 E5                  $.
LE3D4:
        lda     $F2                             ; E3D4 A5 F2                    ..
        sta     SoundV5E4                           ; E3D6 8D E4 05                 ...
LE3D9:
        ldx     #$00                            ; E3D9 A2 00                    ..
LE3DB:
        lda     LE417,x                         ; E3DB BD 17 E4                 ...
        tay                                     ; E3DE A8                       .
        lda     NextSND_Sq0Timer,x                         ; E3DF BD 5F 05                 ._.
        cmp     PrevSND_Sq0Timer,x                         ; E3E2 DD 6C 05                 .l.
        bne     LE3F2                           ; E3E5 D0 0B                    ..
        lda     NextSND_Sq0Length,x                         ; E3E7 BD 60 05                 .`.
        cmp     PrevSND_Sq0Length,x                         ; E3EA DD 6D 05                 .m.
        beq     LE401                           ; E3ED F0 12                    ..
        lda NextSND_Sq0Timer,x
; ----------------------------------------------------------------------------
LE3F2:
        sta     PrevSND_Sq0Timer,x                         ; E3F2 9D 6C 05                 .l.
        sta     SND_Sq0Duty,y                         ; E3F5 99 00 40                 ..@
        lda     NextSND_Sq0Length,x                         ; E3F8 BD 60 05                 .`.
        sta     PrevSND_Sq0Length,x                         ; E3FB 9D 6D 05                 .m.
        sta     SND_Sq0Sweep,y                         ; E3FE 99 01 40                 ..@
LE401:
        inx                                     ; E401 E8                       .
        inx                                     ; E402 E8                       .
        cpx     #$08                            ; E403 E0 08                    ..
        bcc     LE3DB                           ; E405 90 D4                    ..
LE407:
        lda     LE417,x                         ; E407 BD 17 E4                 ...
        tay                                     ; E40A A8                       .
        lda     NextSND_Sq0Timer,x                         ; E40B BD 5F 05                 ._.
        sta     SND_Sq0Duty,y                         ; E40E 99 00 40                 ..@
        inx                                     ; E411 E8                       .
        cpx     #$0C                            ; E412 E0 0C                    ..
        bcc     LE407                           ; E414 90 F1                    ..
        rts                                     ; E416 60                       `

; ----------------------------------------------------------------------------
LE417:
        .byte   $02,$03,$06,$07,$0A,$0B,$0E,$0F ; E417 02 03 06 07 0A 0B 0E 0F  ........
        .byte   $00,$04,$08,$0C,$15             ; E41F 00 04 08 0C 15           .....
; ----------------------------------------------------------------------------
SoundRunChannel0:
        lda     #$30                            ; E424 A9 30                    .0
        sta     NextSND_Sq0Duty                           ; E426 8D 67 05                 .g.
        dec     SoundChannel_06,x                         ; E429 DE 7A 05                 .z.
        bne     LE43B                           ; E42C D0 0D                    ..
        lda     #$00                            ; E42E A9 00                    ..
        sta     NextSND_ApuStatus                           ; E430 8D 6B 05                 .k.
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
        jmp LE451
; ----------------------------------------------------------------------------
LE44C:
        lsr     a                               ; E44C 4A                       J
        bit     $F2                             ; E44D 24 F2                    $.
        beq     LE451                           ; E44F F0 00                    ..
LE451:
        lda     SoundChannel_04,x                         ; E451 BD 78 05                 .x.
        ora     SoundChannel_18,x                         ; E454 1D 8C 05                 ...
        ora     #$30                            ; E457 09 30                    .0
        sta     NextSND_Sq0Duty                           ; E459 8D 67 05                 .g.
        lda     SoundChannel_02,x                         ; E45C BD 76 05                 .v.
        sta     NextSND_Sq0Timer                           ; E45F 8D 5F 05                 ._.
        lda     SoundChannel_03,x                         ; E462 BD 77 05                 .w.
        lsr     a                               ; E465 4A                       J
        ror     NextSND_Sq0Timer                           ; E466 6E 5F 05                 n_.
        lsr     a                               ; E469 4A                       J
        ror     NextSND_Sq0Timer                           ; E46A 6E 5F 05                 n_.
        lsr     a                               ; E46D 4A                       J
        ror     NextSND_Sq0Timer                           ; E46E 6E 5F 05                 n_.
        lsr     a                               ; E471 4A                       J
        ror     NextSND_Sq0Timer                           ; E472 6E 5F 05                 n_.
        sta     NextSND_Sq0Length                           ; E475 8D 60 05                 .`.
        rts                                     ; E478 60                       `

; ----------------------------------------------------------------------------
SoundRunChannel1:
        lda     #$30                            ; E479 A9 30                    .0
        sta     NextSND_Sq1Duty                           ; E47B 8D 68 05                 .h.
        dec     SoundChannel_06,x                         ; E47E DE 7A 05                 .z.
        bne     LE490                           ; E481 D0 0D                    ..
        lda     #$00                            ; E483 A9 00                    ..
        sta     NextSND_ApuStatus                           ; E485 8D 6B 05                 .k.
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
        jmp LE4A6
; ----------------------------------------------------------------------------
LE4A1:
        lsr     a                               ; E4A1 4A                       J
        bit     $F2                             ; E4A2 24 F2                    $.
        beq     LE4A6                           ; E4A4 F0 00                    ..
LE4A6:
        lda     SoundChannel_04,x                         ; E4A6 BD 78 05                 .x.
        ora     SoundChannel_18,x                         ; E4A9 1D 8C 05                 ...
        ora     #$30                            ; E4AC 09 30                    .0
        sta     NextSND_Sq1Duty                           ; E4AE 8D 68 05                 .h.
        lda     SoundChannel_02,x                         ; E4B1 BD 76 05                 .v.
        sta     NextSND_Sq1Timer                           ; E4B4 8D 61 05                 .a.
        lda     SoundChannel_03,x                         ; E4B7 BD 77 05                 .w.
        lsr     a                               ; E4BA 4A                       J
        ror     NextSND_Sq1Timer                           ; E4BB 6E 61 05                 na.
        lsr     a                               ; E4BE 4A                       J
        ror     NextSND_Sq1Timer                           ; E4BF 6E 61 05                 na.
        lsr     a                               ; E4C2 4A                       J
        ror     NextSND_Sq1Timer                           ; E4C3 6E 61 05                 na.
        lsr     a                               ; E4C6 4A                       J
        ror     NextSND_Sq1Timer                           ; E4C7 6E 61 05                 na.
        sta     NextSND_Sq1Length                           ; E4CA 8D 62 05                 .b.
        rts                                     ; E4CD 60                       `

; ----------------------------------------------------------------------------
SoundRunChannel2:
        lda     #$80                            ; E4CE A9 80                    ..
        sta     NextSND_TrgLinear                           ; E4D0 8D 69 05                 .i.
        dec     SoundChannel_06,x                         ; E4D3 DE 7A 05                 .z.
        bne     LE4E5                           ; E4D6 D0 0D                    ..
        lda     #$01                            ; E4D8 A9 01                    ..
        sta     NextSND_ApuStatus                           ; E4DA 8D 6B 05                 .k.
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
        jmp LE4FB
; ----------------------------------------------------------------------------
LE4F6:
        lsr     a                               ; E4F6 4A                       J
        bit     $F2                             ; E4F7 24 F2                    $.
        beq     LE4FB                           ; E4F9 F0 00                    ..
LE4FB:
        lda     SoundChannel_04,x                         ; E4FB BD 78 05                 .x.
        cmp     #$0F                            ; E4FE C9 0F                    ..
        bcc     LE523                           ; E500 90 21                    .!
        lda     #$FF                            ; E502 A9 FF                    ..
        sta     NextSND_TrgLinear                           ; E504 8D 69 05                 .i.
        lda     SoundChannel_02,x                         ; E507 BD 76 05                 .v.
        sta     NextSND_TrgTimer                           ; E50A 8D 63 05                 .c.
        lda     SoundChannel_03,x                         ; E50D BD 77 05                 .w.
        lsr     a                               ; E510 4A                       J
        ror     NextSND_TrgTimer                           ; E511 6E 63 05                 nc.
        lsr     a                               ; E514 4A                       J
        ror     NextSND_TrgTimer                           ; E515 6E 63 05                 nc.
        lsr     a                               ; E518 4A                       J
        ror     NextSND_TrgTimer                           ; E519 6E 63 05                 nc.
        lsr     a                               ; E51C 4A                       J
        ror     NextSND_TrgTimer                           ; E51D 6E 63 05                 nc.
        sta     NextSND_TrgLength                           ; E520 8D 64 05                 .d.
LE523:
        rts                                     ; E523 60                       `

; ----------------------------------------------------------------------------
SoundRunChannel3:
        lda     #$30                            ; E524 A9 30                    .0
        sta     NextSND_NoiseVolume                           ; E526 8D 6A 05                 .j.
        dec     SoundChannel_06,x                         ; E529 DE 7A 05                 .z.
        bne     LE53B                           ; E52C D0 0D                    ..
        lda     #$02                            ; E52E A9 02                    ..
        sta     NextSND_ApuStatus                           ; E530 8D 6B 05                 .k.
        jsr     LE5E9                           ; E533 20 E9 E5                  ..
        bit     $F2                             ; E536 24 F2                    $.
        bvc     LE551                           ; E538 50 17                    P.
        rts
; ----------------------------------------------------------------------------
LE53B:
        bit     $F2                             ; E53B 24 F2                    $.
        bvc     LE540                           ; E53D 50 01                    P.
        rts
; ----------------------------------------------------------------------------
LE540:
        jsr     LE560                           ; E540 20 60 E5                  `.
        lda     #$20                            ; E543 A9 20                    . 
        bit     $F2                             ; E545 24 F2                    $.
        beq     LE54C                           ; E547 F0 03                    ..
        jmp LE551
; ----------------------------------------------------------------------------
LE54C:
        lsr     a                               ; E54C 4A                       J
        bit     $F2                             ; E54D 24 F2                    $.
        beq     LE551                           ; E54F F0 00                    ..
LE551:
        lda     SoundChannel_04,x                         ; E551 BD 78 05                 .x.
        ora     #$30                            ; E554 09 30                    .0
        sta     NextSND_NoiseVolume                           ; E556 8D 6A 05                 .j.
        lda     SoundChannel_03,x                         ; E559 BD 77 05                 .w.
        sta     NextSND_NoisePeriod                           ; E55C 8D 65 05                 .e.
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
        dec     SoundChannel_0A,x                         ; E56E DE 7E 05                 .~.
        bne     LE5B1                           ; E571 D0 3E                    .>
        inc     $F2                             ; E573 E6 F2                    ..
        inc     $F2                             ; E575 E6 F2                    ..
        bne     LE583                           ; E577 D0 0A                    ..
LE579:
        lda     SoundChannel_0A,x                         ; E579 BD 7E 05                 .~.
        beq     LE5E8                           ; E57C F0 6A                    .j
        dec     SoundChannel_0A,x                         ; E57E DE 7E 05                 .~.
        bne     LE5E8                           ; E581 D0 65                    .e
LE583:
        lda     SoundChannel_0B,x                         ; E583 BD 7F 05                 ...
        and     #$3F                            ; E586 29 3F                    )?
        cmp     #$2F                            ; E588 C9 2F                    ./
        bcc     LE5A3                           ; E58A 90 17                    ..
        ldy     #$01                            ; E58C A0 01                    ..
        sbc     #$30                            ; E58E E9 30                    .0
        eor     #$FF                            ; E590 49 FF                    I.
        clc                                     ; E592 18                       .
        adc     SoundChannel_04                           ; E593 6D 78 05                 mx.
        bcs     LE59B                           ; E596 B0 03                    ..
        dey                                     ; E598 88                       .
        lda     #$00                            ; E599 A9 00                    ..
LE59B:
        sta     SoundChannel_04,x                         ; E59B 9D 78 05                 .x.
        tya                                     ; E59E 98                       .
        sta     SoundChannel_0A,x                         ; E59F 9D 7E 05                 .~.
        rts                                     ; E5A2 60                       `

; ----------------------------------------------------------------------------
LE5A3:
        dec     SoundChannel_04,x                         ; E5A3 DE 78 05                 .x.
        bpl     LE5AD                           ; E5A6 10 05                    ..
        lda     #$00                            ; E5A8 A9 00                    ..
        sta     SoundChannel_04,x                         ; E5AA 9D 78 05                 .x.
LE5AD:
        sta     SoundChannel_0A,x                         ; E5AD 9D 7E 05                 .~.
        rts                                     ; E5B0 60                       `

; ----------------------------------------------------------------------------
LE5B1:
        lda     SoundChannel_0C,x                         ; E5B1 BD 80 05                 ...
        beq     LE5E8                           ; E5B4 F0 32                    .2
        dec     SoundChannel_0C,x                         ; E5B6 DE 80 05                 ...
        bne     LE5E8                           ; E5B9 D0 2D                    .-
LE5BB:
        lda     SoundChannelUnkPtr,x                         ; E5BB BD 82 05                 ...
        sta     $F6                             ; E5BE 85 F6                    ..
        lda     SoundChannelUnkPtr+1,x                         ; E5C0 BD 83 05                 ...
        sta     $F7                             ; E5C3 85 F7                    ..
        lda     SoundChannel_0D,x                         ; E5C5 BD 81 05                 ...
        tay                                     ; E5C8 A8                       .
        lda     ($F6),y                         ; E5C9 B1 F6                    ..
        iny                                     ; E5CB C8                       .
        pha                                     ; E5CC 48                       H
        tya                                     ; E5CD 98                       .
        sta     SoundChannel_0D,x                         ; E5CE 9D 81 05                 ...
        pla                                     ; E5D1 68                       h
        tay                                     ; E5D2 A8                       .
        and     #$0F                            ; E5D3 29 0F                    ).
        sec                                     ; E5D5 38                       8
        sbc     SoundChannel_05,x                         ; E5D6 FD 79 05                 .y.
        bcs     LE5DD                           ; E5D9 B0 02                    ..
        lda     #$00                            ; E5DB A9 00                    ..
LE5DD:
        sta     SoundChannel_04,x                         ; E5DD 9D 78 05                 .x.
        tya                                     ; E5E0 98                       .
        lsr     a                               ; E5E1 4A                       J
        lsr     a                               ; E5E2 4A                       J
        lsr     a                               ; E5E3 4A                       J
        lsr     a                               ; E5E4 4A                       J
        sta     SoundChannel_0C,x                         ; E5E5 9D 80 05                 ...
LE5E8:
        rts                                     ; E5E8 60                       `

; ----------------------------------------------------------------------------
LE5E9:
        lda     SoundChannelDataPtr,x                         ; E5E9 BD 7C 05                 .|.
        sta     $F0                             ; E5EC 85 F0                    ..
        lda     SoundChannelDataPtr+1,x                         ; E5EE BD 7D 05                 .}.
        sta     $F1                             ; E5F1 85 F1                    ..
        lda     SoundChannel_07,x                         ; E5F3 BD 7B 05                 .{.
        sta     SoundChannel_06,x                         ; E5F6 9D 7A 05                 .z.
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
        sta     SoundChannel_06,x                         ; E619 9D 7A 05                 .z.
        sta     SoundChannel_07,x                         ; E61C 9D 7B 05                 .{.
        jmp     LE608                           ; E61F 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE622:
        cmp     #$E0                            ; E622 C9 E0                    ..
        bcs     LE638                           ; E624 B0 12                    ..
        sbc     #$BE                            ; E626 E9 BE                    ..
        sta     SoundChannel_19,x                         ; E628 9D 8D 05                 ...
        lda     $F0                             ; E62B A5 F0                    ..
        sta     SoundChannel_1A,x                         ; E62D 9D 8E 05                 ...
        lda     $F1                             ; E630 A5 F1                    ..
        sta     SoundChannel_1B,x                         ; E632 9D 8F 05                 ...
        jmp     LE608                           ; E635 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE638:
        sbc     #$EC                            ; E638 E9 EC                    ..
        bcs     LE65A                           ; E63A B0 1E                    ..
        adc     #$0D                            ; E63C 69 0D                    i.
        sta     SoundChannel_19,x                         ; E63E 9D 8D 05                 ...
        lda     $F0                             ; E641 A5 F0                    ..
        sta     SoundChannel_1A,x                         ; E643 9D 8E 05                 ...
        lda     $F1                             ; E646 A5 F1                    ..
        sta     SoundChannel_1B,x                         ; E648 9D 8F 05                 ...
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
        lda     SfxOps,y                         ; E65C B9 BA E7                 ...
        sta     $F4                           ; E65F 85 F4                    ..
        lda     SfxOps+1,y                         ; E661 B9 BB E7                 ...
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
        lda     NextSND_ApuStatus                           ; E684 AD 6B 05                 .k.
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
        adc     SoundChannel_16,x                         ; E6A4 7D 8A 05                 }..
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
        lda     LE8A6+1,y                         ; E6BB B9 A7 E8                 ...
        sta     $F7                             ; E6BE 85 F7                    ..
        lda     $F4                           ; E6C0 A5 F4                    ..
        sta     SoundChannel_17,x                         ; E6C2 9D 8B 05                 ...
        beq     LE6CF                           ; E6C5 F0 08                    ..
        tay                                     ; E6C7 A8                       .
LE6C8:
        lsr     $F7                             ; E6C8 46 F7                    F.
        ror     $F6                             ; E6CA 66 F6                    f.
        dey                                     ; E6CC 88                       .
        bne     LE6C8                           ; E6CD D0 F9                    ..
LE6CF:
        lda     $F6                             ; E6CF A5 F6                    ..
        sta     SoundChannel_10,x                         ; E6D1 9D 84 05                 ...
        lda     $F7                             ; E6D4 A5 F7                    ..
        sta     SoundChannel_11,x                         ; E6D6 9D 85 05                 ...
        lda     #$20                            ; E6D9 A9 20                    . 
        bit     $F2                             ; E6DB 24 F2                    $.
        beq     LE73E                           ; E6DD F0 5F                    ._
        lda #$00
        sta $F4
        lda $F6

        SEC
        SBC SoundChannel_02,X
        TAY
        LDA $F7
        SBC SoundChannel_03,X
        BCS LE6FF
        INC $F4
        EOR #$FF
        PHA
        TYA
        EOR #$FF
        ADC #$01
        TAY
        PLA
        ADC #$00
LE6FF:
        STY $F6
        STA $F7
        LDA SoundChannel_15,X
        STA SoundChannel_14,X
        STA $F5
        LDA #$00
        LDY #$10
LE70F:
        ASL $F6
        ROL $F7
        ROL A
        CMP $F5
        BCC LE71C
        SBC $F5
        INC $F6
LE71C:
        DEY
        BNE LE70F
        LDY $F6
        LDA $F7
        DEC $F4
        BNE LE734
        EOR #$FF
        PHA
        TYA
        EOR #$FF
        CLC
        ADC #$01
        TAY
        PLA
        ADC #$00
LE734:
        STA SoundChannel_13,X
        TYA
        STA SoundChannel_12,X
        JMP LE764



; ----------------------------------------------------------------------------
LE73E:
        lda     $F6                             ; E73E A5 F6                    ..
        sta     SoundChannel_02,x                         ; E740 9D 76 05                 .v.
        lda     $F7                             ; E743 A5 F7                    ..
        sta     SoundChannel_03,x                         ; E745 9D 77 05                 .w.
        lda     #$10                            ; E748 A9 10                    ..
        bit     $F2                             ; E74A 24 F2                    $.
        beq     LE764                           ; E74C F0 16                    ..
  LDA SoundChannel_12,X              
  STA $F4                  
  LDA SoundChannel_13,X              
  STA $F5                  
  LDY #$00                 
  LDA ($F4),Y              
  STA SoundChannel_14,X              
  LDA #$01                 
  STA SoundChannel_15,X              
; ----------------------------------------------------------------------------
LE764:
        lda     #$08                            ; E764 A9 08                    ..
        bit     $F2                             ; E766 24 F2                    $.
        bne     LE7AF                           ; E768 D0 45                    .E
        lda     $F2                             ; E76A A5 F2                    ..
        and     #$FD                            ; E76C 29 FD                    ).
        sta     $F2                             ; E76E 85 F2                    ..
        lda     #$00                            ; E770 A9 00                    ..
        sta     SoundChannel_0D,x                         ; E772 9D 81 05                 ...
        jsr     LE5BB                           ; E775 20 BB E5                  ..
        lda     $F2                             ; E778 A5 F2                    ..
        eor     #$01                            ; E77A 49 01                    I.
        and     #$05                            ; E77C 29 05                    ).
        bne     LE7AF                           ; E77E D0 2F                    ./
        lda     SoundChannel_06,x                         ; E780 BD 7A 05                 .z.
        lsr     a                               ; E783 4A                       J
        sta     $F4                           ; E784 85 F4                    ..
        lda     SoundChannel_0B,x                         ; E786 BD 7F 05                 ...
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
        lda     SoundChannel_06,x                         ; E7A7 BD 7A 05                 .z.
        sbc     $F4                           ; E7AA E5 F4                    ..
        sta     SoundChannel_0A,x                         ; E7AC 9D 7E 05                 .~.
LE7AF:
        lda     $F0                             ; E7AF A5 F0                    ..
        sta     SoundChannelDataPtr,x                         ; E7B1 9D 7C 05                 .|.
        lda     $F1                             ; E7B4 A5 F1                    ..
        sta     SoundChannelDataPtr+1,x                         ; E7B6 9D 7D 05                 .}.
        rts                                     ; E7B9 60                       `

; ----------------------------------------------------------------------------

SoundAction0 = 0


SfxOps:
.addr SfxOp00
.addr SfxOp01
.addr SfxOp02
.addr SfxOp03
.addr SfxOp04
.addr SfxOp05
.addr SfxOp06
.addr SfxOp07
.addr SfxOp08
.addr SfxOp09
.addr SfxOp0A
.addr SfxOp0B
.addr SfxOp0C
.addr SfxOp0D
.addr SfxOp0E
.addr SfxOp0F
.addr SfxOp10
.addr SfxOp11
.addr SfxOp12
.addr SfxOp13

; ----------------------------------------------------------------------------
SfxOp00:
        jsr     LE89B                           ; E7E2 20 9B E8                  ..
        asl     a                               ; E7E5 0A                       .
        tay                                     ; E7E6 A8                       .
        lda     UnknownSoundDataPointers,y                         ; E7E7 B9 FD E8                 ...
        sta     SoundChannelUnkPtr,x                         ; E7EA 9D 82 05                 ...
        lda     UnknownSoundDataPointers+1,y                         ; E7ED B9 FE E8                 ...
        sta     SoundChannelUnkPtr+1,x                         ; E7F0 9D 83 05                 ...
        jmp     LE608                           ; E7F3 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp01:
        jsr     LE89B                           ; E7F6 20 9B E8                  ..
        sta     SoundChannel_18,x                         ; E7F9 9D 8C 05                 ...
        jmp     LE608                           ; E7FC 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp02:
        jsr     LE89B                           ; E7FF 20 9B E8                  ..
        sta     SoundChannel_05,x                         ; E802 9D 79 05                 .y.
        jmp     LE608                           ; E805 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp03:
        jsr     LE89B                           ; E808 20 9B E8                  ..
        clc                                     ; E80B 18                       .
        adc     SoundChannel_05,x                         ; E80C 7D 79 05                 }y.
        sta     SoundChannel_05,x                         ; E80F 9D 79 05                 .y.
        jmp     LE608                           ; E812 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp04:
        jsr     LE89B                           ; E815 20 9B E8                  ..
        sta     SoundChannel_16,x                         ; E818 9D 8A 05                 ...
        jmp     LE608                           ; E81B 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp05:
        jsr     LE89B                           ; E81E 20 9B E8                  ..
        clc                                     ; E821 18                       .
        adc     SoundChannel_16,x                         ; E822 7D 8A 05                 }..
        sta     SoundChannel_16,x                         ; E825 9D 8A 05                 ...
        jmp     LE608                           ; E828 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp06:
        jsr     LE89B                           ; E82B 20 9B E8                  ..
        sta     SoundChannel_0B,x                         ; E82E 9D 7F 05                 ...
        lda     $F2                             ; E831 A5 F2                    ..
        ora     #$01                            ; E833 09 01                    ..
        sta     $F2                             ; E835 85 F2                    ..
        jmp     LE608                           ; E837 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp07:
        lda     $F2                             ; E83A A5 F2                    ..
        and     #$FE                            ; E83C 29 FE                    ).
        sta     $F2                             ; E83E 85 F2                    ..
        jmp     LE608                           ; E840 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp0C:
        jsr     LE89B                           ; E843 20 9B E8                  ..
        pha                                     ; E846 48                       H
        jsr     LE89B                           ; E847 20 9B E8                  ..
        sta     $F1                             ; E84A 85 F1                    ..
        pla                                     ; E84C 68                       h
        sta     $F0                             ; E84D 85 F0                    ..
        jmp     LE608                           ; E84F 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp0D:
        dec     SoundChannel_19,x                         ; E852 DE 8D 05                 ...
        beq     LE861                           ; E855 F0 0A                    ..
        lda     SoundChannel_1A,x                         ; E857 BD 8E 05                 ...
        sta     $F0                             ; E85A 85 F0                    ..
        lda     SoundChannel_1B,x                         ; E85C BD 8F 05                 ...
        sta     $F1                             ; E85F 85 F1                    ..
LE861:
        jmp     LE608                           ; E861 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp0E:
        dec     SoundChannel_19,x
        beq     LE881
        lda SoundChannel_1A,x
        sta $F4
        lda SoundChannel_1B,x
        sta $F5
        ldy #$02
        lda ($F4),y
        sta $F0
        iny
        lda ($F4),y
        sta $F1
        jmp LE608
; ----------------------------------------------------------------------------
LE881:
        lda     SoundChannel_1A,x                         ; E881 BD 8E 05                 ...
        clc                                     ; E884 18                       .
        adc     #$02                            ; E885 69 02                    i.
        sta     $F0                             ; E887 85 F0                    ..
        lda     SoundChannel_1B,x                         ; E889 BD 8F 05                 ...
        adc     #$00                            ; E88C 69 00                    i.
        sta     $F1                             ; E88E 85 F1                    ..

SfxOp08:
SfxOp09:
SfxOp0A:
SfxOp0B:
SfxOp0F:
SfxOp10:
SfxOp11:
SfxOp12:
        jmp     LE608                           ; E890 4C 08 E6                 L..

; ----------------------------------------------------------------------------
SfxOp13:
        lda     #$00                            ; E893 A9 00                    ..
        sta     $F2                             ; E895 85 F2                    ..
        sta     SoundChannelStatus,x                         ; E897 9D 74 05                 .t.
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
.byte $E4,$6A
.byte $E4,$64
.byte $3A,$5F
.byte $E2,$59
.byte $D7,$54
.byte $14,$50
.byte $95,$4B
.byte $57,$47
.byte $56,$43
.byte $8F,$3F
.byte $FD,$3B
.byte $A0,$38



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
SFXUnused                      = $10
SFXEncounterBoatDespawnDupe    = $11
SFXPlayerDeath                 = $12
SFXSilent                      = $13
SFXMapTrackerPulse             = $14
SFXEncounterPickup             = $15
SFXPause                       = $16
SFXFinaleStrobe                = $17
SFXFinaleHit                   = $18
SFXExtraLife                   = $19
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
        .addr MusicGameOverScreenData
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
        .addr SFXUnusedData
        .addr SFXEncounterBoatDespawnData              ; unused duplicate?
        .addr SFXPlayerDeathData
        .addr SFXSilentData
        .addr SFXMapTrackerPulseData
        .addr SFXEncounterPickupData
        .addr SFXPauseData
        .addr SFXFinaleStrobeData
        .addr SFXFinaleHitData
        .addr SFXExtraLifeData                          ; unused chime?
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
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$08,$ED,$00,$EE,$0D,$F0,$00
.byte $F2,$C2,$E0,$E1,$E9,$EF,$FE,$E0
.byte $E1,$E9,$EF,$FE,$E0,$E1,$E9,$EF
.byte $FE,$E0,$E1,$E9,$EF,$FE,$E0,$E1
.byte $E9,$EF,$02,$E0,$E1,$E9,$EF,$02
.byte $E0,$E1,$E9,$EF,$02,$E0,$E1,$E9
.byte $EF,$02,$E0,$E1,$E9,$F8,$A4,$E9
@Channel1:
.byte $80,$3F,$F8,$A4,$E9,$82,$22,$32
.byte $22,$27,$22,$32,$22,$27,$FA
@Channel2:
.byte $EC,$04,$8A,$57,$17,$55,$15,$54
.byte $14,$53,$13,$F8,$EB,$E9

MusicEncounterScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$07,$ED,$00,$EE,$07,$F0,$09
.byte $F2,$CA,$C1,$84,$16,$15,$14,$58
.byte $88,$18,$17,$16,$F9,$EC,$05,$F2
.byte $48,$82,$1A,$19,$18,$17,$16,$85
.byte $3F,$88,$3F,$86,$3F,$84,$EF,$04
.byte $18,$18,$EF,$FB,$18,$18,$EF,$FA
.byte $18,$18,$EF,$07,$82,$13,$84,$18
.byte $82,$1A,$EF,$FA,$23,$EF,$06,$85
.byte $3F,$84,$3F,$82,$23,$22,$21,$22
.byte $18,$3F,$86,$3F,$84,$EF,$04,$18
.byte $18,$EF,$FB,$18,$18,$EF,$FA,$18
.byte $18,$EF,$07,$F8,$03,$EA
@Channel1:
.byte $EC,$07,$ED,$40,$EE,$07,$F0,$09
.byte $F2,$CA,$C1,$87,$1A,$84,$61,$88
.byte $61,$8A,$21,$F9,$EC,$05,$F2,$48
.byte $82,$23,$3F,$3F,$3F,$23,$85,$3F
.byte $84,$3F,$1A,$18,$82,$13,$3F,$86
.byte $3F,$84,$EF,$04,$21,$21,$EF,$FB
.byte $21,$21,$EF,$FA,$21,$21,$EF,$07
.byte $82,$18,$84,$21,$82,$23,$EF,$FA
.byte $28,$EF,$06,$85,$3F,$84,$3F,$1A
.byte $18,$82,$13,$3F,$86,$3F,$84,$EF
.byte $04,$21,$21,$EF,$FB,$21,$21,$EF
.byte $FA,$21,$21,$EF,$07,$F8,$61,$EA
@Channel2:
.byte $E0,$64,$F5,$F2,$81,$CF,$86,$0A
.byte $F9,$CF,$07,$F9,$F8,$C1,$EA

MusicGameOverScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$06,$ED,$00,$EE,$05,$F0,$0C
.byte $F2,$C3,$94,$12,$22,$15,$25,$96
.byte $17,$94,$19,$62,$22,$32,$25,$35
.byte $96,$27,$94,$29,$3F,$92,$32,$30
.byte $3F,$27,$25,$3F,$27,$25,$27,$25
.byte $94,$24,$20,$20,$22,$FF
@Channel1:
.byte $EC,$06,$ED,$00,$EE,$05,$F0,$0C
.byte $F2,$C3,$94,$09,$19,$12,$22,$96
.byte $14,$94,$15,$19,$19,$29,$22,$32
.byte $96,$24,$94,$25,$3F,$92,$2B,$29
.byte $3F,$24,$22,$3F,$22,$22,$22,$22
.byte $94,$20,$17,$17,$19,$FF
@Channel2:
.byte $E0,$64,$F5,$94,$12,$12,$22,$12
.byte $96,$20,$94,$19,$57,$17,$96,$15
.byte $14,$94,$15,$96,$10,$92,$12,$12
.byte $96,$3F,$92,$12,$12,$96,$3F,$94
.byte $10,$92,$10,$3F,$F3,$8E,$72,$70
.byte $6A,$68,$66,$65,$64,$63,$62,$FF

SFXPlayerDeathData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 3
.addr @Channel3
.byte $FF
@Channel1:
.byte $82,$3F
@Channel0:
.byte $EC,$04,$ED,$00,$EE,$02,$F0,$20
.byte $CF,$8F,$60,$5E,$5C,$5A,$58,$56
.byte $54,$52,$50,$48,$46,$44,$02,$F1
.byte $F7,$F9,$00,$FF
@Channel3:
.byte $EC,$05,$EE,$02,$81,$49,$4A,$4B
.byte $4C,$4D,$0E,$FF

MusicPortPowerupData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$07,$ED,$80,$EE,$02,$F0,$00
.byte $F2,$F2,$94,$25,$24,$23,$22,$20
.byte $1B,$20,$22,$25,$24,$27,$26,$29
.byte $28,$29,$2B,$98,$30,$FF
@Channel1:
.byte $EC,$07,$ED,$80,$EE,$02,$F0,$00
.byte $F2,$F2,$94,$20,$20,$1A,$1A,$17
.byte $17,$17,$1B,$20,$20,$22,$22,$24
.byte $24,$25,$27,$98,$27,$FF
@Channel2:
.byte $E0,$64,$F5,$94,$10,$17,$0A,$15
.byte $07,$12,$07,$07,$10,$17,$12,$19
.byte $14,$1B,$15,$17,$F3,$9F,$20,$1B
.byte $1A,$19,$18,$17,$16,$15,$14,$13
.byte $12,$11,$10,$FF

SFXPortNeedMoreConchShellsData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte $F0,$01
@Channel0:
.byte $EC,$04,$ED,$00,$C3,$82,$15,$80
.byte $3F,$F9,$EE,$0F,$FF

MusicBonusScreenEndData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$05,$ED,$00,$EE,$04,$F0,$0C
.byte $F2,$C1,$94,$19,$1B,$19,$15,$19
.byte $1B,$20,$22,$20,$1B,$3F,$20,$FF
@Channel1:
.byte $EC,$05,$ED,$00,$EE,$04,$F0,$0C
.byte $F2,$C1,$94,$15,$17,$15,$12,$15
.byte $17,$19,$1B,$17,$17,$3F,$17,$FF
@Channel2:
.byte $E0,$64,$F5,$98,$15,$17,$94,$20
.byte $17,$3F,$20,$FF

SFXExtraLifeData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$80,$F0,$18,$EE,$00
.byte $C3,$8F,$10,$20,$EF,$03,$F9,$EE
.byte $00,$C3,$8F,$14,$24,$EF,$03,$F9
.byte $EE,$00,$C3,$8F,$17,$27,$EF,$03
.byte $F9,$EE,$00,$C3,$8F,$20,$30,$EF
.byte $03,$F9,$FF

MusicIntroScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$05,$ED,$C0,$F0,$0C,$F2,$C1
.byte $EE,$03,$C1,$84,$17,$9B,$19,$84
.byte $3F,$9B,$19,$84,$3F,$9B,$19,$96
.byte $22,$F9,$98,$20,$22,$84,$29,$9B
.byte $27,$96,$29,$FF
@Channel1:
.byte $EC,$05,$ED,$C0,$F0,$0C,$F2,$C1
.byte $EE,$03,$C1,$84,$14,$9B,$14,$84
.byte $3F,$9B,$14,$84,$3F,$9B,$14,$96
.byte $19,$F9,$98,$19,$1B,$84,$24,$9B
.byte $24,$96,$24,$FF
@Channel2:
.byte $E0,$64,$F5,$C7,$96,$09,$F9,$98
.byte $15,$17,$84,$09,$9B,$19,$84,$09
.byte $9B,$19,$07,$09,$07,$09,$FF

SFXEncounterEnemyDeathData:
.byte 4
.byte 1
.addr @Channel1 ; ecfe
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$C0,$EE,$00,$F0,$0C
.byte $8F,$C5,$60,$30,$02,$F1,$03,$EF
.byte $01,$F9,$FF

MusicBonusScreenStartData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$08,$ED,$00,$EE,$05,$F0,$0C
.byte $F2,$C2,$82,$12,$14,$E0,$5B,$ED
.byte $22,$17,$86,$17,$17,$84,$1B,$59
.byte $8A,$59,$87,$19,$84,$19,$86,$17
.byte $84,$3F,$82,$12,$14,$E0,$5B,$ED
.byte $22,$17,$86,$17,$17,$84,$16,$57
.byte $8A,$57,$87,$17,$84,$19,$86,$17
.byte $84,$19,$82,$12,$14,$F8,$28,$ED
.byte $84,$17,$17,$82,$12,$84,$14,$82
.byte $12,$87,$20,$84,$5B,$88,$5B,$84
.byte $1B,$82,$1B,$22,$1B,$19,$17,$3F
.byte $22,$32,$32,$22,$32,$32,$84,$3F
.byte $87,$17,$84,$57,$88,$57,$84,$17
.byte $3F,$EF,$FC,$22,$62,$22,$EF,$04
.byte $17,$86,$17,$3F,$84,$22,$62,$FA
@Channel1:
.byte $EC,$08,$ED,$C0,$EE,$05,$F0,$0C
.byte $F2,$C2,$84,$3F,$E0,$DA,$ED,$17
.byte $12,$86,$12,$12,$84,$14,$54,$88
.byte $55,$84,$15,$15,$14,$52,$87,$12
.byte $84,$12,$86,$10,$84,$0B,$3F,$E0
.byte $DA,$ED,$17,$12,$86,$12,$12,$84
.byte $12,$52,$12,$22,$27,$22,$29,$86
.byte $2B,$84,$27,$30,$27,$2B,$27,$29
.byte $86,$2B,$84,$27,$F8,$9F,$ED,$82
.byte $22,$32,$32,$22,$32,$32,$84,$3F
.byte $87,$17,$84,$57,$88,$57,$84,$17
.byte $86,$3F,$82,$12,$14,$84,$17,$17
.byte $82,$12,$84,$14,$82,$12,$87,$20
.byte $84,$5B,$88,$5B,$84,$1B,$3F,$EF
.byte $FC,$17,$57,$17,$EF,$04,$12,$86
.byte $12,$3F,$84,$17,$55,$FA
@Channel2:
.byte $EC,$04,$F0,$18,$F2,$C1,$82,$02
.byte $04,$E0,$46,$EE,$03,$82,$03,$3F
.byte $03,$3F,$03,$3F,$03,$3F,$03,$3F
.byte $03,$3F,$03,$3F,$84,$02,$86,$02
.byte $84,$02,$04,$86,$04,$84,$04,$05
.byte $86,$05,$84,$05,$06,$86,$06,$82
.byte $02,$04,$F8,$1A,$EE,$84,$07,$82
.byte $07,$3F,$84,$07,$82,$07,$3F,$07
.byte $3F,$07,$3F,$84,$07,$82,$07,$3F
.byte $07,$3F,$07,$3F,$84,$07,$82,$07
.byte $3F,$07,$3F,$0B,$12,$0B,$09,$02
.byte $04,$84,$05,$82,$05,$3F,$84,$05
.byte $82,$05,$3F,$05,$3F,$05,$3F,$84
.byte $05,$82,$05,$3F,$05,$3F,$05,$3F
.byte $84,$05,$82,$05,$3F,$05,$85,$3F
.byte $84,$05,$44,$04,$82,$04,$3F,$04
.byte $3F,$04,$3F,$04,$3F,$04,$3F,$84
.byte $04,$43,$FA

MusicOutroScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$07,$ED,$C0,$EE,$05,$F0,$0C
.byte $F2,$C2,$8A,$3F,$3F,$3F,$89,$3F
.byte $84,$3F,$82,$16,$17,$E0,$99,$EF
.byte $84,$3F,$82,$17,$19,$E0,$99,$EF
.byte $86,$12,$84,$10,$14,$3F,$86,$17
.byte $84,$17,$19,$17,$1B,$20,$1B,$86
.byte $17,$84,$14,$86,$17,$84,$16,$86
.byte $17,$19,$84,$1B,$86,$20,$84,$1B
.byte $19,$17,$87,$24,$86,$22,$82,$10
.byte $12,$14,$16,$17,$84,$19,$82,$1B
.byte $86,$20,$22,$24,$84,$22,$86,$1B
.byte $84,$19,$82,$1B,$19,$17,$14,$84
.byte $14,$17,$87,$3F,$84,$14,$17,$1B
.byte $88,$62,$84,$22,$17,$86,$19,$ED
.byte $80,$8A,$62,$88,$22,$8C,$20,$1B
.byte $85,$20,$87,$1B,$84,$17,$86,$19
.byte $84,$1B,$54,$14,$12,$87,$12,$82
.byte $12,$14,$16,$17,$84,$19,$86,$17
.byte $84,$14,$86,$17,$82,$53,$14,$84
.byte $17,$14,$86,$19,$84,$1B,$86,$14
.byte $84,$12,$86,$22,$20,$84,$1B,$87
.byte $19,$82,$23,$85,$24,$88,$22,$84
.byte $3F,$82,$12,$14,$16,$17,$84,$19
.byte $8A,$62,$88,$22,$8C,$27,$26,$85
.byte $27,$86,$24,$84,$20,$87,$22,$84
.byte $24,$5B,$1B,$19,$88,$19,$86,$1B
.byte $89,$17,$86,$22,$89,$1B,$84,$24
.byte $22,$86,$27,$84,$24,$22,$86,$27
.byte $64,$24,$27,$84,$27,$87,$29,$8A
.byte $67,$86,$27,$84,$16,$82,$16,$16
.byte $84,$17,$FF,$87,$22,$82,$16,$17
.byte $84,$22,$20,$1B,$20,$17,$82,$16
.byte $57,$86,$17,$3F,$84,$12,$14,$87
.byte $15,$82,$12,$14,$84,$15,$17,$19
.byte $3F,$89,$12,$FA
@Channel1:
.byte $E0,$07,$F1,$E0,$07,$F1,$E0,$07
.byte $F1,$E0,$07,$F1,$E0,$07,$F1,$E0
.byte $07,$F1,$E0,$22,$F1,$ED,$80,$EE
.byte $06,$84,$12,$82,$22,$22,$84,$20
.byte $1B,$82,$19,$12,$17,$19,$EE,$00
.byte $02,$04,$06,$07,$E0,$07,$F1,$E0
.byte $07,$F1,$E0,$22,$F1,$ED,$40,$EE
.byte $06,$EC,$08,$84,$12,$22,$12,$20
.byte $12,$1B,$12,$19,$ED,$80,$F2,$B5
.byte $82,$20,$20,$27,$27,$30,$30,$37
.byte $37,$30,$32,$30,$32,$30,$32,$30
.byte $32,$1B,$1B,$27,$27,$2B,$2B,$37
.byte $37,$2B,$30,$2B,$30,$2B,$30,$2B
.byte $30,$19,$19,$26,$26,$32,$32,$36
.byte $36,$30,$32,$30,$32,$30,$32,$30
.byte $32,$ED,$40,$F2,$C1,$EC,$07,$84
.byte $27,$26,$24,$87,$30,$86,$2B,$82
.byte $19,$1B,$20,$22,$24,$84,$26,$ED
.byte $80,$F2,$B5,$82,$27,$36,$37,$36
.byte $34,$32,$37,$36,$37,$ED,$40,$F2
.byte $C1,$86,$30,$84,$2B,$27,$ED,$80
.byte $F2,$B5,$82,$36,$37,$36,$37,$36
.byte $37,$36,$37,$84,$20,$24,$82,$34
.byte $34,$37,$37,$34,$34,$37,$37,$84
.byte $34,$37,$EC,$07,$ED,$40,$F2,$C1
.byte $88,$6B,$84,$2B,$24,$86,$26,$F0
.byte $0C,$ED,$80,$EC,$09,$C5,$82,$32
.byte $30,$2B,$29,$30,$2B,$29,$27,$2B
.byte $29,$27,$24,$29,$27,$24,$22,$F9
.byte $EC,$08,$ED,$80,$86,$19,$84,$17
.byte $87,$16,$82,$16,$85,$17,$88,$19
.byte $84,$3F,$82,$0B,$10,$12,$14,$84
.byte $16,$EC,$09,$ED,$80,$C2,$82,$32
.byte $30,$2B,$29,$30,$2B,$29,$27,$2B
.byte $29,$27,$24,$29,$27,$24,$22,$F9
.byte $32,$30,$2B,$29,$30,$2B,$29,$27
.byte $2B,$29,$27,$24,$EC,$07,$ED,$00
.byte $86,$19,$89,$14,$86,$1B,$89,$17
.byte $84,$20,$1B,$86,$24,$84,$20,$1B
.byte $86,$24,$60,$20,$24,$84,$24,$87
.byte $24,$8A,$62,$86,$22,$84,$10,$82
.byte $10,$10,$84,$12,$FF,$EC,$09,$ED
.byte $00,$EE,$02,$F0,$00,$F3,$82,$07
.byte $06,$04,$02,$07,$06,$04,$02,$07
.byte $06,$04,$02,$04,$06,$07,$09,$FA
.byte $82,$05,$04,$02,$00,$05,$04,$02
.byte $00,$05,$04,$02,$00,$02,$04,$05
.byte $07,$FA
@Channel2:
.byte $E0,$64,$F5,$E0,$02,$F2,$E0,$02
.byte $F2,$E0,$02,$F2,$E0,$02,$F2,$E0
.byte $02,$F2,$E0,$02,$F2,$E0,$08,$F2
.byte $E0,$02,$F2,$E0,$02,$F2,$E0,$08
.byte $F2,$84,$10,$10,$17,$10,$3F,$82
.byte $12,$14,$84,$17,$19,$84,$17,$17
.byte $3F,$17,$3F,$82,$1B,$20,$1B,$19
.byte $84,$17,$12,$12,$19,$12,$3F,$82
.byte $16,$17,$84,$19,$22,$14,$14,$24
.byte $14,$3F,$14,$86,$12,$84,$10,$10
.byte $87,$3F,$82,$20,$1B,$19,$17,$84
.byte $14,$0B,$0B,$3F,$86,$17,$14,$84
.byte $10,$09,$09,$87,$3F,$84,$0B,$86
.byte $10,$84,$12,$12,$3F,$3F,$3F,$14
.byte $86,$16,$E0,$11,$F2,$87,$10,$84
.byte $10,$88,$10,$87,$0B,$84,$0B,$88
.byte $0B,$87,$09,$84,$09,$88,$09,$86
.byte $12,$85,$22,$82,$12,$84,$12,$12
.byte $14,$16,$E0,$11,$F2,$84,$3F,$10
.byte $10,$20,$10,$3F,$86,$10,$84,$3F
.byte $0B,$0B,$1B,$0B,$3F,$86,$0B,$84
.byte $09,$19,$19,$09,$09,$19,$19,$0B
.byte $86,$12,$85,$22,$82,$12,$84,$12
.byte $12,$14,$16,$17,$86,$3F,$84,$14
.byte $3F,$12,$3F,$10,$86,$07,$84,$06
.byte $82,$06,$06,$84,$07,$FF,$86,$17
.byte $17,$17,$17,$FA,$15,$15,$15,$15
.byte $12,$12,$12,$12,$FA,$87,$17,$84
.byte $17,$87,$17,$84,$56,$16,$16,$86
.byte $16,$8C,$16,$16,$85,$16,$87,$14
.byte $84,$14,$87,$14,$84,$52,$12,$12
.byte $86,$12,$3F,$12,$FA

MusicFinaleScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$07,$ED,$C0,$EE,$03,$F0,$0C
.byte $E0,$76,$F2,$9A,$16,$E0,$76,$F2
.byte $99,$16,$94,$15,$14,$EC,$05,$F2
.byte $B5,$ED,$90,$EE,$05,$C1,$92,$18
.byte $18,$18,$18,$18,$3F,$18,$18,$18
.byte $18,$18,$3F,$96,$22,$F9,$F3,$96
.byte $26,$25,$24,$23,$23,$22,$21,$20
.byte $F8,$3B,$F2,$92,$48,$12,$98,$58
.byte $94,$18,$17,$92,$18,$17,$FA
@Channel1:
.byte $EC,$05,$F2,$35,$ED,$90,$EE,$07
.byte $F0,$18,$C3,$94,$23,$33,$3F,$23
.byte $33,$3F,$23,$33,$F9,$F0,$0C,$F2
.byte $B5,$EC,$05,$EE,$05,$C1,$92,$17
.byte $17,$17,$17,$17,$3F,$17,$17,$17
.byte $17,$17,$3F,$96,$21,$F9,$F3,$96
.byte $22,$21,$20,$1B,$19,$19,$19,$19
.byte $F8,$82,$F2
@Channel2:
.byte $EC,$04,$F2,$91,$F0,$0C,$C1,$94
.byte $17,$18,$15,$18,$17,$18,$15,$18
.byte $96,$17,$18,$15,$18,$F9,$C1,$94
.byte $12,$13,$0B,$13,$12,$13,$0B,$0B
.byte $F9,$96,$07,$12,$11,$0A,$94,$19
.byte $0A,$17,$1A,$19,$1A,$1A,$1A,$F8
.byte $BD,$F2

SFXFinaleStrobeData:
.byte 4
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte $EC,$01,$EE,$00,$F2,$44,$80,$04
.byte $F4,$18,$85,$0F,$FF

SFXUnusedData:
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte $EC,$07,$EE,$01,$8E,$0F,$0D,$4B
.byte $49,$47,$45,$03,$FF

SFXEncounterHarpoonFireData:
.byte 4
.byte 1
.addr @Channel1
.byte 3
.addr @Channel3
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$40,$EE,$04,$F0,$1C
.byte $8F,$1A,$2A,$3A,$C2,$69,$59,$F1
.byte $F5,$F9,$29,$FF
@Channel3:
.byte $EC,$06,$EE,$02,$8F,$4F,$4D,$4B
.byte $49,$47,$45,$43,$01,$FF

SFXBonusPlaneFireData:
.byte 4
.byte 1
.addr @Channel1
.byte 3
.addr @Channel3
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$80,$EE,$00,$F0,$04
.byte $F3,$8F,$C2,$78,$70,$68,$60,$58
.byte $50,$08,$EE,$02,$F1,$07,$F9,$FF
@Channel3:
.byte $EC,$06,$EE,$00,$8D,$45,$03,$FF

SFXEncounterBoatFireData:
.byte 4
.byte 2
.addr @Channel2
.byte $FF
@Channel2:
.byte $E0,$64,$F5,$F3,$F0,$1C,$8F,$35
.byte $37,$39,$F0,$0C,$C9,$2A,$F1,$FF
.byte $F9,$8F,$C8,$69,$F1,$FE,$F9,$20
.byte $FF

SFXEncounterSubmarineFireData:
.byte 4
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte $EC,$00,$EE,$00,$8E,$4F,$4D,$4B
.byte $48,$06,$FF

MusicStartEncounterData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC,$01,$ED,$00,$EE,$00,$F0,$F7
.byte $F2,$01,$81,$24,$23,$22,$21,$81
.byte $13,$14,$13,$14,$13,$14,$FF
@Channel1:
.byte $EC,$01,$ED,$00,$EE,$00,$F0,$F7
.byte $F2,$01,$81,$1B,$1A,$19,$18,$81
.byte $08,$09,$08,$09,$08,$09,$FF
@Channel2:
.byte $EC,$01,$F0,$F7,$F2,$01,$F8,$BD
.byte $F3

SFXEncounterJawsHarpoonHitData:
.byte 4
.byte 1
.addr SFXEncounterJawsHarpoonHitChannel1
.byte $FF
SFXEncounterJawsHitChannel1:
.byte $F0,$FC,$F8,$DF,$F3
SFXEncounterJawsHarpoonHitChannel1:
.byte $F0,$00,$EC
.byte $06,$ED,$80,$EE,$00,$F2,$C2,$8F
.byte $06,$10,$16,$20,$C2,$20,$24,$27
.byte $30,$EF,$03,$F9,$FF

SFXEncounterJawsHitData:
.byte 4
.byte 1
.addr SFXEncounterJawsHitChannel1
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte $EC,$06,$EE,$00,$8D,$44,$02,$FF

SFXEncounterBoatDespawnData:
.byte 4
.byte 1
.addr SFXEncounterBoatDespawnChannel1
.byte 3
.addr SFXEncounterBoatDespawnChannel3
.byte $FF
SFXEncounterBoatDespawnChannel1:
SFXFinaleHitChannel1:
.byte $EC,$06,$EE,$00,$F0,$00,$F3,$8F
.byte $C5,$20,$21,$EE,$01,$F0,$FF,$F9
.byte $FF
SFXEncounterBoatDespawnChannel3:
SFXFinaleHitChannel3:
.byte $EC,$06,$EE,$00,$F3,$C2,$8F,$0E
.byte $0D,$F9,$8E,$47,$46,$45,$82,$44
.byte $43,$42,$00,$FF

SFXFinaleHitData:
.byte 1
.addr SFXFinaleHitChannel1
.byte 3
.addr SFXFinaleHitChannel3
.byte 0
.addr @Channel0
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte $EC
.byte $06,$ED,$00,$EE,$00,$F0,$20,$8E
.byte $C4,$10,$20,$14,$24,$17,$27,$EF
.byte $03,$F9,$FF
@Channel2:
.byte $E0,$64,$F5,$8F,$10
.byte $13,$12,$17,$0A,$12,$17,$10,$12
.byte $20,$1B,$19,$17,$15,$13,$11,$FF

SFXMapTrackerPulseData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte $EC,$04,$ED,$40,$F0,$0E,$EE,$00
.byte $8F,$0A,$1A,$10,$20,$14,$24,$82
.byte $3F,$8F,$C4,$13,$19,$23,$29,$EF
.byte $04,$F9,$FF,$04,$02,$90,$F4,$03
.byte $A7,$F4,$FF,$EC,$04,$F0,$04,$8F
.byte $06,$0A,$12,$14,$17,$19,$22,$25
.byte $82,$3F,$8E,$27,$25,$23,$21,$1B
.byte $18,$FF,$EC,$08,$EE,$05,$F2,$F1
.byte $8F,$4A,$48,$47,$46,$45,$43,$02
.byte $82,$3F,$8F,$46,$47,$49,$0D,$3F
.byte $C2,$EF,$05,$8F,$47,$49,$0D,$3F
.byte $F9,$FF

SFXEncounterPickupData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$80,$EE,$01,$F0,$0C
.byte $C3,$8E,$25,$35,$27,$37,$29,$39
.byte $2B,$3B,$F1,$00,$EF,$04,$F9,$FF

SFXPauseData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte $EC,$06,$ED,$80,$EE,$01,$F0,$0C
.byte $C3,$8E,$27,$37,$F9,$FF

MusicTitleScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte $FF
@Channel0:
.byte $EC,$05,$ED,$00,$F2,$C1,$F0,$F4
.byte $C3,$EE,$09,$94,$17,$18,$EE,$07
.byte $94,$17,$18,$EE,$06,$94,$17,$18
.byte $EE,$03,$94,$17,$18,$EE,$03,$17
.byte $18,$15,$18,$17,$18,$15,$18,$F9
.byte $C7,$94,$17,$18,$EF,$02,$F9,$DD
.byte $9A,$3F,$F9,$F8,$FE,$F4
@Channel1:
.byte $EC,$07,$ED,$C0,$EE,$02,$F0,$0C
.byte $9A,$3F,$3F,$3F,$3F,$92,$18,$22
.byte $9A,$68,$99,$68,$94,$28,$92,$18
.byte $22,$99,$68,$94,$28,$92,$18,$22
.byte $94,$28,$92,$22,$28,$94,$32,$98
.byte $3F,$DF,$9A,$3F,$F9,$F8,$34,$F5
.byte $EC,$04,$F0,$0C,$F2,$C1,$FA,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $01,$00,$00,$00,$00,$00,$3F,$1F
.byte $1F,$0F,$0F,$07
