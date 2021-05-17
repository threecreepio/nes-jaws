SoundInit:
        ; reset sound registers
        lda #$00
        sta APUStatus
        lda #$30
        sta APUSq0Duty
        sta APUSq1Duty
        sta APUNoiseVolume
        lda #$80
        sta APUTrgLinear
        lda #$08
        sta APUSq0Sweep
        sta APUSq1Sweep
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
        sta APUStatus
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
        sta SFXSoundChannel
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
        lda SoundPatternPointers
        sta SoundChannelPatternPtr,x
        lda SoundPatternPointers+1
        sta SoundChannelPatternPtr+1,x
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

SoundUpdate:
        lda #$30
        sta NextSND_Sq0Duty
        sta NextSND_Sq1Duty
        sta NextSND_NoiseVolume
        lda #$80
        sta NextSND_TrgLinear
        ; if music is disabled, only run channel 4
        lda MusicStatus
        bne @RunSFXChannel
@RunChannel0:
        ldx #SoundChannelLen*0
        ; check if the channel is scheduled to run, otherwise skip
        lda SoundChannel0
        bpl @RunChannel1
        ; run channel!
        sta SoundCurrentChannelStatus
        jsr SoundChannel0RunPattern
        ; copy the updated status back to the channel
        lda SoundCurrentChannelStatus
        sta SoundChannel0
@RunChannel1:
        ldx #SoundChannelLen*1
        ; check if the channel is scheduled to run, otherwise skip
        lda SoundChannel1
        bpl @RunChannel2
        ; run channel!
        sta SoundCurrentChannelStatus
        jsr SoundChannel1RunPattern
        ; copy the updated status back to the channel
        lda SoundCurrentChannelStatus
        sta SoundChannel1
@RunChannel2:
        ldx #SoundChannelLen*2
        ; check if the channel is scheduled to run, otherwise skip
        lda SoundChannel2
        bpl @RunChannel3
        ; run channel!
        sta SoundCurrentChannelStatus
        jsr SoundChannel2RunPattern
        ; copy the updated status back to the channel
        lda SoundCurrentChannelStatus
        sta SoundChannel2
@RunChannel3:
        ldx #SoundChannelLen*3
        ; check if the channel is scheduled to run, otherwise skip
        lda SoundChannel3
        bpl @RunSFXChannel
        ; run channel!
        sta SoundCurrentChannelStatus
        jsr SoundChannel3RunPattern
        ; copy the updated status back to the channel
        lda SoundCurrentChannelStatus
        sta SoundChannel3
@RunSFXChannel:
        ; the sfx channel can run on any of the other channels
        ldx #SoundChannelLen*4
        ; check if the channel is scheduled to run, otherwise skip
        lda SoundChannel4
        bpl SoundUpdateAPURegisters
        sta SoundCurrentChannelStatus
        ; check which channel the sound effect is set to run on
        lda SFXSoundChannel
        bne @CheckSFXChannel1
        ; running on channel 0
        jsr SoundChannel0RunPattern
        jmp @SFXChannelComplete
@CheckSFXChannel1:
        cmp #$02
        bcs @CheckSFXChannel2
        ; running on channel 1
        jsr SoundChannel1RunPattern
        jmp @SFXChannelComplete
@CheckSFXChannel2:
        bne @RunSFXChannel3
        ; running on channel 2
        jsr SoundChannel2RunPattern
        jmp @SFXChannelComplete
@RunSFXChannel3:
        ; running on channel 3
        jsr SoundChannel3RunPattern
@SFXChannelComplete:
        ; copy the updated status back to the channel
        lda SoundCurrentChannelStatus
        sta SoundChannel4

; update the apu registers with any pending changes
SoundUpdateAPURegisters:
        ldx #$00
@UpdateNextRegister:
        ; check the offset to the next apu register to check
        lda @ApuRegisterOffsets,x
        tay
        ; compare two registers at a time
        lda NextSND_Start,x
        cmp PrevSND_Start,x
        bne @UpdateAPUValues
        lda NextSND_Start+1,x
        cmp PrevSND_Start+1,x
        beq @ContinueToNextRegisters
        lda NextSND_Start,x
@UpdateAPUValues:
        ; update apu registers and prev-values
        sta PrevSND_Start,x
        sta APUStart,y
        lda NextSND_Start+1,x
        sta PrevSND_Start+1,x
        sta APUStart+1,y
@ContinueToNextRegisters:
        ; advance by two registers for the first 8
        inx
        inx
        cpx #$08
        bcc @UpdateNextRegister
@ContinueCopying:
        ; always update remaining registers
        lda @ApuRegisterOffsets,x
        tay
        lda NextSND_Start,x
        sta APUStart,y
        inx
        cpx #$0C
        bcc @ContinueCopying
        rts
@ApuRegisterOffsets:
        ; update in pairs
        .byte <APUSq0Timer
        .byte <APUSq0Length
        .byte <APUSq1Timer
        .byte <APUSq1Length
        .byte <APUTrgTimer
        .byte <APUTrgLength
        .byte <APUNoisePeriod
        .byte <APUNoiseLength
        ; always update
        .byte <APUSq0Duty
        .byte <APUSq1Duty
        .byte <APUTrgLinear
        .byte <APUNoiseVolume
        .byte <APUStatus

SoundChannel0RunPattern:
        lda #$30
        sta NextSND_Sq0Duty
        dec SoundChannelTimer1,x
        bne @ChannelTimerActive
        ; the timer has expired, process more sound data
        ; start by setting the channel type to square
        lda #SoundTypeSquare
        sta SoundCurrentChannelType
        jsr StartProcessingSoundData
        ; if the channel has activated, set new APU values
        bit SoundCurrentChannelStatus
        bvc @SetNextAPUValues
        rts
@ChannelTimerActive:
        ; exit if the channel is disabled
        bit SoundCurrentChannelStatus
        bvc @ContinueChannel
        rts
@ContinueChannel:
        jsr SoundRunPattern
        lda #%00100000
        bit SoundCurrentChannelStatus
        beq @WasteSomeTime
        jmp @SetNextAPUValues
@WasteSomeTime:
        lsr a
        bit SoundCurrentChannelStatus
        beq @SetNextAPUValues
@SetNextAPUValues:
        ; determine new duty value
        lda SoundChannelDuty,x
        ora SoundChannelDuty2,x
        ora #$30
        sta NextSND_Sq0Duty
        ; determine new timer value
        lda SoundChannelTimer,x
        sta NextSND_Sq0Timer
        ; determine new length value
        lda SoundChannelPeriod,x
        lsr a
        ror NextSND_Sq0Timer
        lsr a
        ror NextSND_Sq0Timer
        lsr a
        ror NextSND_Sq0Timer
        lsr a
        ror NextSND_Sq0Timer
        sta NextSND_Sq0Length
        ; and we are done!
        rts

SoundChannel1RunPattern:
        lda #$30
        sta NextSND_Sq1Duty
        dec SoundChannelTimer1,x
        bne @ChannelTimerActive
        ; the timer has expired, process more sound data
        ; start by setting the channel type to square
        lda #SoundTypeSquare
        sta SoundCurrentChannelType
        jsr StartProcessingSoundData
        ; if the channel has activated, set new APU values
        bit SoundCurrentChannelStatus
        bvc @SetNextAPUValues
        rts
@ChannelTimerActive:
        ; exit if the channel is disabled
        bit SoundCurrentChannelStatus
        bvc @ContinueChannel
        rts
@ContinueChannel:
        jsr SoundRunPattern
        lda #%00100000
        bit SoundCurrentChannelStatus
        beq @WasteSomeTime
        jmp @SetNextAPUValues
@WasteSomeTime:
        lsr a
        bit SoundCurrentChannelStatus
        beq @SetNextAPUValues
@SetNextAPUValues:
        ; determine new duty value
        lda SoundChannelDuty,x
        ora SoundChannelDuty2,x
        ora #$30
        sta NextSND_Sq1Duty
        ; determine new timer value
        lda SoundChannelTimer,x
        sta NextSND_Sq1Timer
        ; determine new length value
        lda SoundChannelPeriod,x
        lsr a
        ror NextSND_Sq1Timer
        lsr a
        ror NextSND_Sq1Timer
        lsr a
        ror NextSND_Sq1Timer
        lsr a
        ror NextSND_Sq1Timer
        sta NextSND_Sq1Length
        ; and we are done!
        rts

SoundChannel2RunPattern:
        lda #$80
        sta NextSND_TrgLinear
        dec SoundChannelTimer1,x
        bne @ChannelTimerActive
        ; the timer has expired, process more sound data
        ; start by setting the channel type to triangle
        lda #SoundTypeTriangle
        sta SoundCurrentChannelType
        jsr StartProcessingSoundData
        ; if the channel has activated, set new APU values
        bit SoundCurrentChannelStatus
        bvc @SetNextAPUValues
        rts
@ChannelTimerActive:
        ; exit if the channel is disabled
        bit SoundCurrentChannelStatus
        bvc @ContinueChannel
        rts
@ContinueChannel:
        jsr SoundRunPattern
        lda #%00100000
        bit SoundCurrentChannelStatus
        beq @WasteSomeTime
        jmp @SetNextAPUValues
@WasteSomeTime:
        lsr a
        bit SoundCurrentChannelStatus
        beq @SetNextAPUValues
@SetNextAPUValues:
        ; determine new duty value
        lda SoundChannelDuty,x
        cmp #$0F
        ; duty value too low
        bcc @Exit
        lda #$FF
        sta NextSND_TrgLinear
        ; determine new timer value
        lda SoundChannelTimer,x
        sta NextSND_TrgTimer
        ; determine new length value
        lda SoundChannelPeriod,x
        lsr a
        ror NextSND_TrgTimer
        lsr a
        ror NextSND_TrgTimer
        lsr a
        ror NextSND_TrgTimer
        lsr a
        ror NextSND_TrgTimer
        sta NextSND_TrgLength
        ; and we are done!
@Exit:
        rts

; ----------------------------------------------------------------------------
SoundChannel3RunPattern:
        lda #$30
        sta NextSND_NoiseVolume
        dec SoundChannelTimer1,x
        bne @ChannelTimerActive
        ; the timer has expired, process more sound data
        ; start by setting the channel type to noise
        lda #SoundTypeNoise
        sta SoundCurrentChannelType
        jsr StartProcessingSoundData
        ; if the channel has activated, set new APU values
        bit SoundCurrentChannelStatus
        bvc @SetNextAPUValues
        rts
@ChannelTimerActive:
        ; exit if the channel is disabled
        bit SoundCurrentChannelStatus
        bvc @ContinueChannel
        rts
@ContinueChannel:
        jsr SoundRunPattern
        lda #%00100000
        bit SoundCurrentChannelStatus
        beq @WasteSomeTime
        jmp @SetNextAPUValues
@WasteSomeTime:
        lsr a
        bit SoundCurrentChannelStatus
        beq @SetNextAPUValues
@SetNextAPUValues:
        ; determine new duty value
        lda SoundChannelDuty,x
        ora #$30
        sta NextSND_NoiseVolume
        ; determine new period value
        lda SoundChannelPeriod,x
        sta NextSND_NoisePeriod
        ; and we are done!
        rts

; ----------------------------------------------------------------------------
SoundRunPattern:
        lda SoundCurrentChannelStatus
        ; flip low bit, take bits 1 and 3
        eor #%00000001
        and #%00000101
        bne @AdvanceChannelPattern
        ; check if bit 2 is set
        lda #%00000010
        bit SoundCurrentChannelStatus
        bne @RunDecayIfNeeded
        dec SoundChannelDecaying,x
        bne @AdvanceChannelPattern
        ; bump status up to 00000100 if channel 0A is 0
        inc SoundCurrentChannelStatus
        inc SoundCurrentChannelStatus
        bne @RunDecay
@RunDecayIfNeeded:
        lda SoundChannelDecaying,x
        beq SharedRTS2
        dec SoundChannelDecaying,x
        bne SharedRTS2
@RunDecay:
        lda SoundChannelDecayRate,x
        and #%00111111
        ; decay by 1 incase of bad decay rate
        cmp #($30-1)
        bcc @RunDecayBy1
        ; otherwise subtract decay rate by $30 and use that as decay rate.
        ldy #$01
        sbc #$30
        ; decay soundchannelduty
        eor #$FF
        clc 
        adc SoundChannelDuty
        bcs @DoneDecay
        ; if we've underflowed, clear decay and set duty to 0
        dey 
        lda #$00
@DoneDecay:
        ; store new values and finish up
        sta SoundChannelDuty,x
        tya 
        sta SoundChannelDecaying,x
        rts
@RunDecayBy1:
        dec SoundChannelDuty,x
        bpl @DoneDecayBy1
        ; if we've underflowed, clear duty
        lda #$00
        sta SoundChannelDuty,x
@DoneDecayBy1:
        sta SoundChannelDecaying,x
        rts

; ----------------------------------------------------------------------------
@AdvanceChannelPattern:
        ; check so the timer has expired
        lda SoundChannelPatternTimer,x
        beq SharedRTS2
        dec SoundChannelPatternTimer,x
        bne SharedRTS2
        ; if is has we continue the pattern!

ProcessSoundPatternData:
        @TempPatternPtr = $F6
        ; load next value
        lda SoundChannelPatternPtr,x
        sta @TempPatternPtr
        lda SoundChannelPatternPtr+1,x
        sta @TempPatternPtr+1
        lda SoundChannelPatternOffset,x
        tay
        lda (@TempPatternPtr),y
        iny
        pha
        ; increment the current offset value and restore loaded value
        tya
        sta SoundChannelPatternOffset,x
        pla
        tay
        ; use low bits as duty value, subtracting the current duty adjust
        and #%00001111
        sec
        sbc SoundChannelDutyAdjust,x
        ; if we're unflowed, set default value
        bcs @UnderflowChecked
        lda #$00
@UnderflowChecked:
        ; update duty value
        sta SoundChannelDuty,x
        ; and the high bits are a timer
        tya 
        lsr a
        lsr a
        lsr a
        lsr a
        sta SoundChannelPatternTimer,x
SharedRTS2:
        rts

; ----------------------------------------------------------------------------
StartProcessingSoundData:
        ; set sound data pointer to begin at
        lda SoundChannelDataPtr,x
        sta SoundDataPtr
        lda SoundChannelDataPtr+1,x
        sta SoundDataPtr+1
        lda SoundChannelTimer2,x
        sta SoundChannelTimer1,x
        ; update channel status
        lda SoundCurrentChannelStatus
        tay
        and #%10110011
        sta SoundCurrentChannelStatus
        tya
        and #%00000100
        asl a
        ora SoundCurrentChannelStatus
        sta SoundCurrentChannelStatus
ProcessSoundData:
        ; read the next byte of sound data for the channel
        jsr ReadSoundData
        ; if value is lower than 80, run sound instructions
        cmp #$80
        bcc @RunSoundInstruction
        ; if value is between C0 and FF, it's a loop or a sound operation
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
        ; if above E0, we're either doing a call loop or running a sound operation
        cmp #$E0
        bcs @RunSoundOpOrLoop2
        ; we are between C0 and DF, this means we're starting an inline loop
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
        pla ; pointless...
        sta SoundDataPtr
        ; and finally continue reading sound data
        jmp ProcessSoundData
@RunSoundOp:
        ; the value was EC, running a sound operation
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
@RunSoundInstruction:
        @TempF4 = $F4
        @TempF5 = $F5
        @TempF6 = $F6
        @TempF7 = $F7
        tay
        ; if $40 bit is set in the instruction, set $04 bit of the channel status
        and #%01000000
        beq @Checked40Bit
        lda SoundCurrentChannelStatus
        ora #%00000100
        sta SoundCurrentChannelStatus
@Checked40Bit:
        tya
        ; if the low 6 bits are all set, set $40 bit of the channel status and end processing
        and #%00111111
        cmp #%00111111
        bne @CheckedLowBits
        lda SoundCurrentChannelStatus
        ora #%01000000
        sta SoundCurrentChannelStatus
        jmp @ChannelDone
@CheckedLowBits:
        ; branch off if we're in a square or triangle channel
        lda SoundCurrentChannelType
        cmp #SoundTypeNoise
        bne @InSquareOrTriangleChannel
        ; otherwise set the current instruction value into temp storage and continue
        sty @TempF7
        lda #$00
        sta @TempF6
        jmp @CopyInstructionData
@InSquareOrTriangleChannel:
        ; not quite sure what the idea is behind this
        tya
        and #%00110000
        lsr a
        sta @TempF4
        lsr a
        adc @TempF4
        sta @TempF4
        tya
        and #%00001111
        adc @TempF4
        adc SoundChannel_16,x
        ; get A/$C
        ldy #$00
@CheckOverflow:
        cmp #$C
        bcc @DetermineOverflowSteps
        sbc #$C
        iny
        bne @CheckOverflow
@DetermineOverflowSteps:
        sty @TempF4
        asl a
        tay
        lda SoundTimerAndPeriodValues,y
        sta @TempF6
        lda SoundTimerAndPeriodValues+1,y
        sta @TempF7
        lda @TempF4
        sta SoundChannel_17,x
        beq @CopyInstructionData
        tay
@KeepShifting:
        lsr @TempF7
        ror @TempF6
        dey
        bne @KeepShifting
@CopyInstructionData:
        ; store away the values into sound channel, never to be used again
        lda @TempF6
        sta SoundChannel_10,x
        lda @TempF7
        sta SoundChannel_11,x
        ; appears to always be true..
        lda #%00100000
        bit SoundCurrentChannelStatus
        beq @AvoidUnusedCode1
        ; so this never actually runs in game
        lda #$00
        sta @TempF4
        lda @TempF6
        sec
        sbc SoundChannelTimer,x
        tay
        lda @TempF7
        sbc SoundChannelPeriod,x
        bcs @Unused1
        inc @TempF4
        eor #%11111111
        pha
        tya
        eor #%11111111
        adc #$01
        tay
        pla
        adc #$00
@Unused1:
        sty @TempF6
        sta @TempF7
        lda SoundChannel_15,x
        sta SoundChannel_14,x
        sta @TempF5
        lda #$00
        ldy #$10
@Unused2:
        asl @TempF6
        rol @TempF7
        rol a
        cmp @TempF5
        bcc @Unused3
        sbc @TempF5
        inc @TempF6
@Unused3:
        dey
        bne @Unused2
        ldy @TempF6
        lda @TempF7
        dec @TempF4
        bne @Unused4
        eor #%11111111
        pha
        tya
        eor #%11111111
        clc
        adc #$01
        tay
        pla
        adc #$00
@Unused4:
        sta SoundChannel_13,x
        tya
        sta SoundChannel_12,x
        jmp @AvoidUnusedCode2
        ; end of code that never runs!
@AvoidUnusedCode1:
        lda @TempF6
        sta SoundChannelTimer,x
        lda @TempF7
        sta SoundChannelPeriod,x
        ; appears to always be true..
        lda #%00010000
        bit SoundCurrentChannelStatus
        beq @AvoidUnusedCode2
        ; this code.. also never runs.
        lda SoundChannel_12,x
        sta @TempF4
        lda SoundChannel_13,x
        sta @TempF4+1
        ldy #$00
        lda (@TempF4),y
        sta SoundChannel_14,x
        lda #$01
        sta SoundChannel_15,x
        ; end of more code that never runs!
@AvoidUnusedCode2:
        ; check for bit 4, otherwise exit
        lda #%00001000
        bit SoundCurrentChannelStatus
        bne @ChannelDone
        ; clear bit 2
        lda SoundCurrentChannelStatus
        and #%11111101
        sta SoundCurrentChannelStatus
        ; reset pattern offset
        lda #$00
        sta SoundChannelPatternOffset,x
        jsr ProcessSoundPatternData
        lda SoundCurrentChannelStatus
        ; flip low bit, take bits 1 and 3
        eor #%00000001
        and #%00000101
        ; if bit 0 was unset, or bit 3 was set, we finish
        bne @ChannelDone
        ; otherwise we need to figure out a new decay value
        lda SoundChannelTimer1,x
        lsr a
        sta @TempF4
        lda SoundChannelDecayRate,x
        asl a
        bcs @Carry1
        asl a
        bcs @Carry2
        lda @TempF4
        lsr a
        clc 
        adc @TempF4
        sta @TempF4
        jmp @Carry2
@Carry1:
        lsr @TempF4
        asl a
        bcc @Carry2
        lsr @TempF4
@Carry2:
        sec
        lda @TempF4
        bne @SetDecayingValue
        clc
@SetDecayingValue:
        lda SoundChannelTimer1,x
        sbc @TempF4
        sta SoundChannelDecaying,x
@ChannelDone:
        ; copy the new data pointer back to the channel
        lda SoundDataPtr
        sta SoundChannelDataPtr,x
        lda SoundDataPtr+1
        sta SoundChannelDataPtr+1,x
        rts

SoundOpStartLoop = $C0
SoundOpCallLoop = $E0
SoundOpSetPattern = $EC
SoundOpSetDuty2 = $ED
SoundOpSetDutyAdjust = $EE
SoundOpAdjustDuty = $EF
SoundOpF0 = $F0
SoundOpF1 = $F1
SoundOpSetDecayRate = $F2
SoundOpClearDecayFlag = $F3
SoundOpProcessSoundData = $F4
SoundOpJump = $F8
SoundOpContinueLoop = $F9
SoundOpContinueCallLoop = $FA
SoundOpStopChannel = $FF

SoundOps:
.addr SoundOpSetPatternHandler ; takes 1 arg, setspattern 
.addr SoundOpSetDuty2Handler ; takes 1 arg
.addr SoundOpSetDutyAdjustHandler ; takes 1 arg
.addr SoundOpAdjustDutyHandler ; takes 1 arg
.addr SoundOpF0Handler ; takes 1 arg
.addr SoundOpF1Handler ; takes 1 arg
.addr SoundOpSetDecayRateHandler ; takes 1 arg
.addr SoundOpClearDecayFlagHandler ; takes 0 args
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

SoundOpSetPatternHandler:
        jsr ReadSoundData
        asl a
        tay
        lda SoundPatternPointers,y
        sta SoundChannelPatternPtr,x
        lda SoundPatternPointers+1,y
        sta SoundChannelPatternPtr+1,x
        jmp ProcessSoundData

SoundOpSetDuty2Handler:
        jsr ReadSoundData
        sta SoundChannelDuty2,x
        jmp ProcessSoundData

SoundOpSetDutyAdjustHandler:
        jsr ReadSoundData
        sta SoundChannelDutyAdjust,x
        jmp ProcessSoundData

SoundOpAdjustDutyHandler:
        jsr ReadSoundData
        clc
        adc SoundChannelDutyAdjust,x
        sta SoundChannelDutyAdjust,x
        jmp ProcessSoundData

SoundOpF0Handler:
        jsr ReadSoundData
        sta SoundChannel_16,x
        jmp ProcessSoundData

SoundOpF1Handler:
        jsr ReadSoundData
        clc
        adc SoundChannel_16,x
        sta SoundChannel_16,x
        jmp ProcessSoundData

SoundOpSetDecayRateHandler:
        jsr ReadSoundData
        sta SoundChannelDecayRate,x
        lda SoundCurrentChannelStatus
        ora #%00000001
        sta SoundCurrentChannelStatus
        jmp ProcessSoundData

SoundOpClearDecayFlagHandler:
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

; decrements the loop counter, and returns to loop point unless finished
SoundOpContinueCallLoopHandler:
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

SoundTimerAndPeriodValues:
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

SoundPatternPointers:
        .addr SoundPattern0Data
        .addr SoundPattern1Data
        .addr SoundPattern2Data
        .addr SoundPattern3Data
        .addr SoundPattern4Data
        .addr SoundPattern5Data
        .addr SoundPattern6Data
        .addr SoundPattern7Data
        .addr SoundPattern8Data
        .addr SoundPattern9Data

SoundPattern0Data:
        .byte $13,$17,$1B,$7F,$3E,$3D,$3C,$3B,$3A,$39,$38,$37,$46,$45,$54,$53,$52,$51,$00
        
SoundPattern1Data:
        .byte $18,$0F

SoundPattern2Data:
        .byte $18,$2F,$1B,$17,$13,$00
        
SoundPattern3Data:
        .byte $1C,$1D,$1E,$FF,$8E,$8D,$7C,$7B,$8A,$89,$88,$87,$86,$85,$04
        
SoundPattern4Data:
        .byte $0F

SoundPattern5Data:
        .byte $7F,$4E,$4D,$4C,$8B,$8A,$C9,$C8,$C7,$C6,$05
        
SoundPattern6Data:
        .byte $8F,$4E,$3D,$2C,$1B,$1A,$19,$18,$17,$16,$15,$14,$03
        
SoundPattern7Data:
        .byte $FA,$4B,$4C,$3D,$3E,$FF,$FE,$8D,$8C,$8B,$0A

SoundPattern8Data:
        .byte $2F,$2E,$3D,$4C,$4B,$8A,$F9,$F8,$F7,$06
        
SoundPattern9Data:
        .byte $1F,$1D,$1B,$1A,$1C,$1A,$18,$00,$1A,$17,$14,$18,$14,$16,$04

SoundTimingValues:
        .byte $04,$06,$08,$0C,$10,$18
        .byte $20,$30,$40,$60,$80,$0A
        .byte $14,$03,$02,$01,$03,$04
        .byte $06,$09,$0C,$12,$18,$24
        .byte $30,$48,$60,$08,$09,$03
        .byte $02,$01,$9A,$E9

MusicMapScreenData:
.byte 0
.addr @Channel0
.byte 1
.addr @Channel1
.byte 2
.addr @Channel2
.byte $FF
@Channel0:
.byte SoundOpSetPattern,$08
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$0D
.byte SoundOpF0,$00
.byte SoundOpSetDecayRate,$C2
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
.byte SoundOpSetPattern,$04
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$09
.byte SoundOpSetDecayRate,$CA
.byte SoundOpStartLoop+1
.byte $84,$16,$15,$14,$58,$88,$18,$17,$16
.byte SoundOpContinueLoop
.byte SoundOpSetPattern,$05
.byte SoundOpSetDecayRate,$48
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$09
.byte SoundOpSetDecayRate,$CA
.byte SoundOpStartLoop+1
.byte $87,$1A,$84,$61,$88,$61,$8A,$21
.byte SoundOpContinueLoop
.byte SoundOpSetPattern,$05
.byte SoundOpSetDecayRate,$48
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
.byte SoundOpSetDecayRate,$81
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
.byte SoundOpSetPattern,$06
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C3
.byte $94,$12,$22,$15,$25,$96,$17,$94,$19,$62,$22,$32,$25,$35,$96,$27,$94,$29,$3F,$92,$32,$30,$3F,$27,$25,$3F,$27,$25,$27,$25,$94,$24,$20,$20,$22
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpSetPattern,$06
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C3
.byte $94,$09,$19,$12,$22,$96,$14,$94,$15,$19,$19,$29,$22,$32,$96,$24,$94,$25,$3F,$92,$2B,$29,$3F,$24,$22,$3F,$22,$22,$22,$22,$94,$20,$17,$17,$19
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $94,$12,$12,$22,$12,$96,$20,$94,$19,$57,$17,$96,$15,$14,$94,$15,$96,$10,$92,$12,$12,$96,$3F,$92,$12,$12,$96,$3F,$94,$10,$92,$10,$3F
.byte SoundOpClearDecayFlag
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
.byte SoundOpSetPattern,$04
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
.byte SoundOpSetPattern,$05
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpSetDecayRate,$F2
.byte $94,$25,$24,$23,$22,$20,$1B,$20,$22,$25,$24,$27,$26,$29,$28,$29,$2B,$98,$30
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpSetDecayRate,$F2
.byte $94,$20,$20,$1A,$1A,$17,$17,$17,$1B,$20,$20,$22,$22,$24,$24,$25,$27,$98,$27
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpCallLoop
.addr SoundCommonSetup
.byte $94,$10,$17,$0A,$15,$07,$12,$07,$07,$10,$17,$12,$19,$14,$1B,$15,$17
.byte SoundOpClearDecayFlag
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
.byte SoundOpSetPattern,$04
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
.byte SoundOpSetPattern,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C1
.byte $94,$19,$1B,$19,$15,$19,$1B,$20,$22,$20,$1B,$3F,$20
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpSetPattern,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C1
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$05
.byte SoundOpSetDuty2,$C0
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C1
.byte SoundOpSetDutyAdjust,$03
.byte SoundOpStartLoop+1
.byte $84,$17,$9B,$19,$84,$3F,$9B,$19,$84,$3F,$9B,$19,$96,$22
.byte SoundOpContinueLoop
.byte $98,$20,$22,$84,$29,$9B,$27,$96,$29
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpSetPattern,$05
.byte SoundOpSetDuty2,$C0
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C1
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$08
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C2
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
.byte SoundOpSetPattern,$08
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C2
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
.byte SoundOpSetPattern,$04
.byte SoundOpF0,$18
.byte SoundOpSetDecayRate,$C1
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C2
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
.byte SoundOpSetPattern,$08
.byte $84,$12,$22,$12,$20,$12,$1B,$12,$19
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDecayRate,$B5
.byte $82,$20,$20,$27,$27,$30,$30,$37,$37,$30,$32,$30,$32,$30,$32,$30,$32,$1B,$1B,$27,$27,$2B,$2B,$37,$37,$2B,$30,$2B,$30,$2B,$30,$2B,$30,$19,$19,$26,$26,$32,$32,$36,$36,$30,$32,$30,$32,$30,$32,$30,$32
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDecayRate,$C1
.byte SoundOpSetPattern,$07
.byte $84,$27,$26,$24,$87,$30,$86,$2B,$82,$19,$1B,$20,$22,$24,$84,$26
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDecayRate,$B5
.byte $82,$27,$36,$37,$36,$34,$32,$37,$36,$37
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDecayRate,$C1
.byte $86,$30,$84,$2B,$27
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDecayRate,$B5
.byte $82,$36,$37,$36,$37,$36,$37,$36,$37,$84,$20,$24,$82,$34,$34,$37,$37,$34,$34,$37,$37,$84,$34,$37
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDecayRate,$C1
.byte $88,$6B,$84,$2B,$24,$86,$26
.byte SoundOpF0,$0C
.byte SoundOpSetDuty2,$80
.byte SoundOpSetPattern,$09
.byte SoundOpStartLoop+5
.byte $82,$32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24,$29,$27,$24,$22
.byte SoundOpContinueLoop
.byte SoundOpSetPattern,$08
.byte SoundOpSetDuty2,$80
.byte $86,$19,$84,$17,$87,$16,$82,$16,$85,$17,$88,$19,$84,$3F,$82,$0B,$10,$12,$14,$84,$16
.byte SoundOpSetPattern,$09
.byte SoundOpSetDuty2,$80
.byte SoundOpStartLoop+2
.byte $82,$32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24,$29,$27,$24,$22
.byte SoundOpContinueLoop
.byte $32,$30,$2B,$29,$30,$2B,$29,$27,$2B,$29,$27,$24
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$00
.byte $86,$19,$89,$14,$86,$1B,$89,$17,$84,$20,$1B,$86,$24,$84,$20,$1B,$86,$24,$60,$20,$24,$84,$24,$87,$24,$8A,$62,$86,$22,$84,$10,$82,$10,$10,$84,$12
.byte SoundOpStopChannel
@Channel1LoopData:
.byte SoundOpSetPattern,$09
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$00
.byte SoundOpClearDecayFlag
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$03
.byte SoundOpF0,$0C
.byte SoundOpCallLoop
.addr @Channel0Loop
.byte $9A,$16
.byte SoundOpCallLoop
.addr @Channel0Loop
.byte $99,$16,$94,$15,$14
.byte SoundOpSetPattern,$05
.byte SoundOpSetDecayRate,$B5
.byte SoundOpSetDuty2,$90
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpStartLoop+1
.byte $92,$18,$18,$18,$18,$18,$3F,$18,$18,$18,$18,$18,$3F,$96,$22
.byte SoundOpContinueLoop
.byte SoundOpClearDecayFlag
.byte $96,$26,$25,$24,$23,$23,$22,$21,$20
.byte SoundOpJump
.addr @Channel0
@Channel0Loop:
.byte $92,$48,$12,$98,$58,$94,$18,$17,$92,$18,$17
.byte SoundOpContinueCallLoop
@Channel1:
.byte SoundOpSetPattern,$05
.byte SoundOpSetDecayRate,$35
.byte SoundOpSetDuty2,$90
.byte SoundOpSetDutyAdjust,$07
.byte SoundOpF0,$18
.byte SoundOpStartLoop+3
.byte $94,$23,$33,$3F,$23,$33,$3F,$23,$33
.byte SoundOpContinueLoop
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$B5
.byte SoundOpSetPattern,$05
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpStartLoop+1
.byte $92,$17,$17,$17,$17,$17,$3F,$17,$17,$17,$17,$17,$3F,$96,$21
.byte SoundOpContinueLoop
.byte SoundOpClearDecayFlag
.byte $96,$22,$21,$20,$1B,$19,$19,$19,$19
.byte SoundOpJump
.addr @Channel1
@Channel2:
.byte SoundOpSetPattern,$04
.byte SoundOpSetDecayRate,$91
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
.byte SoundOpSetPattern,$01
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpSetDecayRate,$44
.byte $80,$04
.byte SoundOpProcessSoundData
.byte $18,$85,$0F
.byte SoundOpStopChannel

SFXUnusedData:
.byte 3
.addr @Channel3
.byte $FF
@Channel3:
.byte SoundOpSetPattern,$07
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
.byte SoundOpSetPattern,$06
.byte SoundOpSetDuty2,$40
.byte SoundOpSetDutyAdjust,$04
.byte SoundOpF0,$1C
.byte $8F,$1A,$2A,$3A,$C2,$69,$59
.byte SoundOpF1,$F5
.byte SoundOpContinueLoop
.byte $29
.byte SoundOpStopChannel
@Channel3:
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$04
.byte SoundOpClearDecayFlag
.byte $8F,$C2,$78,$70,$68,$60,$58,$50,$08
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF1,$07
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
@Channel3:
.byte SoundOpSetPattern,$06
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
.byte SoundOpClearDecayFlag
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
.byte SoundOpSetPattern,$00
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
.byte SoundOpSetPattern,$01
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$F7
.byte SoundOpSetDecayRate,$01
.byte $81,$24,$23,$22,$21,$81,$13,$14,$13,$14,$13,$14
.byte SoundOpStopChannel
@Channel1:
.byte SoundOpSetPattern,$01
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$F7
.byte SoundOpSetDecayRate,$01
@Channel2Continue:
.byte $81,$1B,$1A,$19,$18,$81,$08,$09,$08,$09,$08,$09
.byte SoundOpStopChannel
@Channel2:
.byte SoundOpSetPattern,$01
.byte SoundOpF0,$F7
.byte SoundOpSetDecayRate,$01
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
.byte SoundOpSetPattern,$06
.byte SoundOpSetDuty2,$80
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpSetDecayRate,$C2
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$06
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpF0,$00
.byte SoundOpClearDecayFlag
.byte $8F,$C5,$20,$21
.byte SoundOpSetDutyAdjust,$01
.byte SoundOpF0,$FF
.byte SoundOpContinueLoop
.byte SoundOpStopChannel
SFXEncounterBoatDespawnChannel3:
SFXFinaleHitChannel3:
.byte SoundOpSetPattern,$06
.byte SoundOpSetDutyAdjust,$00
.byte SoundOpClearDecayFlag
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$04
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
.byte SoundOpSetPattern,$04
.byte SoundOpF0,$04
.byte $8F,$06,$0A,$12,$14,$17,$19,$22,$25,$82,$3F,$8E,$27,$25,$23,$21,$1B,$18
.byte SoundOpStopChannel
.byte SoundOpSetPattern,$08
.byte SoundOpSetDutyAdjust,$05
.byte SoundOpSetDecayRate,$F1
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$06
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
.byte SoundOpSetPattern,$05
.byte SoundOpSetDuty2,$00
.byte SoundOpSetDecayRate,$C1
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
.byte SoundOpSetPattern,$07
.byte SoundOpSetDuty2,$C0
.byte SoundOpSetDutyAdjust,$02
.byte SoundOpF0,$0C
.byte $9A,$3F,$3F,$3F,$3F,$92,$18,$22,$9A,$68,$99,$68,$94,$28,$92,$18,$22,$99,$68,$94,$28,$92,$18,$22,$94,$28,$92,$22,$28,$94,$32,$98,$3F,$DF,$9A,$3F
.byte SoundOpContinueLoop
.byte SoundOpJump
.addr @Channel1

SoundCommonSetup:
.byte SoundOpSetPattern,$04
.byte SoundOpF0,$0C
.byte SoundOpSetDecayRate,$C1
.byte SoundOpContinueCallLoop
