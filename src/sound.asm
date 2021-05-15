SoundDataPtr             = $F0
SoundCurrentChannelStatus = $F2

SoundChannelLen = $1C
SoundChannel0 = $0574 + (SoundChannelLen * 0)
SoundChannel1 = $0574 + (SoundChannelLen * 1)
SoundChannel2 = $0574 + (SoundChannelLen * 2)
SoundChannel3 = $0574 + (SoundChannelLen * 3)
SoundChannel4 = $0574 + (SoundChannelLen * 4)

SoundChannelStatus       = SoundChannel0 + $00
SoundChannelTimer        = SoundChannel0 + $02
SoundChannelPeriod       = SoundChannel0 + $03
SoundChannelDuty         = SoundChannel0 + $04
SoundChannelDutyAdjust          = SoundChannel0 + $05
SoundChannelTimer1          = SoundChannel0 + $06
SoundChannelTimer2          = SoundChannel0 + $07
SoundChannelDataPtr      = SoundChannel0 + $08
SoundChannel_0A          = SoundChannel0 + $0A
SoundChannel_0B          = SoundChannel0 + $0B
SoundChannel_0C          = SoundChannel0 + $0C
SoundChannelUnkOffset          = SoundChannel0 + $0D
SoundChannelUnkPtr       = SoundChannel0 + $0E
SoundChannel_10          = SoundChannel0 + $10
SoundChannel_11          = SoundChannel0 + $11
SoundChannel_12          = SoundChannel0 + $12
SoundChannel_13          = SoundChannel0 + $13
SoundChannel_14          = SoundChannel0 + $14
SoundChannel_15          = SoundChannel0 + $15
SoundChannel_16          = SoundChannel0 + $16
SoundChannel_17          = SoundChannel0 + $17
SoundChannelDuty2          = SoundChannel0 + $18
SoundChannelLoopCounter          = SoundChannel0 + $19
SoundDataPtrCopy         = SoundChannel0 + $1A

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
        sta SoundDataPtr
        lda SoundPointers+1,x
        sta SoundDataPtr+1
        ldy #$00
@ContinueReading:
        ; if next value has its high byte set, we've finished reading
        lda (SoundDataPtr),y
        bmi @Done
        iny
        ; otherwise the first byte is the next sound channel
        tax
        cmp #$04
        bcc @ReadNextSoundChannel
        ; some kind of special handling for sound effects?
        lda (SoundDataPtr),y
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
        sta SoundChannelDutyAdjust,x
        lda #$01
        sta SoundChannelTimer1,x
        lda #$0C
        sta SoundChannelTimer2,x
        ; copy pointer to the data for this sound channel
        lda (SoundDataPtr),y
        iny
        sta SoundChannelDataPtr,x
        lda (SoundDataPtr),y
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
        sta SoundChannelDuty2,x
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
        sta SoundCurrentChannelStatus
        jsr SoundRunChannel0
        lda SoundCurrentChannelStatus
        sta SoundChannelStatus
@RunChannel1:
        ldx #SoundChannelLen*1
        lda SoundChannel1
        bpl @RunChannel2
        sta SoundCurrentChannelStatus
        jsr SoundRunChannel1
        lda SoundCurrentChannelStatus
        sta SoundChannel1
@RunChannel2:
        ldx #SoundChannelLen*2
        lda SoundChannel2
        bpl @RunChannel3
        sta SoundCurrentChannelStatus
        jsr SoundRunChannel2
        lda SoundCurrentChannelStatus
        sta SoundChannel2
@RunChannel3:
        ldx #SoundChannelLen*3
        lda SoundChannel3
        bpl @RunChannel4
        sta SoundCurrentChannelStatus
        jsr SoundRunChannel3
        lda SoundCurrentChannelStatus
        sta SoundChannel3
@RunChannel4:
        ldx #SoundChannelLen*4
        lda SoundChannel4
        bpl LE3D9
        sta SoundCurrentChannelStatus
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
        lda     SoundCurrentChannelStatus                             ; E3D4 A5 F2                    ..
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
        dec     SoundChannelTimer1,x                         ; E429 DE 7A 05                 .z.
        bne     LE43B                           ; E42C D0 0D                    ..
        lda     #$00                            ; E42E A9 00                    ..
        sta     NextSND_ApuStatus                           ; E430 8D 6B 05                 .k.
        jsr     LE5E9                           ; E433 20 E9 E5                  ..
        bit     SoundCurrentChannelStatus                             ; E436 24 F2                    $.
        bvc     LE451                           ; E438 50 17                    P.
        rts                                     ; E43A 60                       `

; ----------------------------------------------------------------------------
LE43B:
        bit     SoundCurrentChannelStatus                             ; E43B 24 F2                    $.
        bvc     LE440                           ; E43D 50 01                    P.
        rts                                     ; E43F 60                       `

; ----------------------------------------------------------------------------
LE440:
        jsr     LE560                           ; E440 20 60 E5                  `.
        lda     #$20                            ; E443 A9 20                    . 
        bit     SoundCurrentChannelStatus                             ; E445 24 F2                    $.
        beq     LE44C                           ; E447 F0 03                    ..
        jmp LE451
; ----------------------------------------------------------------------------
LE44C:
        lsr     a                               ; E44C 4A                       J
        bit     SoundCurrentChannelStatus                             ; E44D 24 F2                    $.
        beq     LE451                           ; E44F F0 00                    ..
LE451:
        lda     SoundChannelDuty,x                         ; E451 BD 78 05                 .x.
        ora     SoundChannelDuty2,x                         ; E454 1D 8C 05                 ...
        ora     #$30                            ; E457 09 30                    .0
        sta     NextSND_Sq0Duty                           ; E459 8D 67 05                 .g.
        lda     SoundChannelTimer,x                         ; E45C BD 76 05                 .v.
        sta     NextSND_Sq0Timer                           ; E45F 8D 5F 05                 ._.
        lda     SoundChannelPeriod,x                         ; E462 BD 77 05                 .w.
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
        dec     SoundChannelTimer1,x                         ; E47E DE 7A 05                 .z.
        bne     LE490                           ; E481 D0 0D                    ..
        lda     #$00                            ; E483 A9 00                    ..
        sta     NextSND_ApuStatus                           ; E485 8D 6B 05                 .k.
        jsr     LE5E9                           ; E488 20 E9 E5                  ..
        bit     SoundCurrentChannelStatus                             ; E48B 24 F2                    $.
        bvc     LE4A6                           ; E48D 50 17                    P.
        rts                                     ; E48F 60                       `

; ----------------------------------------------------------------------------
LE490:
        bit     SoundCurrentChannelStatus                             ; E490 24 F2                    $.
        bvc     LE495                           ; E492 50 01                    P.
        rts                                     ; E494 60                       `

; ----------------------------------------------------------------------------
LE495:
        jsr     LE560                           ; E495 20 60 E5                  `.
        lda     #$20                            ; E498 A9 20                    . 
        bit     SoundCurrentChannelStatus                             ; E49A 24 F2                    $.
        beq     LE4A1                           ; E49C F0 03                    ..
        jmp LE4A6
; ----------------------------------------------------------------------------
LE4A1:
        lsr     a                               ; E4A1 4A                       J
        bit     SoundCurrentChannelStatus                             ; E4A2 24 F2                    $.
        beq     LE4A6                           ; E4A4 F0 00                    ..
LE4A6:
        lda     SoundChannelDuty,x                         ; E4A6 BD 78 05                 .x.
        ora     SoundChannelDuty2,x                         ; E4A9 1D 8C 05                 ...
        ora     #$30                            ; E4AC 09 30                    .0
        sta     NextSND_Sq1Duty                           ; E4AE 8D 68 05                 .h.
        lda     SoundChannelTimer,x                         ; E4B1 BD 76 05                 .v.
        sta     NextSND_Sq1Timer                           ; E4B4 8D 61 05                 .a.
        lda     SoundChannelPeriod,x                         ; E4B7 BD 77 05                 .w.
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
        dec     SoundChannelTimer1,x                         ; E4D3 DE 7A 05                 .z.
        bne     LE4E5                           ; E4D6 D0 0D                    ..
        lda     #$01                            ; E4D8 A9 01                    ..
        sta     NextSND_ApuStatus                           ; E4DA 8D 6B 05                 .k.
        jsr     LE5E9                           ; E4DD 20 E9 E5                  ..
        bit     SoundCurrentChannelStatus                             ; E4E0 24 F2                    $.
        bvc     LE4FB                           ; E4E2 50 17                    P.
        rts                                     ; E4E4 60                       `

; ----------------------------------------------------------------------------
LE4E5:
        bit     SoundCurrentChannelStatus                             ; E4E5 24 F2                    $.
        bvc     LE4EA                           ; E4E7 50 01                    P.
        rts                                     ; E4E9 60                       `

; ----------------------------------------------------------------------------
LE4EA:
        jsr     LE560                           ; E4EA 20 60 E5                  `.
        lda     #$20                            ; E4ED A9 20                    . 
        bit     SoundCurrentChannelStatus                             ; E4EF 24 F2                    $.
        beq     LE4F6                           ; E4F1 F0 03                    ..
        jmp LE4FB
; ----------------------------------------------------------------------------
LE4F6:
        lsr     a                               ; E4F6 4A                       J
        bit     SoundCurrentChannelStatus                             ; E4F7 24 F2                    $.
        beq     LE4FB                           ; E4F9 F0 00                    ..
LE4FB:
        lda     SoundChannelDuty,x                         ; E4FB BD 78 05                 .x.
        cmp     #$0F                            ; E4FE C9 0F                    ..
        bcc     LE523                           ; E500 90 21                    .!
        lda     #$FF                            ; E502 A9 FF                    ..
        sta     NextSND_TrgLinear                           ; E504 8D 69 05                 .i.
        lda     SoundChannelTimer,x                         ; E507 BD 76 05                 .v.
        sta     NextSND_TrgTimer                           ; E50A 8D 63 05                 .c.
        lda     SoundChannelPeriod,x                         ; E50D BD 77 05                 .w.
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
        dec     SoundChannelTimer1,x                         ; E529 DE 7A 05                 .z.
        bne     LE53B                           ; E52C D0 0D                    ..
        lda     #$02                            ; E52E A9 02                    ..
        sta     NextSND_ApuStatus                           ; E530 8D 6B 05                 .k.
        jsr     LE5E9                           ; E533 20 E9 E5                  ..
        bit     SoundCurrentChannelStatus                             ; E536 24 F2                    $.
        bvc     LE551                           ; E538 50 17                    P.
        rts
; ----------------------------------------------------------------------------
LE53B:
        bit     SoundCurrentChannelStatus                             ; E53B 24 F2                    $.
        bvc     LE540                           ; E53D 50 01                    P.
        rts
; ----------------------------------------------------------------------------
LE540:
        jsr     LE560                           ; E540 20 60 E5                  `.
        lda     #$20                            ; E543 A9 20                    . 
        bit     SoundCurrentChannelStatus                             ; E545 24 F2                    $.
        beq     LE54C                           ; E547 F0 03                    ..
        jmp LE551
; ----------------------------------------------------------------------------
LE54C:
        lsr     a                               ; E54C 4A                       J
        bit     SoundCurrentChannelStatus                             ; E54D 24 F2                    $.
        beq     LE551                           ; E54F F0 00                    ..
LE551:
        lda     SoundChannelDuty,x                         ; E551 BD 78 05                 .x.
        ora     #$30                            ; E554 09 30                    .0
        sta     NextSND_NoiseVolume                           ; E556 8D 6A 05                 .j.
        lda     SoundChannelPeriod,x                         ; E559 BD 77 05                 .w.
        sta     NextSND_NoisePeriod                           ; E55C 8D 65 05                 .e.
        rts                                     ; E55F 60                       `

; ----------------------------------------------------------------------------
LE560:
        lda     SoundCurrentChannelStatus                             ; E560 A5 F2                    ..
        eor     #$01                            ; E562 49 01                    I.
        and     #$05                            ; E564 29 05                    ).
        bne     LE5B1                           ; E566 D0 49                    .I
        lda     #$02                            ; E568 A9 02                    ..
        bit     SoundCurrentChannelStatus                             ; E56A 24 F2                    $.
        bne     LE579                           ; E56C D0 0B                    ..
        dec     SoundChannel_0A,x                         ; E56E DE 7E 05                 .~.
        bne     LE5B1                           ; E571 D0 3E                    .>
        inc     SoundCurrentChannelStatus                             ; E573 E6 F2                    ..
        inc     SoundCurrentChannelStatus                             ; E575 E6 F2                    ..
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
        adc     SoundChannelDuty                           ; E593 6D 78 05                 mx.
        bcs     LE59B                           ; E596 B0 03                    ..
        dey                                     ; E598 88                       .
        lda     #$00                            ; E599 A9 00                    ..
LE59B:
        sta     SoundChannelDuty,x                         ; E59B 9D 78 05                 .x.
        tya                                     ; E59E 98                       .
        sta     SoundChannel_0A,x                         ; E59F 9D 7E 05                 .~.
        rts                                     ; E5A2 60                       `

; ----------------------------------------------------------------------------
LE5A3:
        dec     SoundChannelDuty,x                         ; E5A3 DE 78 05                 .x.
        bpl     LE5AD                           ; E5A6 10 05                    ..
        lda     #$00                            ; E5A8 A9 00                    ..
        sta     SoundChannelDuty,x                         ; E5AA 9D 78 05                 .x.
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
        @TempUnkPtr = $F6
        lda     SoundChannelUnkPtr,x                         ; E5BB BD 82 05                 ...
        sta     @TempUnkPtr                             ; E5BE 85 F6                    ..
        lda     SoundChannelUnkPtr+1,x                         ; E5C0 BD 83 05                 ...
        sta     @TempUnkPtr+1                             ; E5C3 85 F7                    ..
        lda     SoundChannelUnkOffset,x                         ; E5C5 BD 81 05                 ...
        tay                                     ; E5C8 A8                       .
        lda     (@TempUnkPtr),y                         ; E5C9 B1 F6                    ..
        iny                                     ; E5CB C8                       .
        pha                                     ; E5CC 48                       H
        tya                                     ; E5CD 98                       .
        sta     SoundChannelUnkOffset,x                         ; E5CE 9D 81 05                 ...
        pla                                     ; E5D1 68                       h
        tay                                     ; E5D2 A8                       .
        and     #$0F                            ; E5D3 29 0F                    ).
        sec                                     ; E5D5 38                       8
        sbc     SoundChannelDutyAdjust,x                         ; E5D6 FD 79 05                 .y.
        bcs     LE5DD                           ; E5D9 B0 02                    ..
        lda     #$00                            ; E5DB A9 00                    ..
LE5DD:
        sta     SoundChannelDuty,x                         ; E5DD 9D 78 05                 .x.
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
        sta     SoundDataPtr                             ; E5EC 85 F0                    ..
        lda     SoundChannelDataPtr+1,x                         ; E5EE BD 7D 05                 .}.
        sta     SoundDataPtr+1                             ; E5F1 85 F1                    ..
        lda     SoundChannelTimer2,x                         ; E5F3 BD 7B 05                 .{.
        sta     SoundChannelTimer1,x                         ; E5F6 9D 7A 05                 .z.
        lda     SoundCurrentChannelStatus                             ; E5F9 A5 F2                    ..
        tay                                     ; E5FB A8                       .
        and     #$B3                            ; E5FC 29 B3                    ).
        sta     SoundCurrentChannelStatus                             ; E5FE 85 F2                    ..
        tya                                     ; E600 98                       .
        and     #$04                            ; E601 29 04                    ).
        asl     a                               ; E603 0A                       .
        ora     SoundCurrentChannelStatus                             ; E604 05 F2                    ..
        sta     SoundCurrentChannelStatus                             ; E606 85 F2                    ..


; read more data from the current sound channel and excute instructions
ProcessSoundData:
        jsr ReadSoundData
        ; if value is lower than 80
        cmp #$80
        bcc LE669
        ; if value is between C0 and FF 
        cmp #$C0
        bcs @RunSoundOpOrLoop
        ; if value is between 80 and BF, we're setting the channel timer
        and #$7F
        tay
        ; find correct timer value and update both
        lda SoundTimingValues,y
        sta SoundChannelTimer1,x
        sta SoundChannelTimer2,x
        ; then continue reading sound data
        jmp ProcessSoundData
@RunSoundOpOrLoop:
        ; if above E0
        cmp #$E0
        bcs @RunSoundOpOrLoop2
        ; we are between C0 and DF, which means we're setting a loop point
        ; the number of loops is the value - BE, so, a minimum of 2.
        sbc #$BE
        sta SoundChannelLoopCounter,x
        ; then store a backup of our current location
        lda SoundDataPtr
        sta SoundDataPtrCopy,x
        lda SoundDataPtr+1
        sta SoundDataPtrCopy+1,x
        ; and finally continue reading sound data
        jmp ProcessSoundData
@RunSoundOpOrLoop2:
        ; if the value is EC or above, we're calling a soundop
        sbc #$EC
        bcs @RunSoundOp
        ; otherwise we're doing a call loop, where we run sound code from a data pointer
        ; first we check how many loops to run
        adc #$0D
        sta SoundChannelLoopCounter,x
        ; then store a backup of our current location
        lda SoundDataPtr
        sta SoundDataPtrCopy,x
        lda SoundDataPtr+1
        sta SoundDataPtrCopy+1,x
        ; then read the pointer to the call target
        jsr ReadSoundData
        pha ; pointless...
        jsr ReadSoundData
        sta SoundDataPtr+1
        pla ; so pointless...
        sta SoundDataPtr
        ; and finally continue reading sound data
        jmp ProcessSoundData
@RunSoundOp:
        @TempJmpTarget = $F4
        ; find pointer to the requested operation
        asl a
        tay
        lda SoundOps,y
        sta @TempJmpTarget
        lda SoundOps+1,y
        sta @TempJmpTarget+1
        ; and execute it
        jmp (@TempJmpTarget)

; ----------------------------------------------------------------------------
LE669:
        tay                                     ; E669 A8                       .
        and     #%01000000                            ; E66A 29 40                    )@
        beq     @LE674                           ; E66C F0 06                    ..
        lda     SoundCurrentChannelStatus                             ; E66E A5 F2                    ..
        ora     #%00000100                            ; E670 09 04                    ..
        sta     SoundCurrentChannelStatus                             ; E672 85 F2                    ..
@LE674:
        tya                                     ; E674 98                       .
        and     #%00111111                            ; E675 29 3F                    )?
        cmp     #%00111111                            ; E677 C9 3F                    .?
        bne     @LE684                           ; E679 D0 09                    ..
        lda     SoundCurrentChannelStatus                             ; E67B A5 F2                    ..
        ora     #$40                            ; E67D 09 40                    .@
        sta     SoundCurrentChannelStatus                             ; E67F 85 F2                    ..
        jmp     @ChannelDone                           ; E681 4C AF E7                 L..

; ----------------------------------------------------------------------------
@LE684:
        lda     NextSND_ApuStatus                           ; E684 AD 6B 05                 .k.
        cmp     #$02                            ; E687 C9 02                    ..
        bne     @LE694                           ; E689 D0 09                    ..
        sty     $F7                             ; E68B 84 F7                    ..
        lda     #$00                            ; E68D A9 00                    ..
        sta     $F6                             ; E68F 85 F6                    ..
        jmp     @LE6CF                           ; E691 4C CF E6                 L..

; ----------------------------------------------------------------------------
@LE694:
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
@LE6A9:
        cmp     #$0C                            ; E6A9 C9 0C                    ..
        bcc     @LE6B2                           ; E6AB 90 05                    ..
        sbc     #$0C                            ; E6AD E9 0C                    ..
        iny                                     ; E6AF C8                       .
        bne     @LE6A9                           ; E6B0 D0 F7                    ..
@LE6B2:
        sty     $F4                           ; E6B2 84 F4                    ..
        asl     a                               ; E6B4 0A                       .
        tay                                     ; E6B5 A8                       .
        lda     LE8A6,y                         ; E6B6 B9 A6 E8                 ...
        sta     $F6                             ; E6B9 85 F6                    ..
        lda     LE8A6+1,y                         ; E6BB B9 A7 E8                 ...
        sta     $F7                             ; E6BE 85 F7                    ..
        lda     $F4                           ; E6C0 A5 F4                    ..
        sta     SoundChannel_17,x                         ; E6C2 9D 8B 05                 ...
        beq     @LE6CF                           ; E6C5 F0 08                    ..
        tay                                     ; E6C7 A8                       .
@LE6C8:
        lsr     $F7                             ; E6C8 46 F7                    F.
        ror     $F6                             ; E6CA 66 F6                    f.
        dey                                     ; E6CC 88                       .
        bne     @LE6C8                           ; E6CD D0 F9                    ..
@LE6CF:
        lda     $F6                             ; E6CF A5 F6                    ..
        sta     SoundChannel_10,x                         ; E6D1 9D 84 05                 ...
        lda     $F7                             ; E6D4 A5 F7                    ..
        sta     SoundChannel_11,x                         ; E6D6 9D 85 05                 ...
        lda     #$20                            ; E6D9 A9 20                    . 
        bit     SoundCurrentChannelStatus                             ; E6DB 24 F2                    $.
        beq     @LE73E                           ; E6DD F0 5F                    ._
        lda #$00
        sta $F4
        lda $F6

        SEC
        SBC SoundChannelTimer,X
        TAY
        LDA $F7
        SBC SoundChannelPeriod,X
        BCS @LE6FF
        INC $F4
        EOR #$FF
        PHA
        TYA
        EOR #$FF
        ADC #$01
        TAY
        PLA
        ADC #$00
@LE6FF:
        STY $F6
        STA $F7
        LDA SoundChannel_15,X
        STA SoundChannel_14,X
        STA $F5
        LDA #$00
        LDY #$10
@LE70F:
        ASL $F6
        ROL $F7
        ROL A
        CMP $F5
        BCC @LE71C
        SBC $F5
        INC $F6
@LE71C:
        DEY
        BNE @LE70F
        LDY $F6
        LDA $F7
        DEC $F4
        BNE @LE734
        EOR #$FF
        PHA
        TYA
        EOR #$FF
        CLC
        ADC #$01
        TAY
        PLA
        ADC #$00
@LE734:
        STA SoundChannel_13,X
        TYA
        STA SoundChannel_12,X
        JMP @LE764
@LE73E:
        lda     $F6                             ; E73E A5 F6                    ..
        sta     SoundChannelTimer,x                         ; E740 9D 76 05                 .v.
        lda     $F7                             ; E743 A5 F7                    ..
        sta     SoundChannelPeriod,x                         ; E745 9D 77 05                 .w.
        lda     #$10                            ; E748 A9 10                    ..
        bit     SoundCurrentChannelStatus                             ; E74A 24 F2                    $.
        beq     @LE764                           ; E74C F0 16                    ..
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
@LE764:
        lda     #$08                            ; E764 A9 08                    ..
        bit     SoundCurrentChannelStatus                             ; E766 24 F2                    $.
        bne     @ChannelDone                           ; E768 D0 45                    .E
        lda     SoundCurrentChannelStatus                             ; E76A A5 F2                    ..
        and     #$FD                            ; E76C 29 FD                    ).
        sta     SoundCurrentChannelStatus                             ; E76E 85 F2                    ..
        lda     #$00                            ; E770 A9 00                    ..
        sta     SoundChannelUnkOffset,x                         ; E772 9D 81 05                 ...
        jsr     LE5BB                           ; E775 20 BB E5                  ..
        lda     SoundCurrentChannelStatus                             ; E778 A5 F2                    ..
        eor     #$01                            ; E77A 49 01                    I.
        and     #$05                            ; E77C 29 05                    ).
        bne     @ChannelDone                           ; E77E D0 2F                    ./
        lda     SoundChannelTimer1,x                         ; E780 BD 7A 05                 .z.
        lsr     a                               ; E783 4A                       J
        sta     $F4                           ; E784 85 F4                    ..
        lda     SoundChannel_0B,x                         ; E786 BD 7F 05                 ...
        asl     a                               ; E789 0A                       .
        bcs     @LE79A                           ; E78A B0 0E                    ..
        asl     a                               ; E78C 0A                       .
        bcs     @LE7A1                           ; E78D B0 12                    ..
        lda     $F4                           ; E78F A5 F4                    ..
        lsr     a                               ; E791 4A                       J
        clc                                     ; E792 18                       .
        adc     $F4                           ; E793 65 F4                    e.
        sta     $F4                           ; E795 85 F4                    ..
        jmp     @LE7A1                           ; E797 4C A1 E7                 L..

; ----------------------------------------------------------------------------
@LE79A:
        lsr     $F4                           ; E79A 46 F4                    F.
        asl     a                               ; E79C 0A                       .
        bcc     @LE7A1                           ; E79D 90 02                    ..
        lsr     $F4                           ; E79F 46 F4                    F.
@LE7A1:
        sec                                     ; E7A1 38                       8
        lda     $F4                           ; E7A2 A5 F4                    ..
        bne     @LE7A7                           ; E7A4 D0 01                    ..
        clc                                     ; E7A6 18                       .
@LE7A7:
        lda     SoundChannelTimer1,x                         ; E7A7 BD 7A 05                 .z.
        sbc     $F4                           ; E7AA E5 F4                    ..
        sta     SoundChannel_0A,x                         ; E7AC 9D 7E 05                 .~.
@ChannelDone:
        lda     SoundDataPtr                             ; E7AF A5 F0                    ..
        sta     SoundChannelDataPtr,x                         ; E7B1 9D 7C 05                 .|.
        lda     SoundDataPtr+1                             ; E7B4 A5 F1                    ..
        sta     SoundChannelDataPtr+1,x                         ; E7B6 9D 7D 05                 .}.
        rts                                     ; E7B9 60                       `

; ----------------------------------------------------------------------------

SoundOpStartLoop = $C0
SoundOpCallLoop = $E0
SoundOpEC = $EC
SoundOpSetDuty2 = $ED
SoundOpSetDutyAdjust = $EE
SoundOpAdjustDuty = $EF
SoundOpF0 = $F0
SoundOpF1 = $F1
SoundOpF2 = $F2
SoundOpF3 = $F3
SoundOpProcessSoundData = $F4
SoundOpJump = $F8
SoundOpContinueLoop = $F9
SoundOpContinueCallLoop = $FA
SoundOpStopChannel = $FF

SoundActionOp = $EC

SoundOps:
.addr SoundOpECHandler ; takes 1 arg, sets unkptr
.addr SoundOpSetDuty2Handler ; takes 1 arg
.addr SoundOpSetDutyAdjustHandler ; takes 1 arg
.addr SoundOpAdjustDutyHandler ; takes 1 arg
.addr SoundOpF0Handler ; takes 1 arg
.addr SoundOpF1Handler ; takes 1 arg
.addr SoundOpF2Handler ; takes 1 arg
.addr SoundOpF3Handler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; unused
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpJumpHandler ; takes 2 args
.addr SoundOpContinueLoopHandler ; takes 0 args
.addr SoundOpContinueCallLoopHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpProcessSoundDataHandler ; takes 0 args
.addr SoundOpStopChannelHandler ; takes 0 args

SoundOpECHandler:
        jsr ReadSoundData
        asl a
        tay
        lda UnknownSoundDataPointers,y
        sta SoundChannelUnkPtr,x
        lda UnknownSoundDataPointers+1,y
        sta SoundChannelUnkPtr+1,x
        jmp ProcessSoundData

; set duty2 value, which is OR'ed with duty1!
SoundOpSetDuty2Handler:
        jsr ReadSoundData
        sta SoundChannelDuty2,x
        jmp ProcessSoundData

SoundOpSetDutyAdjustHandler:
        jsr     ReadSoundData                           ; E7FF 20 9B E8                  ..
        sta     SoundChannelDutyAdjust,x                         ; E802 9D 79 05                 .y.
        jmp     ProcessSoundData                           ; E805 4C 08 E6                 L..

SoundOpAdjustDutyHandler:
        jsr     ReadSoundData                           ; E808 20 9B E8                  ..
        clc                                     ; E80B 18                       .
        adc     SoundChannelDutyAdjust,x                         ; E80C 7D 79 05                 }y.
        sta     SoundChannelDutyAdjust,x                         ; E80F 9D 79 05                 .y.
        jmp     ProcessSoundData                           ; E812 4C 08 E6                 L..

SoundOpF0Handler:
        jsr     ReadSoundData                           ; E815 20 9B E8                  ..
        sta     SoundChannel_16,x                         ; E818 9D 8A 05                 ...
        jmp     ProcessSoundData                           ; E81B 4C 08 E6                 L..

SoundOpF1Handler:
        jsr     ReadSoundData                           ; E81E 20 9B E8                  ..
        clc                                     ; E821 18                       .
        adc     SoundChannel_16,x                         ; E822 7D 8A 05                 }..
        sta     SoundChannel_16,x                         ; E825 9D 8A 05                 ...
        jmp     ProcessSoundData                           ; E828 4C 08 E6                 L..

SoundOpF2Handler:
        jsr ReadSoundData
        sta SoundChannel_0B,x
        lda SoundCurrentChannelStatus
        ora #%00000001
        sta SoundCurrentChannelStatus
        jmp ProcessSoundData

SoundOpF3Handler:
        lda SoundCurrentChannelStatus
        and #%11111110
        sta SoundCurrentChannelStatus
        jmp ProcessSoundData

; moves sound data pointer to a new location
SoundOpJumpHandler:
        jsr ReadSoundData
        pha
        jsr ReadSoundData
        sta SoundDataPtr+1
        pla
        sta SoundDataPtr
        jmp ProcessSoundData

; decrements the loop counter, and returns to loop point unless finished
SoundOpContinueLoopHandler:
        dec SoundChannelLoopCounter,x
        beq @LoopFinished
        lda SoundDataPtrCopy,x
        sta SoundDataPtr
        lda SoundDataPtrCopy+1,x
        sta SoundDataPtr+1
@LoopFinished:
        jmp ProcessSoundData


SoundOpContinueCallLoopHandler: ; return to loop point
        @TempPtr = $F4
        dec SoundChannelLoopCounter,x
        beq @FinishLoop
        ; reload pointer to the loop sound data
        lda SoundDataPtrCopy,x
        sta @TempPtr
        lda SoundDataPtrCopy+1,x
        sta @TempPtr+1
        ldy #$02
        lda (@TempPtr),y
        sta SoundDataPtr
        iny
        lda (@TempPtr),y
        sta SoundDataPtr+1
        ; and keep running
        jmp ProcessSoundData
@FinishLoop:
        ; advance to the byte after the initial loop instruction
        lda SoundDataPtrCopy,x
        clc
        adc #$02
        sta SoundDataPtr
        lda SoundDataPtrCopy+1,x
        adc #$00
        sta SoundDataPtr+1

; go back to reading sound data
SoundOpProcessSoundDataHandler:
        jmp ProcessSoundData

; disable the current channel
SoundOpStopChannelHandler:
        lda #$00
        sta SoundCurrentChannelStatus
        sta SoundChannelStatus,x
        rts

; read next byte of sound data and advance data pointer
ReadSoundData:
        ldy #$00
        lda (SoundDataPtr),y
        inc SoundDataPtr
        bne @Done
        inc SoundDataPtr+1
@Done:
        rts

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
        .addr UnknownSoundData0Data
        .addr UnknownSoundData1Data
        .addr UnknownSoundData2Data
        .addr UnknownSoundData3Data
        .addr UnknownSoundData4Data
        .addr UnknownSoundData5Data
        .addr UnknownSoundData6Data
        .addr UnknownSoundData7Data
        .addr UnknownSoundData8Data
        .addr UnknownSoundData9Data

UnknownSoundData0Data:
        .byte $13,$17,$1B,$7F,$3E,$3D,$3C,$3B,$3A,$39,$38,$37,$46,$45,$54,$53,$52,$51,$00
        
UnknownSoundData1Data:
        .byte $18,$0F

UnknownSoundData2Data:
        .byte $18,$2F,$1B,$17,$13,$00
        
UnknownSoundData3Data:
        .byte $1C,$1D,$1E,$FF,$8E,$8D,$7C,$7B,$8A,$89,$88,$87,$86,$85,$04
        
UnknownSoundData4Data:
        .byte $0F

UnknownSoundData5Data:
        .byte $7F,$4E,$4D,$4C,$8B,$8A,$C9,$C8,$C7,$C6,$05
        
UnknownSoundData6Data:
        .byte $8F,$4E,$3D,$2C,$1B,$1A,$19,$18,$17,$16,$15,$14,$03
        
UnknownSoundData7Data:
        .byte $FA,$4B,$4C,$3D,$3E,$FF,$FE,$8D,$8C,$8B,$0A

UnknownSoundData8Data:
        .byte $2F,$2E,$3D,$4C,$4B,$8A,$F9,$F8,$F7,$06
        
UnknownSoundData9Data:
        .byte $1F,$1D,$1B,$1A,$1C,$1A,$18,$00,$1A,$17,$14,$18,$14,$16,$04



SoundTimingValues:
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
.byte SoundOpEC,$08
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$0D
.byte SoundOpF0,$00
.byte SoundOpF2,$C2
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$FE
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$FE
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$FE
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$FE
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$02
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$02
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$02
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpAdjustDuty,$02
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte SoundOpJump
.addr @Channel0
@Channel1:
.byte $80,$3F
.byte SoundOpJump
.addr @Channel0
@Channel0LoopData:
.byte $82,$22,$32,$22,$27,$22,$32,$22,$27
.byte SoundOpContinueCallLoop
@Channel2:
.byte SoundOpEC,$04
.byte $8A,$57,$17,$55,$15,$54,$14,$53,$13
.byte SoundOpJump
.addr @Channel2

MusicEncounterScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$09
.byte SoundOpF2,$CA
.byte SoundOpStartLoop+1
.byte $84,$16,$15,$14,$58,$88,$18,$17,$16
.byte SoundOpContinueLoop
.byte SoundOpEC,$05
.byte SoundOpF2,$48
.byte $82,$1A,$19,$18,$17,$16,$85,$3F,$88,$3F,$86,$3F,$84
.byte SoundOpAdjustDuty,$04
.byte $18,$18
.byte SoundOpAdjustDuty,$FB
.byte $18,$18
.byte SoundOpAdjustDuty,$FA
.byte $18,$18
.byte SoundOpAdjustDuty,$07
.byte $82,$13,$84,$18,$82,$1A
.byte SoundOpAdjustDuty,$FA
.byte $23
.byte SoundOpAdjustDuty,$06
.byte $85,$3F,$84,$3F,$82,$23,$22,$21,$22,$18,$3F,$86,$3F,$84
.byte SoundOpAdjustDuty,$04
.byte $18,$18
.byte SoundOpAdjustDuty,$FB
.byte $18,$18
.byte SoundOpAdjustDuty,$FA
.byte $18,$18
.byte SoundOpAdjustDuty,$07
.byte SoundOpJump
.addr @Channel0
@Channel1:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$09
.byte SoundOpF2,$CA
.byte SoundOpStartLoop+1
.byte $87,$1A,$84,$61,$88,$61,$8A,$21
.byte SoundOpContinueLoop
.byte SoundOpEC,$05
.byte SoundOpF2,$48
.byte $82,$23,$3F,$3F,$3F,$23,$85,$3F,$84,$3F,$1A,$18,$82,$13,$3F,$86,$3F,$84
.byte SoundOpAdjustDuty,$04
.byte $21,$21
.byte SoundOpAdjustDuty,$FB
.byte $21,$21
.byte SoundOpAdjustDuty,$FA
.byte $21,$21
.byte SoundOpAdjustDuty,$07
.byte $82,$18,$84,$21,$82,$23
.byte SoundOpAdjustDuty,$FA
.byte $28
.byte SoundOpAdjustDuty,$06
.byte $85,$3F,$84,$3F,$1A,$18,$82,$13,$3F,$86,$3F,$84
.byte SoundOpAdjustDuty,$04
.byte $21,$21
.byte SoundOpAdjustDuty,$FB
.byte $21,$21
.byte SoundOpAdjustDuty,$FA
.byte $21,$21
.byte SoundOpAdjustDuty,$07
.byte SoundOpJump
.addr @Channel1
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte SoundOpF2,$81
.byte SoundOpStartLoop+15
.byte $86,$0A
.byte SoundOpContinueLoop
.byte SoundOpStartLoop+15
.byte $07
.byte SoundOpContinueLoop
.byte SoundOpJump
.addr @Channel2

MusicGameOverScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpF2,$C3
.byte $94,$12,$22,$15,$25,$96,$17,$94,$19,$62,$22,$32,$25,$35,$96,$27,$94,$29,$3F,$92,$32,$30,$3F,$27,$25,$3F,$27,$25,$27,$25,$94,$24,$20,$20,$22
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpF2,$C3
.byte $94,$09,$19,$12,$22,$96,$14,$94,$15,$19,$19,$29,$22,$32,$96,$24,$94,$25,$3F,$92,$2B,$29,$3F,$24,$22,$3F,$22,$22,$22,$22,$94,$20,$17,$17,$19
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $94,$12,$12,$22,$12,$96,$20,$94,$19,$57,$17,$96,$15,$14,$94,$15,$96,$10,$92,$12,$12,$96,$3F,$92,$12,$12,$96,$3F,$94,$10,$92,$10,$3F
.byte SoundOpF3
.byte $8E,$72,$70,$6A,$68,$66,$65,$64,$63,$62
.byte SoundOpStopChannel

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
.byte SoundOpEC,$04
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$20
.byte SoundOpStartLoop+15
.byte $8F,$60,$5E,$5C,$5A,$58,$56,$54,$52,$50,$48,$46,$44,$02
.byte SoundOpF1,$F7
.byte SoundOpContinueLoop
.byte $00
.byte SoundOpStopChannel
@Channel3:
.byte SoundOpEC,$05
.byte SoundOpSetDutyAdjust,$02
.byte $81,$49,$4A,$4B,$4C,$4D,$0E
.byte SoundOpStopChannel

MusicPortPowerupData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpF2,$F2
.byte $94,$25,$24,$23,$22,$20,$1B,$20,$22,$25,$24,$27,$26,$29,$28,$29,$2B,$98,$30
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpF2,$F2
.byte $94,$20,$20,$1A,$1A,$17,$17,$17,$1B,$20,$20,$22,$22,$24,$24,$25,$27,$98,$27
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $94,$10,$17,$0A,$15,$07,$12,$07,$07,$10,$17,$12,$19,$14,$1B,$15,$17
.byte SoundOpF3
.byte $9F,$20,$1B,$1A,$19,$18,$17,$16,$15,$14,$13,$12,$11,$10
.byte SoundOpStopChannel

SFXPortNeedMoreConchShellsData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte SoundOpF0,$01
@Channel0:
.byte SoundOpEC,$04
.byte SoundOpSetDuty2,$00
.byte SoundOpStartLoop+3
.byte $82,$15,$80,$3F
.byte SoundOpContinueLoop
.byte SoundOpSetDutyAdjust,$0F
.byte SoundOpStopChannel

MusicBonusScreenEndData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$0C
.byte SoundOpF2,$C1
.byte $94,$19,$1B,$19,$15,$19,$1B,$20,$22,$20,$1B,$3F,$20
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpEC,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$0C
.byte SoundOpF2,$C1
.byte $94,$15,$17,$15,$12,$15,$17,$19,$1B,$17,$17,$3F,$17
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $98,$15,$17,$94,$20,$17,$3F,$20
.byte SoundOpStopChannel

SFXExtraLifeData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpF0,$18
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpStartLoop+3
.byte $8F,$10,$20
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpStartLoop+3
.byte $8F,$14,$24
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpStartLoop+3
.byte $8F,$17,$27
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpStartLoop+3
.byte $8F,$20,$30
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

MusicIntroScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$05
.byte SoundOpSetDuty2,$C0
.byte SoundOpF0,$0C
.byte SoundOpF2,$C1
.byte SoundOpSetDutyAdjust,$03
.byte SoundOpStartLoop+1
.byte $84,$17,$9B,$19,$84,$3F,$9B,$19,$84,$3F,$9B,$19,$96,$22
.byte SoundOpContinueLoop
.byte $98,$20,$22,$84,$29,$9B,$27,$96,$29
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpEC,$05
.byte SoundOpSetDuty2,$C0
.byte SoundOpF0,$0C
.byte SoundOpF2,$C1
.byte SoundOpSetDutyAdjust,$03
.byte SoundOpStartLoop+1
.byte $84,$14,$9B,$14,$84,$3F,$9B,$14,$84,$3F,$9B,$14,$96,$19
.byte SoundOpContinueLoop
.byte $98,$19,$1B,$84,$24,$9B,$24,$96,$24
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte SoundOpStartLoop+7
.byte $96,$09
.byte SoundOpContinueLoop
.byte $98,$15,$17,$84,$09,$9B,$19,$84,$09,$9B,$19,$07,$09,$07,$09
.byte SoundOpStopChannel

SFXEncounterEnemyDeathData:
.byte 4
.byte 1
.addr @Channel1 ; ecfe
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$0C
.byte $8F,$C5,$60,$30,$02
.byte SoundOpF1,$03
.byte SoundOpAdjustDuty,$01
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

MusicBonusScreenStartData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$08
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpF2,$C2
.byte $82,$12,$14
@Channel0Loop1:
.byte SoundOpCallLoop
.addr @Channel0Loop2
.byte $22,$17,$86,$17,$17,$84,$1B,$59,$8A,$59,$87,$19,$84,$19,$86,$17,$84,$3F,$82,$12,$14
.byte SoundOpCallLoop
.addr @Channel0Loop2
.byte $22,$17,$86,$17,$17,$84,$16,$57,$8A,$57,$87,$17,$84,$19,$86,$17,$84,$19,$82,$12,$14
.byte SoundOpJump
.addr @Channel0Loop1
@Channel0Loop2:
.byte $84,$17,$17,$82,$12,$84,$14,$82,$12,$87,$20,$84,$5B,$88,$5B,$84,$1B,$82,$1B,$22,$1B,$19,$17,$3F,$22,$32,$32,$22,$32,$32,$84,$3F,$87,$17,$84,$57,$88,$57,$84,$17,$3F
.byte SoundOpAdjustDuty,$FC
.byte $22,$62,$22
.byte SoundOpAdjustDuty,$04
.byte $17,$86,$17,$3F,$84,$22,$62
.byte SoundOpContinueCallLoop
@Channel1:
.byte SoundOpEC,$08
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpF2,$C2
.byte $84,$3F
@Channel1Loop:
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte $17,$12,$86,$12,$12,$84,$14,$54,$88,$55,$84,$15,$15,$14,$52,$87,$12,$84,$12,$86,$10,$84,$0B,$3F
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte $17,$12,$86,$12,$12,$84,$12,$52,$12,$22,$27,$22,$29,$86,$2B,$84,$27,$30,$27,$2B,$27,$29,$86,$2B,$84,$27
.byte SoundOpJump
.addr @Channel1Loop
@Channel1LoopData:
.byte $82,$22,$32,$32,$22,$32,$32,$84,$3F,$87,$17,$84,$57,$88,$57,$84,$17,$86,$3F,$82,$12,$14,$84,$17,$17,$82,$12,$84,$14,$82,$12,$87,$20,$84,$5B,$88,$5B,$84,$1B,$3F
.byte SoundOpAdjustDuty,$FC
.byte $17,$57,$17
.byte SoundOpAdjustDuty,$04
.byte $12,$86,$12,$3F,$84,$17,$55
.byte SoundOpContinueCallLoop
@Channel2:
.byte SoundOpEC,$04
.byte SoundOpF0,$18
.byte SoundOpF2,$C1
.byte $82,$02,$04
@Channel2Loop0:
.byte SoundOpCallLoop
.addr @Channel2Loop1
.byte $03,$82,$03,$3F,$03,$3F,$03,$3F,$03,$3F,$03,$3F,$03,$3F,$03,$3F,$84,$02,$86,$02,$84,$02,$04,$86,$04,$84,$04,$05,$86,$05,$84,$05,$06,$86,$06,$82,$02,$04
.byte SoundOpJump
.addr @Channel2Loop0
@Channel2Loop1:
.byte $84,$07,$82,$07,$3F,$84,$07,$82,$07,$3F,$07,$3F,$07,$3F,$84,$07,$82,$07,$3F,$07,$3F,$07,$3F,$84,$07,$82,$07,$3F,$07,$3F,$0B,$12,$0B,$09,$02,$04,$84,$05,$82,$05,$3F,$84,$05,$82,$05,$3F,$05,$3F,$05,$3F,$84,$05,$82,$05,$3F,$05,$3F,$05,$3F,$84,$05,$82,$05,$3F,$05,$85,$3F,$84,$05,$44,$04,$82,$04,$3F,$04,$3F,$04,$3F,$04,$3F,$04,$3F,$84,$04,$43
.byte SoundOpContinueCallLoop

MusicOutroScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpF2,$C2
.byte $8A,$3F,$3F,$3F,$89,$3F,$84,$3F,$82,$16,$17
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte $84,$3F,$82,$17,$19
.byte SoundOpCallLoop
.addr @Channel0LoopData
.byte $86,$12,$84,$10,$14,$3F,$86,$17,$84,$17,$19,$17,$1B,$20,$1B,$86,$17,$84,$14,$86,$17,$84,$16,$86,$17,$19,$84,$1B,$86,$20,$84,$1B,$19,$17,$87,$24,$86,$22,$82,$10,$12,$14,$16,$17,$84,$19,$82,$1B,$86,$20,$22,$24,$84,$22,$86,$1B,$84,$19,$82,$1B,$19,$17,$14,$84,$14,$17,$87,$3F,$84,$14,$17,$1B,$88,$62,$84,$22,$17,$86,$19
.byte SoundOpSetDuty2,$80
.byte $8A,$62,$88,$22,$8C,$20,$1B,$85,$20,$87,$1B,$84,$17,$86,$19,$84,$1B,$54,$14,$12,$87,$12,$82,$12,$14,$16,$17,$84,$19,$86,$17,$84,$14,$86,$17,$82,$53,$14,$84,$17,$14,$86,$19,$84,$1B,$86,$14,$84,$12,$86,$22,$20,$84,$1B,$87,$19,$82,$23,$85,$24,$88,$22,$84,$3F,$82,$12,$14,$16,$17,$84,$19,$8A,$62,$88,$22,$8C,$27,$26,$85,$27,$86,$24,$84,$20,$87,$22,$84,$24,$5B,$1B,$19,$88,$19,$86,$1B,$89,$17,$86,$22,$89,$1B,$84,$24,$22,$86,$27,$84,$24,$22,$86,$27,$64,$24,$27,$84,$27,$87,$29,$8A,$67,$86,$27,$84,$16,$82,$16,$16,$84,$17
.byte SoundOpStopChannel
@Channel0LoopData:
.byte $87,$22,$82,$16,$17,$84,$22,$20,$1B,$20,$17,$82,$16,$57,$86,$17,$3F,$84,$12,$14,$87,$15,$82,$12,$14,$84,$15,$17,$19,$3F,$89,$12
.byte SoundOpContinueCallLoop
@Channel1:
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData2
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$06
.byte $84,$12,$82,$22,$22,$84,$20,$1B,$82,$19,$12,$17,$19
.byte SoundOpSetDutyAdjust,$00
.byte $02,$04,$06,$07
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData
.byte SoundOpCallLoop
.addr @Channel1LoopData2
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDutyAdjust,$06
.byte SoundOpEC,$08
.byte $84,$12,$22,$12,$20,$12,$1B,$12,$19
.byte SoundOpSetDuty2,$80
.byte SoundOpF2,$B5
.byte $82,$20,$20,$27,$27,$30,$30,$37,$37,$30,$32,$30,$32,$30,$32,$30,$32,$1B,$1B,$27,$27,$2B,$2B,$37,$37,$2B,$30,$2B,$30,$2B,$30,$2B,$30,$19,$19,$26,$26,$32,$32,$36,$36,$30,$32,$30,$32,$30,$32,$30,$32
.byte SoundOpSetDuty2,$40
.byte SoundOpF2,$C1
.byte SoundOpEC,$07
.byte $84,$27,$26,$24,$87,$30,$86,$2B,$82,$19,$1B,$20,$22,$24,$84,$26
.byte SoundOpSetDuty2,$80
.byte SoundOpF2,$B5
.byte $82,$27,$36,$37,$36,$34,$32,$37,$36,$37
.byte SoundOpSetDuty2,$40
.byte SoundOpF2,$C1
.byte $86,$30,$84,$2B,$27
.byte SoundOpSetDuty2,$80
.byte SoundOpF2,$B5
.byte $82,$36,$37,$36,$37,$36,$37,$36,$37,$84,$20,$24,$82,$34,$34,$37,$37,$34,$34,$37,$37,$84,$34,$37
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$40
.byte SoundOpF2,$C1
.byte $88,$6B,$84,$2B,$24,$86,$26
.byte SoundOpF0,$0C
.byte SoundOpSetDuty2,$80
.byte SoundOpEC,$09
.byte SoundOpStartLoop+5
.byte $82,$32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24,$29,$27,$24,$22
.byte SoundOpContinueLoop
.byte SoundOpEC,$08
.byte SoundOpSetDuty2,$80
.byte $86,$19,$84,$17,$87,$16,$82,$16,$85,$17,$88,$19,$84,$3F,$82,$0B,$10,$12,$14,$84,$16
.byte SoundOpEC,$09
.byte SoundOpSetDuty2,$80
.byte SoundOpStartLoop+2
.byte $82,$32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24,$29,$27,$24,$22
.byte SoundOpContinueLoop
.byte $32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$00
.byte $86,$19,$89,$14,$86,$1B,$89,$17,$84,$20,$1B,$86,$24,$84,$20,$1B,$86,$24,$60,$20,$24,$84,$24,$87,$24,$8A,$62,$86,$22,$84,$10,$82,$10,$10,$84,$12
.byte SoundOpStopChannel
@Channel1LoopData:
.byte SoundOpEC,$09
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpF3
.byte $82,$07,$06,$04,$02,$07,$06,$04,$02,$07,$06,$04,$02,$04,$06,$07,$09
.byte SoundOpContinueCallLoop
@Channel1LoopData2:
.byte $82,$05,$04,$02,$00,$05,$04,$02,$00,$05,$04,$02,$00,$02,$04,$05,$07
.byte SoundOpContinueCallLoop
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF208
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF202
.byte SoundOpCallLoop
.addr @LoopF208
.byte $84,$10,$10,$17,$10,$3F,$82,$12,$14,$84,$17,$19,$84,$17,$17,$3F,$17,$3F,$82,$1B,$20,$1B,$19,$84,$17,$12,$12,$19,$12,$3F,$82,$16,$17,$84,$19,$22,$14,$14,$24,$14,$3F,$14,$86,$12,$84,$10,$10,$87,$3F,$82,$20,$1B,$19,$17,$84,$14,$0B,$0B,$3F,$86,$17,$14,$84,$10,$09,$09,$87,$3F,$84,$0B,$86,$10,$84,$12,$12,$3F,$3F,$3F,$14,$86,$16
.byte SoundOpCallLoop
.addr @LoopF211
.byte $87,$10,$84,$10,$88,$10,$87,$0B,$84,$0B,$88,$0B,$87,$09,$84,$09,$88,$09,$86,$12,$85,$22,$82,$12,$84,$12,$12,$14,$16
.byte SoundOpCallLoop
.addr @LoopF211
.byte $84,$3F,$10,$10,$20,$10,$3F,$86,$10,$84,$3F,$0B,$0B,$1B,$0B,$3F,$86,$0B,$84,$09,$19,$19,$09,$09,$19,$19,$0B,$86,$12,$85,$22,$82,$12,$84,$12,$12,$14,$16,$17,$86,$3F,$84,$14,$3F,$12,$3F,$10,$86,$07,$84,$06,$82,$06,$06,$84,$07
.byte SoundOpStopChannel
@LoopF202:
.byte $86,$17,$17,$17,$17
.byte SoundOpContinueCallLoop
@LoopF208:
.byte $15,$15,$15,$15,$12,$12,$12,$12
.byte SoundOpContinueCallLoop
@LoopF211:
.byte $87,$17,$84,$17,$87,$17,$84,$56,$16,$16,$86,$16,$8C,$16,$16,$85,$16,$87,$14,$84,$14,$87,$14,$84,$52,$12,$12,$86,$12,$3F,$12
.byte SoundOpContinueCallLoop

MusicFinaleScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$03
.byte SoundOpF0,$0C
.byte SoundOpCallLoop
.addr @Channel0Loop
.byte $9A,$16
.byte SoundOpCallLoop
.addr @Channel0Loop
.byte $99,$16,$94,$15,$14
.byte SoundOpEC,$05
.byte SoundOpF2,$B5
.byte SoundOpSetDuty2,$90
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpStartLoop+1
.byte $92,$18,$18,$18,$18,$18,$3F,$18,$18,$18,$18,$18,$3F,$96,$22
.byte SoundOpContinueLoop
.byte SoundOpF3
.byte $96,$26,$25,$24,$23,$23,$22,$21,$20
.byte SoundOpJump
.addr @Channel0
@Channel0Loop:
.byte $92,$48,$12,$98,$58,$94,$18,$17,$92,$18,$17
.byte SoundOpContinueCallLoop
@Channel1:
.byte SoundOpEC,$05
.byte SoundOpF2,$35
.byte SoundOpSetDuty2,$90
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$18
.byte SoundOpStartLoop+3
.byte $94,$23,$33,$3F,$23,$33,$3F,$23,$33
.byte SoundOpContinueLoop
.byte SoundOpF0,$0C
.byte SoundOpF2,$B5
.byte SoundOpEC,$05
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpStartLoop+1
.byte $92,$17,$17,$17,$17,$17,$3F,$17,$17,$17,$17,$17,$3F,$96,$21
.byte SoundOpContinueLoop
.byte SoundOpF3
.byte $96,$22,$21,$20,$1B,$19,$19,$19,$19
.byte SoundOpJump
.addr @Channel1
@Channel2:
.byte SoundOpEC,$04
.byte SoundOpF2,$91
.byte SoundOpF0,$0C
.byte SoundOpStartLoop+1
.byte $94,$17,$18,$15,$18,$17,$18,$15,$18,$96,$17,$18,$15,$18
.byte SoundOpContinueLoop
.byte SoundOpStartLoop+1
.byte $94,$12,$13,$0B,$13,$12,$13,$0B,$0B
.byte SoundOpContinueLoop
.byte $96,$07,$12,$11,$0A,$94,$19,$0A,$17,$1A,$19,$1A,$1A,$1A
.byte SoundOpJump
.addr @Channel2

SFXFinaleStrobeData:
.byte 4
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte SoundOpEC,$01
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF2,$44
.byte $80,$04
.byte SoundOpProcessSoundData
.byte $18,$85,$0F
.byte SoundOpStopChannel

SFXUnusedData:
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte SoundOpEC,$07
.byte SoundOpSetDutyAdjust,$01
.byte $8E,$0F,$0D,$4B,$49,$47,$45,$03
.byte SoundOpStopChannel

SFXEncounterHarpoonFireData:
.byte 4
.byte 1
.addr @Channel1
.byte 3
.addr @Channel3
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$1C
.byte $8F,$1A,$2A,$3A,$C2,$69,$59
.byte SoundOpF1,$F5
.byte SoundOpContinueLoop
.byte $29
.byte SoundOpStopChannel
@Channel3:
.byte SoundOpEC,$06
.byte SoundOpSetDutyAdjust,$02
.byte $8F,$4F,$4D,$4B,$49,$47,$45,$43,$01
.byte SoundOpStopChannel

SFXBonusPlaneFireData:
.byte 4
.byte 1
.addr @Channel1
.byte 3
.addr @Channel3
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$04
.byte SoundOpF3
.byte $8F,$C2,$78,$70,$68,$60,$58,$50,$08
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF1,$07
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
@Channel3:
.byte SoundOpEC,$06
.byte SoundOpSetDutyAdjust,$00
.byte $8D,$45,$03
.byte SoundOpStopChannel

SFXEncounterBoatFireData:
.byte 4
.byte 2
.addr @Channel2
.byte $FF
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte SoundOpF3
.byte SoundOpF0,$1C
.byte $8F,$35,$37,$39
.byte SoundOpF0,$0C
.byte SoundOpStartLoop+9
.byte $2A
.byte SoundOpF1,$FF
.byte SoundOpContinueLoop
.byte $8F,$C8,$69
.byte SoundOpF1,$FE
.byte SoundOpContinueLoop
.byte $20
.byte SoundOpStopChannel

SFXEncounterSubmarineFireData:
.byte 4
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte SoundOpEC,$00
.byte SoundOpSetDutyAdjust,$00
.byte $8E,$4F,$4D,$4B,$48,$06
.byte SoundOpStopChannel

MusicStartEncounterData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpEC,$01
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$F7
.byte SoundOpF2,$01
.byte $81,$24,$23,$22,$21,$81,$13,$14,$13,$14,$13,$14
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpEC,$01
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$F7
.byte SoundOpF2,$01
@Channel2Continue:
.byte $81,$1B,$1A,$19,$18,$81,$08,$09,$08,$09,$08,$09
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpEC,$01
.byte SoundOpF0,$F7
.byte SoundOpF2,$01
.byte SoundOpJump
.addr @Channel2Continue

SFXEncounterJawsHarpoonHitData:
.byte 4
.byte 1
.addr SFXEncounterJawsHarpoonHitChannel1
.byte $FF
SFXEncounterJawsHitChannel1:
.byte SoundOpF0,$FC
.byte SoundOpJump
.addr SFXEncounterJawsHitChannel1Continue
SFXEncounterJawsHarpoonHitChannel1:
.byte SoundOpF0,$00
SFXEncounterJawsHitChannel1Continue:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF2,$C2
.byte $8F,$06,$10,$16,$20,$C2,$20,$24,$27,$30
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

SFXEncounterJawsHitData:
.byte 4
.byte 1
.addr SFXEncounterJawsHitChannel1
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte SoundOpEC,$06
.byte SoundOpSetDutyAdjust,$00
.byte $8D,$44,$02
.byte SoundOpStopChannel

SFXEncounterBoatDespawnData:
.byte 4
.byte 1
.addr SFXEncounterBoatDespawnChannel1
.byte 3
.addr SFXEncounterBoatDespawnChannel3
.byte $FF
SFXEncounterBoatDespawnChannel1:
SFXFinaleHitChannel1:
.byte SoundOpEC,$06
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$00
.byte SoundOpF3
.byte $8F,$C5,$20,$21
.byte SoundOpSetDutyAdjust,$01
.byte SoundOpF0,$FF
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
SFXEncounterBoatDespawnChannel3:
SFXFinaleHitChannel3:
.byte SoundOpEC,$06
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF3
.byte SoundOpStartLoop+2
.byte $8F,$0E,$0D
.byte SoundOpContinueLoop
.byte $8E,$47,$46,$45,$82,$44,$43,$42,$00
.byte SoundOpStopChannel

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
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$20
.byte $8E,$C4,$10,$20,$14,$24,$17,$27
.byte SoundOpAdjustDuty,$03
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $8F,$10,$13,$12,$17,$0A,$12,$17,$10,$12,$20,$1B,$19,$17,$15,$13,$11
.byte SoundOpStopChannel

SFXMapTrackerPulseData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte SoundOpEC,$04
.byte SoundOpSetDuty2,$40
.byte SoundOpF0,$0E
.byte SoundOpSetDutyAdjust,$00
.byte $8F,$0A,$1A,$10,$20,$14,$24,$82,$3F,$8F,$C4,$13,$19,$23,$29
.byte SoundOpAdjustDuty,$04
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
.byte $04,$02,$90
.byte SoundOpProcessSoundData
.byte $03,$A7
.byte SoundOpProcessSoundData
.byte SoundOpStopChannel
.byte SoundOpEC,$04
.byte SoundOpF0,$04
.byte $8F,$06,$0A,$12,$14,$17,$19,$22,$25,$82,$3F,$8E,$27,$25,$23,$21,$1B,$18
.byte SoundOpStopChannel
.byte SoundOpEC,$08
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF2,$F1
.byte $8F,$4A,$48,$47,$46,$45,$43,$02,$82,$3F,$8F,$46,$47,$49,$0D,$3F,$C2
.byte SoundOpAdjustDuty,$05
.byte $8F,$47,$49,$0D,$3F
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

SFXEncounterPickupData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$01
.byte SoundOpF0,$0C
.byte SoundOpStartLoop+3
.byte $8E,$25,$35,$27,$37,$29,$39,$2B,$3B
.byte SoundOpF1,$00
.byte SoundOpAdjustDuty,$04
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

SFXPauseData:
.byte 4
.byte 1
.addr @Channel1
.byte $FF
@Channel1:
.byte SoundOpEC,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$01
.byte SoundOpF0,$0C
.byte SoundOpStartLoop+3
.byte $8E,$27,$37
.byte SoundOpContinueLoop
.byte SoundOpStopChannel

MusicTitleScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte $FF
@Channel0:
.byte SoundOpEC,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpF2,$C1
.byte SoundOpF0,$F4
.byte SoundOpStartLoop+3
.byte SoundOpSetDutyAdjust,$09
.byte $94,$17,$18
.byte SoundOpSetDutyAdjust,$07
.byte $94,$17,$18
.byte SoundOpSetDutyAdjust,$06
.byte $94,$17,$18
.byte SoundOpSetDutyAdjust,$03
.byte $94,$17,$18
.byte SoundOpSetDutyAdjust,$03
.byte $17,$18,$15,$18,$17,$18,$15,$18
.byte SoundOpContinueLoop
.byte SoundOpStartLoop+7
.byte $94,$17,$18
.byte SoundOpAdjustDuty,$02
.byte SoundOpContinueLoop
.byte SoundOpStartLoop+29
.byte $9A,$3F
.byte SoundOpContinueLoop
.byte SoundOpJump
.addr @Channel0
@Channel1:
.byte SoundOpEC,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$0C
.byte $9A,$3F,$3F,$3F,$3F,$92,$18,$22,$9A,$68,$99,$68,$94,$28,$92,$18,$22,$99,$68,$94,$28,$92,$18,$22,$94,$28,$92,$22,$28,$94,$32,$98,$3F,$DF,$9A,$3F
.byte SoundOpContinueLoop
.byte SoundOpJump
.addr @Channel1

SoundCommonSetup:
.byte SoundOpEC,$04
.byte SoundOpF0,$0C
.byte SoundOpF2,$C1
.byte SoundOpContinueCallLoop
