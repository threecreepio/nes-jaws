; da65 V2.16 - Git 6de78c5
; Created:    2020-02-30 20:56:58
; Input file: TMP.prg.bin
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
PPUCTRL               = $2000
PPUMASK               = $2001
PPUSTATUS             = $2002
OAMADDR               = $2003
OAMDATA               = $2004
PPUSCROLL             = $2005
PPUADDR               = $2006
PPUDATA               = $2007

ActiveCHR             = $0307
PPUCTRL_MIRROR        = $030E
PPUMASK_MIRROR        = $030F
SCROLL_X              = $0320
SCROLL_Y              = $0322

SND_SQUARE1_TIMER     = $4000
SND_SQUARE1_LENGTH    = $4001
SND_SQUARE2_TIMER     = $4004
SND_SQUARE2_LENGTH    = $4005
SND_TRIANGLE_TIMER    = $4008
SND_TRIANGLE_LENGTH   = $4009
SND_NOISE_TIMER       = $400C

OAMDMA                = $4014
SND_MASTERCTRL        = $4015

JOYPAD_PORT1          = $4016
JOYPAD_PORT2          = $4017


NextStatusbarToDraw   = $0303
SoundtestEnabled      = $0308
SoundtestSelected     = $00

UseHighPPUNametables  = $0323
RNG0                  = $0324
RNG1                  = $0325
Joy1Inputs            = $0330
Joy1Pressed           = $0332
Joy2Inputs            = $0331
Joy2Pressed           = $0333

; these previous x/y positions are used when jaws or the player is unloaded.
; that way we can restore them to roughly the correct location when needed.
JawsStashedX          = $0348 ; 8 bit approximation of jaws last X coord
JawsStashedY          = $0349 ; 8 bit approximation of jaws last Y coord
PlayerStashedX        = $038C ; 8 bit approximation of jaws last X coord
PlayerStashedY        = $038D ; 8 bit approximation of jaws last Y coord

ShowStatusBarTextLine = $0305
HighScore             = $0350
CurrentScore          = $0380


WaterHeight           = $033C ; 16 bit
; stores how many enounters the player has completed, maxout at $20.
TotalEncountersPlayed = $038E
; how many encounters remain until the next bonus screen
BonusScreenEncounterCountdown  = $038F
; how many bonus screens we have had so far
BonusScreensPlayed      = $038B

; score requirement for the next submarine to appear on the map.
; has top 3 bytes of the score, so 1m / 100k / 10k score levels
ScoreForNextSubmarine = $0394 ; 394-396
MapSubmarineVisible   = $0397
MapSubmarineX         = $034E
MapSubmarineY         = $034F

ActivePalette         = $046F

VRAMBufferActive      = $0100
VRAMBufferOffset      = $0101
VRAMBuffer            = $0102



EntityData            = $0680 ; 680 - 880
PlayerData            = EntityData
PlayerProjectile1Data = EntityData + ( 1 * $20)
PlayerProjectile2Data = EntityData + ( 2 * $20)
PlayerProjectile3Data = EntityData + ( 3 * $20)
JawsData              = EntityData + ( 4 * $20)
Enemy1Data            = JawsData
Enemy2Data            = EntityData + ( 5 * $20)
MaxEnemies            = $05


JawsHP                = $0388 ; 16 bit
JawsMaxHP             = $1400
JawsType              = JawsData + EntityType
JawsX                 = JawsData + EntityX ; 16 bit
JawsY                 = JawsData + EntityY ; 16 bit

CameraX               = $0338 ; 16 bit
CameraY               = $033A ; 16 bit


PlayerType            = PlayerData + EntityType
PlayerX               = PlayerData + EntityX ; 16 bit
PlayerY               = PlayerData + EntityY ; 16 bit

PaletteLoadPending        = $0300
NMISpriteHandlingDisabled = $0302

EncounterJawsActive       = $034B
EncounterType         = $038A ; 0=normal, 1=jaws, 2=bonus stage, 3=?

TrackerTimer          = $0345
TrackerAnimationIndex = $0342
TrackerAnimationTimer = $0343
TrackerDistancePrev   = $0344
TrackerDistanceNext   = $0346

PlayerNumberOfLives   = $0387
PlayerHasTracker      = $0341
PlayerFlag34D    = $034D
PlayerShellCount      = $0390
PlayerPowerLevel      = $0391
PlayerCrabLevel       = $0392
PlayerStrobeCount     = $0393

BGDataPage1           = $0400
BGDataPage2           = $0430
BGDataPage3           = $0460
BGDataDrawOffset      = $046D

StatusbarPPULocation= $48 ; 16 bit

SpritePosY            = $0200
SpriteTile            = $0201
SpriteAttr            = $0202
SpritePosX            = $0203
SPR                   = 4

SoundIsPlaying        = $055D
PPUADDRStatusbarText  = $2B20

; $20 bytes of working data
WorksetPtr            = $40
Workset               = $20

EntityActive          = $00
EntityType            = $01
EntityX               = $02 ; 16 bit
EntityY               = $04 ; 16 bit
EntitySpritesetPtr    = $06 ; 16 bit
EntityAnimPtr         = $08 ; 16 bit
EntityAnimOffset      = $0A
EntityAnimTimer       = $0B
EntitySpritesetDataPtr= $0E ; 16 bit
EntityXSpeed          = $11
EntityYSpeed          = $13
EntityV10             = $10
EntityV11             = $11
EntityV12             = $12
EntityV13             = $13
EntityV14             = $14
EntityV15             = $15
EntityV16             = $16
EntityV17             = $17
EntityV18             = $18
EntityV19             = $19
EntityV1A             = $1A
EntityV1C             = $1C
EntityV1D             = $1D
EntityV1E             = $1E
EntityV1F             = $1F

; ---

JOY_A                 = %00000001
JOY_B                 = %00000010
JOY_SELECT            = %00000100
JOY_START             = %00001000
JOY_UP                = %00010000
JOY_DOWN              = %00100000
JOY_LEFT              = %01000000
JOY_RIGHT             = %10000000

; ----------------------------------------------------------------------------

.org $8000
.segment        "PRG": absolute

; LJN copyright notice at the top of the ROM. Why not.
.byte "(c)1987 LJN TOYS,INC.",$0D,$0A
.byte "TM&(c)1987 UNIVERSAL CITY STUDIOS,INC. ALL RIGHTS RESERVED.",$0D,$0A
.byte "LICENSED BY MERCHANDISING CORPORATION OF AMERICA,INC.",$0D,$0A
.byte "LICENSED BY NINTENDO OF AMERICA,INC.",$0D,$0A


CHRTitleAndBlackScreen       = 0
CHRMapScreen                 = 1
CHREncounterAndIntroScreen   = 2
CHRFinaleAndOutroScreen      = 3

CHRBANKS:
.byte $00,$01,$02,$03

; unknown
.byte $FF,$FF,$FF,$FF
.byte $E0,$00,$00,$00,$A0,$55,$AA,$00
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.byte $00,$00,$00,$12,$A9,$54,$80,$00
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.byte $00,$00,$00,$A0,$4A,$15,$02,$00
.byte $C0,$FF,$FF,$FF,$FF,$FF,$F8,$FF
.byte $3F,$00,$00,$10,$2A,$55,$AF,$00
.byte $00,$F0,$FE,$FF,$FC,$C0,$00,$FF
.byte $FF,$0F,$01,$40,$AB,$7F,$FF

; ----------------------------------------------------------------------------
VBOOT:
        sei
        cld
        ldx #$FF
        txs
        lda #$00
        sta PaletteLoadPending
        lda #%00010000                      ; clear ppuctrl, set background pattern table to $1000
        sta PPUCTRL                         ; update ppuctrl
:       lda PPUSTATUS                       ; delay for 2 frames to let ppu get ready
        bpl :-
:       lda PPUSTATUS
        bpl :-
        ; Clear ZP
        lda #$00
        tax
@ClearMemoryZP:
        sta $00,x
        inx
        bne @ClearMemoryZP
        ; Clear memory
        ldx #$06
        lda #$01
        sta $01
        lda #$00
        tay
@ClearMemory:
        sta ($00),y
        iny
        bne @ClearMemory
        inc $01
        dex
        bne @ClearMemory
        ; initialize high score to 10000
        lda #$01
        sta HighScore + 2
        ; check joypad 2 to enable soundtest
        jsr ReadJoypads
        lda Joy2Inputs
        cmp #(JOY_LEFT | JOY_UP | JOY_B)
        bne GameStartup
        lda #$80
        sta SoundtestEnabled
GameStartup:
        ; clear stack
        ldx #$FF
        txs
        jsr SoundInit
        lda #SFXSTOP
        jsr SoundPlay
        lda #%00010000                         ; set bg pattern to $1000
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        lda #$00                               ;  clear ppu mask mirror
        sta PPUMASK_MIRROR
        jsr RunTitleScreen
        jmp InitializeGame

; ----------------------------------------------------------------------------
RunTitleScreen:
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        jsr ClearScreenAndSprites
        lda #CHRTitleAndBlackScreen
        sta ActiveCHR
        ; uses the same number for CHR and Palette, both 0
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #RomGraphicsTitleScreen
        jsr DrawRomGraphics
        lda #$00
        sta SCROLL_X
        sta CameraX
        sta CameraX+1
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta CameraY
        sta CameraY+1
        jsr ClearEntityMemory
        jsr LoadPlayerWorkset
        lda #$C0
        sta Workset + EntityActive
        lda #AnimationTitleJaws
        jsr WorksetAnimationPlay
        ; place background entity
        lda #$48
        sta Workset + EntityX
        lda #$37
        sta Workset + EntityY
        jsr WorksetSave
        jsr UpdateEntitySprites
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        lda #MusicTitleScreen
        jsr SoundPlay
        lda #$00
        sta $00
@TitleScreenMainLoop:
        jsr WaitFor1Frame
        lda #$01
        sta NMISpriteHandlingDisabled
        jsr ReadJoypads
        jsr Soundtest
        jsr L8B5F
        lda #(JOY_START)
        bit Joy1Pressed
        ; keep looping until player presses start
        beq @TitleScreenMainLoop
        rts

; ----------------------------------------------------------------------------
Soundtest:
        bit SoundtestEnabled
        bpl @Done
        lda #JOY_B
        bit Joy1Pressed
        beq @CheckRightInput
        lda #SFXSTOP
        jsr SoundPlay
@CheckRightInput:
        ldy SoundtestSelected
        bit Joy1Pressed
        bpl @CheckLeftInput
        iny
@CheckLeftInput:
        bvc @CheckDownInput
        dey
@CheckDownInput:
        lda #JOY_DOWN
        bit Joy1Pressed
        beq @CheckUpInput
        tya
        clc
        adc #$10
        tay
@CheckUpInput:
        lda #JOY_UP
        bit Joy1Pressed
        beq @UpdateSelection
        tya
        sec
        sbc #$10
        tay
@UpdateSelection:
        cpy SoundtestSelected
        beq @CheckAInput
        sty $00
        jsr @SoundtestDrawSelection
@CheckAInput:
        lda #JOY_A
        bit Joy1Pressed
        beq @Done
        lda SoundtestSelected
        jsr SoundPlay
@Done:
        rts

@SoundtestDrawSelection:
        ; clear vram buffer
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; set ppu address to $224F for 1st character
        lda #$22
        sta VRAMBuffer,X
        inx
        lda #$4F
        sta VRAMBuffer,X
        inx
        ; get high nybble of selected sound
        lda SoundtestSelected
        lsr a
        lsr a
        lsr a
        lsr a
        clc
        ; add chr number base
        adc #$30
        ; A-F is stored 6 characters after 9
        cmp #$3A
        bcc @DrawHighNybbleHex
        ; so add 6 onto our value if we're above 9
        adc #$06
@DrawHighNybbleHex:
        sta VRAMBuffer,X
        ; set ppu address to $2250 for 2nd character
        inx
        lda #$22
        sta VRAMBuffer,X
        inx
        lda #$50
        sta VRAMBuffer,X
        inx
        ; get low nybble of selected sound
        lda SoundtestSelected
        and #$0F
        clc
        ; add chr number base
        adc #$30
        ; A-F is stored 6 characters after 9
        ; so add 6 onto our value if we're above 9
        cmp #$3A
        bcc @DrawLowNybbleHex
        adc #$06
@DrawLowNybbleHex:                   
        sta VRAMBuffer,X
        ; update vram position
        inx
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda $0304
        ora #$10
        sta $0304
        rts

; ----------------------------------------------------------------------------
InitializeGame:
        ; clear stack.
        ldx #$FF
        txs
        jsr PPUDisableNMI
        lda #SFXSTOP
        jsr SoundPlay
        jsr PPUDisableRendering
        jsr ClearScreenAndSprites
        ; clear game score
        lda #$00
        tax
@ClearScore:
        sta CurrentScore,x
        inx
        cpx #$80
        bcc @ClearScore
        ; start with 3 lives
        lda #$03
        sta PlayerNumberOfLives
        ; clear out player state
        lda #$00
        sta MapSubmarineVisible
        sta PlayerPowerLevel
        sta PlayerCrabLevel
        sta TotalEncountersPlayed
        sta BonusScreensPlayed
        ; 2 encounters needed until first bonus screen
        lda #$02
        sta BonusScreenEncounterCountdown
        ; set submarine to appear at 30k points
        lda #$00
        sta ScoreForNextSubmarine
        sta ScoreForNextSubmarine+1
        lda #$03
        sta ScoreForNextSubmarine+2
        ; start with 3 strobes
        lda #$03
        sta PlayerStrobeCount
        jsr InitJawsStashedLocation
StartGameAfterDeath:
        lda #$00
        sta PlayerFlag34D
        sta PlayerHasTracker
        sta MapSubmarineVisible
        sta EncounterType
        ; start with 3 strobes
        lda #$03
        sta PlayerStrobeCount
        ; Reset Jaws health to $1400
        lda #<JawsMaxHP
        sta JawsHP
        lda #>JawsMaxHP
        sta JawsHP+1
        ; place player at starting port
        lda #$04
        sta PlayerStashedX
        lda #$04
        sta PlayerStashedY
        ; show the "get ready" screen
        jsr RunIntroScreen

RunMapScreen:
        jsr     PPUDisableNMI
        jsr     PPUDisableRendering
        jsr     PPUClear
        jsr     DrawStatusLine
        bit     PlayerHasTracker
        bmi     @RunMapScreenWithTracker
        jsr     DrawStatusLine_PowerLabel
        jmp     @RunMapScreenContinue
@RunMapScreenWithTracker:
        lda     #$80
        sta     PlayerHasTracker
        sta     TrackerDistancePrev
        sta     TrackerDistanceNext
        lda     #RomGraphicsTrackerIcon
        jsr     DrawRomGraphics
@RunMapScreenContinue:
        jsr     ClearEntityMemory
        lda     #$00
        sta     $0306
        jsr     UnstashPlayerLocation
        jsr     L9746
        lda     #PaletteMapScreen
        jsr     StoreActivePaletteAndWaitFor1Frame
        lda     #CHRMapScreen
        sta     ActiveCHR
        jsr     MapRunCamera
        jsr     LAAB3
        lda     #$01
        sta     NMISpriteHandlingDisabled
        sta     ShowStatusBarTextLine
        jsr     PPUEnableNMI
        jsr     PPUEnableAndWaitFor1Frame
        lda     #MusicMapScreen
        jsr     SoundPlay
        jsr     WaitFor1Frame
MapScreenMainLoop:
        jsr     ReadJoypads
        jsr     MapRunJaws
        jsr     MapRunPlayer
        jsr     MapShowSubmarine
        jsr     MapRunCamera
        jsr     LAA4E
        jsr     UpdateEntitySprites
        lda     #$00
        sta     EncounterJawsActive
        lda     $0306
        lsr     a
        bcc     @CheckEnterPort
        jmp     RunEncounterScreen
@CheckEnterPort:
        lsr     a
        bcc     @CheckEnterEncounter
        jmp     RunPortScreen
@CheckEnterEncounter:
        lsr     a
        bcc     @CheckNeedMoreConchShells
        inc     EncounterJawsActive
        lda     JawsData + EntityActive
        and     #$01
        beq     RunEncounterScreen
        inc     EncounterJawsActive
        jmp     RunEncounterScreen
@CheckNeedMoreConchShells:
        lsr     a
        bcc     @L838A
        jmp     MapShowConchShellsMessage
@L838A:
        lda     #(JOY_START)
        bit     Joy1Pressed
        bne     @PauseGameInMap
        jsr     MapRunJawsTracker
        jsr     L8B5F
        jsr     RefreshPPUState
        jsr     WaitFor1Frame
        jmp     MapScreenMainLoop
@PauseGameInMap:
        lda #$81
        sta ShowStatusBarTextLine         
        lda #$01
        sta NMISpriteHandlingDisabled
        sta $4A
        lda #SFXPause
        jsr SoundPlay
        jsr CopyToVRAMBuffer
        .addr CopyTextPause
@L83B6:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr L8B5F
        jsr ReadJoypads
        lda #$08
        bit Joy1Pressed
        bne @L84D6
        LDY #$02
        jsr WaitForYSpins
        jmp @L83B6
@L84D6:
        lda #$00
        sta $4A
        lda #$01
        sta ShowStatusBarTextLine         
        bit $0308
        bpl @L83E6
        lda Joy2Inputs
        and #(JOY_A | JOY_B)
        bne @L83E9
@L83E6:
        jmp MapScreenMainLoop
@L83E9:
        tax
        dex
        stx $034B
        lda TrackerDistancePrev
        and #$0F
        tax
        dex
        stx TrackerDistancePrev

; ----------------------------------------------------------------------------
RunEncounterScreen:
        lda #MusicStartEncounter
        jsr SoundPlay
        lda EncounterJawsActive
        beq @StartingJawsEncounter
        jsr CopyToVRAMBuffer
        .addr CopyTextYouveHitSomething
        jmp @UpdateStatusbar
@StartingJawsEncounter:
        jsr CopyToVRAMBuffer
        .addr CopyTextYouveHitJaws
@UpdateStatusbar:
        lda     #$81
        sta     ShowStatusBarTextLine
        lda     #$01
        sta     NMISpriteHandlingDisabled
@DelayUntilSoundStops:
        jsr     RefreshPPUState
        jsr     WaitFor1Frame
        jsr     L8B5F
        ldy     #$02
        jsr     WaitForYSpins
        lda     $0574
        bmi     @DelayUntilSoundStops
        ; run encounter
        lda     #$01
        sta     ShowStatusBarTextLine
        jsr     PPUDisableNMI
        lda     #SFXSTOP
        jsr     SoundPlay
        jsr     PPUDisableRendering
        jsr     StashPlayerLocation
        jsr     StashJawsLocation
        jsr     ClearEntityMemory
        lda     #$00
        sta     $0306
        jsr     EncounterLoadSettings
        lda     #$00
        sta     SCROLL_X
        lda     #$00
        sta     CameraX
        lda     #$10
        sta     CameraX+1
        jsr     LA749
        jsr     L96F1
        jsr     PPUEnableNMI
        jsr     PPUEnableAndWaitFor1Frame
        ldx     EncounterType
        lda     EncounterTypeMusic,x
        jsr     SoundPlay
        lda     #$00
        sta     $0301
@L8476:
        jsr     ReadJoypads
        jsr     EncounterRunPlayer
        jsr     EncounterRunProjectiles
        jsr     EncounterRunJaws
        jsr     LA136
        jsr     L96F1
        jsr     UpdateEntitySprites
        lda     $0306
        and     #$E0
        bne     L850A
        lda     #(JOY_START)
        bit     Joy1Pressed
        bne     @PauseGameInEncounter
        jsr     RefreshPPUState
        jsr     LA9B6
        jsr     L8B5F
        jmp     @L8476
@PauseGameInEncounter:                   
        lda #$81
        sta ShowStatusBarTextLine
        lda #$01
        sta NMISpriteHandlingDisabled
        sta $4A
        lda #SFXPause
        jsr SoundPlay
        jsr CopyToVRAMBuffer
        .addr CopyTextPause
@L84BB:                   
        jsr RefreshPPUState
        jsr L8B5F
        jsr WaitFor1Frame
        jsr ReadJoypads
        lda #$08
        bit Joy1Pressed
        bne @L84D6
        ldy #$02
        jsr WaitForYSpins
        jmp @L84BB
@L84D6:                   
        lda #$00
        sta $4A
        lda #$01
        sta ShowStatusBarTextLine
        bit $0308
        bpl @L8476
        lda Joy2Inputs
        and #(JOY_A | JOY_B)
        beq @L8476
        tax
        dex
        bne @Continue
        lda #$40
        sta $0306
        jmp @L8476
@Continue:
        dex
        bne @Done
        lda #$20
        sta $0306
        jmp @L8476
@Done:
        lda #$09
        sta PlayerNumberOfLives
        jmp @L8476


; ----------------------------------------------------------------------------
L850A:
        lda     #$20                            ; 850A A9 20                    . 
        bit     $0306                           ; 850C 2C 06 03                 ,..
        beq     L8514                           ; 850F F0 03                    ..
        jmp     L85C4                           ; 8511 4C C4 85                 L..

; ----------------------------------------------------------------------------
L8514:
        bmi     L8553                           ; 8514 30 3D                    0=
        inc     TotalEncountersPlayed                           ; 8516 EE 8E 03                 ...
        lda     TotalEncountersPlayed                           ; 8519 AD 8E 03                 ...
        cmp     #$20                            ; 851C C9 20                    . 
        bcc     L8525                           ; 851E 90 05                    ..
        lda     #$18
        sta     TotalEncountersPlayed
; ----------------------------------------------------------------------------
L8525:
        dec     BonusScreenEncounterCountdown                           ; 8525 CE 8F 03                 ...
        bne     L853C                           ; 8528 D0 12                    ..
        jsr     RunBonusScreen                           ; 852A 20 0E CF                  ..
        lda     #$03                            ; 852D A9 03                    ..
        sta     BonusScreenEncounterCountdown                           ; 852F 8D 8F 03                 ...
        ldx     BonusScreensPlayed                           ; 8532 AE 8B 03                 ...
        inx                                     ; 8535 E8                       .
        txa                                     ; 8536 8A                       .
        and     #$07                            ; 8537 29 07                    ).
        sta     BonusScreensPlayed                           ; 8539 8D 8B 03                 ...
L853C:
        lda     JawsHP+1                           ; 853C AD 89 03                 ...
        clc                                     ; 853F 18                       .
        adc     #$04                            ; 8540 69 04                    i.
        cmp     #>JawsMaxHP                            ; 8542 C9 14                    ..
        bcc     L854D                           ; 8544 90 07                    ..
        lda     #<JawsMaxHP                            ; 8546 A9 00                    ..
        sta     JawsHP                           ; 8548 8D 88 03                 ...
        lda     #>JawsMaxHP                            ; 854B A9 14                    ..
L854D:
        sta     JawsHP+1                           ; 854D 8D 89 03                 ...
        jmp     RunMapScreen                           ; 8550 4C ED 82                 L..

; ----------------------------------------------------------------------------
L8553:
        jsr L8605
        dec PlayerNumberOfLives
        beq RunGameOverScreen
        lsr PlayerShellCount
        dec PlayerPowerLevel
        bpl @ReduceCrabLevel
        lda #0
        sta PlayerPowerLevel                    ; minimum power level is 0
@ReduceCrabLevel:
        dec PlayerCrabLevel
        bpl @SwitchToIntroScreen
        lda #0
        sta PlayerCrabLevel                     ; minimum crab level is 0
@SwitchToIntroScreen:
        jmp StartGameAfterDeath


RunGameOverScreen:
        JSR PPUDisableNMI
        LDA #SFXSTOP
        JSR SoundPlay
        JSR PPUDisableRendering
        JSR ClearScreenAndSprites
        LDA #PaletteBlackScreen
        JSR StoreActivePaletteAndWaitFor1Frame
        LDA #$00
        STA SCROLL_X
        STA SCROLL_Y
        STA UseHighPPUNametables
        STA ActiveCHR
        LDA #$01
        STA NMISpriteHandlingDisabled
        STA $0305
        LDA #RomGraphicsGameOverScreen
        JSR DrawRomGraphics
        JSR DrawStatusLine
        JSR PPUEnableNMI
        JSR PPUEnableAndWaitFor1Frame
        LDA #MusicGameOverScreen
        JSR SoundPlay
@Delay:
        JSR WaitFor1Frame
        LDY #$02
        JSR WaitForYSpins
        JSR RefreshPPUState
        BIT $05AC
        BMI @Delay
        JMP GameStartup
; ----------------------------------------------------------------------------
L85C4:
        lda     #$06                            ; 85C4 A9 06                    ..
        sta     $13                             ; 85C6 85 13                    ..
L85C8:
        lda     #>JawsMaxHP                            ; 85C8 A9 14                    ..
        sta     JawsHP+1                           ; 85CA 8D 89 03                 ...
        lda     $0304                           ; 85CD AD 04 03                 ...
        ora     #$40                            ; 85D0 09 40                    .@
        sta     $0304                           ; 85D2 8D 04 03                 ...
        lda     #$10                            ; 85D5 A9 10                    ..
        jsr     WaitForAFramesAndRefreshPPU                           ; 85D7 20 1F D1                  ..
        lda     #$00                            ; 85DA A9 00                    ..
        sta     JawsHP+1                           ; 85DC 8D 89 03                 ...
        lda     $0304                           ; 85DF AD 04 03                 ...
        ora     #$40                            ; 85E2 09 40                    .@
        sta     $0304                           ; 85E4 8D 04 03                 ...
        lda     #$18                            ; 85E7 A9 18                    ..
        jsr     WaitForAFramesAndRefreshPPU                           ; 85E9 20 1F D1                  ..
        dec     $13                             ; 85EC C6 13                    ..
        bne     L85C8                           ; 85EE D0 D8                    ..
        jsr     EnterFinaleScreen                           ; 85F0 20 62 D7                  b.
        .byte   $A9,$00,$8D,$88,$03,$A9,$14,$8D ; 85F3 A9 00 8D 88 03 A9 14 8D  ........
        .byte   $89,$03,$A9,$03,$8D,$93,$03,$4C ; 85FB 89 03 A9 03 8D 93 03 4C  .......L
        .byte   $ED,$82                         ; 8603 ED 82                    ..
; ----------------------------------------------------------------------------
L8605:
        lda     #SFXSTOP                            ; 8605 A9 FF                    ..
        sta     SoundPlay                           ; 8607 8D CD E2                 ...
        lda     #$80                            ; 860A A9 80                    ..
        sta     $0680                           ; 860C 8D 80 06                 ...
L860F:
        jsr     RefreshPPUState                           ; 860F 20 83 8B                  ..
        jsr     WaitFor1Frame                           ; 8612 20 40 8C                  @.
        jsr     L8621                           ; 8615 20 21 86                  !.
        jsr     UpdateEntitySprites                           ; 8618 20 37 9A                  7.
        bit     $0680                           ; 861B 2C 80 06                 ,..
        bmi     L860F                           ; 861E 30 EF                    0.
        rts                                     ; 8620 60                       `

; ----------------------------------------------------------------------------
L8621:
        lda     #<PlayerData                            ; 8621 A9 80                    ..
        sta     WorksetPtr                             ; 8623 85 40                    .@
        lda     #>PlayerData                            ; 8625 A9 06                    ..
        sta     WorksetPtr+1                             ; 8627 85 41                    .A
        jsr     WorksetLoad                           ; 8629 20 54 97                  T.
        bit     Workset + EntityActive                             ; 862C 24 20                    $ 
        bvs     L8644                           ; 862E 70 14                    p.
        lda     #$C0                            ; 8630 A9 C0                    ..
        sta     Workset + EntityActive                             ; 8632 85 20                    . 
        lda     #$00                            ; 8634 A9 00                    ..
        sta     Workset + EntityV14                             ; 8636 85 34                    .4
        lda     #$20                            ; 8638 A9 20                    . 
        sta     Workset + EntityV15                             ; 863A 85 35                    .5
        lda     #AnimationEncounterPlayerDeath1                            ; 863C A9 24                    .$
        jsr     WorksetAnimationPlay                           ; 863E 20 AD 97                  ..
        jmp     WorksetSave                           ; 8641 4C 61 97                 La.

; ----------------------------------------------------------------------------
L8644:
        bit     Workset + EntityV14                             ; 8644 24 34                    $4
        bmi     L8681                           ; 8646 30 39                    09
        dec     Workset + EntityV15                             ; 8648 C6 35                    .5
        beq     L864F                           ; 864A F0 03                    ..
        jmp     WorksetSave                           ; 864C 4C 61 97                 La.

; ----------------------------------------------------------------------------
L864F:
        lda     #<PlayerProjectile1Data                            ; 864F A9 A0                    ..
        sta     $44                             ; 8651 85 44                    .D
        lda     #>PlayerProjectile1Data                            ; 8653 A9 06                    ..
        sta     $45                             ; 8655 85 45                    .E
        ldy     #$00                            ; 8657 A0 00                    ..
L8659:
        tya                                     ; 8659 98                       .
        sta     ($44),y                         ; 865A 91 44                    .D
        lda     $44                             ; 865C A5 44                    .D
        clc                                     ; 865E 18                       .
        adc     #$20                            ; 865F 69 20                    i 
        sta     $44                             ; 8661 85 44                    .D
        lda     $45                             ; 8663 A5 45                    .E
        adc     #$00                            ; 8665 69 00                    i.
        sta     $45                             ; 8667 85 45                    .E
        cmp     #$08                            ; 8669 C9 08                    ..
        bcc     L8659                           ; 866B 90 EC                    ..
        lda     #$80                            ; 866D A9 80                    ..
        sta     Workset + EntityV14                             ; 866F 85 34                    .4
        lda     #AnimationEncounterPlayerDeath2                            ; 8671 A9 25                    .%
        jsr     WorksetAnimationPlay                           ; 8673 20 AD 97                  ..
        lda     #$00                            ; 8676 A9 00                    ..
        sta     Workset + EntityV12                            ; 8678 85 32                    .2
        lda     #$01                            ; 867A A9 01                    ..
        sta     Workset + EntityYSpeed                             ; 867C 85 33                    .3
        jmp     WorksetSave                           ; 867E 4C 61 97                 La.

; ----------------------------------------------------------------------------
L8681:
        lda     #$01                            ; 8681 A9 01                    ..
        bit     Workset + EntityV1F                             ; 8683 24 3F                    $?
        bne     L868E                           ; 8685 D0 07                    ..
        lda     #$00                            ; 8687 A9 00                    ..
        sta     Workset + EntityActive                             ; 8689 85 20                    . 
        jmp     WorksetSave                           ; 868B 4C 61 97                 La.

; ----------------------------------------------------------------------------
L868E:
        jsr     WorksetAnimationAdvance                           ; 868E 20 BE 97                  ..
        jsr     L981B                           ; 8691 20 1B 98                  ..
        jmp     WorksetSave                           ; 8694 4C 61 97                 La.

; ----------------------------------------------------------------------------
EncounterTypeMusic:
        .byte MusicEncounterScreen
        .byte MusicEncounterScreen
        .byte MusicBonusScreenStart
        .byte MusicEncounterScreen

CopyTextYouveHitSomething:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "      YOU/VE HIT SOMETHING!     "

CopyTextYouveHitJaws:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "        YOU/VE HIT JAWS!        "

; ----------------------------------------------------------------------------
RunIntroScreen:
        jsr     PPUDisableNMI
        jsr     PPUDisableRendering
        jsr     ClearScreenAndSprites
        jsr     DrawStatusLine
        lda     #RomGraphicsIntroScreen
        jsr     DrawRomGraphics
        lda     #PaletteIntroScreen
        jsr     StoreActivePaletteAndWaitFor1Frame
        jsr     PPURenderHorizontal
        lda     #$00
        sta     SCROLL_X
        sta     $0321
        sta     SCROLL_Y
        sta     UseHighPPUNametables
        ; disable status bar text
        lda     #$01
        sta     ShowStatusBarTextLine
        sta     NMISpriteHandlingDisabled
        lda     #CHREncounterAndIntroScreen
        sta     ActiveCHR
        ; set ppu to $2272 and draw lives counter
        lda     #$22
        sta     PPUADDR
        lda     #$72
        sta     PPUADDR
        lda     PlayerNumberOfLives
        clc
        adc     #$60
        ; set ppu to $22B1 and draw score
        sta     PPUDATA
        lda     #$22
        sta     PPUADDR
        lda     #$B1
        sta     PPUADDR
        jsr     DrawHighScore
        ; play music and start scene
        lda     #MusicIntroScreen
        jsr     SoundPlay
        jsr     PPUEnableNMI
        jsr     PPUEnableAndWaitFor1Frame
@DelayUntilMusicStops:
        lda     #$01
        jsr     WaitForAFramesAndRefreshPPU
        lda     $05AC
        bmi     @DelayUntilMusicStops
        rts

; ----------------------------------------------------------------------------
DrawHighScore:
        ldx     #$00
@SkipSpaces:
        lda     HighScore,x
        bne     @DrawNumber
        lda     #$00
        sta     PPUDATA
        inx
        bpl     @SkipSpaces
@DrawNumbers:
        lda     HighScore,x
@DrawNumber:
        adc     #$60
        sta     PPUDATA
        inx
        cpx     #$07
        bcc     @DrawNumbers
        rts

; ----------------------------------------------------------------------------
L8768:
        lda     PlayerShellCount                           ; 8768 AD 90 03                 ...
        sec                                     ; 876B 38                       8
        sbc     $034C                           ; 876C ED 4C 03                 .L.
        sta     PlayerShellCount                           ; 876F 8D 90 03                 ...
        lda     $0304                           ; 8772 AD 04 03                 ...
        ora     #$08                            ; 8775 09 08                    ..
        sta     $0304                           ; 8777 8D 04 03                 ...
        rts                                     ; 877A 60                       `

; ----------------------------------------------------------------------------
MapShowConchShellsMessage:
        lda #SFXPortNeedMoreConchShells
        jsr SoundPlay
        lda #$81
        sta $0305
        jsr CopyToVRAMBuffer
        .addr CopyTextYouNeedMoreConchShells
        lda #$78
        sta $12
@Wait:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr L8B5F
        ldy #$02
        jsr WaitForYSpins
        dec $12
        bne @Wait
        lda #$01
        sta $0305
        lda #$00
        sta $0306
        jsr SoundPlay
        jmp MapScreenMainLoop

CopyTextYouNeedMoreConchShells:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "   YOU NEED MORE CONCH SHELLS.  "

; ----------------------------------------------------------------------------
DrawStatusLine_PowerLabel:
        lda     #RomGraphicsStatusPowerLabel                            ; 87D3 A9 0B                    ..
        jsr     DrawRomGraphics                           ; 87D5 20 69 8D                  i.
        lda     #$2B                            ; 87D8 A9 2B                    .+
        sta     PPUADDR                           ; 87DA 8D 06 20                 .. 
        lda     #$91                            ; 87DD A9 91                    ..
        sta     PPUADDR                           ; 87DF 8D 06 20                 .. 
        lda     PlayerPowerLevel                           ; 87E2 AD 91 03                 ...
        clc                                     ; 87E5 18                       .
        adc     #$31                            ; 87E6 69 31                    i1
        sta     PPUDATA                           ; 87E8 8D 07 20                 .. 
        rts                                     ; 87EB 60                       `

; ----------------------------------------------------------------------------
RunPortScreen:
        lda     #MusicPortPowerup
        jsr     SoundPlay
        bit     PlayerHasTracker
        bpl     RunPortTracker
        jmp     RunPortPowerUp

RunPortTracker:
        jsr     PPUDisableNMI
        jsr     PPUDisableRendering
        jsr     StashPlayerLocation
        jsr     StashJawsLocation
        jsr     ClearEntityMemory
        lda     #CHRTitleAndBlackScreen
        sta     $0306
        sta     ActiveCHR
        jsr     ClearScreenAndSprites
        lda     #RomGraphicsGotTrackerScreen
        jsr     DrawRomGraphics
        jsr     DrawStatusLine
        lda     #PaletteBlackScreen
        jsr     StoreActivePaletteAndWaitFor1Frame
        lda     #$00
        sta     SCROLL_X
        sta     CameraX
        sta     CameraX+1
        sta     SCROLL_Y
        sta     UseHighPPUNametables
        sta     CameraY
        sta     CameraY+1
        lda     #<PlayerData
        sta     WorksetPtr
        lda     #>PlayerData
        sta     WorksetPtr+1
        jsr     WorksetLoad
        lda     #$C0
        sta     Workset + EntityActive
        lda     #AnimationPortTracker
        jsr     WorksetAnimationPlay
        lda     #$68
        sta     Workset + EntityX
        lda     #$67
        sta     Workset + EntityY
        jsr     WorksetSave
        jsr     UpdateEntitySprites
        lda     #$01
        sta     ShowStatusBarTextLine
        jsr     PPUEnableNMI
        jsr     PPUEnableAndWaitFor1Frame
        lda     #$78
        jsr     WaitForAFramesAndRefreshPPU
        jsr     CopyToVRAMBuffer
        .byte   $83,$88
; 
        jsr     CopyToVRAMBuffer
        .byte   $88,$88
; 
        jsr     L8768
        lda     #$78
        jsr     WaitForAFramesAndRefreshPPU
        lda     #$80
        sta     PlayerHasTracker
        jmp     RunMapScreen
@TrackerTiles1:
        .byte   $6F,$2B,$02,$0B,$0C
@TrackerTiles2:
        .byte   $8F,$2B,$02,$1B,$1C


; ----------------------------------------------------------------------------
RunPortPowerUp:
        jsr     PPUDisableNMI
        jsr     PPUDisableRendering
        lda     PPUCTRL_MIRROR
        and     #%11100111            ; disable sprite+bg rendering flags
        sta     PPUCTRL_MIRROR
        jsr     StashPlayerLocation
        jsr     StashJawsLocation
        jsr     ClearEntityMemory
        lda     #CHRTitleAndBlackScreen
        sta     $0306
        sta     ActiveCHR
        jsr     ClearScreenAndSprites
        lda     #RomGraphicsPortScreen
        jsr     DrawRomGraphics
        jsr     DrawStatusLine
        jsr     DrawStatusLine_PowerLabel
        lda     #PalettePort
        jsr     StoreActivePaletteAndWaitFor1Frame
        lda     #$00
        sta     SCROLL_X
        sta     CameraX
        sta     CameraX+1
        sta     SCROLL_Y
        sta     UseHighPPUNametables
        sta     CameraY
        sta     CameraY+1
        lda     #<PlayerData
        sta     WorksetPtr
        lda     #>PlayerData
        sta     WorksetPtr+1
        jsr     WorksetLoad
        lda     #$C0
        sta     Workset + EntityActive
        lda     #AnimationPortBoat
        jsr     WorksetAnimationPlay
        lda     #$C0
        sta     Workset + EntityX
        lda     #$FF
        sta     Workset + EntityX  + 1
        lda     #$94
        sta     Workset + EntityY
        lda     #$00
        sta     Workset + EntityY + 1
        lda     #$80
        sta     Workset + EntityV10
        lda     #$00
        sta     Workset + EntityXSpeed
        jsr     WorksetSave
        jsr     UpdateEntitySprites
        lda     #$01
        sta     ShowStatusBarTextLine
        jsr     PPUEnableNMI
        jsr     PPUEnableAndWaitFor1Frame
@WaitForBoatToArriveAtPort:
        jsr     WaitFor1Frame
        lda     #<PlayerData
        sta     WorksetPtr
        lda     #>PlayerData
        sta     WorksetPtr+1
        jsr     WorksetLoad
        jsr     WorksetMoveX
        jsr     WorksetSave
        lda     Workset + EntityX  + 1
        bmi     @Delay
        lda     Workset + EntityX
        cmp     #$08
        bcs     @IncreasePowerLevel
@Delay:
        jsr     UpdateEntitySprites
        jsr     RefreshPPUState
        jmp     @WaitForBoatToArriveAtPort
@IncreasePowerLevel:
        lda     PlayerPowerLevel
        cmp     #$08
        bcs     @AlreadyAtMaxPowerLevel
        jsr     CopyToVRAMBuffer
        .addr   CopyTextPowerLevelRaised
        jsr     RefreshPPUState
        lda     #$3C
        jsr     WaitForAFramesAndRefreshPPU
        inc     PlayerPowerLevel
        lda     #$00
        sta     VRAMBufferActive
        ldx     VRAMBufferOffset
        lda     #$2B
        sta     VRAMBuffer,x
        inx
        lda     #$91
        sta     VRAMBuffer,x
        inx
        lda     PlayerPowerLevel
        clc
        adc     #$31
        sta     VRAMBuffer,x
        inx
        stx     VRAMBufferOffset
        lda     #$80
        sta     VRAMBufferActive
        lda     $0304
        ora     #$10
        sta     $0304
        jsr     L8768
        lda     #$81
        sta     ShowStatusBarTextLine
        lda     #$B4
        jsr     WaitForAFramesAndRefreshPPU
        lda     PPUCTRL_MIRROR
        ora     #%00010000                     ; set background table to $1000
        sta     PPUCTRL_MIRROR
        lda     #$01
        sta     ShowStatusBarTextLine
        jmp     RunMapScreen

; ----------------------------------------------------------------------------
@AlreadyAtMaxPowerLevel:
        jsr CopyToVRAMBuffer
        .addr CopyTextCollectOneStrobe
        lda #$81
        sta ShowStatusBarTextLine
        inc PlayerStrobeCount
        lda PlayerStrobeCount
        cmp #$09
        bcc @Skip
        lda #$09
        sta PlayerStrobeCount
@Skip:
        jsr L8768
        jsr RefreshPPUState
        lda #$B4
        jsr WaitForAFramesAndRefreshPPU
        lda PPUCTRL_MIRROR
        ora #%00010000                         ; set background table to $1000
        sta PPUCTRL_MIRROR
        lda #$01
        sta ShowStatusBarTextLine
        jmp RunMapScreen

CopyTextPowerLevelRaised:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "       POWER LEVEL RAISED.      "

CopyTextCollectOneStrobe:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "       COLLECT ONE STROBE.      "
        
; ----------------------------------------------------------------------------
UnstashPlayerLocation:
        lda     PlayerStashedX                           ; 8A16 AD 8C 03                 ...
        jsr     L8C29                           ; 8A19 20 29 8C                  ).
        lda     $16                             ; 8A1C A5 16                    ..
        clc                                     ; 8A1E 18                       .
        adc     #$08                            ; 8A1F 69 08                    i.
        sta     PlayerX                           ; 8A21 8D 82 06                 ...
        lda     $17                             ; 8A24 A5 17                    ..
        adc     #$00                            ; 8A26 69 00                    i.
        sta     PlayerX+1                           ; 8A28 8D 83 06                 ...
        lda     PlayerStashedY                           ; 8A2B AD 8D 03                 ...
        jsr     L8C29                           ; 8A2E 20 29 8C                  ).
        lda     $16                             ; 8A31 A5 16                    ..
        clc                                     ; 8A33 18                       .
        adc     #$08                            ; 8A34 69 08                    i.
        sta     PlayerY                           ; 8A36 8D 84 06                 ...
        lda     $17                             ; 8A39 A5 17                    ..
        adc     #$00                            ; 8A3B 69 00                    i.
        sta     PlayerY+1                           ; 8A3D 8D 85 06                 ...
        rts                                     ; 8A40 60                       `

; ----------------------------------------------------------------------------
StashPlayerLocation:
        lda     PlayerX+1                           ; 8A41 AD 83 06                 ...
        lsr     a                               ; 8A44 4A                       J
        lda     PlayerX                           ; 8A45 AD 82 06                 ...
        ror     a                               ; 8A48 6A                       j
        lsr     a                               ; 8A49 4A                       J
        lsr     a                               ; 8A4A 4A                       J
        lsr     a                               ; 8A4B 4A                       J
        sta     PlayerStashedX                           ; 8A4C 8D 8C 03                 ...
        lda     PlayerY+1                           ; 8A4F AD 85 06                 ...
        lsr     a                               ; 8A52 4A                       J
        lda     PlayerY                           ; 8A53 AD 84 06                 ...
        ror     a                               ; 8A56 6A                       j
        lsr     a                               ; 8A57 4A                       J
        lsr     a                               ; 8A58 4A                       J
        lsr     a                               ; 8A59 4A                       J
        sta     PlayerStashedY                           ; 8A5A 8D 8D 03                 ...
        rts                                     ; 8A5D 60                       `

; ----------------------------------------------------------------------------
StashJawsLocation:
        lda     JawsX+1                           ; 8A5E AD 03 07                 ...
        lsr     a                               ; 8A61 4A                       J
        lda     JawsX                           ; 8A62 AD 02 07                 ...
        ror     a                               ; 8A65 6A                       j
        lsr     a                               ; 8A66 4A                       J
        lsr     a                               ; 8A67 4A                       J
        lsr     a                               ; 8A68 4A                       J
        sta     JawsStashedX                           ; 8A69 8D 48 03                 .H.
        lda     JawsY+1                           ; 8A6C AD 05 07                 ...
        lsr     a                               ; 8A6F 4A                       J
        lda     JawsY                           ; 8A70 AD 04 07                 ...
        ror     a                               ; 8A73 6A                       j
        lsr     a                               ; 8A74 4A                       J
        lsr     a                               ; 8A75 4A                       J
        lsr     a                               ; 8A76 4A                       J
        sta     JawsStashedY                           ; 8A77 8D 49 03                 .I.
        rts                                     ; 8A7A 60                       `

; ----------------------------------------------------------------------------
VNMI:
        pha
        txa
        pha
        tya
        pha
        lda #$01
        sta $0301
        lda NMISpriteHandlingDisabled
        beq @DrawBackgroundOrChangePalette
        lda #$01
        bit ShowStatusBarTextLine
        beq @CopySprites
        bmi @OffsetStatusbarForTextLine
        lda #$40
        sta StatusbarPPULocation
        lda #$2B
        sta StatusbarPPULocation+1
        ; set height of spr0 to the statusbar height
        lda #$C0
        jmp @PositionSprite0
@OffsetStatusbarForTextLine:
        lda #$00
        sta StatusbarPPULocation
        lda #$2B
        sta StatusbarPPULocation+1
        ; set height of spr0 to the statusbar height
        lda #$B0
@PositionSprite0:
        ; position SPR0 just above the statusbar
        sta SpritePosY
        lda #$FF
        sta SpriteTile
        lda #$20
        sta SpriteAttr
        lda #$D0
        sta SpritePosX
@CopySprites:
        jsr DMACopySprites
@DrawBackgroundOrChangePalette:
        lda #$01
        bit PaletteLoadPending
        beq @DrawBackground
        ; if palette load is pending, do that instead of statusbar
        jsr WritePalette
        jmp @Continue
@DrawBackground:
        jsr DrawBackground
@Continue:
        ; set base nametable to $2000 or $2400
        lda     PPUCTRL_MIRROR
        and     #%11111101
        tax
        ; if the high nametables flag is set, use nametables $2800 or $2C00
        lda     UseHighPPUNametables
        and     #$01
        beq     @UpdatePPURegisters
        inx
        inx
@UpdatePPURegisters:
        stx     PPUCTRL_MIRROR
        stx     PPUCTRL
        lda     PPUMASK_MIRROR
        sta     PPUMASK
        lda     PPUSTATUS
        lda     SCROLL_X
        sta     PPUSCROLL
        lda     SCROLL_Y
        sta     PPUSCROLL
        ldx     ActiveCHR
        lda     CHRBANKS,x
        sta     CHRBANKS,x
        lda     SoundIsPlaying
        bne     @Exit
        jsr     SoundUpdate
@Exit:
        pla
        tay
        pla
        tax
        pla
        rti

; ----------------------------------------------------------------------------
DrawBackground:
        @TempJumpTarget = $0334
        ldx NextStatusbarToDraw
        dex 
        bpl @KeepDrawingStatusbar
        rts
@KeepDrawingStatusbar:
        txa
        asl a
        tax
        lda StatusbarPointers,x
        sta @TempJumpTarget
        lda StatusbarPointers+1,x
        sta @TempJumpTarget+1
        jmp (@TempJumpTarget)

StatusbarPointers:
        .addr LAC58
        .addr LAC64
        .addr LAC6D
        .addr LAC79
        .addr DrawStatusbarScore
        .addr DrawStatusbarJawsPower
        .addr DrawStatusbarEncounterWaves
        .addr DrawVRAMBuffer
        .addr DrawStatusbarShells


; ----------------------------------------------------------------------------
DrawStatusbarScore:
        jsr     DrawStatusLine_Score                           ; 8B3B 20 9E A7                  ..
        lda     #$00                            ; 8B3E A9 00                    ..
        sta     NextStatusbarToDraw                           ; 8B40 8D 03 03                 ...
        rts                                     ; 8B43 60                       `

; ----------------------------------------------------------------------------
DrawStatusbarJawsPower:
        jsr     DrawStatusLine_JawsPower                           ; 8B44 20 5C A9                  \.
        lda     #$00                            ; 8B47 A9 00                    ..
        sta     NextStatusbarToDraw                           ; 8B49 8D 03 03                 ...
        rts                                     ; 8B4C 60                       `

; ----------------------------------------------------------------------------
DrawStatusbarEncounterWaves:
        jsr     DrawEncounterWaves                           ; 8B4D 20 E4 A9                  ..
        lda     #$00                            ; 8B50 A9 00                    ..
        sta     NextStatusbarToDraw                           ; 8B52 8D 03 03                 ...
        rts                                     ; 8B55 60                       `

; ----------------------------------------------------------------------------
DrawStatusbarShells:
        jsr     DrawStatusLine_Shells                           ; 8B56 20 92 A9                  ..
        lda     #$00                            ; 8B59 A9 00                    ..
        sta     NextStatusbarToDraw                           ; 8B5B 8D 03 03                 ...
        rts                                     ; 8B5E 60                       `

; ----------------------------------------------------------------------------
L8B5F:
        lda     NextStatusbarToDraw                           ; 8B5F AD 03 03                 ...
        bne     @Done                           ; 8B62 D0 1E                    ..
        ldx     #$00                            ; 8B64 A2 00                    ..
        lda     #$80                            ; 8B66 A9 80                    ..
@L8B68:
        bit     $0304                           ; 8B68 2C 04 03                 ,..
        bne     @L8B72                           ; 8B6B D0 05                    ..
        inx                                     ; 8B6D E8                       .
        lsr     a                               ; 8B6E 4A                       J
        bcc     @L8B68                           ; 8B6F 90 F7                    ..
        rts                                     ; 8B71 60                       `
@L8B72:
        eor     $0304                           ; 8B72 4D 04 03                 M..
        sta     $0304                           ; 8B75 8D 04 03                 ...
        txa                                     ; 8B78 8A                       .
        cmp     #$05                            ; 8B79 C9 05                    ..
        bcs     @Done                           ; 8B7B B0 05                    ..
        adc     #$05                            ; 8B7D 69 05                    i.
        sta     NextStatusbarToDraw                           ; 8B7F 8D 03 03                 ...
@Done:
        rts                                     ; 8B82 60                       `

; ----------------------------------------------------------------------------
RefreshPPUState:
        lda #$40
:       bit PPUSTATUS       ; delay until vblank
        bvc :-
        lda StatusbarPPULocation+1
        sta PPUADDR
        lda StatusbarPPULocation
        sta PPUADDR
        lda #$00
        sta PPUSCROLL
        sta PPUSCROLL
        lda CHRBANKS
        sta CHRBANKS        ; set first chr bank
        lda PPUMASK_MIRROR
        and #%11101111      ; clear sprite rendering flag
        sta PPUMASK
        lda PPUCTRL_MIRROR
        and #%11100111      ; set sprite and background table to $0000
        ora #%00010000      ; set background table to $1000
        sta PPUCTRL
        rts

; ----------------------------------------------------------------------------
VIRQ:
        rti
; ----------------------------------------------------------------------------

PPUDisableRendering:
        lda PPUMASK_MIRROR
        and #%11100111     ; clear sprite and background rendering flag
        sta PPUMASK_MIRROR
        sta PPUMASK
        rts

; ----------------------------------------------------------------------------
PPUEnableAndWaitFor1Frame:
        lda PPUMASK_MIRROR
        ora #%00011000
        sta PPUMASK_MIRROR
        lda PPUCTRL_MIRROR
        pha
        ora #%10000000
        sta PPUCTRL
        jsr WaitFor1Frame
        pla
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        rts

; ----------------------------------------------------------------------------
PPUEnableNMI:
        lda PPUCTRL_MIRROR
        ora #%10000000     ; set nmi flag
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        rts

; ----------------------------------------------------------------------------
PPUDisableNMI:
        lda PPUCTRL_MIRROR
        and #%01111111     ; clear nmi flag
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        rts

; ----------------------------------------------------------------------------
PPURenderHorizontal:
        lda PPUCTRL_MIRROR
        and #%11111011     ; clear vertical rendering flag
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        rts

; seemingly unused code?
; ----------------------------------------------------------------------------
        .byte   $AD,$0E,$03,$09,$04,$8D,$0E,$03 ; 8C02 AD 0E 03 09 04 8D 0E 03  ........
        .byte   $8D,$01,$20,$60,$85,$17,$18,$A9 ; 8C0A 8D 01 20 60 85 17 18 A9  .. `....
        .byte   $00,$24,$17,$10,$03,$A9,$0F,$38 ; 8C12 00 24 17 10 03 A9 0F 38  .$.....8
        .byte   $66,$17,$6A,$66,$17,$6A,$66,$17 ; 8C1A 66 17 6A 66 17 6A 66 17  f.jf.jf.
        .byte   $6A,$66,$17,$6A,$85,$16,$60     ; 8C22 6A 66 17 6A 85 16 60     jf.j..`

; ----------------------------------------------------------------------------
L8C29:
        sta     $16                             ; 8C29 85 16                    ..
        lda     #$00                            ; 8C2B A9 00                    ..
        sta     $17                             ; 8C2D 85 17                    ..
        asl     $16                             ; 8C2F 06 16                    ..
        rol     $17                             ; 8C31 26 17                    &.
        asl     $16                             ; 8C33 06 16                    ..
        rol     $17                             ; 8C35 26 17                    &.
        asl     $16                             ; 8C37 06 16                    ..
        rol     $17                             ; 8C39 26 17                    &.
        asl     $16                             ; 8C3B 06 16                    ..
        rol     $17                             ; 8C3D 26 17                    &.
        rts                                     ; 8C3F 60                       `

; ----------------------------------------------------------------------------
WaitFor1Frame:
        lda     #$00                            ; 8C40 A9 00                    ..
        sta     $0301                           ; 8C42 8D 01 03                 ...
@Wait:
        lda     $0301                           ; 8C45 AD 01 03                 ...
        beq     @Wait                           ; 8C48 F0 FB                    ..
        lda     #$00                            ; 8C4A A9 00                    ..
        sta     $0301                           ; 8C4C 8D 01 03                 ...
        rts                                     ; 8C4F 60                       `

; ----------------------------------------------------------------------------
WaitForYFrames:
        jsr     WaitFor1Frame                           ; 8C50 20 40 8C                  @.
        dey                                     ; 8C53 88                       .
        bne     WaitForYFrames                           ; 8C54 D0 FA                    ..
        rts                                     ; 8C56 60                       `

; seemingly unused code?
; ----------------------------------------------------------------------------
        .byte   $A0,$3C,$20,$50,$8C,$CA,$D0,$F8 ; 8C57 A0 3C 20 50 8C CA D0 F8  .< P....
        .byte   $60                             ; 8C5F 60                       `
; ----------------------------------------------------------------------------

; waits for roughly 1300 * Y cycles
WaitForYSpins:
        ldx     #$00                            ; 8C60 A2 00                    ..
@Wait:
        dex                                     ; 8C62 CA                       .
        bne     @Wait                           ; 8C63 D0 FD                    ..
        dey                                     ; 8C65 88                       .
        bne     @Wait                           ; 8C66 D0 FA                    ..
        rts                                     ; 8C68 60                       `

; ----------------------------------------------------------------------------
RNGAdvance:
        clc
        lda     RNG1
        and     #%00000101
        beq     @Carry
        cmp     #$05
        bne     @Continue
@Carry:
        sec
@Continue:
        rol     RNG0
        rol     RNG1
        lda     RNG1
        and     #%00000111
        adc     RNG0
        eor     #%01011010
        rts

; ----------------------------------------------------------------------------
ReadJoypads:
        lda #$01
        sta JOYPAD_PORT1
        lda #$00
        sta JOYPAD_PORT1
        ldx #$08
@LoopCTL1:
        lda JOYPAD_PORT1
        sta $12
        lsr a
        ora $12
        lsr a
        ror $13
        dex
        bne @LoopCTL1
        lda $13
        eor Joy1Inputs
        and $13
        sta Joy1Pressed
        lda $13
        sta Joy1Inputs
        ldx #$08
@LoopCTL2:
        lda JOYPAD_PORT2
        sta $12
        lsr a
        ora $12
        lsr a
        ror $13
        dex
        bne @LoopCTL2
        lda $13
        eor Joy2Inputs
        and $13
        sta Joy2Pressed
        lda $13
        sta Joy2Inputs
        rts

; ----------------------------------------------------------------------------
AwardPoints:
        ; multiply A by 6 to get starting offset in points table
        asl     a
        sta     $13
        asl     a
        adc     $13
        ; add 5 to get ending offset in points table
        adc     #$05
        tax
        ; count down from 5 awarding points from the table
        ldy     #$05
        clc
@AwardNext:
        lda     AwardPointsTable,x
        adc     CurrentScore,y
        cmp     #$0A
        bcc     @Advance
        ; subtract 10 points if the point value reaches 11.
        ; this will carry up to the next byte.
        sbc     #$0A
@Advance:
        sta     CurrentScore,y
        dex
        dey
        bpl     @AwardNext
        lda     $0304
        ora     #$80
        sta     $0304
        ldx     #$00
@CheckForNewHighScore:
        lda     HighScore,x
        cmp     CurrentScore,x
        bcc     @FoundNewHighScore
        bne     @L8D18
        inx
        cpx     #$06
        bcc     @CheckForNewHighScore
        .byte   $4C,$18,$8D
@FoundNewHighScore:
        ldx     #$00
@CopyToHighScore:
        lda     CurrentScore,x
        sta     HighScore,x
        inx
        cpx     #$06
        bcc     @CopyToHighScore
@L8D18:
        ldx     #$00
@L8D1A:
        lda     ScoreForNextSubmarine,x
        cmp     CurrentScore,x
        bne     @L8D2A
        inx
        cpx     #$03
        bcc     @L8D1A
        jmp     @L8D2C
@L8D2A:
        bcs     @L8D68
@L8D2C:
        lda     EncounterType
        bne     @L8D3E
        lda     MapSubmarineVisible
        bne     @L8D3E
        lda     #$80
        sta     MapSubmarineVisible
        jmp     @L8D52
@L8D3E:
        .byte   $A9,$19,$20,$CD,$E2,$EE,$87,$03
        .byte   $AD,$87,$03,$C9,$0A,$90,$05,$A9
        .byte   $09,$8D,$87,$03
@L8D52:
        ldx     #$02
        lda     #$03
        clc
@L8D57:
        adc     ScoreForNextSubmarine,x
        cmp     #$0A
        bcc     @L8D60
        .byte   $E9,$0A
@L8D60:
        sta     ScoreForNextSubmarine,x
        lda     #$00
        dex
        bpl     @L8D57
@L8D68:
        rts

; ----------------------------------------------------------------------------
DrawRomGraphics:
        @ROMPointer = $10           ; pointer to location in rom where the graphics are stored
        @PPUPointer = $12           ; pointer to the ppu address that we are drawing to
        asl a
        tax
        lda RomGraphicsPtrs,x
        sta @ROMPointer
        lda RomGraphicsPtrs+1,x
        sta @ROMPointer+1
        jsr PPURenderHorizontal
        ldx #$00
        jsr @GFXSetPPUAddress
@GFXDraw:
        jsr @GFXReadNextByte
        cmp #$FF                    ; FF marks the end of a section of rendering
        beq @FoundFF
        sta PPUDATA
        inc @PPUPointer             ; increment ppuaddr mirror
        bne @GFXDraw
        inc @PPUPointer+1
        jmp @GFXDraw
@FoundFF:
        jsr @GFXReadNextByte
        cmp #$00                    ; FF 00 marks the end of the graphics set
        bne @NextSegment1
        rts                         ; we're done drawing!

@NextSegment1:
        cmp #$01
        bne @NextSegment2
        jsr @GFXSetPPUAddress
        jmp @GFXDraw

@NextSegment2:
        cmp #$FF
        beq @GFXRepeatByte
        clc
        adc @PPUPointer
        sta @PPUPointer
        pha
        lda @PPUPointer+1
        adc #$00
        sta @PPUPointer+1
        sta PPUADDR
        pla
        sta PPUADDR
        jmp @GFXDraw

@GFXRepeatByte:
        @TempBytesPerPage     = $0310
        @TempPages            = $0311
        @TempValueToRepeat    = $0312
        jsr @GFXReadNextByte
        sta @TempBytesPerPage
        jsr @GFXReadNextByte
        sta @TempPages
        jsr @GFXReadNextByte
        sta @TempValueToRepeat
@DrawNextPage:
        ldy @TempBytesPerPage
        lda @TempValueToRepeat
@DrawNextByte:
        sta PPUDATA
        dey
        bne @DrawNextByte
        clc
        lda @PPUPointer
        adc #$20
        sta @PPUPointer
        tay
        lda @PPUPointer+1
        adc #$00
        sta @PPUPointer+1
        sta PPUADDR
        sty PPUADDR
        dec @TempPages
        bne @DrawNextPage
        jmp @GFXDraw

@GFXReadNextByte:
        lda (@ROMPointer,x)
        inc @ROMPointer
        bne @NoCarry
        inc @ROMPointer+1
@NoCarry:
        rts

@GFXSetPPUAddress:
        jsr @GFXReadNextByte
        sta @PPUPointer
        pha
        jsr @GFXReadNextByte
        sta @PPUPointer+1
        sta PPUADDR
        pla
        sta PPUADDR
        rts

; ----------------------------------------------------------------------------
ClearScreenAndSprites:
        jsr     PPUDisableRendering
        jsr     PPURenderHorizontal
        lda     #$00
        sta     NextStatusbarToDraw
        sta     NMISpriteHandlingDisabled
        sta     $0304
        sta     ShowStatusBarTextLine
        jsr     ClearScreen
        jsr     MoveAllSpritesOffscreen
        rts

; ----------------------------------------------------------------------------
PPUClear:
        lda     #$00
        sta     NextStatusbarToDraw
        sta     $0304
        jsr     PPUDisableRendering
        jsr     MoveAllSpritesOffscreen
        jsr     PPURenderHorizontal
        lda     #$20
        sta     PPUADDR
        lda     #$00
        sta     PPUADDR
        tax
        ldy     #$04
@Draw0:
        sta     PPUDATA
        dex
        bne     @Draw0
        dey
        bne     @Draw0
        lda     #$28
        sta     PPUADDR
        stx     PPUADDR
        txa
        ldy     #$04
        ldx     #$40
@Draw1:
        sta     PPUDATA
        dex
        bne     @Draw1
        dey
        bne     @Draw1
        lda     #$2B
        sta     PPUADDR
        lda     #$C0
        sta     PPUADDR
        ldx     #$30
@Draw2:
        sty     PPUDATA
        dex
        bne     @Draw2
        rts

; ----------------------------------------------------------------------------
ClearScreen:
        lda     #$20
        sta     PPUADDR
        jsr     @ClearScreen1
        lda     #$28
        sta     PPUADDR
@ClearScreen1:
        lda     #$00
        sta     PPUADDR
        ldy     #$04
        tax
@WritePPUDATA:
        sta     PPUDATA
        dex
        bne     @WritePPUDATA
        dey
        bne     @WritePPUDATA
        rts

; ----------------------------------------------------------------------------
MoveAllSpritesOffscreen:
        lda     #$F0
        ldx     #$00
@MoveNextSprite:
        sta     SpritePosY,x
        inx
        inx
        inx
        inx
        bne     @MoveNextSprite
        lda     #$01
        sta     NMISpriteHandlingDisabled
        rts

; ----------------------------------------------------------------------------
DMACopySprites:
        lda     #$00
        sta     OAMADDR
        sta     NMISpriteHandlingDisabled
        lda     #$02
        sta     OAMDMA
        rts

; ----------------------------------------------------------------------------
StoreActivePaletteAndWaitFor1Frame:
        sta     ActivePalette
        lda     PaletteLoadPending
        ora     #$01                              ; set palette load flag
        sta     PaletteLoadPending
        lda     PPUMASK_MIRROR
        pha
        jsr     PPUDisableRendering
        lda     PPUCTRL_MIRROR
        pha
        jsr     PPUEnableNMI
        jsr     WaitFor1Frame
        pla
        sta     PPUCTRL_MIRROR
        sta     PPUMASK
        pla
        sta     PPUMASK_MIRROR
        sta     PPUMASK
        rts

; ----------------------------------------------------------------------------
WritePalette:
        @TempPalettePointer = $F8
        ; clear vertical rendering flag
        lda     PPUCTRL_MIRROR
        and     #%11111011
        sta     PPUCTRL
        lda     ActivePalette
        ; move pointer to the $20-byte offset in PaletteData
        sta     @TempPalettePointer + 1
        lda     #$00
        lsr     @TempPalettePointer + 1
        ror     a
        lsr     @TempPalettePointer + 1
        ror     a
        lsr     @TempPalettePointer + 1
        ror     a
        adc     #<PaletteData
        sta     @TempPalettePointer
        lda     @TempPalettePointer + 1
        adc     #>PaletteData
        sta     @TempPalettePointer + 1
        ; set ppu address to palette starting offset
        lda     #$3F
        sta     PPUADDR
        lda     #$00
        sta     PPUADDR
        tay
        ; copy $20 bytes of data
        ldx     #$20
@KeepCopying:
        lda     (@TempPalettePointer),y
        sta     PPUDATA
        iny
        dex
        bne     @KeepCopying
        ; set ppu address back to palette start offset
        lda     #$3F
        sta     PPUADDR
        lda     #$00
        sta     PPUADDR
        ; set ppu address to 0...
        sta     PPUADDR
        sta     PPUADDR
        ; clear palette load flag
        lda     PaletteLoadPending
        and     #$FE
        sta     PaletteLoadPending
        rts

; # Procedure: JumpEngine
; Reads a list of pointers after the code that JSR'ed
; into it and jumps into the pointer for the A register.
;
; ## Example:
; DoWork:
;   lda #1            ; set A to 1
;   jsr JumpEngine    ; enter the jumpengine
;   .addr FirstItem   ; 
;   .addr SecondItem  ; this pointer will be jumped to
; 

JumpEngine:
        @TempCallsite = $44
        @TempTarget   = $0318
        asl a
        tay
        pla
        clc
        adc #$01
        sta @TempCallsite
        pla
        adc #$00
        sta @TempCallsite+1
        lda (@TempCallsite),y
        sta @TempTarget
        iny
        lda (@TempCallsite),y
        sta @TempTarget+1
        jmp (@TempTarget)

; ----------------------------------------------------------------------------
MapRunPlayer:
        jsr     LoadPlayerWorkset                           ; 8F54 20 4C 97                  L.
        bit     Workset + EntityActive                             ; 8F57 24 20                    $ 
        bvs     @PlayerIsActive                           ; 8F59 70 15                    p.
        lda     #$C0                            ; 8F5B A9 C0                    ..
        sta     Workset + EntityActive                             ; 8F5D 85 20                    . 
        lda     #$08                            ; 8F5F A9 08                    ..
        sta     Workset + EntityV14                             ; 8F61 85 34                    .4
        lda     #$FF                            ; 8F63 A9 FF                    ..
        sta     Workset + EntityV15                             ; 8F65 85 35                    .5
        jsr     L90A7                           ; 8F67 20 A7 90                  ..
        jsr     L98ED                           ; 8F6A 20 ED 98                  ..
        jmp     SaveWorksetAndRTS                           ; 8F6D 4C 9C 90                 L..
@PlayerIsActive:
        lda     #$08                            ; 8F70 A9 08                    ..
        bit     Workset + EntityV14                             ; 8F72 24 34                    $4
        beq     L8F9F                           ; 8F74 F0 29                    .)
        jsr     L90F4                           ; 8F76 20 F4 90                  ..
        cmp     #$08                            ; 8F79 C9 08                    ..
        bcc     L8F83                           ; 8F7B 90 06                    ..
        jsr     L90A7                           ; 8F7D 20 A7 90                  ..
        jmp     SaveWorksetAndRTS                           ; 8F80 4C 9C 90                 L..

; ----------------------------------------------------------------------------
L8F83:
        sta     Workset + EntityV14                             ; 8F83 85 34                    .4
        jsr     L915D                           ; 8F85 20 5D 91                  ].
        bcs     L8F93                           ; 8F88 B0 09                    ..
        jsr     L90A7                           ; 8F8A 20 A7 90                  ..
        jsr     L9123                           ; 8F8D 20 23 91                  #.
        jmp     L8FBA                           ; 8F90 4C BA 8F                 L..

; ----------------------------------------------------------------------------
L8F93:
        lda     Workset + EntityV14                             ; 8F93 A5 34                    .4
        ora     #$08                            ; 8F95 09 08                    ..
        sta     Workset + EntityV14                             ; 8F97 85 34                    .4
        jsr     L90A7                           ; 8F99 20 A7 90                  ..
        jmp     SaveWorksetAndRTS                           ; 8F9C 4C 9C 90                 L..

; ----------------------------------------------------------------------------
L8F9F:
        jsr     L90F4                           ; 8F9F 20 F4 90                  ..
        cmp     #$08                            ; 8FA2 C9 08                    ..
        bcs     L8FB7                           ; 8FA4 B0 11                    ..
        tax                                     ; 8FA6 AA                       .
        adc     Workset + EntityV14                             ; 8FA7 65 34                    e4
        and     #$07                            ; 8FA9 29 07                    ).
        cmp     #$04                            ; 8FAB C9 04                    ..
        bne     L8FB7                           ; 8FAD D0 08                    ..
        stx     Workset + EntityV14                             ; 8FAF 86 34                    .4
        jsr     L90A7                           ; 8FB1 20 A7 90                  ..
        jsr     L9123                           ; 8FB4 20 23 91                  #.
L8FB7:
        jsr     WorksetAnimationAdvance                           ; 8FB7 20 BE 97                  ..
L8FBA:
        jsr     WorksetMoveX                           ; 8FBA 20 FA 97                  ..
        jsr     L981B                           ; 8FBD 20 1B 98                  ..
        lda     Workset + EntityX                             ; 8FC0 A5 22                    ."
        and     #$0F                            ; 8FC2 29 0F                    ).
        cmp     #$08                            ; 8FC4 C9 08                    ..
        beq     L8FCB                           ; 8FC6 F0 03                    ..
        jmp     SaveWorksetAndRTS                           ; 8FC8 4C 9C 90                 L..

; ----------------------------------------------------------------------------
L8FCB:
        lda     Workset + EntityY                             ; 8FCB A5 24                    .$
        and     #$0F                            ; 8FCD 29 0F                    ).
        cmp     #$08                            ; 8FCF C9 08                    ..
        beq     @L8FD6                           ; 8FD1 F0 03                    ..
        jmp     SaveWorksetAndRTS                           ; 8FD3 4C 9C 90                 L..
@L8FD6:
        lda     Workset + EntityV14                             ; 8FD6 A5 34                    .4
        ora     #$08                            ; 8FD8 09 08                    ..
        sta     Workset + EntityV14                             ; 8FDA 85 34                    .4
        jsr     L98ED                           ; 8FDC 20 ED 98                  ..
        jsr     L95E4                           ; 8FDF 20 E4 95                  ..
        jsr     L962D                           ; 8FE2 20 2D 96                  -.
        sec                                     ; 8FE5 38                       8
        sbc     #$0A                            ; 8FE6 E9 0A                    ..
        bcc     @L9045                           ; 8FE8 90 5B                    .[
        cmp     #$02                            ; 8FEA C9 02                    ..
        bcs     @L9045                           ; 8FEC B0 57                    .W
        sta     $12                             ; 8FEE 85 12                    ..
        eor     PlayerFlag34D                           ; 8FF0 4D 4D 03                 MM.
        bne     @L9045                           ; 8FF3 D0 50                    .P
        bit     PlayerHasTracker                           ; 8FF5 2C 41 03                 ,A.
        bmi     @L9006                           ; 8FF8 30 0C                    0.
        lda     PlayerShellCount                           ; 8FFA AD 90 03                 ...
        cmp     #$05                            ; 8FFD C9 05                    ..
        bcc     @L903A                           ; 8FFF 90 39                    .9
        lda     #$05                            ; 9001 A9 05                    ..
        jmp     @L9024                           ; 9003 4C 24 90                 L$.
@L9006:
        ldx     PlayerPowerLevel                           ; 9006 AE 91 03                 ...
        cpx     #$08                            ; 9009 E0 08                    ..
        bcs     @L901B                           ; 900B B0 0E                    ..
        lda     PlayerShellCount                           ; 900D AD 90 03                 ...
        cmp     ShellPricePerPowerLevel,x                         ; 9010 DD 9F 90                 ...
        bcc     @L903A                           ; 9013 90 25                    .%
        lda     ShellPricePerPowerLevel,x                         ; 9015 BD 9F 90                 ...
        jmp     @L9024                           ; 9018 4C 24 90                 L$.
@L901B:
        lda PlayerShellCount
        cmp #$0a
        bcc @L903A
        lda #$0a
@L9024:
        sta     $034C                           ; 9024 8D 4C 03                 .L.
        lda     $0306                           ; 9027 AD 06 03                 ...
        ora     #$02                            ; 902A 09 02                    ..
        sta     $0306                           ; 902C 8D 06 03                 ...
        lda     PlayerFlag34D                           ; 902F AD 4D 03                 .M.
        eor     #$01                            ; 9032 49 01                    I.
        sta     PlayerFlag34D                           ; 9034 8D 4D 03                 .M.
        jmp     SaveWorksetAndRTS                           ; 9037 4C 9C 90                 L..
@L903A:
        lda $0306
        ora #$08
        sta $0306
        jmp SaveWorksetAndRTS
@L9045:
        bit     MapSubmarineVisible                           ; 9045 2C 97 03                 ,..
        bpl     @L907E                           ; 9048 10 34                    .4
        bvc     @L907E                           ; 904A 50 32                    P2
        jsr     L95E4                           ; 904C 20 E4 95                  ..
        lsr     $17                             ; 904F 46 17                    F.
        ror     $16                             ; 9051 66 16                    f.
        lsr     $16                             ; 9053 46 16                    F.
        lsr     $16                             ; 9055 46 16                    F.
        lsr     $16                             ; 9057 46 16                    F.
        lda     MapSubmarineX                           ; 9059 AD 4E 03                 .N.
        cmp     $16                             ; 905C C5 16                    ..
        bne     @L907E                           ; 905E D0 1E                    ..
        lsr     $19                             ; 9060 46 19                    F.
        ror     $18                             ; 9062 66 18                    f.
        lsr     $18                             ; 9064 46 18                    F.
        lsr     $18                             ; 9066 46 18                    F.
        lsr     $18                             ; 9068 46 18                    F.
        lda     MapSubmarineY                           ; 906A AD 4F 03                 .O.
        cmp     $18                             ; 906D C5 18                    ..
        bne     @L907E                           ; 906F D0 0D                    ..
        lda     #$01                            ; 9071 A9 01                    ..
        sta     EncounterType                           ; 9073 8D 8A 03                 ...
        lda     #$00                            ; 9076 A9 00                    ..
        sta     $06A0                           ; 9078 8D A0 06                 ...
        sta     MapSubmarineVisible                           ; 907B 8D 97 03                 ...
@L907E:
        jsr     RNGAdvance                           ; 907E 20 69 8C                  i.
        and     #$1F                            ; 9081 29 1F                    ).
        bne     SaveWorksetAndRTS                           ; 9083 D0 17                    ..
        lda     $0306                           ; 9085 AD 06 03                 ...
        ora     #$04                            ; 9088 09 04                    ..
        sta     $0306                           ; 908A 8D 06 03                 ...
        jsr     L95E4                           ; 908D 20 E4 95                  ..
        jsr     L962D                           ; 9090 20 2D 96                  -.
        cmp     #$06                            ; 9093 C9 06                    ..
        bcc     @L9099                           ; 9095 90 02                    ..
        lda #EncounterType4
@L9099:
        sta     $0340                           ; 9099 8D 40 03                 .@.
SaveWorksetAndRTS:
        jmp     WorksetSave                           ; 909C 4C 61 97                 La.

; ----------------------------------------------------------------------------
ShellPricePerPowerLevel:
        .byte $03 ;  3 shells to upgrade from power level 1
        .byte $05 ;  5 shells to upgrade from power level 2
        .byte $07 ;  7 shells to upgrade from power level 3
        .byte $0A ; 10 shells to upgrade from power level 4
        .byte $0F ; 15 shells to upgrade from power level 5
        .byte $14 ; 20 shells to upgrade from power level 6
        .byte $19 ; 25 shells to upgrade from power level 7
        .byte $1E ; 30 shells to upgrade from power level 8

; ----------------------------------------------------------------------------
L90A7:
        @TempPointer = $44
        lda     Workset + EntityV14
        cmp     Workset + EntityV15
        beq     @Done
        sta     Workset + EntityV15
        asl     a
        tay
        lda     Workset + EntityType
        asl     a
        tax
        lda     @Animations,x
        sta     @TempPointer
        lda     @Animations+1,x
        sta     @TempPointer+1
        lda     Workset + EntityActive
        and     #$CF
        ora     (@TempPointer),y
        sta     Workset + EntityActive
        iny
        lda     (@TempPointer),y
        jsr     WorksetAnimationPlay
@Done:
        rts
@Animations:
        .addr @BoatAnimations
        .addr @BoatAnimations
        .addr @BoatAnimations

@BoatAnimations:
.byte $00,AnimationMapBoatEW
.byte $00,AnimationMapBoatEW
.byte $00,AnimationMapBoatS
.byte $00,AnimationMapBoatS
.byte $10,AnimationMapBoatEW
.byte $10,AnimationMapBoatEW
.byte $00,AnimationMapBoatN
.byte $00,AnimationMapBoatN
.byte $00,AnimationMapBoatStillEW
.byte $00,AnimationMapBoatStillEW
.byte $00,AnimationMapBoatStillS
.byte $00,AnimationMapBoatStillS
.byte $10,AnimationMapBoatStillEW
.byte $10,AnimationMapBoatStillEW
.byte $00,AnimationMapBoatStillN
.byte $00,AnimationMapBoatStillN

; ----------------------------------------------------------------------------
L90F4:
        lda     Workset + EntityType                             ; 90F4 A5 21                    .!
        asl     a                               ; 90F6 0A                       .
        tax                                     ; 90F7 AA                       .
        lda     PTRS,x                         ; 90F8 BD 0D 91                 ...
        sta     $44                             ; 90FB 85 44                    .D
        lda     PTRS+1,x                         ; 90FD BD 0E 91                 ...
        sta     $45                             ; 9100 85 45                    .E
        lda     Joy1Inputs                           ; 9102 AD 30 03                 .0.
        lsr     a                               ; 9105 4A                       J
        lsr     a                               ; 9106 4A                       J
        lsr     a                               ; 9107 4A                       J
        lsr     a                               ; 9108 4A                       J
        tay                                     ; 9109 A8                       .
        lda     ($44),y                         ; 910A B1 44                    .D
        rts                                     ; 910C 60                       `


PTRS:
.addr PTRS2
.addr PTRS2
.addr PTRS2

PTRS2:
.byte $08, $06, $02, $08, $04, $04, $04, $08, $00, $00, $00, $08, $08, $08, $08, $08

; ----------------------------------------------------------------------------
L9123:
        lda     Workset + EntityV14                             ; 9123 A5 34                    .4
        asl     a                               ; 9125 0A                       .
        asl     a                               ; 9126 0A                       .
        tax                                     ; 9127 AA                       .
        lda     L913D,x                         ; 9128 BD 3D 91                 .=.
        sta     Workset + EntityV10                             ; 912B 85 30                    .0
        lda     L913E,x                         ; 912D BD 3E 91                 .>.
        sta     Workset + EntityXSpeed                             ; 9130 85 31                    .1
        lda     L913F,x                         ; 9132 BD 3F 91                 .?.
        sta     Workset + EntityV12                            ; 9135 85 32                    .2
        lda     L9140,x                         ; 9137 BD 40 91                 .@.
        sta     Workset + EntityYSpeed                             ; 913A 85 33                    .3
        rts                                     ; 913C 60                       `

; ----------------------------------------------------------------------------
L913D:
        .byte   $00                             ; 913D 00                       .
L913E:
        .byte   $01                             ; 913E 01                       .
L913F:
        .byte   $00                             ; 913F 00                       .
L9140:
        .byte   $00,$00,$01,$00,$01,$00,$00,$00 ; 9140 00 00 01 00 01 00 00 00  ........
        .byte   $01,$00,$FF,$00,$01,$00,$FF,$00 ; 9148 01 00 FF 00 01 00 FF 00  ........
        .byte   $00,$00,$FF,$00,$FF,$00,$00,$00 ; 9150 00 00 FF 00 FF 00 00 00  ........
        .byte   $FF,$00,$01,$00,$FF             ; 9158 FF 00 01 00 FF           .....
; ----------------------------------------------------------------------------
L915D:
        lda     Workset + EntityV14                             ; 915D A5 34                    .4
        asl     a                               ; 915F 0A                       .
        tax                                     ; 9160 AA                       .
        ldy     L9176,x                         ; 9161 BC 76 91                 .v.
        lda     L9175,x                         ; 9164 BD 75 91                 .u.
        tax                                     ; 9167 AA                       .
        jsr     L95F5                           ; 9168 20 F5 95                  ..
        cmp     #$0A                            ; 916B C9 0A                    ..
        bcc     L9172                           ; 916D 90 03                    ..
        cmp     #$0C                            ; 916F C9 0C                    ..
        rts                                     ; 9171 60                       `

; ----------------------------------------------------------------------------
L9172:
        cmp     #$04                            ; 9172 C9 04                    ..
        rts                                     ; 9174 60                       `

; ----------------------------------------------------------------------------
L9175:
        .byte   $10                             ; 9175 10                       .
L9176:
        .byte   $00,$10,$10,$00,$10,$F0,$10,$F0 ; 9176 00 10 10 00 10 F0 10 F0  ........
        .byte   $00,$F0,$F0,$00,$F0,$10,$F0     ; 917E 00 F0 F0 00 F0 10 F0     .......
; ----------------------------------------------------------------------------
MapShowSubmarine:
        bit     MapSubmarineVisible
        bmi     @ShowSubmarine
        rts
@ShowSubmarine:
        bvs     @Done
        lda     #$C0
        sta     MapSubmarineVisible
        jsr     RNGAdvance
        and     #$06
        tax
        lda     MapSubmarineSpawnLocations,x
        sta     MapSubmarineX
        lda     MapSubmarineSpawnLocations+1,x
        sta     MapSubmarineY
        lda     #$00
        sta     $06A0
@Done:
        bit     $06A0
        bvc     L91AF
        rts

; ----------------------------------------------------------------------------
L91AF:
        lda     #<PlayerProjectile1Data
        sta     WorksetPtr
        lda     #>PlayerProjectile1Data
        sta     WorksetPtr+1
        jsr     WorksetLoad
        lda     #$C0
        sta     Workset + EntityActive
        lda     #$00
        sta     Workset + (EntityX + 1)
        sta     Workset + (EntityY + 1)
        lda     MapSubmarineX
        sec
        rol     a
        rol     Workset + (EntityX  + 1)
        asl     a
        rol     Workset + (EntityX  + 1)
        asl     a
        rol     Workset + (EntityX  + 1)
        asl     a
        rol     Workset + (EntityX  + 1)
        sta     Workset + EntityX
        lda     MapSubmarineY
        sec
        rol     a
        rol     Workset + (EntityY + 1)
        asl     a
        rol     Workset + (EntityY + 1)
        asl     a
        rol     Workset + (EntityY + 1)
        asl     a
        rol     Workset + (EntityY + 1)
        sta     Workset + EntityY
        lda     #AnimationMapSubmarine
        jsr     WorksetAnimationPlay
        jmp     WorksetSave

; ----------------------------------------------------------------------------
MapSubmarineSpawnLocations:
        .byte $09, $04
        .byte $1A, $11
        .byte $1E, $01
        .byte $07, $15


; ----------------------------------------------------------------------------
EncounterRunPlayer:
        jsr     LoadPlayerWorkset                           ; 91F8 20 4C 97                  L.
        lda     Workset + EntityType                             ; 91FB A5 21                    .!
        jsr     JumpEngine                           ; 91FD 20 39 8F                  9.
        .addr   EncounterRunPlayerBoat
        .addr   EncounterRunPlayerSubmarine
        .addr   EncounterRunPlayerSwim

; ----------------------------------------------------------------------------
EncounterRunPlayerBoat:
        bit     Workset + EntityActive
        bvs     L9231
        lda     #$80
        sta     Workset + EntityX
        lda     #$10
        sta     Workset + EntityX  + 1
        lda     WaterHeight
        sec
        sbc     #$03
        sta     Workset + EntityY
        lda     WaterHeight+1
        sbc     #$00
        sta     Workset + EntityY + 1
        lda     #$20
        sta     Workset + EntityV1D
        lda     #AnimationEncounterBoat
        jsr     WorksetAnimationPlay
        lda     #$C0
        sta     Workset + EntityActive
        jmp     WorksetSave
L9231:
        lda     EncounterJawsActive                           ; 9231 AD 4B 03                 .K.
        beq     L923D                           ; 9234 F0 07                    ..
        dec     Workset + EntityV1D                             ; 9236 C6 3D                    .=
        beq     L9241                           ; 9238 F0 07                    ..
        jmp     WorksetSave                           ; 923A 4C 61 97                 La.
; ----------------------------------------------------------------------------
L923D:
        bit     Workset + EntityV1F                             ; 923D 24 3F                    $?
        bpl     L925F                           ; 923F 10 1E                    ..
L9241:
        lda     Workset + EntityActive                             ; 9241 A5 20                    . 
        and     #$BF                            ; 9243 29 BF                    ).
        sta     Workset + EntityActive                             ; 9245 85 20                    . 
        lda     #SFXEncounterBoatDespawn                            ; 9247 A9 0F                    ..
        jsr     SoundPlay                           ; 9249 20 CD E2                  ..
        lda     EncounterType                           ; 924C AD 8A 03                 ...
        bne     L9258                           ; 924F D0 07                    ..
        lda     #$02                            ; 9251 A9 02                    ..
        sta     Workset + EntityType                             ; 9253 85 21                    .!
        jmp     EncounterRunPlayerSwim                           ; 9255 4C 56 94                 LV.

; ----------------------------------------------------------------------------
L9258:
        lda     #$01                            ; 9258 A9 01                    ..
        sta     Workset + EntityType                             ; 925A 85 21                    .!
        jmp     EncounterRunPlayerSubmarine                           ; 925C 4C FE 92                 L..

; ----------------------------------------------------------------------------
L925F:
        bit     Joy1Inputs                           ; 925F 2C 30 03                 ,0.
        bpl     L9297                           ; 9262 10 33                    .3
        lda     Workset + EntityActive                             ; 9264 A5 20                    . 
        and     #$EF                            ; 9266 29 EF                    ).
        sta     Workset + EntityActive                             ; 9268 85 20                    . 
        lda     PlayerCrabLevel                           ; 926A AD 92 03                 ...
        asl     a                               ; 926D 0A                       .
        tax                                     ; 926E AA                       .
        lda     $2C                             ; 926F A5 2C                    .,
        clc                                     ; 9271 18                       .
        adc     L92F4,x                         ; 9272 7D F4 92                 }..
        sta     $2C                             ; 9275 85 2C                    .,
        lda     Workset + EntityX                             ; 9277 A5 22                    ."
        adc     L92F5,x                         ; 9279 7D F5 92                 }..
        sta     Workset + EntityX                             ; 927C 85 22                    ."
        tay                                     ; 927E A8                       .
        lda     Workset + EntityX  + 1                            ; 927F A5 23                    .#
        adc     #$00                            ; 9281 69 00                    i.
        sta     Workset + EntityX  + 1                            ; 9283 85 23                    .#
        cpy     #$E0                            ; 9285 C0 E0                    ..
        sbc     #$10                            ; 9287 E9 10                    ..
        bcc     L9297                           ; 9289 90 0C                    ..
        .byte   $A9,$00,$85,$2C,$A9,$E0,$85,$22 ; 928B A9 00 85 2C A9 E0 85 22  ...,..."
        .byte   $A9,$10,$85,$23                 ; 9293 A9 10 85 23              ...#
; ----------------------------------------------------------------------------
L9297:
        bit     Joy1Inputs                           ; 9297 2C 30 03                 ,0.
        bvc     L92CF                           ; 929A 50 33                    P3
        lda     Workset + EntityActive                             ; 929C A5 20                    . 
        ora     #$10                            ; 929E 09 10                    ..
        sta     Workset + EntityActive                             ; 92A0 85 20                    . 
        lda     PlayerCrabLevel                           ; 92A2 AD 92 03                 ...
        asl     a                               ; 92A5 0A                       .
        tax                                     ; 92A6 AA                       .
        lda     $2C                             ; 92A7 A5 2C                    .,
        sec                                     ; 92A9 38                       8
        sbc     L92F4,x                         ; 92AA FD F4 92                 ...
        sta     $2C                             ; 92AD 85 2C                    .,
        lda     Workset + EntityX                             ; 92AF A5 22                    ."
        sbc     L92F5,x                         ; 92B1 FD F5 92                 ...
        sta     Workset + EntityX                             ; 92B4 85 22                    ."
        tay                                     ; 92B6 A8                       .
        lda     Workset + EntityX  + 1                            ; 92B7 A5 23                    .#
        sbc     #$00                            ; 92B9 E9 00                    ..
        sta     Workset + EntityX  + 1                            ; 92BB 85 23                    .#
        cpy     #$1F                            ; 92BD C0 1F                    ..
        sbc     #$10                            ; 92BF E9 10                    ..
        bcs     L92CF                           ; 92C1 B0 0C                    ..
        lda     #$00                            ; 92C3 A9 00                    ..
        sta     $2C                             ; 92C5 85 2C                    .,
        lda     #$20                            ; 92C7 A9 20                    . 
        sta     Workset + EntityX                             ; 92C9 85 22                    ."
        lda     #$10                            ; 92CB A9 10                    ..
        sta     Workset + EntityX  + 1                            ; 92CD 85 23                    .#
L92CF:
        lda     #$03                            ; 92CF A9 03                    ..
        bit     Joy1Pressed                           ; 92D1 2C 32 03                 ,2.
        beq     L92F1                           ; 92D4 F0 1B                    ..
        jsr     L95D0                           ; 92D6 20 D0 95                  ..
        bmi     L92F1                           ; 92D9 30 16                    0.
        lda     #$00                            ; 92DB A9 00                    ..
        sta     $06A1,x                         ; 92DD 9D A1 06                 ...
        lda     #$01                            ; 92E0 A9 01                    ..
        bit     Joy1Pressed                           ; 92E2 2C 32 03                 ,2.
        beq     L92EC                           ; 92E5 F0 05                    ..
        lda     #$80                            ; 92E7 A9 80                    ..
        jmp     L92EE                           ; 92E9 4C EE 92                 L..

; ----------------------------------------------------------------------------
L92EC:
        .byte   $A9,$90                         ; 92EC A9 90                    ..
; ----------------------------------------------------------------------------
L92EE:
        sta     $06A0,x                         ; 92EE 9D A0 06                 ...
L92F1:
        jmp     WorksetSave                           ; 92F1 4C 61 97                 La.

; ----------------------------------------------------------------------------
L92F4:
        .byte   $00                             ; 92F4 00                       .
L92F5:
        .byte   $01,$40,$01,$80,$01,$C0,$01,$00 ; 92F5 01 40 01 80 01 C0 01 00  .@......
        .byte   $02                             ; 92FD 02                       .
; ----------------------------------------------------------------------------
EncounterRunPlayerSubmarine:
        bit     Workset + EntityActive                             ; 92FE 24 20                    $ 
        bvs     L931A                           ; 9300 70 18                    p.
        lda     Workset + EntityActive                             ; 9302 A5 20                    . 
        and     #$90                            ; 9304 29 90                    ).
        ora     #$42                            ; 9306 09 42                    .B
        sta     Workset + EntityActive                             ; 9308 85 20                    . 
        lda     #AnimationEncounterSubmarine                            ; 930A A9 21                    .!
        jsr     WorksetAnimationPlay                           ; 930C 20 AD 97                  ..
        lda     #$00                            ; 930F A9 00                    ..
        sta     Workset + EntityV1F                             ; 9311 85 3F                    .?
        lda     #$B4                            ; 9313 A9 B4                    ..
        sta     Workset + EntityV1D                             ; 9315 85 3D                    .=
        jmp     WorksetSave                           ; 9317 4C 61 97                 La.

; ----------------------------------------------------------------------------
L931A:
        lda     Workset + EntityV1D                             ; 931A A5 3D                    .=
        beq     L9328                           ; 931C F0 0A                    ..
        dec     Workset + EntityV1D                             ; 931E C6 3D                    .=
        bne     L9343                           ; 9320 D0 21                    .!
        lda     Workset + EntityActive                             ; 9322 A5 20                    . 
        and     #$FD                            ; 9324 29 FD                    ).
        sta     Workset + EntityActive                             ; 9326 85 20                    . 
L9328:
        bit     Workset + EntityV1F                             ; 9328 24 3F                    $?
        bpl     L9343                           ; 932A 10 17                    ..
        lda     Workset + EntityActive                             ; 932C A5 20                    . 
        and     #$BF                            ; 932E 29 BF                    ).
        sta     Workset + EntityActive                             ; 9330 85 20                    . 
        lda     #$00                            ; 9332 A9 00                    ..
        sta     EncounterType                           ; 9334 8D 8A 03                 ...
        lda     #$02                            ; 9337 A9 02                    ..
        sta     Workset + EntityType                             ; 9339 85 21                    .!
        lda     #SFXEncounterBoatDespawnDupe                            ; 933B A9 11                    ..
        jsr     SoundPlay                           ; 933D 20 CD E2                  ..
        jmp     EncounterRunPlayerSwim                           ; 9340 4C 56 94                 LV.

; ----------------------------------------------------------------------------
L9343:
        bit     Joy1Inputs                           ; 9343 2C 30 03                 ,0.
        bpl     L936D                           ; 9346 10 25                    .%
        lda     #$20                            ; 9348 A9 20                    . 
        sta     $16                             ; 934A 85 16                    ..
        lda     #$00                            ; 934C A9 00                    ..
        sta     $17                             ; 934E 85 17                    ..
        lda     PlayerCrabLevel                           ; 9350 AD 92 03                 ...
        asl     a                               ; 9353 0A                       .
        tax                                     ; 9354 AA                       .
        lda     L9442,x                         ; 9355 BD 42 94                 .B.
        sta     $18                             ; 9358 85 18                    ..
        lda     L9443,x                         ; 935A BD 43 94                 .C.
        sta     $19                             ; 935D 85 19                    ..
        ldx     #$10                            ; 935F A2 10                    ..
        jsr     L9882                           ; 9361 20 82 98                  ..
        lda     Workset + EntityActive                             ; 9364 A5 20                    . 
        and     #$EF                            ; 9366 29 EF                    ).
        sta     Workset + EntityActive                             ; 9368 85 20                    . 
        jmp     L9399                           ; 936A 4C 99 93                 L..

; ----------------------------------------------------------------------------
L936D:
        bvs     L9377                           ; 936D 70 08                    p.
        ldy     #$10                            ; 936F A0 10                    ..
        jsr     L98B8                           ; 9371 20 B8 98                  ..
        jmp     L9399                           ; 9374 4C 99 93                 L..

; ----------------------------------------------------------------------------
L9377:
        lda     #$E0                            ; 9377 A9 E0                    ..
        sta     $16                             ; 9379 85 16                    ..
        lda     #$FF                            ; 937B A9 FF                    ..
        sta     $17                             ; 937D 85 17                    ..
        lda     PlayerCrabLevel                           ; 937F AD 92 03                 ...
        asl     a                               ; 9382 0A                       .
        tax                                     ; 9383 AA                       .
        lda     L944C,x                         ; 9384 BD 4C 94                 .L.
        sta     $18                             ; 9387 85 18                    ..
        lda     L944D,x                         ; 9389 BD 4D 94                 .M.
        sta     $19                             ; 938C 85 19                    ..
        ldx     #$10                            ; 938E A2 10                    ..
        jsr     L9882                           ; 9390 20 82 98                  ..
        lda     Workset + EntityActive                             ; 9393 A5 20                    . 
        ora     #$10                            ; 9395 09 10                    ..
        sta     Workset + EntityActive                             ; 9397 85 20                    . 
L9399:
        lda     #$20                            ; 9399 A9 20                    . 
        bit     Joy1Inputs                           ; 939B 2C 30 03                 ,0.
        beq     L93BF                           ; 939E F0 1F                    ..
        lda     #$20                            ; 93A0 A9 20                    . 
        sta     $16                             ; 93A2 85 16                    ..
        lda     #$00                            ; 93A4 A9 00                    ..
        sta     $17                             ; 93A6 85 17                    ..
        lda     PlayerCrabLevel                           ; 93A8 AD 92 03                 ...
        asl     a                               ; 93AB 0A                       .
        tax                                     ; 93AC AA                       .
        lda     L9442,x                         ; 93AD BD 42 94                 .B.
        sta     $18                             ; 93B0 85 18                    ..
        lda     L9443,x                         ; 93B2 BD 43 94                 .C.
        sta     $19                             ; 93B5 85 19                    ..
        ldx     #$12                            ; 93B7 A2 12                    ..
        jsr     L9882                           ; 93B9 20 82 98                  ..
        jmp     L93EA                           ; 93BC 4C EA 93                 L..

; ----------------------------------------------------------------------------
L93BF:
        lda     #$10                            ; 93BF A9 10                    ..
        bit     Joy1Inputs                           ; 93C1 2C 30 03                 ,0.
        bne     L93CE                           ; 93C4 D0 08                    ..
        ldy     #$10                            ; 93C6 A0 10                    ..
        jsr     L98BD                           ; 93C8 20 BD 98                  ..
        jmp     L93EA                           ; 93CB 4C EA 93                 L..

; ----------------------------------------------------------------------------
L93CE:
        lda     #$E0                            ; 93CE A9 E0                    ..
        sta     $16                             ; 93D0 85 16                    ..
        lda     #$FF                            ; 93D2 A9 FF                    ..
        sta     $17                             ; 93D4 85 17                    ..
        lda     PlayerCrabLevel                           ; 93D6 AD 92 03                 ...
        asl     a                               ; 93D9 0A                       .
        tax                                     ; 93DA AA                       .
        lda     L944C,x                         ; 93DB BD 4C 94                 .L.
        sta     $18                             ; 93DE 85 18                    ..
        lda     L944D,x                         ; 93E0 BD 4D 94                 .M.
        sta     $19                             ; 93E3 85 19                    ..
        ldx     #$12                            ; 93E5 A2 12                    ..
        jsr     L9882                           ; 93E7 20 82 98                  ..
L93EA:
        jsr     WorksetMoveX                           ; 93EA 20 FA 97                  ..
        jsr     L981B                           ; 93ED 20 1B 98                  ..
        ldx     Workset + EntityX                             ; 93F0 A6 22                    ."
        lda     Workset + EntityX  + 1                            ; 93F2 A5 23                    .#
        cpx     #$10                            ; 93F4 E0 10                    ..
        sbc     #$10                            ; 93F6 E9 10                    ..
        bcs     L9404                           ; 93F8 B0 0A                    ..
        lda     #$10                            ; 93FA A9 10                    ..
        sta     Workset + EntityX                             ; 93FC 85 22                    ."
        lda     #$10                            ; 93FE A9 10                    ..
        sta     Workset + EntityX  + 1                            ; 9400 85 23                    .#
        bne     L9414                           ; 9402 D0 10                    ..
L9404:
        lda     Workset + EntityX  + 1                            ; 9404 A5 23                    .#
        cpx     #$F0                            ; 9406 E0 F0                    ..
        sbc     #$10                            ; 9408 E9 10                    ..
        bcc     L9414                           ; 940A 90 08                    ..
        lda     #$F0                            ; 940C A9 F0                    ..
        sta     Workset + EntityX                             ; 940E 85 22                    ."
        lda     #$10                            ; 9410 A9 10                    ..
        sta     Workset + EntityX  + 1                            ; 9412 85 23                    .#
L9414:
        jsr     L99F2                           ; 9414 20 F2 99                  ..
        bcs     L941C                           ; 9417 B0 03                    ..
        jsr     L99D0                           ; 9419 20 D0 99                  ..
L941C:
        lda     #$03                            ; 941C A9 03                    ..
        bit     Joy1Pressed                           ; 941E 2C 32 03                 ,2.
        beq     L943F                           ; 9421 F0 1C                    ..
        jsr     L95D0                           ; 9423 20 D0 95                  ..
        bmi     L943F                           ; 9426 30 17                    0.
        lda     #$01                            ; 9428 A9 01                    ..
        bit     Joy1Pressed                           ; 942A 2C 32 03                 ,2.
        beq     L9433                           ; 942D F0 04                    ..
        lda     #$02                            ; 942F A9 02                    ..
        bne     L9435                           ; 9431 D0 02                    ..
L9433:
        .byte   $A9,$01                         ; 9433 A9 01                    ..
; ----------------------------------------------------------------------------
L9435:
        sta     $06A1,x                         ; 9435 9D A1 06                 ...
        lda     Workset + EntityActive                             ; 9438 A5 20                    . 
        and     #$90                            ; 943A 29 90                    ).
        sta     $06A0,x                         ; 943C 9D A0 06                 ...
L943F:
        jmp     WorksetSave                           ; 943F 4C 61 97                 La.

; ----------------------------------------------------------------------------
L9442:
        .byte   $00                             ; 9442 00                       .
L9443:
        .byte   $01,$40,$01,$80,$01,$C0,$01,$00 ; 9443 01 40 01 80 01 C0 01 00  .@......
        .byte   $02                             ; 944B 02                       .
L944C:
        .byte   $00                             ; 944C 00                       .
L944D:
        .byte   $FF,$C0,$FE,$80,$FE,$40,$FE,$00 ; 944D FF C0 FE 80 FE 40 FE 00  .....@..
        .byte   $FE                             ; 9455 FE                       .
; ----------------------------------------------------------------------------
EncounterRunPlayerSwim:
        bit     Workset + EntityActive                             ; 9456 24 20                    $ 
        bvs     L9472                           ; 9458 70 18                    p.
        lda     Workset + EntityActive                             ; 945A A5 20                    . 
        and     #$90                            ; 945C 29 90                    ).
        ora     #$42                            ; 945E 09 42                    .B
        sta     Workset + EntityActive                             ; 9460 85 20                    . 
        lda     #AnimationEncounterSwim                            ; 9462 A9 23                    .#
        jsr     WorksetAnimationPlay                           ; 9464 20 AD 97                  ..
        lda     #$00                            ; 9467 A9 00                    ..
        sta     Workset + EntityV1F                             ; 9469 85 3F                    .?
        lda     #$B4                            ; 946B A9 B4                    ..
        sta     Workset + EntityV1D                             ; 946D 85 3D                    .=
        jmp     WorksetSave                           ; 946F 4C 61 97                 La.

; ----------------------------------------------------------------------------
L9472:
        lda     Workset + EntityV1D                             ; 9472 A5 3D                    .=
        beq     L9480                           ; 9474 F0 0A                    ..
        dec     Workset + EntityV1D                             ; 9476 C6 3D                    .=
        bne     L948F                           ; 9478 D0 15                    ..
        lda     Workset + EntityActive                             ; 947A A5 20                    . 
        and     #$FD                            ; 947C 29 FD                    ).
        sta     Workset + EntityActive                             ; 947E 85 20                    . 
L9480:
        bit     Workset + EntityV1F                             ; 9480 24 3F                    $?
        bpl     L948F                           ; 9482 10 0B                    ..
        lda     #SFXPlayerDeath                            ; 9484 A9 12                    ..
        jsr     SoundPlay                           ; 9486 20 CD E2                  ..
        lda     #$80                            ; 9489 A9 80                    ..
        sta     $0306                           ; 948B 8D 06 03                 ...
        rts                                     ; 948E 60                       `

; ----------------------------------------------------------------------------
L948F:
        bit     Joy1Inputs                           ; 948F 2C 30 03                 ,0.
        bpl     L94C2                           ; 9492 10 2E                    ..
        ldy     #$10                            ; 9494 A0 10                    ..
        lda     #$01                            ; 9496 A9 01                    ..
        bit     Joy1Pressed                           ; 9498 2C 32 03                 ,2.
        beq     L949F                           ; 949B F0 02                    ..
        ldy     #$80                            ; 949D A0 80                    ..
L949F:
        sty     $16                             ; 949F 84 16                    ..
        lda     #$00                            ; 94A1 A9 00                    ..
        sta     $17                             ; 94A3 85 17                    ..
        lda     PlayerCrabLevel                           ; 94A5 AD 92 03                 ...
        asl     a                               ; 94A8 0A                       .
        tax                                     ; 94A9 AA                       .
        lda     L95BC,x                         ; 94AA BD BC 95                 ...
        sta     $18                             ; 94AD 85 18                    ..
        lda     L95BD,x                         ; 94AF BD BD 95                 ...
        sta     $19                             ; 94B2 85 19                    ..
        ldx     #$10                            ; 94B4 A2 10                    ..
        jsr     L9882                           ; 94B6 20 82 98                  ..
        lda     Workset + EntityActive                             ; 94B9 A5 20                    . 
        and     #$EF                            ; 94BB 29 EF                    ).
        sta     Workset + EntityActive                             ; 94BD 85 20                    . 
        jmp     L9500                           ; 94BF 4C 00 95                 L..

; ----------------------------------------------------------------------------
L94C2:
        bvs     L94D5                           ; 94C2 70 11                    p.
        ldy     #$10                            ; 94C4 A0 10                    ..
        lda     #$01                            ; 94C6 A9 01                    ..
        bit     Joy1Pressed                           ; 94C8 2C 32 03                 ,2.
        beq     L94CF                           ; 94CB F0 02                    ..
        ldy     #$80                            ; 94CD A0 80                    ..
L94CF:
        jsr     L98B8                           ; 94CF 20 B8 98                  ..
        jmp     L9500                           ; 94D2 4C 00 95                 L..

; ----------------------------------------------------------------------------
L94D5:
        ldy     #$F0                            ; 94D5 A0 F0                    ..
        lda     #$01                            ; 94D7 A9 01                    ..
        bit     Joy1Pressed                           ; 94D9 2C 32 03                 ,2.
        beq     L94E0                           ; 94DC F0 02                    ..
        ldy     #$80                            ; 94DE A0 80                    ..
L94E0:
        sty     $16                             ; 94E0 84 16                    ..
        lda     #$FF                            ; 94E2 A9 FF                    ..
        sta     $17                             ; 94E4 85 17                    ..
        lda     PlayerCrabLevel                           ; 94E6 AD 92 03                 ...
        asl     a                               ; 94E9 0A                       .
        tax                                     ; 94EA AA                       .
        lda     L95C6,x                         ; 94EB BD C6 95                 ...
        sta     $18                             ; 94EE 85 18                    ..
        lda     L95C7,x                         ; 94F0 BD C7 95                 ...
        sta     $19                             ; 94F3 85 19                    ..
        ldx     #$10                            ; 94F5 A2 10                    ..
        jsr     L9882                           ; 94F7 20 82 98                  ..
        lda     Workset + EntityActive                             ; 94FA A5 20                    . 
        ora     #$10                            ; 94FC 09 10                    ..
        sta     Workset + EntityActive                             ; 94FE 85 20                    . 
L9500:
        lda     #$20                            ; 9500 A9 20                    . 
        bit     Joy1Inputs                           ; 9502 2C 30 03                 ,0.
        beq     L952F                           ; 9505 F0 28                    .(
        ldy     #$10                            ; 9507 A0 10                    ..
        lda     #$01                            ; 9509 A9 01                    ..
        bit     Joy1Pressed                           ; 950B 2C 32 03                 ,2.
        beq     L9512                           ; 950E F0 02                    ..
        ldy     #$80                            ; 9510 A0 80                    ..
L9512:
        sty     $16                             ; 9512 84 16                    ..
        lda     #$00                            ; 9514 A9 00                    ..
        sta     $17                             ; 9516 85 17                    ..
        lda     PlayerCrabLevel                           ; 9518 AD 92 03                 ...
        asl     a                               ; 951B 0A                       .
        tax                                     ; 951C AA                       .
        lda     L95BC,x                         ; 951D BD BC 95                 ...
        sta     $18                             ; 9520 85 18                    ..
        lda     L95BD,x                         ; 9522 BD BD 95                 ...
        sta     $19                             ; 9525 85 19                    ..
        ldx     #$12                            ; 9527 A2 12                    ..
        jsr     L9882                           ; 9529 20 82 98                  ..
        jmp     L956C                           ; 952C 4C 6C 95                 Ll.

; ----------------------------------------------------------------------------
L952F:
        lda     #$10                            ; 952F A9 10                    ..
        bit     Joy1Inputs                           ; 9531 2C 30 03                 ,0.
        bne     L9547                           ; 9534 D0 11                    ..
        ldy     #$10                            ; 9536 A0 10                    ..
        lda     #$01                            ; 9538 A9 01                    ..
        bit     Joy1Pressed                           ; 953A 2C 32 03                 ,2.
        beq     L9541                           ; 953D F0 02                    ..
        ldy     #$80                            ; 953F A0 80                    ..
L9541:
        jsr     L98BD                           ; 9541 20 BD 98                  ..
        jmp     L956C                           ; 9544 4C 6C 95                 Ll.

; ----------------------------------------------------------------------------
L9547:
        ldy     #$F0                            ; 9547 A0 F0                    ..
        lda     #$01                            ; 9549 A9 01                    ..
        bit     Joy1Pressed                           ; 954B 2C 32 03                 ,2.
        beq     L9552                           ; 954E F0 02                    ..
        .byte   $A0,$80                         ; 9550 A0 80                    ..
; ----------------------------------------------------------------------------
L9552:
        sty     $16                             ; 9552 84 16                    ..
        lda     #$FF                            ; 9554 A9 FF                    ..
        sta     $17                             ; 9556 85 17                    ..
        lda     PlayerCrabLevel                           ; 9558 AD 92 03                 ...
        asl     a                               ; 955B 0A                       .
        tax                                     ; 955C AA                       .
        lda     L95C6,x                         ; 955D BD C6 95                 ...
        sta     $18                             ; 9560 85 18                    ..
        lda     L95C7,x                         ; 9562 BD C7 95                 ...
        sta     $19                             ; 9565 85 19                    ..
        ldx     #$12                            ; 9567 A2 12                    ..
        jsr     L9882                           ; 9569 20 82 98                  ..
L956C:
        jsr     WorksetAnimationAdvance                           ; 956C 20 BE 97                  ..
        jsr     WorksetMoveX                           ; 956F 20 FA 97                  ..
        jsr     L981B                           ; 9572 20 1B 98                  ..
        ldx     Workset + EntityX                             ; 9575 A6 22                    ."
        lda     Workset + EntityX  + 1                            ; 9577 A5 23                    .#
        cpx     #$10                            ; 9579 E0 10                    ..
        sbc     #$10                            ; 957B E9 10                    ..
        bcs     L9589                           ; 957D B0 0A                    ..
        .byte   $A9,$10,$85,$22,$A9,$10,$85,$23 ; 957F A9 10 85 22 A9 10 85 23  ..."...#
        .byte   $D0,$10                         ; 9587 D0 10                    ..
; ----------------------------------------------------------------------------
L9589:
        lda     Workset + EntityX  + 1                            ; 9589 A5 23                    .#
        cpx     #$F0                            ; 958B E0 F0                    ..
        sbc     #$10                            ; 958D E9 10                    ..
        bcc     L9599                           ; 958F 90 08                    ..
        lda     #$F0                            ; 9591 A9 F0                    ..
        sta     Workset + EntityX                             ; 9593 85 22                    ."
        lda     #$10                            ; 9595 A9 10                    ..
        sta     Workset + EntityX  + 1                            ; 9597 85 23                    .#
L9599:
        jsr     L99F2                           ; 9599 20 F2 99                  ..
        bcs     L95A1                           ; 959C B0 03                    ..
        jsr     L99D0                           ; 959E 20 D0 99                  ..
L95A1:
        lda     #$02                            ; 95A1 A9 02                    ..
        bit     Joy1Pressed                           ; 95A3 2C 32 03                 ,2.
        beq     L95B9                           ; 95A6 F0 11                    ..
        jsr     L95D0                           ; 95A8 20 D0 95                  ..
        bmi     L95B9                           ; 95AB 30 0C                    0.
        lda     Workset + EntityActive                             ; 95AD A5 20                    . 
        and     #$90                            ; 95AF 29 90                    ).
        sta     $06A0,x                         ; 95B1 9D A0 06                 ...
        lda     #$03                            ; 95B4 A9 03                    ..
        sta     $06A1,x                         ; 95B6 9D A1 06                 ...
L95B9:
        jmp     WorksetSave                           ; 95B9 4C 61 97                 La.

; ----------------------------------------------------------------------------
L95BC:
        .byte   $00                             ; 95BC 00                       .
L95BD:
        .byte   $01,$40,$01,$80,$01,$C0,$01,$00 ; 95BD 01 40 01 80 01 C0 01 00  .@......
        .byte   $02                             ; 95C5 02                       .
L95C6:
        .byte   $00                             ; 95C6 00                       .
L95C7:
        .byte   $FF,$C0,$FE,$80,$FE,$40,$FE,$00 ; 95C7 FF C0 FE 80 FE 40 FE 00  .....@..
        .byte   $FE                             ; 95CF FE                       .
; ----------------------------------------------------------------------------
L95D0:
        ldx     #$00                            ; 95D0 A2 00                    ..
        lda     $06A0,x                         ; 95D2 BD A0 06                 ...
        bpl     L95E3                           ; 95D5 10 0C                    ..
        ldx     #$20                            ; 95D7 A2 20                    . 
        lda     $06A0,x                         ; 95D9 BD A0 06                 ...
        bpl     L95E3                           ; 95DC 10 05                    ..
        ldx     #$40                            ; 95DE A2 40                    .@
        lda     $06A0,x                         ; 95E0 BD A0 06                 ...
L95E3:
        rts                                     ; 95E3 60                       `

; ----------------------------------------------------------------------------
L95E4:
        lda     Workset + EntityX                             ; 95E4 A5 22                    ."
        sta     $16                             ; 95E6 85 16                    ..
        lda     Workset + EntityX  + 1                            ; 95E8 A5 23                    .#
        sta     $17                             ; 95EA 85 17                    ..
        lda     Workset + EntityY                             ; 95EC A5 24                    .$
        sta     $18                             ; 95EE 85 18                    ..
        lda     Workset + EntityY + 1                             ; 95F0 A5 25                    .%
        sta     $19                             ; 95F2 85 19                    ..
        rts                                     ; 95F4 60                       `

; ----------------------------------------------------------------------------
L95F5:
        jsr     L95E4                           ; 95F5 20 E4 95                  ..
        clc                                     ; 95F8 18                       .
        txa                                     ; 95F9 8A                       .
        bmi     L9607                           ; 95FA 30 0B                    0.
        adc     $16                             ; 95FC 65 16                    e.
        sta     $16                             ; 95FE 85 16                    ..
        lda     $17                             ; 9600 A5 17                    ..
        adc     #$00                            ; 9602 69 00                    i.
        jmp     L960F                           ; 9604 4C 0F 96                 L..

; ----------------------------------------------------------------------------
L9607:
        adc     $16                             ; 9607 65 16                    e.
        sta     $16                             ; 9609 85 16                    ..
        lda     $17                             ; 960B A5 17                    ..
        adc     #$FF                            ; 960D 69 FF                    i.
L960F:
        sta     $17                             ; 960F 85 17                    ..
        clc                                     ; 9611 18                       .
        tya                                     ; 9612 98                       .
        bmi     L9620                           ; 9613 30 0B                    0.
        adc     $18                             ; 9615 65 18                    e.
        sta     $18                             ; 9617 85 18                    ..
        lda     $19                             ; 9619 A5 19                    ..
        adc     #$00                            ; 961B 69 00                    i.
        jmp     L9628                           ; 961D 4C 28 96                 L(.

; ----------------------------------------------------------------------------
L9620:
        adc     $18                             ; 9620 65 18                    e.
        sta     $18                             ; 9622 85 18                    ..
        lda     $19                             ; 9624 A5 19                    ..
        adc     #$FF                            ; 9626 69 FF                    i.
L9628:
        sta     $19                             ; 9628 85 19                    ..
        jmp     L962D                           ; 962A 4C 2D 96                 L-.

; ----------------------------------------------------------------------------
L962D:
        lda     $18                             ; 962D A5 18                    ..
        and     #$F0                            ; 962F 29 F0                    ).
        sta     $18                             ; 9631 85 18                    ..
        cmp     #$80                            ; 9633 C9 80                    ..
        lda     $19                             ; 9635 A5 19                    ..
        sbc     #$01                            ; 9637 E9 01                    ..
        bcs     L966B                           ; 9639 B0 30                    .0
        lda     $17                             ; 963B A5 17                    ..
        cmp     #$02                            ; 963D C9 02                    ..
        bcs     L966B                           ; 963F B0 2A                    .*
        lsr     a                               ; 9641 4A                       J
        lda     $16                             ; 9642 A5 16                    ..
        ror     a                               ; 9644 6A                       j
        lsr     a                               ; 9645 4A                       J
        lsr     a                               ; 9646 4A                       J
        lsr     a                               ; 9647 4A                       J
        lsr     a                               ; 9648 4A                       J
        ora     $18                             ; 9649 05 18                    ..
        clc                                     ; 964B 18                       .
        adc     #$00                            ; 964C 69 00                    i.
        sta     $18                             ; 964E 85 18                    ..
        lda     $19                             ; 9650 A5 19                    ..
        adc     #$FE                            ; 9652 69 FE                    i.
        sta     $19                             ; 9654 85 19                    ..
        ldy     #$00                            ; 9656 A0 00                    ..
        lda     ($18),y                         ; 9658 B1 18                    ..
        tax                                     ; 965A AA                       .
        lda     #$10                            ; 965B A9 10                    ..
        bit     $16                             ; 965D 24 16                    $.
        bne     L9667                           ; 965F D0 06                    ..
        txa                                     ; 9661 8A                       .
        lsr     a                               ; 9662 4A                       J
        lsr     a                               ; 9663 4A                       J
        lsr     a                               ; 9664 4A                       J
        lsr     a                               ; 9665 4A                       J
        rts                                     ; 9666 60                       `

; ----------------------------------------------------------------------------
L9667:
        txa                                     ; 9667 8A                       .
        and     #$0F                            ; 9668 29 0F                    ).
        rts                                     ; 966A 60                       `

; ----------------------------------------------------------------------------
L966B:
        .byte   $A9,$0F,$60                     ; 966B A9 0F 60                 ..`
; ----------------------------------------------------------------------------
MapRunCamera:
        lda     PlayerX                           ; 966E AD 82 06                 ...
        sec                                     ; 9671 38                       8
        sbc     #$80                            ; 9672 E9 80                    ..
        tax                                     ; 9674 AA                       .
        lda     PlayerX+1                           ; 9675 AD 83 06                 ...
        sbc     #$00                            ; 9678 E9 00                    ..
        tay                                     ; 967A A8                       .
        bcs     L9683                           ; 967B B0 06                    ..
        ldx     #$00                            ; 967D A2 00                    ..
        ldy     #$00                            ; 967F A0 00                    ..
        bcc     L968F                           ; 9681 90 0C                    ..
L9683:
        txa                                     ; 9683 8A                       .
        cmp     #$10                            ; 9684 C9 10                    ..
        tya                                     ; 9686 98                       .
        sbc     #$01                            ; 9687 E9 01                    ..
        bcc     L968F                           ; 9689 90 04                    ..
        ldx     #$10                            ; 968B A2 10                    ..
        ldy     #$01                            ; 968D A0 01                    ..
L968F:
        stx     $0328                           ; 968F 8E 28 03                 .(.
        sty     $0329                           ; 9692 8C 29 03                 .).
        txa                                     ; 9695 8A                       .
        sec                                     ; 9696 38                       8
        sbc     #$08                            ; 9697 E9 08                    ..
        sta     CameraX                           ; 9699 8D 38 03                 .8.
        sta     SCROLL_X                           ; 969C 8D 20 03                 . .
        tya                                     ; 969F 98                       .
        sbc     #$00                            ; 96A0 E9 00                    ..
        sta     CameraX+1                           ; 96A2 8D 39 03                 .9.
        lda     PlayerY                           ; 96A5 AD 84 06                 ...
        sec                                     ; 96A8 38                       8
        sbc     #$60                            ; 96A9 E9 60                    .`
        tax                                     ; 96AB AA                       .
        lda     PlayerY+1                           ; 96AC AD 85 06                 ...
        sbc     #$00                            ; 96AF E9 00                    ..
        tay                                     ; 96B1 A8                       .
        bcs     L96BA                           ; 96B2 B0 06                    ..
        ldx     #$00                            ; 96B4 A2 00                    ..
        ldy     #$00                            ; 96B6 A0 00                    ..
        bcc     L96C6                           ; 96B8 90 0C                    ..
L96BA:
        txa                                     ; 96BA 8A                       .
        cmp     #$C6                            ; 96BB C9 C6                    ..
        tya                                     ; 96BD 98                       .
        sbc     #$00                            ; 96BE E9 00                    ..
        bcc     L96C6                           ; 96C0 90 04                    ..
        .byte   $A2,$C6,$A0,$00                 ; 96C2 A2 C6 A0 00              ....
; ----------------------------------------------------------------------------
L96C6:
        stx     $032A                           ; 96C6 8E 2A 03                 .*.
        sty     $032B                           ; 96C9 8C 2B 03                 .+.
        txa                                     ; 96CC 8A                       .
        sec                                     ; 96CD 38                       8
        sbc     #$0F                            ; 96CE E9 0F                    ..
        sta     CameraY                           ; 96D0 8D 3A 03                 .:.
        tya                                     ; 96D3 98                       .
        sbc     #$00                            ; 96D4 E9 00                    ..
        sta     CameraY+1                           ; 96D6 8D 3B 03                 .;.
        txa                                     ; 96D9 8A                       .
        clc                                     ; 96DA 18                       .
        adc     #$10                            ; 96DB 69 10                    i.
        tax                                     ; 96DD AA                       .
        tya                                     ; 96DE 98                       .
        adc     #$00                            ; 96DF 69 00                    i.
        tay                                     ; 96E1 A8                       .
        txa                                     ; 96E2 8A                       .
        cmp     #$F0                            ; 96E3 C9 F0                    ..
        bcc     L96EA                           ; 96E5 90 03                    ..
        .byte   $69,$0F,$C8                     ; 96E7 69 0F C8                 i..
; ----------------------------------------------------------------------------
L96EA:
        sta     SCROLL_Y                           ; 96EA 8D 22 03                 .".
        sty     UseHighPPUNametables                           ; 96ED 8C 23 03                 .#.
        rts                                     ; 96F0 60                       `

; ----------------------------------------------------------------------------
L96F1:
        lda     PlayerY                           ; 96F1 AD 84 06                 ...
        sec                                     ; 96F4 38                       8
        sbc     #$60                            ; 96F5 E9 60                    .`
        tax                                     ; 96F7 AA                       .
        lda     PlayerY+1                           ; 96F8 AD 85 06                 ...
        sbc     #$00                            ; 96FB E9 00                    ..
        tay                                     ; 96FD A8                       .
        bcs     L9706                           ; 96FE B0 06                    ..
        ldx     #$00                            ; 9700 A2 00                    ..
        ldy     #$00                            ; 9702 A0 00                    ..
        beq     L9721                           ; 9704 F0 1B                    ..
L9706:
        lda     $033E                           ; 9706 AD 3E 03                 .>.
        sec                                     ; 9709 38                       8
        sbc     #$C0                            ; 970A E9 C0                    ..
        sta     $16                             ; 970C 85 16                    ..
        lda     $033F                           ; 970E AD 3F 03                 .?.
        sbc     #$00                            ; 9711 E9 00                    ..
        sta     $17                             ; 9713 85 17                    ..
        txa                                     ; 9715 8A                       .
        cmp     $16                             ; 9716 C5 16                    ..
        tya                                     ; 9718 98                       .
        sbc     $17                             ; 9719 E5 17                    ..
        bcc     L9721                           ; 971B 90 04                    ..
        ldx     $16                             ; 971D A6 16                    ..
        ldy     $17                             ; 971F A4 17                    ..
L9721:
        txa                                     ; 9721 8A                       .
        sec                                     ; 9722 38                       8
        sbc     #$0B                            ; 9723 E9 0B                    ..
        sta     CameraY                           ; 9725 8D 3A 03                 .:.
        tya                                     ; 9728 98                       .
        sbc     #$00                            ; 9729 E9 00                    ..
        sta     CameraY+1                           ; 972B 8D 3B 03                 .;.
        txa                                     ; 972E 8A                       .
        clc                                     ; 972F 18                       .
        adc     #$14                            ; 9730 69 14                    i.
        tax                                     ; 9732 AA                       .
        tya                                     ; 9733 98                       .
        adc     #$00                            ; 9734 69 00                    i.
        tay                                     ; 9736 A8                       .
        txa                                     ; 9737 8A                       .
        cmp     #$F0                            ; 9738 C9 F0                    ..
        bcc     L973F                           ; 973A 90 03                    ..
        .byte   $69,$0F,$C8                     ; 973C 69 0F C8                 i..
; ----------------------------------------------------------------------------
L973F:
        sta     SCROLL_Y                           ; 973F 8D 22 03                 .".
        sty     UseHighPPUNametables                           ; 9742 8C 23 03                 .#.
        rts                                     ; 9745 60                       `

; ----------------------------------------------------------------------------
L9746:
        lda     #$80                            ; 9746 A9 80                    ..
        sta     $0680                           ; 9748 8D 80 06                 ...
        rts                                     ; 974B 60                       `

; ----------------------------------------------------------------------------
LoadPlayerWorkset:
        lda     #<PlayerData                            ; 974C A9 80                    ..
        sta     WorksetPtr                             ; 974E 85 40                    .@
        lda     #>PlayerData                            ; 9750 A9 06                    ..
        sta     WorksetPtr+1                             ; 9752 85 41                    .A

WorksetLoad:
        ldy     #$00                            ; 9754 A0 00                    ..
@Continue:
        lda     (WorksetPtr),y                         ; 9756 B1 40                    .@
        sta     Workset,y                           ; 9758 99 20 00                 . .
        iny                                     ; 975B C8                       .
        cpy     #$20                            ; 975C C0 20                    . 
        bcc     @Continue                           ; 975E 90 F6                    ..
        rts                                     ; 9760 60                       `

; ----------------------------------------------------------------------------
WorksetSave:
        ldy     #$00                            ; 9761 A0 00                    ..
@Continue:
        lda     Workset,y                           ; 9763 B9 20 00                 . .
        sta     (WorksetPtr),y                         ; 9766 91 40                    .@
        iny                                     ; 9768 C8                       .
        cpy     #$20                            ; 9769 C0 20                    . 
        bcc     @Continue                           ; 976B 90 F6                    ..
        rts                                     ; 976D 60                       `

; ----------------------------------------------------------------------------
WorksetNext:
        lda     WorksetPtr                             ; 976E A5 40                    .@
        clc                                     ; 9770 18                       .
        adc     #$20                            ; 9771 69 20                    i 
        sta     WorksetPtr                             ; 9773 85 40                    .@
        lda     WorksetPtr+1                             ; 9775 A5 41                    .A
        adc     #$00                            ; 9777 69 00                    i.
        sta     WorksetPtr+1                             ; 9779 85 41                    .A
        rts                                     ; 977B 60                       `

; ----------------------------------------------------------------------------
; clear memory range from $680 to $800
ClearEntityMemory:
        @TempPointer = $16
        @BytesToClear = $18
        lda     #<PlayerData
        sta     @TempPointer
        lda     #>PlayerData
        sta     @TempPointer+1
        lda     #$80
        sta     @BytesToClear
        lda     #$01
        sta     @BytesToClear+1
        jmp     @ClearMemory
@ClearMemory:
        ldy     #$00
@KeepClearing:
        lda     #$00
        sta     (@TempPointer),y
        inc     @TempPointer
        bne     @Continue
        inc     @TempPointer+1
@Continue:
        lda     @BytesToClear
        sec
        sbc     #$01
        sta     @BytesToClear
        lda     @BytesToClear+1
        sbc     #$00
        sta     @BytesToClear+1
        ora     @BytesToClear
        ; keep clearing until BytesToClear is 0
        bne     @KeepClearing
        rts

; ----------------------------------------------------------------------------
WorksetAnimationPlay:
        asl a
        tax
        lda AnimationPointers,x
        sta Workset + (EntityAnimPtr + 0)
        lda AnimationPointers+1,x
        sta Workset + (EntityAnimPtr + 1)
        ldy #$00
        jmp WorksetAnimationAdvance2

WorksetAnimationAdvance:
        lda Workset + EntityAnimTimer
        beq WorksetAnimationRTS
        dec Workset + EntityAnimTimer
        bne WorksetAnimationRTS
        ldy Workset + EntityAnimOffset
WorksetAnimationAdvance2:
@RepeatAnimation:
        ; load frame duration for next spriteset
        lda (Workset + EntityAnimPtr),y
        iny
        ; if the duration is $FF, we've reached the end
        ; of our animation and it's time to repeat!
        cmp #$FF
        bne @KeepAnimating
        ldy #$00
        beq @RepeatAnimation
@KeepAnimating:
        ; store the current timer
        sta Workset + EntityAnimTimer
        ; load and store a pointer to the next spriteset
        lda (Workset + EntityAnimPtr),y
        iny
        sta Workset + (EntitySpritesetPtr + 0)
        lda (Workset + EntityAnimPtr),y
        iny
        sta Workset + (EntitySpritesetPtr + 1)
        ; store offset to the next frame
        sty Workset + EntityAnimOffset
        ; and load the address to the first sprite in the spriteset
        ldy #$00
        lda (Workset + EntitySpritesetPtr),y
        sta Workset + (EntitySpritesetDataPtr + 0)
        iny
        lda (Workset + EntitySpritesetPtr),y
        sta Workset + (EntitySpritesetDataPtr + 1)
        ; skip past the 2 byte spriteset header
        lda #$02
        clc
        adc Workset + (EntitySpritesetPtr + 0)
        sta Workset + EntitySpritesetPtr
        ; carry if needed
        lda Workset + (EntitySpritesetPtr + 1)
        adc #$00
        sta Workset + (EntitySpritesetPtr + 1)
WorksetAnimationRTS:
        rts

; ----------------------------------------------------------------------------
WorksetMoveX:
        lda     Workset + EntityV10
        clc
        adc     $2C
        sta     $2C
        lda     Workset + EntityXSpeed
        bmi     @MoveNegative
        adc     Workset + EntityX
        sta     Workset + EntityX
        lda     Workset + EntityX + 1
        adc     #$00
        sta     Workset + EntityX + 1
        rts
@MoveNegative:
        adc     Workset + EntityX
        sta     Workset + EntityX
        lda     Workset + EntityX + 1
        adc     #$FF
        sta     Workset + EntityX + 1
        rts

; ----------------------------------------------------------------------------
L981B:
        lda     Workset + EntityV12                            ; 981B A5 32                    .2
        clc                                     ; 981D 18                       .
        adc     $2D                             ; 981E 65 2D                    e-
        sta     $2D                             ; 9820 85 2D                    .-
        lda     Workset + EntityYSpeed                             ; 9822 A5 33                    .3
        bmi     L9831                           ; 9824 30 0B                    0.
        adc     Workset + EntityY                             ; 9826 65 24                    e$
        sta     Workset + EntityY                             ; 9828 85 24                    .$
        lda     Workset + EntityY + 1                             ; 982A A5 25                    .%
        adc     #$00                            ; 982C 69 00                    i.
        sta     Workset + EntityY + 1                             ; 982E 85 25                    .%
        rts                                     ; 9830 60                       `

; ----------------------------------------------------------------------------
L9831:
        adc     Workset + EntityY                             ; 9831 65 24                    e$
        sta     Workset + EntityY                             ; 9833 85 24                    .$
        lda     Workset + EntityY + 1                             ; 9835 A5 25                    .%
        adc     #$FF                            ; 9837 69 FF                    i.
        sta     Workset + EntityY + 1                             ; 9839 85 25                    .%
        rts                                     ; 983B 60                       `

; ----------------------------------------------------------------------------
L983C:
        ldx     #$10                            ; 983C A2 10                    ..
        jmp     L9843                           ; 983E 4C 43 98                 LC.

; ----------------------------------------------------------------------------
L9841:
        ldx     #$12                            ; 9841 A2 12                    ..
L9843:
        pha                                     ; 9843 48                       H
        clc                                     ; 9844 18                       .
        adc     $20,x                           ; 9845 75 20                    u 
        sta     $20,x                           ; 9847 95 20                    . 
        pla                                     ; 9849 68                       h
        bmi     @L9865                           ; 984A 30 19                    0.
        lda     #$00                            ; 984C A9 00                    ..
        adc     $21,x                           ; 984E 75 21                    u!
        sta     $21,x                           ; 9850 95 21                    .!
        tya                                     ; 9852 98                       .
        eor     $21,x                           ; 9853 55 21                    U!
        bmi     @ExitWithoutCarry                           ; 9855 30 29                    0)
        tya                                     ; 9857 98                       .
        clc                                     ; 9858 18                       .
        sbc     $21,x                           ; 9859 F5 21                    .!
        bcs     @ExitWithoutCarry                           ; 985B B0 23                    .#
        sty     $21,x                           ; 985D 94 21                    .!
        lda     #$00                            ; 985F A9 00                    ..
        sta     $20,x                           ; 9861 95 20                    . 
        beq     @ExitWithCarry                           ; 9863 F0 19                    ..
@L9865:
        lda     #$FF                            ; 9865 A9 FF                    ..
        adc     $21,x                           ; 9867 75 21                    u!
        sta     $21,x                           ; 9869 95 21                    .!
        tya                                     ; 986B 98                       .
        eor     $21,x                           ; 986C 55 21                    U!
        bmi     @ExitWithoutCarry                           ; 986E 30 10                    0.
        dey                                     ; 9870 88                       .
        tya                                     ; 9871 98                       .
        cmp     $21,x                           ; 9872 D5 21                    .!
        iny                                     ; 9874 C8                       .
        tya                                     ; 9875 98                       .
        bcc     @ExitWithoutCarry                           ; 9876 90 08                    ..
        sta     $21,x                           ; 9878 95 21                    .!
        lda     #$00                            ; 987A A9 00                    ..
        sta     $20,x                           ; 987C 95 20                    . 
@ExitWithCarry:
        sec                                     ; 987E 38                       8
        rts                                     ; 987F 60                       `
@ExitWithoutCarry:
        clc                                     ; 9880 18                       .
        rts                                     ; 9881 60                       `

; ----------------------------------------------------------------------------
L9882:
        lda     $16                             ; 9882 A5 16                    ..
        clc                                     ; 9884 18                       .
        adc     $20,x                           ; 9885 75 20                    u 
        sta     $20,x                           ; 9887 95 20                    . 
        lda     $17                             ; 9889 A5 17                    ..
        tay                                     ; 988B A8                       .
        adc     $21,x                           ; 988C 75 21                    u!
        sta     $21,x                           ; 988E 95 21                    .!
        tay                                     ; 9890 A8                       .
        clc                                     ; 9891 18                       .
        eor     $19                             ; 9892 45 19                    E.
        bmi     L98B7                           ; 9894 30 21                    0!
        tya                                     ; 9896 98                       .
        bmi     L98A5                           ; 9897 30 0C                    0.
        lda     $20,x                           ; 9899 B5 20                    . 
        cmp     $18                             ; 989B C5 18                    ..
        lda     $21,x                           ; 989D B5 21                    .!
        sbc     $19                             ; 989F E5 19                    ..
        bcs     L98AF                           ; 98A1 B0 0C                    ..
        bcc     L98B7                           ; 98A3 90 12                    ..
L98A5:
        lda     $18                             ; 98A5 A5 18                    ..
        cmp     $20,x                           ; 98A7 D5 20                    . 
        lda     $19                             ; 98A9 A5 19                    ..
        sbc     $21,x                           ; 98AB F5 21                    .!
        bcc     L98B7                           ; 98AD 90 08                    ..
L98AF:
        lda     $18                             ; 98AF A5 18                    ..
        sta     $20,x                           ; 98B1 95 20                    . 
        lda     $19                             ; 98B3 A5 19                    ..
        sta     $21,x                           ; 98B5 95 21                    .!
L98B7:
        rts                                     ; 98B7 60                       `

; ----------------------------------------------------------------------------
L98B8:
        ldx     #$10                            ; 98B8 A2 10                    ..
        jmp     L98BF                           ; 98BA 4C BF 98                 L..

; ----------------------------------------------------------------------------
L98BD:
        ldx     #$12                            ; 98BD A2 12                    ..
L98BF:
        lda     $21,x                           ; 98BF B5 21                    .!
        bpl     L98D3                           ; 98C1 10 10                    ..
        tya                                     ; 98C3 98                       .
        clc                                     ; 98C4 18                       .
        adc     $20,x                           ; 98C5 75 20                    u 
        sta     $20,x                           ; 98C7 95 20                    . 
        lda     $21,x                           ; 98C9 B5 21                    .!
        adc     #$00                            ; 98CB 69 00                    i.
        sta     $21,x                           ; 98CD 95 21                    .!
        bpl     L98E3                           ; 98CF 10 12                    ..
        clc                                     ; 98D1 18                       .
        rts                                     ; 98D2 60                       `

; ----------------------------------------------------------------------------
L98D3:
        tya                                     ; 98D3 98                       .
        eor     #$FF                            ; 98D4 49 FF                    I.
        sec                                     ; 98D6 38                       8
        adc     $20,x                           ; 98D7 75 20                    u 
        sta     $20,x                           ; 98D9 95 20                    . 
        lda     $21,x                           ; 98DB B5 21                    .!
        adc     #$FF                            ; 98DD 69 FF                    i.
        sta     $21,x                           ; 98DF 95 21                    .!
        bpl     L98EB                           ; 98E1 10 08                    ..
L98E3:
        lda     #$00                            ; 98E3 A9 00                    ..
        sta     $20,x                           ; 98E5 95 20                    . 
        sta     $21,x                           ; 98E7 95 21                    .!
        sec                                     ; 98E9 38                       8
        rts                                     ; 98EA 60                       `

; ----------------------------------------------------------------------------
L98EB:
        clc                                     ; 98EB 18                       .
        rts                                     ; 98EC 60                       `

; ----------------------------------------------------------------------------
L98ED:
        lda     #$00                            ; 98ED A9 00                    ..
        sta     Workset + EntityV10                             ; 98EF 85 30                    .0
        sta     Workset + EntityXSpeed                             ; 98F1 85 31                    .1
        sta     Workset + EntityV12                            ; 98F3 85 32                    .2
        sta     Workset + EntityYSpeed                             ; 98F5 85 33                    .3
        rts                                     ; 98F7 60                       `

; ----------------------------------------------------------------------------
L98F8:
        lda     #$A0                            ; 98F8 A9 A0                    ..
        sta     $42                             ; 98FA 85 42                    .B
        lda     #$06                            ; 98FC A9 06                    ..
        sta     $43                             ; 98FE 85 43                    .C
        lda     Workset + EntityV1F                             ; 9900 A5 3F                    .?
        and     #$BF                            ; 9902 29 BF                    ).
        sta     Workset + EntityV1F                             ; 9904 85 3F                    .?
        lda     #$03                            ; 9906 A9 03                    ..
        sta     $47                             ; 9908 85 47                    .G
L990A:
        ldy     #$00                            ; 990A A0 00                    ..
        lda     ($42),y                         ; 990C B1 42                    .B
        bpl     L992E                           ; 990E 10 1E                    ..
        and     #$40                            ; 9910 29 40                    )@
        beq     L992E                           ; 9912 F0 1A                    ..
        jsr     HitDetect                           ; 9914 20 69 99                  i.
        bcc     L992E                           ; 9917 90 15                    ..
        ldy     #$1F                            ; 9919 A0 1F                    ..
        lda     ($42),y                         ; 991B B1 42                    .B
        ora     #$80                            ; 991D 09 80                    ..
        sta     ($42),y                         ; 991F 91 42                    .B
        lda     Workset + EntityV1F                             ; 9921 A5 3F                    .?
        ora     #$40                            ; 9923 09 40                    .@
        sta     Workset + EntityV1F                             ; 9925 85 3F                    .?
        ldy     #$01                            ; 9927 A0 01                    ..
        lda     ($42),y                         ; 9929 B1 42                    .B
        sta     $034A                           ; 992B 8D 4A 03                 .J.
L992E:
        lda     $42                             ; 992E A5 42                    .B
        clc                                     ; 9930 18                       .
        adc     #$20                            ; 9931 69 20                    i 
        sta     $42                             ; 9933 85 42                    .B
        lda     $43                             ; 9935 A5 43                    .C
        adc     #$00                            ; 9937 69 00                    i.
        sta     $43                             ; 9939 85 43                    .C
        dec     $47                             ; 993B C6 47                    .G
        bne     L990A                           ; 993D D0 CB                    ..
        rts                                     ; 993F 60                       `

; ----------------------------------------------------------------------------
L9940:
        lda     #$02                            ; 9940 A9 02                    ..
        bit     $0680                           ; 9942 2C 80 06                 ,..
        bne     L9960                           ; 9945 D0 19                    ..
        lda     Workset + EntityV1F                             ; 9947 A5 3F                    .?
        and     #$7F                            ; 9949 29 7F                    ).
        sta     Workset + EntityV1F                             ; 994B 85 3F                    .?
        jsr     HitDetectAgainstPlayer                           ; 994D 20 61 99                  a.
        bcc     L9960                           ; 9950 90 0E                    ..
        lda     Workset + EntityV1F                             ; 9952 A5 3F                    .?
        ora     #$80                            ; 9954 09 80                    ..
        sta     Workset + EntityV1F                             ; 9956 85 3F                    .?
        lda     $069F                           ; 9958 AD 9F 06                 ...
        ora     #$80                            ; 995B 09 80                    ..
        sta     $069F                           ; 995D 8D 9F 06                 ...
L9960:
        rts                                     ; 9960 60                       `

; ----------------------------------------------------------------------------
HitDetectAgainstPlayer:
        lda     #<PlayerData                            ; 9961 A9 80                    ..
        sta     $42                             ; 9963 85 42                    .B
        lda     #>PlayerData                            ; 9965 A9 06                    ..
        sta     $43                             ; 9967 85 43                    .C
HitDetect:
        ldy     #$02                            ; 9969 A0 02                    ..
        lda     #$00                            ; 996B A9 00                    ..
        sta     $15                             ; 996D 85 15                    ..
        lda     ($42),y                         ; 996F B1 42                    .B
        sec                                     ; 9971 38                       8
        sbc     Workset + EntityX                             ; 9972 E5 22                    ."
        iny                                     ; 9974 C8                       .
        sta     $1A                             ; 9975 85 1A                    ..
        lda     ($42),y                         ; 9977 B1 42                    .B
        sbc     Workset + EntityX  + 1                            ; 9979 E5 23                    .#
        iny                                     ; 997B C8                       .
        sta     $1B                             ; 997C 85 1B                    ..
        bcs     @L9992                           ; 997E B0 12                    ..
        inc     $15                             ; 9980 E6 15                    ..
        eor     #$FF                            ; 9982 49 FF                    I.
        sta     $1B                             ; 9984 85 1B                    ..
        lda     $1A                             ; 9986 A5 1A                    ..
        eor     #$FF                            ; 9988 49 FF                    I.
        sta     $1A                             ; 998A 85 1A                    ..
        inc     $1A                             ; 998C E6 1A                    ..
        bne     @L9992                           ; 998E D0 02                    ..
        inc     $1B                             ; 9990 E6 1B                    ..
@L9992:
        lda     ($42),y                         ; 9992 B1 42                    .B
        sec                                     ; 9994 38                       8
        sbc     Workset + EntityY                             ; 9995 E5 24                    .$
        iny                                     ; 9997 C8                       .
        sta     $1C                             ; 9998 85 1C                    ..
        lda     ($42),y                         ; 999A B1 42                    .B
        sbc     Workset + EntityY + 1                             ; 999C E5 25                    .%
        sta     $1D                             ; 999E 85 1D                    ..
        bcs     @L99B6                           ; 99A0 B0 14                    ..
        inc     $15                             ; 99A2 E6 15                    ..
        inc     $15                             ; 99A4 E6 15                    ..
        eor     #$FF                            ; 99A6 49 FF                    I.
        sta     $1D                             ; 99A8 85 1D                    ..
        lda     $1C                             ; 99AA A5 1C                    ..
        eor     #$FF                            ; 99AC 49 FF                    I.
        sta     $1C                             ; 99AE 85 1C                    ..
        inc     $1C                             ; 99B0 E6 1C                    ..
        bne     @L99B6                           ; 99B2 D0 02                    ..
        .byte   $E6,$1D                         ; 99B4 E6 1D                    ..
; ----------------------------------------------------------------------------
@L99B6:
        clc                                     ; 99B6 18                       .
        lda     $1B                             ; 99B7 A5 1B                    ..
        ora     $1D                             ; 99B9 05 1D                    ..
        bne     @L99CF                           ; 99BB D0 12                    ..
        ldy     #$0E                            ; 99BD A0 0E                    ..
        lda     ($42),y                         ; 99BF B1 42                    .B
        adc     Workset + EntitySpritesetDataPtr                             ; 99C1 65 2E                    e.
        cmp     $1A                             ; 99C3 C5 1A                    ..
        bcc     @L99CF                           ; 99C5 90 08                    ..
        iny                                     ; 99C7 C8                       .
        lda     ($42),y                         ; 99C8 B1 42                    .B
        clc                                     ; 99CA 18                       .
        adc     Workset + (EntitySpritesetDataPtr + 1)                             ; 99CB 65 2F                    e/
        cmp     $1C                             ; 99CD C5 1C                    ..
@L99CF:
        rts                                     ; 99CF 60                       `

; ----------------------------------------------------------------------------
L99D0:
        lda     $033E                           ; 99D0 AD 3E 03                 .>.
        sec                                     ; 99D3 38                       8
        sbc     #$10                            ; 99D4 E9 10                    ..
        sta     $16                             ; 99D6 85 16                    ..
        lda     $033F                           ; 99D8 AD 3F 03                 .?.
        sbc     #$00                            ; 99DB E9 00                    ..
        sta     $17                             ; 99DD 85 17                    ..
        lda     Workset + EntityY                             ; 99DF A5 24                    .$
        cmp     $16                             ; 99E1 C5 16                    ..
        lda     Workset + EntityY + 1                             ; 99E3 A5 25                    .%
        sbc     $17                             ; 99E5 E5 17                    ..
        bcc     L99F1                           ; 99E7 90 08                    ..
        lda     $16                             ; 99E9 A5 16                    ..
        sta     Workset + EntityY                             ; 99EB 85 24                    .$
        lda     $17                             ; 99ED A5 17                    ..
        sta     Workset + EntityY + 1                             ; 99EF 85 25                    .%
L99F1:
        rts                                     ; 99F1 60                       `

; ----------------------------------------------------------------------------
L99F2:
        lda     Workset + (EntitySpritesetDataPtr  + 1)                             ; 99F2 A5 2F                    ./
        clc                                     ; 99F4 18                       .
        adc     WaterHeight                           ; 99F5 6D 3C 03                 m<.
        sta     $16                             ; 99F8 85 16                    ..
        lda     #$00                            ; 99FA A9 00                    ..
        adc     WaterHeight+1                           ; 99FC 6D 3D 03                 m=.
        sta     $17                             ; 99FF 85 17                    ..
        lda     $16                             ; 9A01 A5 16                    ..
        cmp     Workset + EntityY                             ; 9A03 C5 24                    .$
        lda     $17                             ; 9A05 A5 17                    ..
        sbc     Workset + EntityY + 1                             ; 9A07 E5 25                    .%
        bcc     L9A13                           ; 9A09 90 08                    ..
        lda     $16                             ; 9A0B A5 16                    ..
        sta     Workset + EntityY                             ; 9A0D 85 24                    .$
        lda     $17                             ; 9A0F A5 17                    ..
        sta     Workset + EntityY + 1                             ; 9A11 85 25                    .%
L9A13:
        rts                                     ; 9A13 60                       `

; ----------------------------------------------------------------------------
L9A14:
        lda     Workset + (EntitySpritesetDataPtr + 1)                             ; 9A14 A5 2F                    ./
        asl     a                               ; 9A16 0A                       .
        clc                                     ; 9A17 18                       .
        adc     WaterHeight                           ; 9A18 6D 3C 03                 m<.
        sta     $16                             ; 9A1B 85 16                    ..
        lda     #$00                            ; 9A1D A9 00                    ..
        adc     WaterHeight+1                           ; 9A1F 6D 3D 03                 m=.
        sta     $17                             ; 9A22 85 17                    ..
        lda     $16                             ; 9A24 A5 16                    ..
        cmp     Workset + EntityY                             ; 9A26 C5 24                    .$
        lda     $17                             ; 9A28 A5 17                    ..
        sbc     Workset + EntityY + 1                             ; 9A2A E5 25                    .%
        bcc     L9A36                           ; 9A2C 90 08                    ..
        lda     $16                             ; 9A2E A5 16                    ..
        sta     Workset + EntityY                             ; 9A30 85 24                    .$
        lda     $17                             ; 9A32 A5 17                    ..
        sta     Workset + EntityY + 1                             ; 9A34 85 25                    .%
L9A36:
        rts                                     ; 9A36 60                       `

; ----------------------------------------------------------------------------
UpdateEntitySprites:
        lda     #$0C                            ; 9A37 A9 0C                    ..
        sta     $46                             ; 9A39 85 46                    .F
        lda     #$3F                            ; 9A3B A9 3F                    .?
        sta     $47                             ; 9A3D 85 47                    .G
        lda     #<PlayerData                            ; 9A3F A9 80                    ..
        sta     WorksetPtr                             ; 9A41 85 40                    .@
        lda     #>PlayerData                            ; 9A43 A9 06                    ..
        sta     WorksetPtr+1                             ; 9A45 85 41                    .A
        ldx     #$04                            ; 9A47 A2 04                    ..
        ldy     #$80                            ; 9A49 A0 80                    ..
        lda     $0336                           ; 9A4B AD 36 03                 .6.
        beq     L9A54                           ; 9A4E F0 04                    ..
        ldx     #$FC                            ; 9A50 A2 FC                    ..
        ldy     #$00                            ; 9A52 A0 00                    ..
L9A54:
        stx     $0F                             ; 9A54 86 0F                    ..
        sty     $0336                           ; 9A56 8C 36 03                 .6.
L9A59:
        ; clear bit 1 of the last byte of the entity
        ldy     #EntityV1F
        lda     (WorksetPtr),y                         ; 9A5B B1 40                    .@
        and     #$FE                            ; 9A5D 29 FE                    ).
        sta     (WorksetPtr),y                         ; 9A5F 91 40                    .@
        ; check if entity is active, and if so, place out sprites
        ldy     #EntityActive
        lda     (WorksetPtr),y                         ; 9A63 B1 40                    .@
        tay                                     ; 9A65 A8                       .
        eor     #$C0                            ; 9A66 49 C0                    I.
        and     #$C1                            ; 9A68 29 C1                    ).
        beq     PlaceSprite                           ; 9A6A F0 28                    .(
L9A6C:
        lda     WorksetPtr                             ; 9A6C A5 40                    .@
        clc                                     ; 9A6E 18                       .
        adc     #$20                            ; 9A6F 69 20                    i 
        sta     WorksetPtr                             ; 9A71 85 40                    .@
        lda     WorksetPtr+1                             ; 9A73 A5 41                    .A
        adc     #$00                            ; 9A75 69 00                    i.
        sta     WorksetPtr+1                             ; 9A77 85 41                    .A
        dec     $46                             ; 9A79 C6 46                    .F
        bne     L9A59                           ; 9A7B D0 DC                    ..
        ldy     $47                             ; 9A7D A4 47                    .G
        beq     L9A8E                           ; 9A7F F0 0D                    ..
L9A81:
        lda     #$F0                            ; 9A81 A9 F0                    ..
        sta     SpritePosY,x                         ; 9A83 9D 00 02                 ...
        txa                                     ; 9A86 8A                       .
        clc                                     ; 9A87 18                       .
        adc     $0F                             ; 9A88 65 0F                    e.
        tax                                     ; 9A8A AA                       .
        dey                                     ; 9A8B 88                       .
        bne     L9A81                           ; 9A8C D0 F3                    ..
L9A8E:
        lda     #$01                            ; 9A8E A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; 9A90 8D 02 03                 ...
        rts                                     ; 9A93 60                       `

; ----------------------------------------------------------------------------
PlaceSprite:
        @TempScreenX    = $02
        @TempScreenY    = $04
        @TempGFXPointer = $06
        tya
        asl     a
        asl     a
        and     #$C0
        sta     $00
        ; find low x screen coordinate
        ldy     #EntityX
        lda     (WorksetPtr),y
        iny
        sec
        sbc     CameraX
        sta     @TempScreenX
        ; find high x screen coordinate
        lda     (WorksetPtr),y
        iny
        sbc     CameraX+1
        sta     @TempScreenX+1
        ; find low y screen coordinate
        lda     (WorksetPtr),y
        iny
        sec
        sbc     CameraY
        sta     @TempScreenY
        ; find high y screen coordinate
        lda     (WorksetPtr),y
        iny
        sbc     CameraY+1
        sta     @TempScreenY+1
        ; find sprite graphics pointer
        lda     (WorksetPtr),y
        iny
        sta     @TempGFXPointer
        lda     (WorksetPtr),y
        sta     @TempGFXPointer+1

        ldy     #$00
        sty     $01
L9ACC:
        lda     ($06),y
        iny
        cmp     #$80
        beq     L9B4F
        bit     $00
        bvc     L9ADC
        eor     #$FF
        sec
        adc     #$F8
L9ADC:
        clc
        and     #$FF
        bmi     L9AEF
        adc     $02
        sta     SpritePosX,x
        lda     $03
        adc     #$00
        beq     L9AFA
        jmp     L9B49

; ----------------------------------------------------------------------------
L9AEF:
        adc     $02                             ; 9AEF 65 02                    e.
        sta     SpritePosX,x                         ; 9AF1 9D 03 02                 ...
        lda     $03                             ; 9AF4 A5 03                    ..
        adc     #$FF                            ; 9AF6 69 FF                    i.
        bne     L9B49                           ; 9AF8 D0 4F                    .O
L9AFA:
        lda     ($06),y                         ; 9AFA B1 06                    ..
        bit     $00                             ; 9AFC 24 00                    $.
        bpl     L9B05                           ; 9AFE 10 05                    ..
        .byte   $49,$FF,$38,$69,$F8             ; 9B00 49 FF 38 69 F8           I.8i.
; ----------------------------------------------------------------------------
L9B05:
        clc                                     ; 9B05 18                       .
        and     #$FF                            ; 9B06 29 FF                    ).
        bmi     L9B18                           ; 9B08 30 0E                    0.
        adc     $04                             ; 9B0A 65 04                    e.
        sta     SpritePosY,x                         ; 9B0C 9D 00 02                 ...
        lda     $05                             ; 9B0F A5 05                    ..
        adc     #$00                            ; 9B11 69 00                    i.
        beq     L9B23                           ; 9B13 F0 0E                    ..
        jmp     L9B49                           ; 9B15 4C 49 9B                 LI.

; ----------------------------------------------------------------------------
L9B18:
        adc     $04                             ; 9B18 65 04                    e.
        sta     SpritePosY,x                         ; 9B1A 9D 00 02                 ...
        lda     $05                             ; 9B1D A5 05                    ..
        adc     #$FF                            ; 9B1F 69 FF                    i.
        bne     L9B49                           ; 9B21 D0 26                    .&
L9B23:
        lda     SpritePosY,x                         ; 9B23 BD 00 02                 ...
        cmp     #$F0                            ; 9B26 C9 F0                    ..
        bcs     L9B49                           ; 9B28 B0 1F                    ..
        iny                                     ; 9B2A C8                       .
        lda     ($06),y                         ; 9B2B B1 06                    ..
        iny                                     ; 9B2D C8                       .
        sta     SpriteTile,x                         ; 9B2E 9D 01 02                 ...
        lda     ($06),y                         ; 9B31 B1 06                    ..
        iny                                     ; 9B33 C8                       .
        eor     $00                             ; 9B34 45 00                    E.
        sta     SpriteAttr,x                         ; 9B36 9D 02 02                 ...
        lda     #$01                            ; 9B39 A9 01                    ..
        sta     $01                             ; 9B3B 85 01                    ..
        txa                                     ; 9B3D 8A                       .
        clc                                     ; 9B3E 18                       .
        adc     $0F                             ; 9B3F 65 0F                    e.
        tax                                     ; 9B41 AA                       .
        dec     $47                             ; 9B42 C6 47                    .G
        bne     L9ACC                           ; 9B44 D0 86                    ..
        .byte   $4C,$8E,$9A                     ; 9B46 4C 8E 9A                 L..
; ----------------------------------------------------------------------------
L9B49:
        iny                                     ; 9B49 C8                       .
        iny                                     ; 9B4A C8                       .
        iny                                     ; 9B4B C8                       .
        jmp     L9ACC                           ; 9B4C 4C CC 9A                 L..

; ----------------------------------------------------------------------------
L9B4F:
        ldy     #$1F                            ; 9B4F A0 1F                    ..
        lda     (WorksetPtr),y                         ; 9B51 B1 40                    .@
        ora     $01                             ; 9B53 05 01                    ..
        sta     (WorksetPtr),y                         ; 9B55 91 40                    .@
        jmp     L9A6C                           ; 9B57 4C 6C 9A                 Ll.

; ----------------------------------------------------------------------------
EncounterRunProjectiles:
        @TempCounter = $46
        lda #<PlayerProjectile1Data
        sta WorksetPtr
        lda #>PlayerProjectile1Data
        sta WorksetPtr+1
        lda #$03
        sta @TempCounter
@RunActiveEntity:
        jsr WorksetLoad
        lda Workset + EntityActive
        bpl @AdvanceToNextEntity
        lda #>(@SaveEntity - 1)
        pha
        lda #<(@SaveEntity - 1)
        pha
        lda Workset + EntityType
        jsr JumpEngine
        .addr EncounterBoatProjectile
        .addr EncounterBulletProjectile
        .addr EncounterSubmarineProjectile
        .addr EncounterHarpoonProjectile
        .addr EncounterPlaneProjectile
@SaveEntity:
        jsr WorksetSave
@AdvanceToNextEntity:
        jsr WorksetNext
        dec @TempCounter
        bne @RunActiveEntity
        rts

; ----------------------------------------------------------------------------
BonusRunProjectiles:
        lda     #<PlayerProjectile1Data                            ; 9B8D A9 A0                    ..
        sta     WorksetPtr                             ; 9B8F 85 40                    .@
        lda     #>PlayerProjectile1Data                            ; 9B91 A9 06                    ..
        sta     WorksetPtr+1                             ; 9B93 85 41                    .A
        lda     #$03                            ; 9B95 A9 03                    ..
        sta     $46                             ; 9B97 85 46                    .F
L9B99:
        jsr     WorksetLoad                           ; 9B99 20 54 97                  T.
        lda     Workset + EntityActive                             ; 9B9C A5 20                    . 
        bpl     L9BA3                           ; 9B9E 10 03                    ..
        jsr     EncounterPlaneProjectile                           ; 9BA0 20 7F 9C                  ..
L9BA3:
        jsr     WorksetSave                           ; 9BA3 20 61 97                  a.
        jsr     WorksetNext                           ; 9BA6 20 6E 97                  n.
        dec     $46                             ; 9BA9 C6 46                    .F
        bne     L9B99                           ; 9BAB D0 EC                    ..
        rts                                     ; 9BAD 60                       `

; ----------------------------------------------------------------------------
EncounterBoatProjectile:
        bit     Workset + EntityActive                             ; 9BAE 24 20                    $ 
        bvs     L9BBD                           ; 9BB0 70 0B                    p.
        jsr     L9CC7                           ; 9BB2 20 C7 9C                  ..
        lda     #SFXEncounterBoatFire                            ; 9BB5 A9 08                    ..
        jsr     SoundPlay                           ; 9BB7 20 CD E2                  ..
        jmp     L9C05                           ; 9BBA 4C 05 9C                 L..

; ----------------------------------------------------------------------------
L9BBD:
        lda     Workset + EntityV1F                             ; 9BBD A5 3F                    .?
        bmi     L9BFC                           ; 9BBF 30 3B                    0;
        and     #$01                            ; 9BC1 29 01                    ).
        beq     L9C01                           ; 9BC3 F0 3C                    .<
        lda     $38                             ; 9BC5 A5 38                    .8
        bmi     L9BF2                           ; 9BC7 30 29                    0)
        lda     Workset + EntityY                             ; 9BC9 A5 24                    .$
        cmp     WaterHeight                           ; 9BCB CD 3C 03                 .<.
        lda     Workset + EntityY + 1                             ; 9BCE A5 25                    .%
        sbc     WaterHeight+1                           ; 9BD0 ED 3D 03                 .=.
        bcc     L9BE8                           ; 9BD3 90 13                    ..
        lda     #$00                            ; 9BD5 A9 00                    ..
        sta     Workset + EntityV10                             ; 9BD7 85 30                    .0
        sta     Workset + EntityXSpeed                             ; 9BD9 85 31                    .1
        lda     #$80                            ; 9BDB A9 80                    ..
        ora     $38                             ; 9BDD 05 38                    .8
        sta     $38                             ; 9BDF 85 38                    .8
        lsr     Workset + EntityYSpeed                             ; 9BE1 46 33                    F3
        ror     Workset + EntityV12                            ; 9BE3 66 32                    f2
        jmp     L9BF2                           ; 9BE5 4C F2 9B                 L..

; ----------------------------------------------------------------------------
L9BE8:
        lda     #$40                            ; 9BE8 A9 40                    .@
        ldy     #$04                            ; 9BEA A0 04                    ..
        jsr     L9841                           ; 9BEC 20 41 98                  A.
        jsr     WorksetMoveX                           ; 9BEF 20 FA 97                  ..
L9BF2:
        jsr     L981B                           ; 9BF2 20 1B 98                  ..
        jsr     L99D0                           ; 9BF5 20 D0 99                  ..
        bcc     L9C05                           ; 9BF8 90 0B                    ..
        .byte   $B0,$05                         ; 9BFA B0 05                    ..
; ----------------------------------------------------------------------------
L9BFC:
        lda     #$00                            ; 9BFC A9 00                    ..
        sta     $034A                           ; 9BFE 8D 4A 03                 .J.
L9C01:
        lda     #$00                            ; 9C01 A9 00                    ..
        sta     Workset + EntityActive                             ; 9C03 85 20                    . 
L9C05:
        rts                                     ; 9C05 60                       `

; ----------------------------------------------------------------------------
EncounterBulletProjectile:
        bit     Workset + EntityActive
        bvs     @L9C6C
        jsr     L9CC7
        lda     #SFXEncounterBoatFire
        jsr     SoundPlay
        jmp     @L9C7E
@L9C6C:
        lda     Workset + EntityV1F
        bmi     @L9C7A
        and     #$01
        beq     @L9C7A
        jsr     WorksetMoveX
        jmp     @L9C7E
@L9C7A:
        lda     #$00
        sta     Workset + EntityActive
@L9C7E:
        rts

; ----------------------------------------------------------------------------
EncounterSubmarineProjectile:
        bit     Workset + EntityActive                             ; 9C28 24 20                    $ 
        bvs     L9C37                                              ; 9C2A 70 0B                    p.
        jsr     L9CC7                           ; 9C2C 20 C7 9C                  ..
        lda     #SFXEncounterSubmarineFire                            ; 9C2F A9 0A                    ..
        jsr     SoundPlay                           ; 9C31 20 CD E2                  ..
        jmp     L9C5C                           ; 9C34 4C 5C 9C                 L\.

; ----------------------------------------------------------------------------
L9C37:
        lda     Workset + EntityV1F                             ; 9C37 A5 3F                    .?
        bmi     L9C58                           ; 9C39 30 1D                    0.
        and     #$01                            ; 9C3B 29 01                    ).
        beq     L9C58                           ; 9C3D F0 19                    ..
        jsr     WorksetMoveX                           ; 9C3F 20 FA 97                  ..
        jsr     L981B                           ; 9C42 20 1B 98                  ..
        lda     #$20                            ; 9C45 A9 20                    . 
        ldy     #$10                            ; 9C47 A0 10                    ..
        jsr     L9841                           ; 9C49 20 41 98                  A.
        ldy     #$08                            ; 9C4C A0 08                    ..
        jsr     L98B8                           ; 9C4E 20 B8 98                  ..
        jsr     L99D0                           ; 9C51 20 D0 99                  ..
        bcc     L9C5C                           ; 9C54 90 06                    ..
        .byte   $B0,$00                         ; 9C56 B0 00                    ..
; ----------------------------------------------------------------------------
L9C58:
        lda     #$00                            ; 9C58 A9 00                    ..
        sta     Workset + EntityActive                             ; 9C5A 85 20                    . 
L9C5C:
        rts                                     ; 9C5C 60                       `

; ----------------------------------------------------------------------------
EncounterHarpoonProjectile:
        bit     Workset + EntityActive                             ; 9C5D 24 20                    $ 
        bvs     L9C6C                           ; 9C5F 70 0B                    p.
        jsr     L9CC7                           ; 9C61 20 C7 9C                  ..
        lda     #SFXEncounterHarpoonFire                            ; 9C64 A9 0B                    ..
        jsr     SoundPlay                           ; 9C66 20 CD E2                  ..
        jmp     L9C7E                           ; 9C69 4C 7E 9C                 L~.

; ----------------------------------------------------------------------------
L9C6C:
        lda     Workset + EntityV1F                             ; 9C6C A5 3F                    .?
        bmi     L9C7A                           ; 9C6E 30 0A                    0.
        and     #$01                            ; 9C70 29 01                    ).
        beq     L9C7A                           ; 9C72 F0 06                    ..
        jsr     WorksetMoveX                           ; 9C74 20 FA 97                  ..
        jmp     L9C7E                           ; 9C77 4C 7E 9C                 L~.

; ----------------------------------------------------------------------------
L9C7A:
        lda     #$00                            ; 9C7A A9 00                    ..
        sta     Workset + EntityActive                             ; 9C7C 85 20                    . 
L9C7E:
        rts                                     ; 9C7E 60                       `

; ----------------------------------------------------------------------------
EncounterPlaneProjectile:
        bit     Workset + EntityActive                             ; 9C7F 24 20                    $ 
        bvs     L9C8E                           ; 9C81 70 0B                    p.
        jsr     L9CC7                           ; 9C83 20 C7 9C                  ..
        lda     #SFXBonusPlaneFire                            ; 9C86 A9 09                    ..
        jsr     SoundPlay                           ; 9C88 20 CD E2                  ..
        jmp     L9C7E                           ; 9C8B 4C 7E 9C                 L~.

; ----------------------------------------------------------------------------
L9C8E:
        lda     Workset + EntityV1F                             ; 9C8E A5 3F                    .?
        bmi     L9CC2                           ; 9C90 30 30                    00
        and     #$01                            ; 9C92 29 01                    ).
        beq     L9CC2                           ; 9C94 F0 2C                    .,
        jsr     L981B                           ; 9C96 20 1B 98                  ..
        lda     $38                             ; 9C99 A5 38                    .8
        bne     L9CBB                           ; 9C9B D0 1E                    ..
        lda     Workset + EntityY                             ; 9C9D A5 24                    .$
        cmp     WaterHeight                           ; 9C9F CD 3C 03                 .<.
        lda     Workset + EntityY + 1                             ; 9CA2 A5 25                    .%
        sbc     WaterHeight+1                           ; 9CA4 ED 3D 03                 .=.
        bcc     L9CC6                           ; 9CA7 90 1D                    ..
        inc     $38                             ; 9CA9 E6 38                    .8
        lda     #$00                            ; 9CAB A9 00                    ..
        sta     Workset + EntityV12                            ; 9CAD 85 32                    .2
        lda     #$03                            ; 9CAF A9 03                    ..
        sta     Workset + EntityYSpeed                             ; 9CB1 85 33                    .3
        lda     #AnimationEncounterBomb                            ; 9CB3 A9 28                    .(
        jsr     WorksetAnimationPlay                           ; 9CB5 20 AD 97                  ..
        jmp     L9CC6                           ; 9CB8 4C C6 9C                 L..

; ----------------------------------------------------------------------------
L9CBB:
        jsr     L99D0                           ; 9CBB 20 D0 99                  ..
        bcc     L9CC6                           ; 9CBE 90 06                    ..
        .byte   $B0,$00                         ; 9CC0 B0 00                    ..
; ----------------------------------------------------------------------------
L9CC2:
        lda     #$00                            ; 9CC2 A9 00                    ..
        sta     Workset + EntityActive                             ; 9CC4 85 20                    . 
L9CC6:
        rts                                     ; 9CC6 60                       `

; ----------------------------------------------------------------------------
L9CC7:
        lda     #$00                            ; 9CC7 A9 00                    ..
        ldx     #$14                            ; 9CC9 A2 14                    ..
L9CCB:
        sta     $20,x                           ; 9CCB 95 20                    . 
        inx                                     ; 9CCD E8                       .
        cpx     #$20                            ; 9CCE E0 20                    . 
        bcc     L9CCB                           ; 9CD0 90 F9                    ..
        lda     Workset + EntityType                             ; 9CD2 A5 21                    .!
        asl     a                               ; 9CD4 0A                       .
        asl     a                               ; 9CD5 0A                       .
        asl     a                               ; 9CD6 0A                       .
        tax                                     ; 9CD7 AA                       .
        lda     Workset + EntityActive                             ; 9CD8 A5 20                    . 
        ora     #$40                            ; 9CDA 09 40                    .@
        sta     Workset + EntityActive                             ; 9CDC 85 20                    . 
        and     #$10                            ; 9CDE 29 10                    ).
        bne     L9CFF                           ; 9CE0 D0 1D                    ..
        lda     PlayerX                           ; 9CE2 AD 82 06                 ...
        clc                                     ; 9CE5 18                       .
        adc     L9D52,x                         ; 9CE6 7D 52 9D                 }R.
        sta     Workset + EntityX                             ; 9CE9 85 22                    ."
        lda     PlayerX+1                           ; 9CEB AD 83 06                 ...
        adc     #$00                            ; 9CEE 69 00                    i.
        sta     Workset + EntityX  + 1                            ; 9CF0 85 23                    .#
        lda     L9D54,x                         ; 9CF2 BD 54 9D                 .T.
        sta     Workset + EntityV10                             ; 9CF5 85 30                    .0
        lda     L9D55,x                         ; 9CF7 BD 55 9D                 .U.
        sta     Workset + EntityXSpeed                             ; 9CFA 85 31                    .1
        jmp     L9D23                           ; 9CFC 4C 23 9D                 L#.

; ----------------------------------------------------------------------------
L9CFF:
        lda     PlayerX                           ; 9CFF AD 82 06                 ...
        sec                                     ; 9D02 38                       8
        sbc     L9D52,x                         ; 9D03 FD 52 9D                 .R.
        sta     Workset + EntityX                             ; 9D06 85 22                    ."
        lda     PlayerX+1                           ; 9D08 AD 83 06                 ...
        sbc     #$00                            ; 9D0B E9 00                    ..
        sta     Workset + EntityX  + 1                            ; 9D0D 85 23                    .#
        lda     L9D54,x                         ; 9D0F BD 54 9D                 .T.
        eor     #$FF                            ; 9D12 49 FF                    I.
        sta     Workset + EntityV10                             ; 9D14 85 30                    .0
        lda     L9D55,x                         ; 9D16 BD 55 9D                 .U.
        eor     #$FF                            ; 9D19 49 FF                    I.
        sta     Workset + EntityXSpeed                             ; 9D1B 85 31                    .1
        inc     Workset + EntityV10                             ; 9D1D E6 30                    .0
        bne     L9D23                           ; 9D1F D0 02                    ..
        inc     Workset + EntityXSpeed                             ; 9D21 E6 31                    .1
L9D23:
        lda     L9D56,x                         ; 9D23 BD 56 9D                 .V.
        sta     Workset + EntityV12                            ; 9D26 85 32                    .2
        lda     L9D57,x                         ; 9D28 BD 57 9D                 .W.
        sta     Workset + EntityYSpeed                             ; 9D2B 85 33                    .3
        clc                                     ; 9D2D 18                       .
        lda     L9D53,x                         ; 9D2E BD 53 9D                 .S.
        bmi     L9D40                           ; 9D31 30 0D                    0.
        adc     PlayerY                           ; 9D33 6D 84 06                 m..
        sta     Workset + EntityY                             ; 9D36 85 24                    .$
        lda     PlayerY+1                           ; 9D38 AD 85 06                 ...
        adc     #$00                            ; 9D3B 69 00                    i.
        jmp     L9D4A                           ; 9D3D 4C 4A 9D                 LJ.

; ----------------------------------------------------------------------------
L9D40:
        .byte   $6D,$84,$06,$85,$24,$AD,$85,$06 ; 9D40 6D 84 06 85 24 AD 85 06  m...$...
        .byte   $69,$FF                         ; 9D48 69 FF                    i.
; ----------------------------------------------------------------------------
L9D4A:
        sta     Workset + EntityY + 1                             ; 9D4A 85 25                    .%
        lda     L9D58,x                         ; 9D4C BD 58 9D                 .X.
        jmp     WorksetAnimationPlay                           ; 9D4F 4C AD 97                 L..

; ----------------------------------------------------------------------------
L9D52:
        .byte   $0C                             ; 9D52 0C                       .
L9D53:
        .byte   $00                             ; 9D53 00                       .
L9D54:
        .byte   $80                             ; 9D54 80                       .
L9D55:
        .byte   $01                             ; 9D55 01                       .
L9D56:
        .byte   $00                             ; 9D56 00                       .
L9D57:
        .byte   $FD                             ; 9D57 FD                       .
L9D58:
        .byte   $28,$00,$08,$00,$00,$04,$00,$00 ; 9D58 28 00 08 00 00 04 00 00  (.......
        .byte   $29,$00,$08,$00,$00,$03,$00,$00 ; 9D60 29 00 08 00 00 03 00 00  ).......
        .byte   $28,$00,$08,$00,$00,$03,$00,$00 ; 9D68 28 00 08 00 00 03 00 00  (.......
        .byte   $2B,$00,$00,$08,$00,$00,$80,$01 ; 9D70 2B 00 00 08 00 00 80 01  +.......
        .byte   $2A,$00                         ; 9D78 2A 00                    *.
; ----------------------------------------------------------------------------
MapRunJaws:
        lda #<JawsData
        sta WorksetPtr
        lda #>JawsData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityActive
        bvs @JawsIsActive
        ; restore jaws from the stash
        lda JawsStashedX
        sec
        rol a
        asl a
        asl a
        asl a
        sta Workset + EntityX
        lda #$00
        rol a
        sta Workset + EntityX  + 1
        lda JawsStashedY
        sec
        rol a
        asl a
        asl a
        asl a
        sta Workset + EntityY
        lda #$00
        rol a
        sta Workset + EntityY + 1
        jsr L9EFA
        lda #$00
        sta Workset + EntityV17
        lda #$C1
        sta Workset + EntityActive
        lda #$80
        sta Workset + EntityV1D
        jmp WorksetSave
@JawsIsActive:
        jsr WorksetAnimationAdvance
        lda Workset + EntityV1D
        bne L9DD8
        jsr L9940
        lda Workset + EntityV1F
        bpl L9DDD
        jsr L95E4
        jsr L962D
        sta $0340
        lda #$01
        sta $0306
        jmp WorksetSave

; ----------------------------------------------------------------------------
L9DD8:
        dec     Workset + EntityV1D                             ; 9DD8 C6 3D                    .=
        jmp     L9E05                           ; 9DDA 4C 05 9E                 L..

; ----------------------------------------------------------------------------
L9DDD:
        lda     $1A                             ; 9DDD A5 1A                    ..
        sta     $16                             ; 9DDF 85 16                    ..
        lda     $1B                             ; 9DE1 A5 1B                    ..
        sta     $17                             ; 9DE3 85 17                    ..
        lda     $1C                             ; 9DE5 A5 1C                    ..
        sta     $18                             ; 9DE7 85 18                    ..
        lda     $1D                             ; 9DE9 A5 1D                    ..
        sta     $19                             ; 9DEB 85 19                    ..
        ldx     #$04                            ; 9DED A2 04                    ..
L9DEF:
        lsr     $17                             ; 9DEF 46 17                    F.
        ror     $16                             ; 9DF1 66 16                    f.
        lsr     $19                             ; 9DF3 46 19                    F.
        ror     $18                             ; 9DF5 66 18                    f.
        dex                                     ; 9DF7 CA                       .
        bne     L9DEF                           ; 9DF8 D0 F5                    ..
        lda     $16                             ; 9DFA A5 16                    ..
        cmp     $18                             ; 9DFC C5 18                    ..
        bcs     L9E02                           ; 9DFE B0 02                    ..
        lda     $18                             ; 9E00 A5 18                    ..
L9E02:
        sta     TrackerDistancePrev                           ; 9E02 8D 44 03                 .D.
L9E05:
        dec     Workset + EntityV16                            ; 9E05 C6 36                    .6
        bne     L9E4A                           ; 9E07 D0 41                    .A
        bit     Workset + EntityV17                            ; 9E09 24 37                    $7
        bpl     L9E15                           ; 9E0B 10 08                    ..
        lda     #$C1                            ; 9E0D A9 C1                    ..
        sta     Workset + EntityActive                             ; 9E0F 85 20                    . 
        lda     #$00                            ; 9E11 A9 00                    ..
        sta     Workset + EntityV17                            ; 9E13 85 37                    .7
L9E15:
        jsr     L9EFA                           ; 9E15 20 FA 9E                  ..
        lda     TrackerDistancePrev                           ; 9E18 AD 44 03                 .D.
        cmp     #$03                            ; 9E1B C9 03                    ..
        lda     #$01                            ; 9E1D A9 01                    ..
        bit     Workset + EntityActive                             ; 9E1F 24 20                    $ 
        bne     L9E3F                           ; 9E21 D0 1C                    ..
        bcs     L9E37                           ; 9E23 B0 12                    ..
        bit     Workset + EntityV17                            ; 9E25 24 37                    $7
        bvs     L9E2F                           ; 9E27 70 06                    p.
        lda     Workset + EntityV15                             ; 9E29 A5 35                    .5
        cmp     Workset + EntityV14                             ; 9E2B C5 34                    .4
        beq     L9E4A                           ; 9E2D F0 1B                    ..
L9E2F:
        lda     #$00                            ; 9E2F A9 00                    ..
        sta     Workset + EntityV17                            ; 9E31 85 37                    .7
        ldx     #$08                            ; 9E33 A2 08                    ..
        bne     L9E47                           ; 9E35 D0 10                    ..
L9E37:
        lda     #$80                            ; 9E37 A9 80                    ..
        sta     Workset + EntityV17                            ; 9E39 85 37                    .7
        ldx     #$10                            ; 9E3B A2 10                    ..
        bne     L9E47                           ; 9E3D D0 08                    ..
L9E3F:
        bcs     L9E4A                           ; 9E3F B0 09                    ..
        lda     #$40                            ; 9E41 A9 40                    .@
        sta     Workset + EntityV17                            ; 9E43 85 37                    .7
        ldx     #$00                            ; 9E45 A2 00                    ..
L9E47:
        jsr     L9E53                           ; 9E47 20 53 9E                  S.
L9E4A:
        jsr     WorksetMoveX                           ; 9E4A 20 FA 97                  ..
        jsr     L981B                           ; 9E4D 20 1B 98                  ..
        jmp     WorksetSave                           ; 9E50 4C 61 97                 La.

; ----------------------------------------------------------------------------
L9E53:
        txa                                     ; 9E53 8A                       .
        clc                                     ; 9E54 18                       .
        adc     Workset + EntityV14                             ; 9E55 65 34                    e4
        asl     a                               ; 9E57 0A                       .
        tax                                     ; 9E58 AA                       .
        lda     Workset + EntityActive                             ; 9E59 A5 20                    . 
        and     #$CF                            ; 9E5B 29 CF                    ).
        ora     L9E6F,x                         ; 9E5D 1D 6F 9E                 .o.
        sta     Workset + EntityActive                             ; 9E60 85 20                    . 
        lda     L9E70,x                         ; 9E62 BD 70 9E                 .p.
        jsr     WorksetAnimationPlay                           ; 9E65 20 AD 97                  ..
        lda     Workset + EntityActive                             ; 9E68 A5 20                    . 
        and     #$FE                            ; 9E6A 29 FE                    ).
        sta     Workset + EntityActive                             ; 9E6C 85 20                    . 
        rts                                     ; 9E6E 60                       `

; ----------------------------------------------------------------------------
L9E6F:
        .byte   $00                             ; 9E6F 00                       .
L9E70:
        .byte   $15,$00,$19,$00,$16,$10,$19,$10 ; 9E70 15 00 19 00 16 10 19 10  ........
        .byte   $15,$10,$18,$00,$16,$00,$18,$00 ; 9E78 15 10 18 00 16 00 18 00  ........
        .byte   $10,$00,$14,$00,$12,$10,$14,$10 ; 9E80 10 00 14 00 12 10 14 10  ........
        .byte   $10,$10,$13,$00,$11,$00,$13,$00 ; 9E88 10 10 13 00 11 00 13 00  ........
        .byte   $1A,$00,$1E,$00,$1B,$10,$1E,$10 ; 9E90 1A 00 1E 00 1B 10 1E 10  ........
        .byte   $1A,$10,$1D,$00,$1B,$00,$1D     ; 9E98 1A 10 1D 00 1B 00 1D     .......
; ----------------------------------------------------------------------------
L9E9F:
        lda     Workset + EntityV14                             ; 9E9F A5 34                    .4
        asl     a                               ; 9EA1 0A                       .
        tax                                     ; 9EA2 AA                       .
        ldy     L9EB1,x                         ; 9EA3 BC B1 9E                 ...
        lda     L9EB0,x                         ; 9EA6 BD B0 9E                 ...
        tax                                     ; 9EA9 AA                       .
        jsr     L95F5                           ; 9EAA 20 F5 95                  ..
        cmp     #$06                            ; 9EAD C9 06                    ..
        rts                                     ; 9EAF 60                       `

; ----------------------------------------------------------------------------
L9EB0:
        .byte   $10                             ; 9EB0 10                       .
L9EB1:
        .byte   $00,$10,$10,$00,$10,$F0,$10,$F0 ; 9EB1 00 10 10 00 10 F0 10 F0  ........
        .byte   $00,$F0,$F0,$00,$F0,$10,$F0     ; 9EB9 00 F0 F0 00 F0 10 F0     .......
; ----------------------------------------------------------------------------
L9EC0:
        lda     Workset + EntityV14                             ; 9EC0 A5 34                    .4
        asl     a                               ; 9EC2 0A                       .
        asl     a                               ; 9EC3 0A                       .
        tax                                     ; 9EC4 AA                       .
        lda     L9EDA,x                         ; 9EC5 BD DA 9E                 ...
        sta     Workset + EntityV10                             ; 9EC8 85 30                    .0
        lda     L9EDB,x                         ; 9ECA BD DB 9E                 ...
        sta     Workset + EntityXSpeed                             ; 9ECD 85 31                    .1
        lda     L9EDC,x                         ; 9ECF BD DC 9E                 ...
        sta     Workset + EntityV12                            ; 9ED2 85 32                    .2
        lda     L9EDD,x                         ; 9ED4 BD DD 9E                 ...
        sta     Workset + EntityYSpeed                             ; 9ED7 85 33                    .3
        rts                                     ; 9ED9 60                       `

; ----------------------------------------------------------------------------
L9EDA:
        .byte   $80                             ; 9EDA 80                       .
L9EDB:
        .byte   $00                             ; 9EDB 00                       .
L9EDC:
        .byte   $00                             ; 9EDC 00                       .
L9EDD:
        .byte   $00,$80,$00,$80,$00,$00,$00,$80 ; 9EDD 00 80 00 80 00 00 00 80  ........
        .byte   $00,$80,$FF,$80,$00,$80,$FF,$00 ; 9EE5 00 80 FF 80 00 80 FF 00  ........
        .byte   $00,$80,$FF,$80,$FF,$00,$00,$80 ; 9EED 00 80 FF 80 FF 00 00 80  ........
        .byte   $FF,$80,$00,$80,$FF             ; 9EF5 FF 80 00 80 FF           .....
; ----------------------------------------------------------------------------
L9EFA:
        lda     Workset + EntityV14                             ; 9EFA A5 34                    .4
        sta     Workset + EntityV15                             ; 9EFC 85 35                    .5
        jsr     L9F27                           ; 9EFE 20 27 9F                  '.
        sta     Workset + EntityV14                             ; 9F01 85 34                    .4
        jsr     L9E9F                           ; 9F03 20 9F 9E                  ..
        bcc     L9F1F                           ; 9F06 90 17                    ..
        jsr     RNGAdvance                           ; 9F08 20 69 8C                  i.
        and     #$01                            ; 9F0B 29 01                    ).
        bne     L9F11                           ; 9F0D D0 02                    ..
        lda     #$FF                            ; 9F0F A9 FF                    ..
L9F11:
        pha                                     ; 9F11 48                       H
        clc                                     ; 9F12 18                       .
        adc     Workset + EntityV14                             ; 9F13 65 34                    e4
        and     #$07                            ; 9F15 29 07                    ).
        sta     Workset + EntityV14                             ; 9F17 85 34                    .4
        jsr     L9E9F                           ; 9F19 20 9F 9E                  ..
        pla                                     ; 9F1C 68                       h
        bcs     L9F11                           ; 9F1D B0 F2                    ..
L9F1F:
        jsr     L9EC0                           ; 9F1F 20 C0 9E                  ..
        lda     #$20                            ; 9F22 A9 20                    . 
        sta     Workset + EntityV16                            ; 9F24 85 36                    .6
        rts                                     ; 9F26 60                       `

; ----------------------------------------------------------------------------
L9F27:
        lda     $1A                             ; 9F27 A5 1A                    ..
        sta     $16                             ; 9F29 85 16                    ..
        lda     $1B                             ; 9F2B A5 1B                    ..
        sta     $17                             ; 9F2D 85 17                    ..
        lda     $1C                             ; 9F2F A5 1C                    ..
        sta     $18                             ; 9F31 85 18                    ..
        lda     $1D                             ; 9F33 A5 1D                    ..
        sta     $19                             ; 9F35 85 19                    ..
        lda     $15                             ; 9F37 A5 15                    ..
        sta     $12                             ; 9F39 85 12                    ..
        lda     $16                             ; 9F3B A5 16                    ..
        cmp     $18                             ; 9F3D C5 18                    ..
        lda     $17                             ; 9F3F A5 17                    ..
        sbc     $19                             ; 9F41 E5 19                    ..
        bcc     L9F5B                           ; 9F43 90 16                    ..
        lda     $16                             ; 9F45 A5 16                    ..
        ldx     $18                             ; 9F47 A6 18                    ..
        sta     $18                             ; 9F49 85 18                    ..
        stx     $16                             ; 9F4B 86 16                    ..
        lda     $17                             ; 9F4D A5 17                    ..
        ldx     $19                             ; 9F4F A6 19                    ..
        sta     $19                             ; 9F51 85 19                    ..
        stx     $17                             ; 9F53 86 17                    ..
        lda     $12                             ; 9F55 A5 12                    ..
        ora     #$04                            ; 9F57 09 04                    ..
        sta     $12                             ; 9F59 85 12                    ..
L9F5B:
        asl     $16                             ; 9F5B 06 16                    ..
        rol     $17                             ; 9F5D 26 17                    &.
        lda     $16                             ; 9F5F A5 16                    ..
        cmp     $18                             ; 9F61 C5 18                    ..
        lda     $17                             ; 9F63 A5 17                    ..
        sbc     $19                             ; 9F65 E5 19                    ..
        lda     $12                             ; 9F67 A5 12                    ..
        bcc     L9F6D                           ; 9F69 90 02                    ..
        ora     #$08                            ; 9F6B 09 08                    ..
L9F6D:
        tax                                     ; 9F6D AA                       .
        lda     L9F72,x                         ; 9F6E BD 72 9F                 .r.
        rts                                     ; 9F71 60                       `

; ----------------------------------------------------------------------------
L9F72:
        .byte   $02,$02,$06,$06,$00,$04,$00,$04 ; 9F72 02 02 06 06 00 04 00 04  ........
        .byte   $01,$03,$07,$05,$01,$03,$07,$05 ; 9F7A 01 03 07 05 01 03 07 05  ........
; ----------------------------------------------------------------------------
EncounterRunJaws:
        lda     EncounterJawsActive                           ; 9F82 AD 4B 03                 .K.
        cmp     #$02                            ; 9F85 C9 02                    ..
        bne     L9F8A                           ; 9F87 D0 01                    ..
        rts                                     ; 9F89 60                       `

; ----------------------------------------------------------------------------
L9F8A:
        lda     #<JawsData                            ; 9F8A A9 00                    ..
        sta     WorksetPtr                             ; 9F8C 85 40                    .@
        lda     #>JawsData                            ; 9F8E A9 07                    ..
        sta     WorksetPtr+1                             ; 9F90 85 41                    .A
        jsr     WorksetLoad                           ; 9F92 20 54 97                  T.
        bit     Workset + EntityActive                             ; 9F95 24 20                    $ 
        bvs     L9FFD                           ; 9F97 70 64                    pd
        jsr     RNGAdvance                           ; 9F99 20 69 8C                  i.
        and     #$10                            ; 9F9C 29 10                    ).
        bne     L9FB7                           ; 9F9E D0 17                    ..
        lda     #$C0                            ; 9FA0 A9 C0                    ..
        sta     Workset + EntityActive                             ; 9FA2 85 20                    . 
        lda     #$C0                            ; 9FA4 A9 C0                    ..
        sta     Workset + EntityX                             ; 9FA6 85 22                    ."
        lda     #$0F                            ; 9FA8 A9 0F                    ..
        sta     Workset + EntityX  + 1                            ; 9FAA 85 23                    .#
        lda     #$00                            ; 9FAC A9 00                    ..
        sta     Workset + EntityV10                             ; 9FAE 85 30                    .0
        lda     #$01                            ; 9FB0 A9 01                    ..
        sta     Workset + EntityXSpeed                             ; 9FB2 85 31                    .1
        jmp     L9FCB                           ; 9FB4 4C CB 9F                 L..

; ----------------------------------------------------------------------------
L9FB7:
        lda     #$D0                            ; 9FB7 A9 D0                    ..
        sta     Workset + EntityActive                             ; 9FB9 85 20                    . 
        lda     #$40                            ; 9FBB A9 40                    .@
        sta     Workset + EntityX                             ; 9FBD 85 22                    ."
        lda     #$11                            ; 9FBF A9 11                    ..
        sta     Workset + EntityX  + 1                            ; 9FC1 85 23                    .#
        lda     #$00                            ; 9FC3 A9 00                    ..
        sta     Workset + EntityV10                             ; 9FC5 85 30                    .0
        lda     #$FF                            ; 9FC7 A9 FF                    ..
        sta     Workset + EntityXSpeed                             ; 9FC9 85 31                    .1
L9FCB:
        lda     WaterHeight                           ; 9FCB AD 3C 03                 .<.
        clc                                     ; 9FCE 18                       .
        adc     #$30                            ; 9FCF 69 30                    i0
        sta     Workset + EntityY                             ; 9FD1 85 24                    .$
        lda     WaterHeight+1                           ; 9FD3 AD 3D 03                 .=.
        adc     #$00                            ; 9FD6 69 00                    i.
        sta     Workset + EntityY + 1                             ; 9FD8 85 25                    .%
        lda     EncounterJawsActive                           ; 9FDA AD 4B 03                 .K.
        sta     Workset + EntityV14                             ; 9FDD 85 34                    .4
        sta     Workset + EntityV15                             ; 9FDF 85 35                    .5
        beq     L9FED                           ; 9FE1 F0 0A                    ..
        .byte   $AE,$44,$03,$E8,$86,$35,$A9,$00 ; 9FE3 AE 44 03 E8 86 35 A9 00  .D...5..
        .byte   $85,$34                         ; 9FEB 85 34                    .4
; ----------------------------------------------------------------------------
L9FED:
        lda     #$00                            ; 9FED A9 00                    ..
        sta     Workset + EntityV16                            ; 9FEF 85 36                    .6
        sta     $38                             ; 9FF1 85 38                    .8
        sta     Workset + EntityV19                             ; 9FF3 85 39                    .9
        lda     #AnimationEncounterJaws                            ; 9FF5 A9 30                    .0
        jsr     WorksetAnimationPlay                           ; 9FF7 20 AD 97                  ..
        jmp     WorksetSave                           ; 9FFA 4C 61 97                 La.

; ----------------------------------------------------------------------------
L9FFD:
        lda     Workset + EntityV14                             ; 9FFD A5 34                    .4
        ora     Workset + EntityV15                             ; 9FFF 05 35                    .5
        beq     LA013                           ; A001 F0 10                    ..
        .byte   $A5,$34,$38,$E9,$01,$85,$34,$A5 ; A003 A5 34 38 E9 01 85 34 A5  .48...4.
        .byte   $35,$E9,$00,$85,$35,$4C,$61,$97 ; A00B 35 E9 00 85 35 4C 61 97  5...5La.
; ----------------------------------------------------------------------------
LA013:
        lda     $38                             ; A013 A5 38                    .8
        beq     LA02B                           ; A015 F0 14                    ..
        clc                                     ; A017 18                       .
        lda     Workset + EntityXSpeed                             ; A018 A5 31                    .1
        bpl     LA01D                           ; A01A 10 01                    ..
        sec                                     ; A01C 38                       8
LA01D:
        ror     Workset + EntityXSpeed                             ; A01D 66 31                    f1
        ror     Workset + EntityV10                             ; A01F 66 30                    f0
        jsr     WorksetMoveX                           ; A021 20 FA 97                  ..
        asl     Workset + EntityV10                             ; A024 06 30                    .0
        rol     Workset + EntityXSpeed                             ; A026 26 31                    &1
        jmp     LA02E                           ; A028 4C 2E A0                 L..

; ----------------------------------------------------------------------------
LA02B:
        jsr     WorksetMoveX                           ; A02B 20 FA 97                  ..
LA02E:
        lda     Workset + EntityX  + 1                            ; A02E A5 23                    .#
        cmp     #$10                            ; A030 C9 10                    ..
        beq     LA045                           ; A032 F0 11                    ..
        lda     Workset + EntityX                             ; A034 A5 22                    ."
        bcs     LA040                           ; A036 B0 08                    ..
        cmp     #$E0                            ; A038 C9 E0                    ..
        bcs     LA045                           ; A03A B0 09                    ..
        sec                                     ; A03C 38                       8
        jmp     LA046                           ; A03D 4C 46 A0                 LF.

; ----------------------------------------------------------------------------
LA040:
        cmp     #$20                            ; A040 C9 20                    . 
        jmp     LA046                           ; A042 4C 46 A0                 LF.

; ----------------------------------------------------------------------------
LA045:
        clc                                     ; A045 18                       .
LA046:
        bit     Workset + EntityV16                            ; A046 24 36                    $6
        bmi     LA053                           ; A048 30 09                    0.
        bcs     LA072                           ; A04A B0 26                    .&
        lda     #$80                            ; A04C A9 80                    ..
        sta     Workset + EntityV16                            ; A04E 85 36                    .6
        jmp     LA075                           ; A050 4C 75 A0                 Lu.

; ----------------------------------------------------------------------------
LA053:
        bcc     LA075                           ; A053 90 20                    . 
        lda     #$00                            ; A055 A9 00                    ..
        sta     Workset + EntityV16                            ; A057 85 36                    .6
        lda     Workset + EntityActive                             ; A059 A5 20                    . 
        eor     #$10                            ; A05B 49 10                    I.
        sta     Workset + EntityActive                             ; A05D 85 20                    . 
        lda     Workset + EntityXSpeed                             ; A05F A5 31                    .1
        eor     #$FF                            ; A061 49 FF                    I.
        tay                                     ; A063 A8                       .
        lda     Workset + EntityV10                             ; A064 A5 30                    .0
        eor     #$FF                            ; A066 49 FF                    I.
        clc                                     ; A068 18                       .
        adc     #$01                            ; A069 69 01                    i.
        sta     Workset + EntityV10                             ; A06B 85 30                    .0
        tya                                     ; A06D 98                       .
        adc     #$00                            ; A06E 69 00                    i.
        sta     Workset + EntityXSpeed                             ; A070 85 31                    .1
LA072:
        jmp     WorksetSave                           ; A072 4C 61 97                 La.

; ----------------------------------------------------------------------------
LA075:
        jsr     WorksetAnimationAdvance                           ; A075 20 BE 97                  ..
        jsr     L98F8                           ; A078 20 F8 98                  ..
        jsr     L9940                           ; A07B 20 40 99                  @.
        lda     $38                             ; A07E A5 38                    .8
        bne     LA0E3                           ; A080 D0 61                    .a
        bit     Workset + EntityV1F                             ; A082 24 3F                    $?
        bvc     LA0EE                           ; A084 50 68                    Ph
        ldx     PlayerPowerLevel                           ; A086 AE 91 03                 ...
        lda     JawsDamageByPowerLevel,x                         ; A089 BD 2D A1                 .-.
        sta     $16                             ; A08C 85 16                    ..
        lda     #$00                            ; A08E A9 00                    ..
        sta     $17                             ; A090 85 17                    ..
        ldx     $034A                           ; A092 AE 4A 03                 .J.
        lda     JawsDamageMultipliers,x                         ; A095 BD 28 A1                 .(.
        beq     LA09E                           ; A098 F0 04                    ..
        asl     $16                             ; A09A 06 16                    ..
        rol     $17                             ; A09C 26 17                    &.
LA09E:
        lda     JawsHP                           ; A09E AD 88 03                 ...
        sec                                     ; A0A1 38                       8
        sbc     $16                             ; A0A2 E5 16                    ..
        sta     JawsHP                           ; A0A4 8D 88 03                 ...
        lda     JawsHP+1                           ; A0A7 AD 89 03                 ...
        sbc     $17                             ; A0AA E5 17                    ..
        bpl     LA0B3                           ; A0AC 10 05                    ..
        .byte   $A9,$00,$8D,$88,$03             ; A0AE A9 00 8D 88 03           .....
; ----------------------------------------------------------------------------
LA0B3:
        sta     JawsHP+1                           ; A0B3 8D 89 03                 ...
        ora     JawsHP                           ; A0B6 0D 88 03                 ...
        bne     LA0C6                           ; A0B9 D0 0B                    ..
        lda     $0306                           ; A0BB AD 06 03                 ...
        ora     #$20                            ; A0BE 09 20                    . 
        sta     $0306                           ; A0C0 8D 06 03                 ...
        jmp     WorksetSave                           ; A0C3 4C 61 97                 La.

; ----------------------------------------------------------------------------
LA0C6:
        ldx     $034A                           ; A0C6 AE 4A 03                 .J.
        lda     JawsHitSounds,x                         ; A0C9 BD 23 A1                 .#.
        jsr     SoundPlay                           ; A0CC 20 CD E2                  ..
        lda     #$18                            ; A0CF A9 18                    ..
        sta     $38                             ; A0D1 85 38                    .8
        lda     $0304                           ; A0D3 AD 04 03                 ...
        ora     #$40                            ; A0D6 09 40                    .@
        sta     $0304                           ; A0D8 8D 04 03                 ...
        lda     #$01                            ; A0DB A9 01                    ..
        jsr     AwardPoints                           ; A0DD 20 D0 8C                  ..
        jmp     LA0EE                           ; A0E0 4C EE A0                 L..

; ----------------------------------------------------------------------------
LA0E3:
        jsr     WorksetAnimationAdvance                           ; A0E3 20 BE 97                  ..
        jsr     WorksetAnimationAdvance                           ; A0E6 20 BE 97                  ..
        jsr     WorksetAnimationAdvance                           ; A0E9 20 BE 97                  ..
        dec     $38                             ; A0EC C6 38                    .8
LA0EE:
        lda     #$00                            ; A0EE A9 00                    ..
        sta     Workset + EntityV12                            ; A0F0 85 32                    .2
        sta     Workset + EntityYSpeed                             ; A0F2 85 33                    .3
        lda     $1D                             ; A0F4 A5 1D                    ..
        bne     LA117                           ; A0F6 D0 1F                    ..
        lda     $1C                             ; A0F8 A5 1C                    ..
        cmp     #$08                            ; A0FA C9 08                    ..
        bcc     LA117                           ; A0FC 90 19                    ..
        lda     #$02                            ; A0FE A9 02                    ..
        bit     $15                             ; A100 24 15                    $.
        bne     LA10F                           ; A102 D0 0B                    ..
        lda     #$80                            ; A104 A9 80                    ..
        sta     Workset + EntityV12                            ; A106 85 32                    .2
        lda     #$00                            ; A108 A9 00                    ..
        sta     Workset + EntityYSpeed                             ; A10A 85 33                    .3
        jmp     LA117                           ; A10C 4C 17 A1                 L..

; ----------------------------------------------------------------------------
LA10F:
        lda     #$80                            ; A10F A9 80                    ..
        sta     Workset + EntityV12                            ; A111 85 32                    .2
        lda     #$FF                            ; A113 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; A115 85 33                    .3
LA117:
        jsr     L981B                           ; A117 20 1B 98                  ..
        jsr     L9A14                           ; A11A 20 14 9A                  ..
        jsr     L99D0                           ; A11D 20 D0 99                  ..
        jmp     WorksetSave                           ; A120 4C 61 97                 La.


; sound effects to play when jaws takes damage
JawsHitSounds:
        .byte SFXEncounterJawsHit               ; when hit with the boat
        .byte SFXEncounterJawsHarpoonHit        ; when hit with a harpoon
        .byte SFXEncounterJawsHit               ; when hit with the submarine
        .byte SFXEncounterJawsHarpoonHit        ; unused powerup state
        .byte SFXEncounterJawsHarpoonHit        ; unused powerup state

JawsDamageMultipliers:
        .byte 1                                 ; extra damage with boat
        .byte 0                                 ; normal damage with harpoon
        .byte 1                                 ; extra damage with submarine
        .byte 0                                 ; unused powerup state
        .byte 0                                 ; unused powerup state

JawsDamageByPowerLevel:
        .byte $08                               ; power level 0
        .byte $10                               ; power level 1
        .byte $20                               ; power level 2
        .byte $30                               ; power level 3
        .byte $40                               ; power level 4
        .byte $50                               ; power level 5
        .byte $60                               ; power level 6
        .byte $70                               ; power level 7
        .byte $80                               ; power level 8

; ----------------------------------------------------------------------------
LA136:
        lda     $0306                           ; A136 AD 06 03                 ...
        ora     #$01                            ; A139 09 01                    ..
        sta     $0306                           ; A13B 8D 06 03                 ...
        lda     $0486                           ; A13E AD 86 04                 ...
        ora     $0487                           ; A141 0D 87 04                 ...
        beq     LA157                           ; A144 F0 11                    ..
        lda     $0486                           ; A146 AD 86 04                 ...
        sec                                     ; A149 38                       8
        sbc     #$01                            ; A14A E9 01                    ..
        sta     $0486                           ; A14C 8D 86 04                 ...
        lda     $0487                           ; A14F AD 87 04                 ...
        sbc     #$00                            ; A152 E9 00                    ..
        sta     $0487                           ; A154 8D 87 04                 ...
LA157:
        lda     #<Enemy2Data                            ; A157 A9 20                    . 
        sta     WorksetPtr                             ; A159 85 40                    .@
        lda     #>Enemy2Data                            ; A15B A9 07                    ..
        sta     WorksetPtr+1                             ; A15D 85 41                    .A
        lda     $0480                           ; A15F AD 80 04                 ...
        sta     $46                             ; A162 85 46                    .F
LA164:
        ldy     #$00                            ; A164 A0 00                    ..
        lda     (WorksetPtr),y                         ; A166 B1 40                    .@
        bmi     LA1B0                           ; A168 30 46                    0F
        lda     $0486                           ; A16A AD 86 04                 ...
        ora     $0487                           ; A16D 0D 87 04                 ...
        bne     LA1C1                           ; A170 D0 4F                    .O
        lda     $0482                           ; A172 AD 82 04                 ...
        sta     $44                             ; A175 85 44                    .D
        lda     $0483                           ; A177 AD 83 04                 ...
        sta     $45                             ; A17A 85 45                    .E
        ldy     $0481                           ; A17C AC 81 04                 ...
        lda     #$02                            ; A17F A9 02                    ..
        bit     $0306                           ; A181 2C 06 03                 ,..
        bne     LA1C1                           ; A184 D0 3B                    .;
        lda     ($44),y                         ; A186 B1 44                    .D
        cmp     #$FF                            ; A188 C9 FF                    ..
        bne     LA197                           ; A18A D0 0B                    ..
        lda     $0306                           ; A18C AD 06 03                 ...
        ora     #$02                            ; A18F 09 02                    ..
        sta     $0306                           ; A191 8D 06 03                 ...
        jmp     LA1C1                           ; A194 4C C1 A1                 L..

; ----------------------------------------------------------------------------
LA197:
        iny                                     ; A197 C8                       .
        sty     $0481                           ; A198 8C 81 04                 ...
        ldy     #$01                            ; A19B A0 01                    ..
        sta     (WorksetPtr),y                         ; A19D 91 40                    .@
        dey                                     ; A19F 88                       .
        lda     #$80                            ; A1A0 A9 80                    ..
        sta     (WorksetPtr),y                         ; A1A2 91 40                    .@
        lda     $0484                           ; A1A4 AD 84 04                 ...
        sta     $0486                           ; A1A7 8D 86 04                 ...
        lda     $0485                           ; A1AA AD 85 04                 ...
        sta     $0487                           ; A1AD 8D 87 04                 ...
LA1B0:
        lda     $0306                           ; A1B0 AD 06 03                 ...
        and     #$FE                            ; A1B3 29 FE                    ).
        sta     $0306                           ; A1B5 8D 06 03                 ...
        jsr     WorksetLoad                           ; A1B8 20 54 97                  T.
        jsr     RunEntity                           ; A1BB 20 06 A2                  ..
        jsr     WorksetSave                           ; A1BE 20 61 97                  a.
LA1C1:
        lda     WorksetPtr                             ; A1C1 A5 40                    .@
        clc                                     ; A1C3 18                       .
        adc     #$20                            ; A1C4 69 20                    i 
        sta     WorksetPtr                             ; A1C6 85 40                    .@
        lda     WorksetPtr+1                             ; A1C8 A5 41                    .A
        adc     #$00                            ; A1CA 69 00                    i.
        sta     WorksetPtr+1                             ; A1CC 85 41                    .A
        dec     $46                             ; A1CE C6 46                    .F
        bne     LA164                           ; A1D0 D0 92                    ..
        lda     #$04                            ; A1D2 A9 04                    ..
        bit     $0306                           ; A1D4 2C 06 03                 ,..
        beq     LA1EA                           ; A1D7 F0 11                    ..
        lda     $0486                           ; A1D9 AD 86 04                 ...
        ora     $0487                           ; A1DC 0D 87 04                 ...
        bne     LA205                           ; A1DF D0 24                    .$
        lda     $0306                           ; A1E1 AD 06 03                 ...
        ora     #$40                            ; A1E4 09 40                    .@
        sta     $0306                           ; A1E6 8D 06 03                 ...
        rts                                     ; A1E9 60                       `

; ----------------------------------------------------------------------------
LA1EA:
        lda     #$03                            ; A1EA A9 03                    ..
        and     $0306                           ; A1EC 2D 06 03                 -..
        cmp     #$03                            ; A1EF C9 03                    ..
        bne     LA205                           ; A1F1 D0 12                    ..
        lda     $0306                           ; A1F3 AD 06 03                 ...
        ora     #$04                            ; A1F6 09 04                    ..
        sta     $0306                           ; A1F8 8D 06 03                 ...
        lda     #$40                            ; A1FB A9 40                    .@
        sta     $0486                           ; A1FD 8D 86 04                 ...
        lda     #$00                            ; A200 A9 00                    ..
        sta     $0487                           ; A202 8D 87 04                 ...
LA205:
        rts                                     ; A205 60                       `

; ----------------------------------------------------------------------------
RunEntity:
        lda Workset + EntityType
        jsr JumpEngine
        .addr RunEntityJellyfish
        .addr RunEntityStingray
        .addr RunEntityJellyfish2
        .addr RunEntityBabyshark
        .addr RunEntityStingray
        .addr $0000
        .addr $0000
        .addr $0000
        .addr RunEntityCrab
        .addr RunEntityShell
        .addr RunEntityStar

; ----------------------------------------------------------------------------
RunEntityJellyfish:
        bit     Workset + EntityActive
        bvs     @EntityIsActive
        lda     #$00
        sta     Workset + EntityV1F
        lda     #$C0
        sta     Workset + EntityActive
        jsr     LA32F
        lda     #$00
        sta     Workset + EntityV14
        jmp     LA25C
@EntityIsActive:
        jsr     WorksetAnimationAdvance
        bit     Workset + EntityV14
        bpl     LA243
        lda     Workset + EntityAnimTimer
        beq     SpawnEntityCrabOrStar
        rts
LA243:
        jsr     L98F8                           ; A243 20 F8 98                  ..
        jsr     L9940                           ; A246 20 40 99                  @.
        bit     Workset + EntityV1F                             ; A249 24 3F                    $?
        bvs     LA269                           ; A24B 70 1C                    p.
        jsr     L981B                           ; A24D 20 1B 98                  ..
        jsr     L99F2                           ; A250 20 F2 99                  ..
        bcs     WorksetDisableEntity                           ; A253 B0 3B                    .;
        ldy     #$08                            ; A255 A0 08                    ..
        jsr     L98BD                           ; A257 20 BD 98                  ..
        bcc     SharedRTS                           ; A25A 90 38                    .8
LA25C:
        lda     #$00                            ; A25C A9 00                    ..
        sta     Workset + EntityV12                            ; A25E 85 32                    .2
        lda     #$FE                            ; A260 A9 FE                    ..
        sta     Workset + EntityYSpeed                             ; A262 85 33                    .3
        lda     #AnimationEncounterJellyfish                            ; A264 A9 38                    .8
        jmp     WorksetAnimationPlay                           ; A266 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA269:
        lda     #$04                            ; A269 A9 04                    ..
        jsr     AwardPoints                           ; A26B 20 D0 8C                  ..
        lda     #SFXEncounterEnemyDeath                            ; A26E A9 0E                    ..
        jsr     SoundPlay                           ; A270 20 CD E2                  ..
        lda     #$80                            ; A273 A9 80                    ..
        sta     Workset + EntityV14                             ; A275 85 34                    .4
        lda     #AnimationEncounterBubble                            ; A277 A9 39                    .9
        jmp     WorksetAnimationPlay                           ; A279 4C AD 97                 L..

; ----------------------------------------------------------------------------
SpawnEntityCrabOrStar:
        ; advance the rng to determine powerup spawn type
        jsr     RNGAdvance
        and     #$07
        tax
        lda     CrabOrStarRNG,x
        ; if we hit a 0 in the spawn table, skip spawning
        beq     WorksetDisableEntity
        sta     Workset + EntityType
        lda     #$80
        sta     Workset + EntityActive
        jmp     RunEntity
WorksetDisableEntity:
        lda     #$00
        sta     Workset + EntityActive
SharedRTS:
        rts
CrabOrStarRNG:
        .byte $00
        .byte $00
        .byte $00
        .byte $08 ; crab
        .byte $00
        .byte $00
        .byte $00
        .byte $09 ; star

; this appears to be a duplicate of the jellyfish code.
; as far as i can tell it never actually runs.
RunEntityJellyfish2:
        bit     Workset + EntityActive
        bvs     @EntityIsActive
        lda     #$00
        sta     Workset + EntityV1F
        lda     #$C0
        sta     Workset + EntityActive
        jsr     LA32F
        lda     #$00
        sta     Workset + EntityV14
        jmp     @Continue1
@EntityIsActive:
        jsr     WorksetAnimationAdvance
        bit     Workset + EntityV14
        bpl     @LFF90
        lda     Workset + EntityAnimTimer
        beq     @SpawnEntityCrabOrStar
        rts
@LFF90:
        jsr     L98F8
        jsr     L9940
        bit     Workset + EntityV1F
        bvs     @LFFD4
        jsr     WorksetMoveX
        jsr     L981B
        jsr     L99F2
        bcs     @Disable
        ldy     #$08
        jsr     L98BD
        bcc     @Exit
@Continue1:
        lda     #$00
        sta     Workset + EntityV12        
        lda     #$FE
        sta     Workset + EntityV13        
        lda     Workset + EntityX
        cmp     $0682
        bcs     @LA2DB
        lda     #$80
        sta     Workset + EntityV10
        lda     #$00
        sta     Workset + EntityV11       
        jmp     $A2FD
@LA2DB:
        lda     #$80
        sta     Workset + EntityV10
        lda     #$FF
        sta     Workset + EntityV11        
        lda     #AnimationEncounterJellyfish
        jsr     WorksetAnimationPlay
        rts
@LFFD4:
        lda     #$04
        jsr     AwardPoints
        lda     #SFXEncounterEnemyDeath
        jsr     SoundPlay
        lda     #$80
        sta     $34
        lda     #AnimationEncounterBubble
        jmp     WorksetAnimationPlay
@SpawnEntityCrabOrStar:
        ; advance the rng to determine powerup spawn type
        jsr     RNGAdvance
        and     #$07
        tax
        lda     CrabOrStarRNG,x
        ; if we hit a 0 in the spawn table, skip spawning
        beq     @Disable
        sta     Workset + EntityType
        lda     #$80
        sta     Workset + EntityActive
        jmp     RunEntity
@Disable:
        lda     #$00
        sta     Workset + EntityActive
@Exit:
        rts

; ----------------------------------------------------------------------------
LA32F:
        lda     $033E                           ; A32F AD 3E 03                 .>.
        clc                                     ; A332 18                       .
        adc     #$20                            ; A333 69 20                    i 
        sta     Workset + EntityY                             ; A335 85 24                    .$
        lda     $033F                           ; A337 AD 3F 03                 .?.
        adc     #$00                            ; A33A 69 00                    i.
        sta     Workset + EntityY + 1                             ; A33C 85 25                    .%
        lda     PlayerX                           ; A33E AD 82 06                 ...
        and     #$F0                            ; A341 29 F0                    ).
        sta     $12                             ; A343 85 12                    ..
LA345:
        jsr     RNGAdvance                           ; A345 20 69 8C                  i.
        and     #$F0                            ; A348 29 F0                    ).
        sta     $13                             ; A34A 85 13                    ..
        ldx     TotalEncountersPlayed                           ; A34C AE 8E 03                 ...
        cpx     #$08                            ; A34F E0 08                    ..
        bcs     LA366                           ; A351 B0 13                    ..
        sec                                     ; A353 38                       8
        sbc     $12                             ; A354 E5 12                    ..
        bpl     LA35D                           ; A356 10 05                    ..
        eor     #$FF                            ; A358 49 FF                    I.
        clc                                     ; A35A 18                       .
        adc     #$01                            ; A35B 69 01                    i.
LA35D:
        lsr     a                               ; A35D 4A                       J
        lsr     a                               ; A35E 4A                       J
        lsr     a                               ; A35F 4A                       J
        lsr     a                               ; A360 4A                       J
        cmp     LA371,x                         ; A361 DD 71 A3                 .q.
        bcc     LA345                           ; A364 90 DF                    ..
LA366:
        lda     $13                             ; A366 A5 13                    ..
        ora     #$08                            ; A368 09 08                    ..
        sta     Workset + EntityX                             ; A36A 85 22                    ."
        lda     #$10                            ; A36C A9 10                    ..
        sta     Workset + EntityX  + 1                            ; A36E 85 23                    .#
        rts                                     ; A370 60                       `

; ----------------------------------------------------------------------------
LA371:
        .byte   $04,$04,$03,$03,$02,$02,$01,$01 ; A371 04 04 03 03 02 02 01 01  ........
; ----------------------------------------------------------------------------
RunEntityStingray:
        bit     Workset + EntityActive                             ; A379 24 20                    $ 
        bvs     LA3D6                           ; A37B 70 59                    pY
        lda     #$00                            ; A37D A9 00                    ..
        sta     Workset + EntityV1F                             ; A37F 85 3F                    .?
        sta     Workset + EntityV19                             ; A381 85 39                    .9
        sta     Workset + EntityV1A                             ; A383 85 3A                    .:
        lda     #$02                            ; A385 A9 02                    ..
        sta     $38                             ; A387 85 38                    .8
        lda     PlayerY                           ; A389 AD 84 06                 ...
        clc                                     ; A38C 18                       .
        adc     #$10                            ; A38D 69 10                    i.
        sta     Workset + EntityY                             ; A38F 85 24                    .$
        lda     PlayerY+1                           ; A391 AD 85 06                 ...
        adc     #$00                            ; A394 69 00                    i.
        sta     Workset + EntityY + 1                             ; A396 85 25                    .%
        jsr     L99D0                           ; A398 20 D0 99                  ..
        lda     #AnimationEncounterStingray                            ; A39B A9 3C                    .<
        jsr     WorksetAnimationPlay                           ; A39D 20 AD 97                  ..
        ldx     #$00                            ; A3A0 A2 00                    ..
        lda     Workset + EntityY                             ; A3A2 A5 24                    .$
        cmp     #$04                            ; A3A4 C9 04                    ..
        bne     LA3AA                           ; A3A6 D0 02                    ..
        .byte   $A2,$04                         ; A3A8 A2 04                    ..
; ----------------------------------------------------------------------------
LA3AA:
        stx     Workset + EntityV17                            ; A3AA 86 37                    .7
        lda     PlayerX                           ; A3AC AD 82 06                 ...
        bmi     LA3BF                           ; A3AF 30 0E                    0.
        lda     #$D0                            ; A3B1 A9 D0                    ..
        sta     Workset + EntityActive                             ; A3B3 85 20                    . 
        inx                                     ; A3B5 E8                       .
        inx                                     ; A3B6 E8                       .
        lda     #$10                            ; A3B7 A9 10                    ..
        sta     Workset + EntityX                             ; A3B9 85 22                    ."
        lda     #$11                            ; A3BB A9 11                    ..
        bne     LA3C9                           ; A3BD D0 0A                    ..
LA3BF:
        lda     #$C0                            ; A3BF A9 C0                    ..
        sta     Workset + EntityActive                             ; A3C1 85 20                    . 
        lda     #$F0                            ; A3C3 A9 F0                    ..
        sta     Workset + EntityX                             ; A3C5 85 22                    ."
        lda     #$0F                            ; A3C7 A9 0F                    ..
LA3C9:
        sta     Workset + EntityX  + 1                            ; A3C9 85 23                    .#
        lda     LA491,x                         ; A3CB BD 91 A4                 ...
        sta     Workset + EntityV10                             ; A3CE 85 30                    .0
        lda     LA492,x                         ; A3D0 BD 92 A4                 ...
        sta     Workset + EntityXSpeed                             ; A3D3 85 31                    .1
        rts                                     ; A3D5 60                       `

; ----------------------------------------------------------------------------
LA3D6:
        jsr     WorksetAnimationAdvance                           ; A3D6 20 BE 97                  ..
        lda     Workset + EntityV1A                             ; A3D9 A5 3A                    .:
        beq     LA3E0                           ; A3DB F0 03                    ..
        jmp     LA46C                           ; A3DD 4C 6C A4                 Ll.

; ----------------------------------------------------------------------------
LA3E0:
        lda     Workset + EntityV19                             ; A3E0 A5 39                    .9
        beq     LA3E7                           ; A3E2 F0 03                    ..
        dec     Workset + EntityV19                             ; A3E4 C6 39                    .9
        rts                                     ; A3E6 60                       `

; ----------------------------------------------------------------------------
LA3E7:
        jsr     L98F8                           ; A3E7 20 F8 98                  ..
        jsr     L9940                           ; A3EA 20 40 99                  @.
        bit     Workset + EntityV1F                             ; A3ED 24 3F                    $?
        bvs     LA449                           ; A3EF 70 58                    pX
        jsr     WorksetMoveX                           ; A3F1 20 FA 97                  ..
        lda     #$10                            ; A3F4 A9 10                    ..
        bit     Workset + EntityActive                             ; A3F6 24 20                    $ 
        bne     LA419                           ; A3F8 D0 1F                    ..
        lda     Workset + EntityX  + 1                            ; A3FA A5 23                    .#
        cmp     #$11                            ; A3FC C9 11                    ..
        bcc     LA406                           ; A3FE 90 06                    ..
        lda     Workset + EntityX                             ; A400 A5 22                    ."
        cmp     #$10                            ; A402 C9 10                    ..
        bcs     LA407                           ; A404 B0 01                    ..
LA406:
        rts                                     ; A406 60                       `

; ----------------------------------------------------------------------------
LA407:
        lda     #$D0                            ; A407 A9 D0                    ..
        sta     Workset + EntityActive                             ; A409 85 20                    . 
        ldx     Workset + EntityV17                            ; A40B A6 37                    .7
        lda     LA493,x                         ; A40D BD 93 A4                 ...
        sta     Workset + EntityV10                             ; A410 85 30                    .0
        lda     LA494,x                         ; A412 BD 94 A4                 ...
        sta     Workset + EntityXSpeed                             ; A415 85 31                    .1
        bne     LA435                           ; A417 D0 1C                    ..
LA419:
        lda     Workset + EntityX  + 1                            ; A419 A5 23                    .#
        cmp     #$10                            ; A41B C9 10                    ..
        bcs     LA488                           ; A41D B0 69                    .i
        lda     Workset + EntityX                             ; A41F A5 22                    ."
        cmp     #$EF                            ; A421 C9 EF                    ..
        bcs     LA488                           ; A423 B0 63                    .c
        lda     #$C0                            ; A425 A9 C0                    ..
        sta     Workset + EntityActive                             ; A427 85 20                    . 
        ldx     Workset + EntityV17                            ; A429 A6 37                    .7
        lda     LA491,x                         ; A42B BD 91 A4                 ...
        sta     Workset + EntityV10                             ; A42E 85 30                    .0
        lda     LA492,x                         ; A430 BD 92 A4                 ...
        sta     Workset + EntityXSpeed                             ; A433 85 31                    .1
LA435:
        lda     Workset + EntityY                             ; A435 A5 24                    .$
        sec                                     ; A437 38                       8
        sbc     #$20                            ; A438 E9 20                    . 
        sta     Workset + EntityY                             ; A43A 85 24                    .$
        lda     Workset + EntityY + 1                             ; A43C A5 25                    .%
        sbc     #$00                            ; A43E E9 00                    ..
        sta     Workset + EntityY + 1                             ; A440 85 25                    .%
        jsr     L99F2                           ; A442 20 F2 99                  ..
        bcc     LA488                           ; A445 90 41                    .A
        bcs     LA484                           ; A447 B0 3B                    .;
LA449:
        dec     $38                             ; A449 C6 38                    .8
        beq     LA459                           ; A44B F0 0C                    ..
        lda     #$00                            ; A44D A9 00                    ..
        jsr     AwardPoints                           ; A44F 20 D0 8C                  ..
        lda     #$08                            ; A452 A9 08                    ..
        sta     Workset + EntityV19                             ; A454 85 39                    .9
        jmp     LA488                           ; A456 4C 88 A4                 L..

; ----------------------------------------------------------------------------
LA459:
        lda     #$06                            ; A459 A9 06                    ..
        jsr     AwardPoints                           ; A45B 20 D0 8C                  ..
        lda     #SFXEncounterEnemyDeath                            ; A45E A9 0E                    ..
        jsr     SoundPlay                           ; A460 20 CD E2                  ..
        lda     #$80                            ; A463 A9 80                    ..
        sta     Workset + EntityV1A                             ; A465 85 3A                    .:
        lda     #AnimationEncounterStingrayDeath                            ; A467 A9 0E                    ..
        jmp     WorksetAnimationPlay                           ; A469 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA46C:
        lda     Workset + EntityAnimTimer                             ; A46C A5 2B                    .+
        bne     LA488                           ; A46E D0 18                    ..
        jsr     RNGAdvance                           ; A470 20 69 8C                  i.
        and     #$07                            ; A473 29 07                    ).
        tax                                     ; A475 AA                       .
        lda     LA489,x                         ; A476 BD 89 A4                 ...
        beq     LA484                           ; A479 F0 09                    ..
        sta     Workset + EntityType                             ; A47B 85 21                    .!
        lda     #$80                            ; A47D A9 80                    ..
        sta     Workset + EntityActive                             ; A47F 85 20                    . 
        jmp     RunEntity                           ; A481 4C 06 A2                 L..

; ----------------------------------------------------------------------------
LA484:
        lda     #$00                            ; A484 A9 00                    ..
        sta     Workset + EntityActive                             ; A486 85 20                    . 
LA488:
        rts                                     ; A488 60                       `

; ----------------------------------------------------------------------------
LA489:
        .byte   $00,$08,$00,$09,$00,$0A,$00,$09 ; A489 00 08 00 09 00 0A 00 09  ........
LA491:
        .byte   $00                             ; A491 00                       .
LA492:
        .byte   $01                             ; A492 01                       .
LA493:
        .byte   $00                             ; A493 00                       .
LA494:
        .byte   $FF,$00,$02,$00,$FE             ; A494 FF 00 02 00 FE           .....
; ----------------------------------------------------------------------------
RunEntityBabyshark:
        bit     Workset + EntityActive                             ; A499 24 20                    $ 
        bvs     LA4F9                           ; A49B 70 5C                    p\
        lda     PlayerY                           ; A49D AD 84 06                 ...
        sta     Workset + EntityY                             ; A4A0 85 24                    .$
        lda     PlayerY+1                           ; A4A2 AD 85 06                 ...
        sta     Workset + EntityY + 1                             ; A4A5 85 25                    .%
        lda     #$05                            ; A4A7 A9 05                    ..
        sta     Workset + EntityV15                             ; A4A9 85 35                    .5
        lda     #$00                            ; A4AB A9 00                    ..
        sta     Workset + EntityV16                            ; A4AD 85 36                    .6
        sta     $38                             ; A4AF 85 38                    .8
        sta     Workset + EntityV19                             ; A4B1 85 39                    .9
        jsr     RNGAdvance                           ; A4B3 20 69 8C                  i.
        and     #$07                            ; A4B6 29 07                    ).
        adc     #$07                            ; A4B8 69 07                    i.
        sta     Workset + EntityV17                            ; A4BA 85 37                    .7
        lda     #AnimationEncounterBabyshark                            ; A4BC A9 1F                    ..
        jsr     WorksetAnimationPlay                           ; A4BE 20 AD 97                  ..
        lda     PlayerX+1                           ; A4C1 AD 83 06                 ...
        cmp     #$10                            ; A4C4 C9 10                    ..
        bcc     LA4CF                           ; A4C6 90 07                    ..
        bne     LA4E4                           ; A4C8 D0 1A                    ..
        lda     PlayerX                           ; A4CA AD 82 06                 ...
        bpl     LA4E4                           ; A4CD 10 15                    ..
LA4CF:
        lda     #$C0                            ; A4CF A9 C0                    ..
        sta     Workset + EntityActive                             ; A4D1 85 20                    . 
        lda     #$E0                            ; A4D3 A9 E0                    ..
        sta     Workset + EntityX                             ; A4D5 85 22                    ."
        lda     #$0F                            ; A4D7 A9 0F                    ..
        sta     Workset + EntityX  + 1                            ; A4D9 85 23                    .#
        lda     #$00                            ; A4DB A9 00                    ..
        sta     Workset + EntityV10                             ; A4DD 85 30                    .0
        lda     #$01                            ; A4DF A9 01                    ..
        sta     Workset + EntityXSpeed                             ; A4E1 85 31                    .1
        rts                                     ; A4E3 60                       `

; ----------------------------------------------------------------------------
LA4E4:
        .byte   $A9,$D0,$85,$20,$A9,$20,$85,$22 ; A4E4 A9 D0 85 20 A9 20 85 22  ... . ."
        .byte   $A9,$11,$85,$23,$A9,$00,$85,$30 ; A4EC A9 11 85 23 A9 00 85 30  ...#...0
        .byte   $A9,$FF,$85,$31,$60             ; A4F4 A9 FF 85 31 60           ...1`
; ----------------------------------------------------------------------------
LA4F9:
        lda     Workset + EntityV19                             ; A4F9 A5 39                    .9
        beq     LA500                           ; A4FB F0 03                    ..
        jmp     LA5C0                           ; A4FD 4C C0 A5                 L..

; ----------------------------------------------------------------------------
LA500:
        lda     $38                             ; A500 A5 38                    .8
        beq     LA523                           ; A502 F0 1F                    ..
        clc                                     ; A504 18                       .
        lda     Workset + EntityXSpeed                             ; A505 A5 31                    .1
        bpl     LA50A                           ; A507 10 01                    ..
        .byte   $38                             ; A509 38                       8
; ----------------------------------------------------------------------------
LA50A:
        ror     Workset + EntityXSpeed                             ; A50A 66 31                    f1
        ror     Workset + EntityV10                             ; A50C 66 30                    f0
        jsr     WorksetMoveX                           ; A50E 20 FA 97                  ..
        asl     Workset + EntityV10                             ; A511 06 30                    .0
        rol     Workset + EntityXSpeed                             ; A513 26 31                    &1
        jsr     WorksetAnimationAdvance                           ; A515 20 BE 97                  ..
        jsr     WorksetAnimationAdvance                           ; A518 20 BE 97                  ..
        jsr     WorksetAnimationAdvance                           ; A51B 20 BE 97                  ..
        dec     $38                             ; A51E C6 38                    .8
        jmp     LA526                           ; A520 4C 26 A5                 L&.

; ----------------------------------------------------------------------------
LA523:
        jsr     WorksetMoveX                           ; A523 20 FA 97                  ..
LA526:
        jsr     L981B                           ; A526 20 1B 98                  ..
        jsr     L99F2                           ; A529 20 F2 99                  ..
        jsr     L99D0                           ; A52C 20 D0 99                  ..
        bit     Workset + EntityV16                            ; A52F 24 36                    $6
        bmi     LA53F                           ; A531 30 0C                    0.
        lda     #$01                            ; A533 A9 01                    ..
        bit     Workset + EntityV1F                             ; A535 24 3F                    $?
        bne     LA53A                           ; A537 D0 01                    ..
        rts                                     ; A539 60                       `

; ----------------------------------------------------------------------------
LA53A:
        lda     #$80                            ; A53A A9 80                    ..
        sta     Workset + EntityV16                            ; A53C 85 36                    .6
        rts                                     ; A53E 60                       `

; ----------------------------------------------------------------------------
LA53F:
        lda     #$01                            ; A53F A9 01                    ..
        bit     Workset + EntityV1F                             ; A541 24 3F                    $?
        bne     LA56A                           ; A543 D0 25                    .%
        .byte   $C6,$35,$D0,$05,$A9,$00,$85,$20 ; A545 C6 35 D0 05 A9 00 85 20  .5..... 
        .byte   $60,$A9,$00,$85,$36,$A5,$20,$49 ; A54D 60 A9 00 85 36 A5 20 49  `...6. I
        .byte   $10,$85,$20,$A5,$30,$49,$FF,$18 ; A555 10 85 20 A5 30 49 FF 18  .. .0I..
        .byte   $69,$01,$85,$30,$A5,$31,$49,$FF ; A55D 69 01 85 30 A5 31 49 FF  i..0.1I.
        .byte   $69,$00,$85,$31,$60             ; A565 69 00 85 31 60           i..1`
; ----------------------------------------------------------------------------
LA56A:
        jsr     WorksetAnimationAdvance                           ; A56A 20 BE 97                  ..
        jsr     L98F8                           ; A56D 20 F8 98                  ..
        jsr     L9940                           ; A570 20 40 99                  @.
        bit     Workset + EntityV1F                             ; A573 24 3F                    $?
        bvc     LA597                           ; A575 50 20                    P 
        lda     #SFXEncounterEnemyDeath                            ; A577 A9 0E                    ..
        jsr     SoundPlay                           ; A579 20 CD E2                  ..
        dec     Workset + EntityV17                            ; A57C C6 37                    .7
        bne     LA58E                           ; A57E D0 0E                    ..
        lda     #$0A                            ; A580 A9 0A                    ..
        jsr     AwardPoints                           ; A582 20 D0 8C                  ..
        lda     #$80                            ; A585 A9 80                    ..
        sta     Workset + EntityV19                             ; A587 85 39                    .9
        lda     #AnimationEncounterBabysharkDeath                            ; A589 A9 0F                    ..
        jmp     WorksetAnimationPlay                           ; A58B 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA58E:
        lda     #$00                            ; A58E A9 00                    ..
        jsr     AwardPoints                           ; A590 20 D0 8C                  ..
        lda     #$08                            ; A593 A9 08                    ..
        sta     $38                             ; A595 85 38                    .8
LA597:
        lda     $1D                             ; A597 A5 1D                    ..
        bne     LA5A8                           ; A599 D0 0D                    ..
        lda     $1C                             ; A59B A5 1C                    ..
        cmp     #$04                            ; A59D C9 04                    ..
        bcs     LA5A8                           ; A59F B0 07                    ..
        lda     #$00                            ; A5A1 A9 00                    ..
        sta     Workset + EntityV12                            ; A5A3 85 32                    .2
        sta     Workset + EntityYSpeed                             ; A5A5 85 33                    .3
        rts                                     ; A5A7 60                       `

; ----------------------------------------------------------------------------
LA5A8:
        lda     #$02                            ; A5A8 A9 02                    ..
        bit     $15                             ; A5AA 24 15                    $.
        bne     LA5B7                           ; A5AC D0 09                    ..
        lda     #$80                            ; A5AE A9 80                    ..
        sta     Workset + EntityV12                            ; A5B0 85 32                    .2
        lda     #$00                            ; A5B2 A9 00                    ..
        sta     Workset + EntityYSpeed                             ; A5B4 85 33                    .3
        rts                                     ; A5B6 60                       `

; ----------------------------------------------------------------------------
LA5B7:
        lda #$80
        sta Workset + EntityV12        
        lda #$FF
        sta Workset + EntityV13        
        rts 

; ----------------------------------------------------------------------------
LA5C0:
        jsr     WorksetAnimationAdvance                           ; A5C0 20 BE 97                  ..
        lda     Workset + EntityAnimTimer                             ; A5C3 A5 2B                    .+
        beq     LA5C8                           ; A5C5 F0 01                    ..
        rts                                     ; A5C7 60                       `

; ----------------------------------------------------------------------------
LA5C8:
        lda     #$80                            ; A5C8 A9 80                    ..
        sta     Workset + EntityActive                             ; A5CA 85 20                    . 
        lda     #$09                            ; A5CC A9 09                    ..
        sta     Workset + EntityType                             ; A5CE 85 21                    .!
        jmp     RunEntity                           ; A5D0 4C 06 A2                 L..

; ----------------------------------------------------------------------------
RunEntityCrab:
        bit Workset + EntityActive                             ; A5D3 24 20                    $ 
        bvs EncounterCrab                           ; A5D5 70 20                    p 
        lda PlayerCrabLevel                           ; A5D7 AD 92 03                 ...
        cmp #$03                            ; A5DA C9 03                    ..
        bcc LA5E5                           ; A5DC 90 07                    ..
        lda #$0A
        sta Workset + EntityType
        jmp RunEntityStar

; ----------------------------------------------------------------------------
LA5E5:
        lda     #$C0                            ; A5E5 A9 C0                    ..
        sta     Workset + EntityActive                             ; A5E7 85 20                    . 
        jsr     L98ED                           ; A5E9 20 ED 98                  ..
        lda     #$00                            ; A5EC A9 00                    ..
        sta     $38                             ; A5EE 85 38                    .8
        sta     Workset + EntityV1F                             ; A5F0 85 3F                    .?
        lda     #AnimationEncounterCrab                            ; A5F2 A9 2C                    .,
        jmp     WorksetAnimationPlay                           ; A5F4 4C AD 97                 L..

; ----------------------------------------------------------------------------
EncounterCrab:
        jsr HitDetectAgainstPlayer
        bcc LA61A
        ; play pickup sound
        lda #SFXEncounterPickup
        jsr SoundPlay
        ; award 30 points
        lda #$02
        jsr AwardPoints
        ; increment crab level
        inc PlayerCrabLevel
        lda PlayerCrabLevel
        cmp #$04
        bcc @Exit
        ; make sure we don't go over 4
        lda #$03
        sta PlayerCrabLevel
@Exit:
        lda #$00
        sta $20
        rts

; ----------------------------------------------------------------------------
LA61A:
        lda     Workset + EntityV18
        bne     LA642
        lda     #$08
        ldy     #$01
        jsr     L9841
        jsr     L981B
        jsr     L99D0
        bcc     @Exit
        inc     Workset + EntityV18
        ; set movement speed to +1
        ldy     #$01
        ; compare crab position to player x
        lda     PlayerX
        cmp     Workset + EntityX
        lda     PlayerX+1
        sbc     Workset + EntityX + 1
        bcs     @StoreSpeed
        ; set crab speed to -1 if player is to the left
        ldy     #$FF
@StoreSpeed:
        sty     Workset + EntityXSpeed
@Exit:
        rts

; ----------------------------------------------------------------------------
LA642:
        jsr     WorksetAnimationAdvance                           ; A642 20 BE 97                  ..
        jsr     WorksetMoveX                           ; A645 20 FA 97                  ..
        lda     Workset + EntityX  + 1                            ; A648 A5 23                    .#
        lda     #$01                            ; A64A A9 01                    ..
        and     Workset + EntityV1F                             ; A64C 25 3F                    %?
        bne     LA658                           ; A64E D0 08                    ..
        .byte   $C9,$10,$F0,$04,$A9,$00,$85,$20 ; A650 C9 10 F0 04 A9 00 85 20  ....... 
; ----------------------------------------------------------------------------
LA658:
        rts                                     ; A658 60                       `

; ----------------------------------------------------------------------------
RunEntityShell:
        bit     Workset + EntityActive                             ; A659 24 20                    $ 
        bvs     LA66D                           ; A65B 70 10                    p.
        lda     #$C0                            ; A65D A9 C0                    ..
        sta     Workset + EntityActive                             ; A65F 85 20                    . 
        jsr     L98ED                           ; A661 20 ED 98                  ..
        lda     #$00                            ; A664 A9 00                    ..
        sta     $38                             ; A666 85 38                    .8
        lda     #AnimationEncounterShell                            ; A668 A9 2D                    .-
        jmp     WorksetAnimationPlay                           ; A66A 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA66D:
        jsr     HitDetectAgainstPlayer                           ; A66D 20 61 99                  a.
        bcc     LA698                           ; A670 90 26                    .&
        lda     #SFXEncounterPickup                            ; A672 A9 15                    ..
        jsr     SoundPlay                           ; A674 20 CD E2                  ..
        lda     #$02                            ; A677 A9 02                    ..
        jsr     AwardPoints                           ; A679 20 D0 8C                  ..
        inc     PlayerShellCount                           ; A67C EE 90 03                 ...
        lda     PlayerShellCount                           ; A67F AD 90 03                 ...
        cmp     #$64                            ; A682 C9 64                    .d
        bcc     LA68B                           ; A684 90 05                    ..
        .byte   $A9,$63,$8D,$90,$03             ; A686 A9 63 8D 90 03           .c...
; ----------------------------------------------------------------------------
LA68B:
        lda     $0304                           ; A68B AD 04 03                 ...
        ora     #$08                            ; A68E 09 08                    ..
        sta     $0304                           ; A690 8D 04 03                 ...
        lda     #$00                            ; A693 A9 00                    ..
        sta     Workset + EntityActive                             ; A695 85 20                    . 
        rts                                     ; A697 60                       `

; ----------------------------------------------------------------------------
LA698:
        bit     $38                             ; A698 24 38                    $8
        bpl     LA6A2                           ; A69A 10 06                    ..
        dec     Workset + EntityV19                             ; A69C C6 39                    .9
        bne     LA6BC                           ; A69E D0 1C                    ..
        .byte   $F0,$F1                         ; A6A0 F0 F1                    ..
; ----------------------------------------------------------------------------
LA6A2:
        jsr     WorksetAnimationAdvance                           ; A6A2 20 BE 97                  ..
        lda     #$04                            ; A6A5 A9 04                    ..
        ldy     #$01                            ; A6A7 A0 01                    ..
        jsr     L9841                           ; A6A9 20 41 98                  A.
        jsr     L981B                           ; A6AC 20 1B 98                  ..
        jsr     L99D0                           ; A6AF 20 D0 99                  ..
        bcc     LA6BC                           ; A6B2 90 08                    ..
        lda     #$80                            ; A6B4 A9 80                    ..
        sta     $38                             ; A6B6 85 38                    .8
        lda     #$80                            ; A6B8 A9 80                    ..
        sta     Workset + EntityV19                             ; A6BA 85 39                    .9
LA6BC:
        rts                                     ; A6BC 60                       `

; ----------------------------------------------------------------------------
RunEntityStar:
        bit     Workset + EntityActive                             ; A6BD 24 20                    $ 
        bvs     LA6D3                           ; A6BF 70 12                    p.
        lda     #$C0                            ; A6C1 A9 C0                    ..
        sta     Workset + EntityActive                             ; A6C3 85 20                    . 
        jsr     L98ED                           ; A6C5 20 ED 98                  ..
        lda     #$00                            ; A6C8 A9 00                    ..
        sta     $38                             ; A6CA 85 38                    .8
        sta     Workset + EntityV14                             ; A6CC 85 34                    .4
        lda     #AnimationEncounterStar                            ; A6CE A9 2E                    ..
        jmp     WorksetAnimationPlay                           ; A6D0 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA6D3:
        bit     Workset + EntityV14                             ; A6D3 24 34                    $4
        bpl     LA6E2                           ; A6D5 10 0B                    ..
        jsr     L981B                           ; A6D7 20 1B 98                  ..
        jsr     WorksetAnimationAdvance                           ; A6DA 20 BE 97                  ..
        lda     Workset + EntityAnimTimer                             ; A6DD A5 2B                    .+
        beq     LA70C                           ; A6DF F0 2B                    .+
        rts                                     ; A6E1 60                       `

; ----------------------------------------------------------------------------
LA6E2:
        jsr     HitDetectAgainstPlayer                           ; A6E2 20 61 99                  a.
        bcc     LA711                           ; A6E5 90 2A                    .*
        lda     #SFXEncounterPickup                            ; A6E7 A9 15                    ..
        jsr     SoundPlay                           ; A6E9 20 CD E2                  ..
        jsr     RNGAdvance                           ; A6EC 20 69 8C                  i.
        and     #$06                            ; A6EF 29 06                    ).
        tax                                     ; A6F1 AA                       .
        lda     LA737,x                         ; A6F2 BD 37 A7                 .7.
        pha                                     ; A6F5 48                       H
        lda     LA736,x                         ; A6F6 BD 36 A7                 .6.
        jsr     AwardPoints                           ; A6F9 20 D0 8C                  ..
        lda     #$80                            ; A6FC A9 80                    ..
        sta     Workset + EntityV14                             ; A6FE 85 34                    .4
        lda     #$00                            ; A700 A9 00                    ..
        sta     Workset + EntityV12                            ; A702 85 32                    .2
        lda     #$FF                            ; A704 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; A706 85 33                    .3
        pla                                     ; A708 68                       h
        jmp     WorksetAnimationPlay                           ; A709 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA70C:
        lda     #$00                            ; A70C A9 00                    ..
        sta     Workset + EntityActive                             ; A70E 85 20                    . 
        rts                                     ; A710 60                       `

; ----------------------------------------------------------------------------
LA711:
        jsr     WorksetAnimationAdvance                           ; A711 20 BE 97                  ..
        bit     $38                             ; A714 24 38                    $8
        bpl     LA71E                           ; A716 10 06                    ..
        dec     Workset + EntityV19                             ; A718 C6 39                    .9
        bne     LA735                           ; A71A D0 19                    ..
        beq     LA70C                           ; A71C F0 EE                    ..
LA71E:
        lda     #$04                            ; A71E A9 04                    ..
        ldy     #$01                            ; A720 A0 01                    ..
        jsr     L9841                           ; A722 20 41 98                  A.
        jsr     L981B                           ; A725 20 1B 98                  ..
        jsr     L99D0                           ; A728 20 D0 99                  ..
        bcc     LA735                           ; A72B 90 08                    ..
        lda     #$80                            ; A72D A9 80                    ..
        sta     $38                             ; A72F 85 38                    .8
        lda     #$80                            ; A731 A9 80                    ..
        sta     Workset + EntityV19                             ; A733 85 39                    .9
LA735:
        rts                                     ; A735 60                       `

; ----------------------------------------------------------------------------
LA736:
        .byte   $0A                             ; A736 0A                       .
LA737:
        .byte   $35,$0A,$35,$0C,$36,$0E,$37     ; A737 35 0A 35 0C 36 0E 37     5.5.6.7
; ----------------------------------------------------------------------------
InitJawsStashedLocation:
        lda     #$18                            ; A73E A9 18                    ..
        sta     JawsStashedX                           ; A740 8D 48 03                 .H.
        lda     #$0C                            ; A743 A9 0C                    ..
        sta     JawsStashedY                           ; A745 8D 49 03                 .I.
        rts                                     ; A748 60                       `

; ----------------------------------------------------------------------------
LA749:
        @TempPointer = $44
        lda     TotalEncountersPlayed
        asl     a
        tax
        lda     UnknownData3_Pointers,x
        sta     @TempPointer
        lda     UnknownData3_Pointers+1,x
        sta     @TempPointer+1
        ldy     #$00
        lda     (@TempPointer),y
        iny
        cmp     #$03
        bcc     @LA76A
        ldx     EncounterJawsActive
        cpx     #$02
        bcs     @LA76A
        lda     #$03
@LA76A:
        sta     $0480
        lda     (@TempPointer),y
        iny
        sta     $0484
        sta     $0486
        lda     (@TempPointer),y
        iny
        sta     $0482
        lda     (@TempPointer),y
        sta     $0483
        lda     #$00
        sta     $0481
        lda     #$00
        sta     $0485
        sta     $0487
        rts

; ----------------------------------------------------------------------------
DrawStatusLine:
        lda     #RomGraphicsStatusLineText                            ; A78F A9 01                    ..
        jsr     DrawRomGraphics                           ; A791 20 69 8D                  i.
        jsr     DrawStatusLine_Score                       ; A794 20 9E A7                  ..
        jsr     DrawStatusLine_JawsPower                           ; A797 20 5C A9                  \.
        jsr     DrawStatusLine_Shells                           ; A79A 20 92 A9                  ..
        rts                                     ; A79D 60                       `

; ----------------------------------------------------------------------------
DrawStatusLine_Score: ; A79E
        jsr PPURenderHorizontal
        ; set draw location to 2B81 (score digits)
        lda #$2B
        sta PPUADDR 
        lda #$81
        sta PPUADDR 
        ldx #$00 ; first score digit
        ldy #$20 ; space character
@DrawLeadingZeroes:
        lda CurrentScore,x ; load score digit
        bne @DrawDigit
        sty PPUDATA ; write space to ppu if digit was 0
        inx 
        cpx #$05 ; draw up to 5 spaces, after that we draw 00 if there was no score.
        bcc @DrawLeadingZeroes
@LoadNextDigit:
        lda CurrentScore,x ; load score digit
@DrawDigit:
        clc 
        adc #$30  ; shift down to numbers range in the pattern table
        sta PPUDATA ; draw digit
        inx 
        cpx #$07  ; draw 7 characters for the score
        bcc @LoadNextDigit
        rts 

; ----------------------------------------------------------------------------
MapRunJawsTracker:
        @Temp = $12
        ; exit if the player does not have the tracker
        lda PlayerHasTracker
        bmi @MapRunJawsTracker
        rts
@MapRunJawsTracker:
        ; skip ahead if jaws is moving farther away
        lda TrackerDistancePrev
        cmp TrackerDistanceNext
        bcs @CheckTimerExpiration
        ; skip ahead if jaws is >= 16 units away
        cmp #$10
        bcs @CheckTimerExpiration
        ldx TrackerDistanceNext
        cpx #$10
        bcs @CheckTimerExpiration
        ; otherwise store a new pulse timer based on
        ; the tracker timer for our new distance compared to old
        sta TrackerDistanceNext
        lda @TrackerTimers,x
        ldx TrackerDistancePrev
        sec
        sbc @TrackerTimers,x
        sta @Temp
        lda TrackerTimer
        sec
        sbc @Temp
        bcs @UpdateTimer
        lda #$00
@UpdateTimer:
        sta TrackerTimer
@CheckTimerExpiration:
        ; if the timer is 0, we can play the sound!
        lda TrackerTimer
        beq @PlaySoundIfNeeded
        ; otherwise decrement the timer and update ui.
        dec TrackerTimer
        jmp @UpdateStatusbarIfNeeded
@PlaySoundIfNeeded:
        ; check so that we are close enough to play the sound.
        lda TrackerDistancePrev
        cmp #$10
        bcs @UpdateStatusbarIfNeeded
        ; update the timer based on distance, play the sound and
        ; prepare the ui animation
        sta TrackerDistanceNext
        tax
        lda @TrackerTimers,x
        sta TrackerTimer
        lda #SFXMapTrackerPulse
        jsr SoundPlay
        lda #$00
        sta TrackerAnimationIndex
        lda #$01
        sta TrackerAnimationTimer
@UpdateStatusbarIfNeeded:
        ; wait for next timer animation update
        lda TrackerAnimationTimer
        beq @Done
        dec TrackerAnimationTimer
        bne @Done
        lda TrackerAnimationIndex
        cmp #$09
        bcs @Done
        inc TrackerAnimationIndex
        ldx #$04
        stx TrackerAnimationTimer
        asl a
        tay
        ; place new tiles in vram buffer
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; set ppu address to $2B6F, and mark the buffer as having multiple bytes
        lda #$2B | VRAMFlagMultipleBytes
        sta VRAMBuffer,x
        inx
        lda #$6F
        sta VRAMBuffer,x
        inx
        ; set bytes to draw
        lda #$02
        sta VRAMBuffer,x
        inx
        ; and load in the next tracker animation tiles
        lda @TrackerAnimationTiles,y
        sta VRAMBuffer,x
        inx
        lda @TrackerAnimationTiles+1,y
        sta VRAMBuffer,x
        inx
        ; store new vram offset and flag as active
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda $0304
        ora #$10
        sta $0304
@Done:
        rts

; cooldown for the tracker, used to slow the tracker down based
; on players distance to jaws
@TrackerTimers:
        .byte $18,$20,$30,$40,$50,$60,$70,$80,$90,$A0,$B0,$C0,$D0,$E0,$F0,$FF

; sets of two tiles showing the trackers pulse in the statusbar
@TrackerAnimationTiles:
        .byte $0D,$0C
        .byte $1D,$0C
        .byte $0E,$0F
        .byte $1E,$1F
        .byte $24,$25
        .byte $0B,$27
        .byte $0B,$28
        .byte $0B,$29
        .byte $0B,$0C


; ----------------------------------------------------------------------
; Copy data from rom into vram buffer
; Example:
;
;   jsr CopyToVRAMBuffer
;   .addr DataToCopy
;   rts
;
;   DataToCopy:
;   .byte 3, 1, "HEY"
;
; Running this code will write $81 $03 "HEY" into $102
;
CopyToVRAMBuffer:
        @TempPointer    = $44
        @TempCopyLength = $0F
        @TempTarget     = $102
        ; start by setting the pointer to our callsite
        pla
        sta @TempPointer
        pla
        sta @TempPointer+1
        jsr @IncrementPointer
        ldy #0
        ; then get the next address from that pointer
        lda (@TempPointer),y
        tax
        jsr @IncrementPointer
        lda (@TempPointer),y
        tay
        ; put return site back onto the stack
        lda @TempPointer+1
        pha
        lda @TempPointer
        pha
        ; and update the pointer to our data
        stx @TempPointer
        sty @TempPointer+1
        ldy #0
        sty VRAMBufferActive
        ; use $101 as a copy offset
        ldx VRAMBufferOffset
        lda (@TempPointer),y
        sta VRAMBuffer+1,x
        inx
        iny
        lda (@TempPointer),y
        ora #VRAMFlagMultipleBytes
        sta VRAMBufferOffset,x
        inx
        iny
        lda (@TempPointer),y
        sta VRAMBuffer,x
        sta @TempCopyLength
        inx
        iny
@KeepCopying:
        lda (@TempPointer),y
        sta VRAMBuffer,x
        inx
        iny
        dec @TempCopyLength
        bne @KeepCopying
        ; store new offset at $101
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda $0304
        ora #$10
        sta $0304
        rts
@IncrementPointer:
        inc @TempPointer
        bne @Done
        inc @TempPointer+1
@Done:
        rts

; ----------------------------------------------------------------------------
VRAMFlagMultipleBytes = %10000000

DrawVRAMBuffer:
        lda VRAMBufferActive
        bpl @Done
        lda VRAMBufferOffset
        beq @Done
        lda PPUCTRL_MIRROR
        and #%11111011                   ; clear vertical rendering flag
        sta PPUCTRL
        ldx #$00
@CopyNextBuffer:
        lda VRAMBuffer,x
        bmi @DrawMultipleBytes           ; check if negative flag is set, otherwise draw single byte
        sta PPUADDR
        inx
        lda VRAMBuffer,x
        sta PPUADDR
        inx
        lda VRAMBuffer,x
        sta PPUDATA
        inx
        jmp @NextBuffer
@DrawMultipleBytes:
        ; remove multiple bytes flag to get real ppu address
        and #($FF ^ VRAMFlagMultipleBytes)
        sta PPUADDR
        inx
        lda VRAMBuffer,x
        sta PPUADDR
        inx
        ldy VRAMBuffer,x
        inx
@KeepDrawing:
        lda VRAMBuffer,x
        sta PPUDATA
        inx
        dey
        bne @KeepDrawing
@NextBuffer:
        cpx VRAMBufferOffset
        bcc @CopyNextBuffer
        lda #$00
        sta VRAMBufferOffset
@Done:
        lda #$00
        sta NextStatusbarToDraw
        rts

; ----------------------------------------------------------------------------
DrawStatusLine_JawsPower:
        jsr     PPURenderHorizontal
        ; draw at $2B94, where the jaws power bar is
        lda     #$2B
        sta     PPUADDR
        lda     #$94
        sta     PPUADDR
        ldy     #$08
        ldx     #$0A
        lda     JawsHP+1
@DrawFullBar:
        cmp     #$02
        bcc     @DrawHalfBar
        sty     PPUDATA
        sbc     #$02
        dex
        bne     @DrawFullBar
        rts
@DrawHalfBar:
        cmp     #$00
        beq     @DrawEmptyBars
        ldy     #$09
        sty     PPUDATA
        dex
        beq     @Done
@DrawEmptyBars:
        ldy     #$0A
@DrawEmptyBar:
        sty     PPUDATA
        dex
        bne     @DrawEmptyBar
@Done:
        rts

; ----------------------------------------------------------------------------
DrawStatusLine_Shells:
        jsr     PPURenderHorizontal
        ; draw at $2B94, where the shell counter is
        lda     #$2B
        sta     PPUADDR
        lda     #$8C
        sta     PPUADDR
        lda     PlayerShellCount
        jsr     ConvertAToBCD
        jsr     MoveAAndYToAsciiTable
        pha
        tya
        ; make doubly-certain that we're in the ascii table and
        ; then write the shell counter to ppu
        ora     #$30
        sta     PPUDATA
        pla
        ora     #$30
        sta     PPUDATA
        rts

; ----------------------------------------------------------------------------
LA9B6:
        lda     $031A                           ; A9B6 AD 1A 03                 ...
        cmp     #$10                            ; A9B9 C9 10                    ..
        bcc     LA9E0                           ; A9BB 90 23                    .#
        lda     NextStatusbarToDraw                           ; A9BD AD 03 03                 ...
        bne     LA9E3                           ; A9C0 D0 21                    .!
        lda     #$00                            ; A9C2 A9 00                    ..
        sta     $031A                           ; A9C4 8D 1A 03                 ...
        inc     $031B                           ; A9C7 EE 1B 03                 ...
        lda     $031B                           ; A9CA AD 1B 03                 ...
        cmp     #$06                            ; A9CD C9 06                    ..
        bcc     LA9D6                           ; A9CF 90 05                    ..
        lda     #$00                            ; A9D1 A9 00                    ..
        sta     $031B                           ; A9D3 8D 1B 03                 ...
LA9D6:
        lda     $0304                           ; A9D6 AD 04 03                 ...
        ora     #$20                            ; A9D9 09 20                    . 
        sta     $0304                           ; A9DB 8D 04 03                 ...
        bne     LA9E3                           ; A9DE D0 03                    ..
LA9E0:
        inc     $031A                           ; A9E0 EE 1A 03                 ...
LA9E3:
        rts                                     ; A9E3 60                       `

; ----------------------------------------------------------------------------
DrawEncounterWaves:
        jsr     PPURenderHorizontal
        lda     WaterHeight
        clc
        adc     #$20
        sta     $FA
        lda     #$08
        asl     $FA
        rol     a
        asl     $FA
        rol     a
        sta     PPUADDR
        lda     $FA
        sta     PPUADDR
        lda     $031B
        asl     a
        asl     a
        tax
        lda     @WaveTiles,x
        inx
        sta     $FA
        lda     @WaveTiles,x
        inx
        sta     $FB
        lda     @WaveTiles,x
        inx
        sta     $FC
        lda     @WaveTiles,x
        sta     $FD
        ldx     #$08
@LAA1E:
        lda     $FA
        sta     PPUDATA
        lda     $FB
        sta     PPUDATA
        lda     $FC
        sta     PPUDATA
        lda     $FD
        sta     PPUDATA
        dex
        bne     @LAA1E
        rts
@WaveTiles:
        .byte   $CC,$CD,$CE,$CF,$DC,$DD,$DE,$DF
        .byte   $EC,$ED,$EE,$EF,$FC,$FD,$FE,$FF
        .byte   $EC,$ED,$EE,$EF,$DC,$DD,$DE,$DF
; ----------------------------------------------------------------------------
LAA4E:
        lda     NextStatusbarToDraw                           ; AA4E AD 03 03                 ...
        beq     LAA54                           ; AA51 F0 01                    ..
        rts                                     ; AA53 60                       `

; ----------------------------------------------------------------------------
LAA54:
        lda     $032D                           ; AA54 AD 2D 03                 .-.
        cmp     $0329                           ; AA57 CD 29 03                 .).
        bne     LAA65                           ; AA5A D0 09                    ..
        lda     $032C                           ; AA5C AD 2C 03                 .,.
        cmp     $0328                           ; AA5F CD 28 03                 .(.
        bne     LAA65                           ; AA62 D0 01                    ..
        rts                                     ; AA64 60                       `

; ----------------------------------------------------------------------------
LAA65:
        bcs     LAA7A                           ; AA65 B0 13                    ..
        ldy     #$01                            ; AA67 A0 01                    ..
        lda     $0328                           ; AA69 AD 28 03                 .(.
        clc                                     ; AA6C 18                       .
        adc     #$F0                            ; AA6D 69 F0                    i.
        tax                                     ; AA6F AA                       .
        lda     $0329                           ; AA70 AD 29 03                 .).
        adc     #$00                            ; AA73 69 00                    i.
        cmp     #$02                            ; AA75 C9 02                    ..
        bcc     LAA8B                           ; AA77 90 12                    ..
        rts                                     ; AA79 60                       `

; ----------------------------------------------------------------------------
LAA7A:
        ldy     #$03                            ; AA7A A0 03                    ..
        lda     $0328                           ; AA7C AD 28 03                 .(.
        sec                                     ; AA7F 38                       8
        sbc     #$00                            ; AA80 E9 00                    ..
        tax                                     ; AA82 AA                       .
        lda     $0329                           ; AA83 AD 29 03                 .).
        sbc     #$00                            ; AA86 E9 00                    ..
        bpl     LAA8B                           ; AA88 10 01                    ..
        .byte   $60                             ; AA8A 60                       `
; ----------------------------------------------------------------------------
LAA8B:
        lsr     a                               ; AA8B 4A                       J
        txa                                     ; AA8C 8A                       .
        ror     a                               ; AA8D 6A                       j
        lsr     a                               ; AA8E 4A                       J
        lsr     a                               ; AA8F 4A                       J
        lsr     a                               ; AA90 4A                       J
        sta     $00                             ; AA91 85 00                    ..
        and     #$0F                            ; AA93 29 0F                    ).
        tax                                     ; AA95 AA                       .
        lda     $00                             ; AA96 A5 00                    ..
        cmp     $0470,x                         ; AA98 DD 70 04                 .p.
        beq     LAAA6                           ; AA9B F0 09                    ..
        sty     NextStatusbarToDraw                           ; AA9D 8C 03 03                 ...
        jsr     LAAF0                           ; AAA0 20 F0 AA                  ..
        jsr     LAB50                           ; AAA3 20 50 AB                  P.
LAAA6:
        lda     $0328                           ; AAA6 AD 28 03                 .(.
        sta     $032C                           ; AAA9 8D 2C 03                 .,.
        lda     $0329                           ; AAAC AD 29 03                 .).
        sta     $032D                           ; AAAF 8D 2D 03                 .-.
        rts                                     ; AAB2 60                       `

; ----------------------------------------------------------------------------
LAAB3:
        lda     $0329                           ; AAB3 AD 29 03                 .).
        sta     $01                             ; AAB6 85 01                    ..
        sta     $032D                           ; AAB8 8D 2D 03                 .-.
        lda     $0328                           ; AABB AD 28 03                 .(.
        sta     $032C                           ; AABE 8D 2C 03                 .,.
        lsr     $01                             ; AAC1 46 01                    F.
        ror     a                               ; AAC3 6A                       j
        lsr     a                               ; AAC4 4A                       J
        lsr     a                               ; AAC5 4A                       J
        lsr     a                               ; AAC6 4A                       J
        sta     $00                             ; AAC7 85 00                    ..
        pha                                     ; AAC9 48                       H
        lda     #$10                            ; AACA A9 10                    ..
        sta     $01                             ; AACC 85 01                    ..
LAACE:
        jsr     LAAF0                           ; AACE 20 F0 AA                  ..
        jsr     LAB9A                           ; AAD1 20 9A AB                  ..
        inc     $00                             ; AAD4 E6 00                    ..
        dec     $01                             ; AAD6 C6 01                    ..
        bne     LAACE                           ; AAD8 D0 F4                    ..
        pla                                     ; AADA 68                       h
        sta     $00                             ; AADB 85 00                    ..
        lda     #$08                            ; AADD A9 08                    ..
        sta     $08                             ; AADF 85 08                    ..
LAAE1:
        jsr     LAB50                           ; AAE1 20 50 AB                  P.
        jsr     DrawBGDataPage3
        inc     $00                             ; AAE7 E6 00                    ..
        inc     $00                             ; AAE9 E6 00                    ..
        dec     $01                             ; AAEB C6 01                    ..
        bne     LAAE1                           ; AAED D0 F2                    ..
        rts                                     ; AAEF 60                       `

; ----------------------------------------------------------------------------
LAAF0:
        lda     $00                             ; AAF0 A5 00                    ..
        and     #$0F                            ; AAF2 29 0F                    ).
        tax                                     ; AAF4 AA                       .
        lda     $00                             ; AAF5 A5 00                    ..
        sta     $0470,x                         ; AAF7 9D 70 04                 .p.
        asl     a                               ; AAFA 0A                       .
        adc     $00                             ; AAFB 65 00                    e.
        sta     $02                             ; AAFD 85 02                    ..
        lda     #$00                            ; AAFF A9 00                    ..
        asl     $02                             ; AB01 06 02                    ..
        rol     a                               ; AB03 2A                       *
        asl     $02                             ; AB04 06 02                    ..
        rol     a                               ; AB06 2A                       *
        asl     $02                             ; AB07 06 02                    ..
        rol     a                               ; AB09 2A                       *
        adc     #$F7                            ; AB0A 69 F7                    i.
        sta     $03                             ; AB0C 85 03                    ..
        ldx     #$00                            ; AB0E A2 00                    ..
LAB10:
        txa                                     ; AB10 8A                       .
        tay                                     ; AB11 A8                       .
        lda     ($02),y                         ; AB12 B1 02                    ..
        sta     $04                             ; AB14 85 04                    ..
        lda     #$00                            ; AB16 A9 00                    ..
        tay                                     ; AB18 A8                       .
        asl     $04                             ; AB19 06 04                    ..
        rol     a                               ; AB1B 2A                       *
        asl     $04                             ; AB1C 06 04                    ..
        rol     a                               ; AB1E 2A                       *
        adc     #$FB                            ; AB1F 69 FB                    i.
        sta     $05                             ; AB21 85 05                    ..
        txa                                     ; AB23 8A                       .
        pha                                     ; AB24 48                       H
        asl     a                               ; AB25 0A                       .
        tax                                     ; AB26 AA                       .
        lda     ($04),y                         ; AB27 B1 04                    ..
        iny                                     ; AB29 C8                       .
        sta     BGDataPage1,x                         ; AB2A 9D 00 04                 ...
        lda     ($04),y                         ; AB2D B1 04                    ..
        iny                                     ; AB2F C8                       .
        sta     BGDataPage2,x                         ; AB30 9D 30 04                 .0.
        lda     ($04),y                         ; AB33 B1 04                    ..
        iny                                     ; AB35 C8                       .
        sta     BGDataPage1+1,x                         ; AB36 9D 01 04                 ...
        lda     ($04),y                         ; AB39 B1 04                    ..
        sta     BGDataPage2+1,x                         ; AB3B 9D 31 04                 .1.
        pla                                     ; AB3E 68                       h
        tax                                     ; AB3F AA                       .
        inx                                     ; AB40 E8                       .
        cpx     #$18                            ; AB41 E0 18                    ..
        bcc     LAB10                           ; AB43 90 CB                    ..
        lda     $00                             ; AB45 A5 00                    ..
        asl     a                               ; AB47 0A                       .
        and     #$1E                            ; AB48 29 1E                    ).
        adc     #$80                            ; AB4A 69 80                    i.
        sta     BGDataDrawOffset                           ; AB4C 8D 6D 04                 .m.
        rts                                     ; AB4F 60                       `

; ----------------------------------------------------------------------------
LAB50:
        lda     $00                             ; AB50 A5 00                    ..
        and     #$0E                            ; AB52 29 0E                    ).
        tax                                     ; AB54 AA                       .
        lda     $0470,x                         ; AB55 BD 70 04                 .p.
        lsr     a                               ; AB58 4A                       J
        sta     $02                             ; AB59 85 02                    ..
        asl     a                               ; AB5B 0A                       .
        adc     $02                             ; AB5C 65 02                    e.
        asl     a                               ; AB5E 0A                       .
        asl     a                               ; AB5F 0A                       .
        adc     $02                             ; AB60 65 02                    e.
        sta     $02                             ; AB62 85 02                    ..
        lda     $0471,x                         ; AB64 BD 71 04                 .q.
        lsr     a                               ; AB67 4A                       J
        sta     $04                             ; AB68 85 04                    ..
        asl     a                               ; AB6A 0A                       .
        adc     $04                             ; AB6B 65 04                    e.
        asl     a                               ; AB6D 0A                       .
        asl     a                               ; AB6E 0A                       .
        adc     $04                             ; AB6F 65 04                    e.
        sta     $04                             ; AB71 85 04                    ..
        lda     #$FA                            ; AB73 A9 FA                    ..
        sta     $03                             ; AB75 85 03                    ..
        sta     $05                             ; AB77 85 05                    ..
        ldy     #$00                            ; AB79 A0 00                    ..
LAB7B:
        lda     ($02),y                         ; AB7B B1 02                    ..
        and     #$33                            ; AB7D 29 33                    )3
        sta     $06                             ; AB7F 85 06                    ..
        lda     ($04),y                         ; AB81 B1 04                    ..
        and     #$CC                            ; AB83 29 CC                    ).
        ora     $06                             ; AB85 05 06                    ..
        sta     $0460,y                         ; AB87 99 60 04                 .`.
        iny                                     ; AB8A C8                       .
        cpy     #$0D                            ; AB8B C0 0D                    ..
        bcc     LAB7B                           ; AB8D 90 EC                    ..
        lda     $00                             ; AB8F A5 00                    ..
        and     #$0E                            ; AB91 29 0E                    ).
        lsr     a                               ; AB93 4A                       J
        adc     #$C8                            ; AB94 69 C8                    i.
        sta     $046E                           ; AB96 8D 6E 04                 .n.
        rts                                     ; AB99 60                       `

; ----------------------------------------------------------------------------
LAB9A:
        jsr     DrawBGDataPage1                           ; AB9A 20 A0 AB                  ..
        jmp     DrawBGDataPage2                           ; AB9D 4C DC AB                 L..

; ----------------------------------------------------------------------------
DrawBGDataPage1:
        lda PPUCTRL_MIRROR
        ora #%00000100                      ; set vertical rendering
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        lda #$20
        sta PPUADDR
        lda BGDataDrawOffset
        sta PPUADDR
        ldx #$00
@KeepCopying1:
        lda BGDataPage1,x
        sta PPUDATA
        inx
        cpx #$1A
        bcc @KeepCopying1
        lda #$28
        sta PPUADDR
        lda BGDataDrawOffset
        and #$1E
        sta PPUADDR
@KeepCopying2:
        lda BGDataPage1,x
        sta PPUDATA
        inx
        cpx #$30
        bcc @KeepCopying2
        rts

; ----------------------------------------------------------------------------
DrawBGDataPage2:
        lda PPUCTRL_MIRROR
        ora #%00000100                      ; set vertical rendering
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        lda #$20
        sta PPUADDR
        lda BGDataDrawOffset
        ora #$01
        sta PPUADDR
        ldx #$00
@KeepCopying1:
        lda BGDataPage2,x
        sta PPUDATA
        inx
        cpx #$1A
        bcc @KeepCopying1
        lda #$28
        sta PPUADDR
        lda BGDataDrawOffset
        and #$1E
        ora #$01
        sta PPUADDR
@KeepCopying2:
        lda BGDataPage2,x
        sta PPUDATA
        inx
        cpx #$30
        bcc @KeepCopying2
        rts

; ----------------------------------------------------------------------------
DrawBGDataPage3:
        ldx #$00
        ldy $046E
@KeepDrawing:
        ; set ppu to $23YY
        lda #$23
        sta PPUADDR
        sty PPUADDR
        lda BGDataPage3,x
        sta PPUDATA
        tya
        clc
        adc #$08
        tay
        inx
        cpx #$07
        bcc @KeepDrawing
        lda $046E
        and #$C7
        tay
@KeepDrawing2:
        ; set ppu to $2BYY
        lda #$2B
        sta PPUADDR
        sty PPUADDR
        lda BGDataPage3,x
        sta PPUDATA
        tya
        clc
        adc #$08
        tay
        inx
        cpx #$0D
        bcc @KeepDrawing2
        rts

; ----------------------------------------------------------------------------
LAC58:
        jsr     DrawBGDataPage1                           ; AC58 20 A0 AB                  ..
        jsr     DrawBGDataPage3                           ; AC5B 20 1C AC                  ..
        lda     #$02                            ; AC5E A9 02                    ..
        sta     NextStatusbarToDraw                           ; AC60 8D 03 03                 ...
        rts                                     ; AC63 60                       `

; ----------------------------------------------------------------------------
LAC64:
        jsr     DrawBGDataPage2                           ; AC64 20 DC AB                  ..
        lda     #$00                            ; AC67 A9 00                    ..
        sta     NextStatusbarToDraw                           ; AC69 8D 03 03                 ...
        rts                                     ; AC6C 60                       `

; ----------------------------------------------------------------------------
LAC6D:
        jsr     DrawBGDataPage2                           ; AC6D 20 DC AB                  ..
        jsr     DrawBGDataPage3                           ; AC70 20 1C AC                  ..
        lda     #$04                            ; AC73 A9 04                    ..
        sta     NextStatusbarToDraw                           ; AC75 8D 03 03                 ...
        rts                                     ; AC78 60                       `

; ----------------------------------------------------------------------------
LAC79:
        jsr     DrawBGDataPage1                           ; AC79 20 A0 AB                  ..
        lda     #$00                            ; AC7C A9 00                    ..
        sta     NextStatusbarToDraw                           ; AC7E 8D 03 03                 ...
        rts                                     ; AC81 60                       `

; ----------------------------------------------------------------------------
EncounterLoadSettings:
        @TempPointer = $44
        jsr     PPUDisableNMI                           ; AC82 20 EA 8B                  ..
        jsr     PPUDisableRendering                           ; AC85 20 B6 8B                  ..
        lda     #CHREncounterAndIntroScreen
        sta     ActiveCHR                           ; AC8A 8D 07 03                 ...
        lda     #$00                            ; AC8D A9 00                    ..
        sta     $031A                           ; AC8F 8D 1A 03                 ...
        sta     $031B                           ; AC92 8D 1B 03                 ...
        lda     $0340                           ; AC95 AD 40 03                 .@.
        asl     a                               ; AC98 0A                       .
        tax                                     ; AC99 AA                       .
        lda     EncounterTypeSettings,x                         ; AC9A BD 08 CD                 ...
        sta     @TempPointer                             ; AC9D 85 44                    .D
        lda     EncounterTypeSettings+1,x                         ; AC9F BD 09 CD                 ...
        sta     @TempPointer+1                             ; ACA2 85 45                    .E
        jsr     ClearScreenAndSprites                           ; ACA4 20 12 8E                  ..
        jsr     DrawStatusLine                           ; ACA7 20 8F A7                  ..
        jsr     DrawStatusLine_PowerLabel                           ; ACAA 20 D3 87                  ..
        lda     #$01                            ; ACAD A9 01                    ..
        sta     ShowStatusBarTextLine                           ; ACAF 8D 05 03                 ...
        sta     NMISpriteHandlingDisabled                           ; ACB2 8D 02 03                 ...
        ldy     #$00                            ; ACB5 A0 00                    ..
        lda     (@TempPointer),y                         ; ACB7 B1 44                    .D
        jsr     LoadEncounterBackground                           ; ACB9 20 E6 AC                  ..
        ldy     #$01                            ; ACBC A0 01                    ..
        lda     (@TempPointer),y                         ; ACBE B1 44                    .D
        jsr     DrawRomGraphics                           ; ACC0 20 69 8D                  i.
        ldy     #$02                            ; ACC3 A0 02                    ..
        lda     (@TempPointer),y                         ; ACC5 B1 44                    .D
        iny                                     ; ACC7 C8                       .
        sta     WaterHeight                           ; ACC8 8D 3C 03                 .<.
        lda     (@TempPointer),y                         ; ACCB B1 44                    .D
        iny                                     ; ACCD C8                       .
        sta     WaterHeight+1                           ; ACCE 8D 3D 03                 .=.
        lda     (@TempPointer),y                         ; ACD1 B1 44                    .D
        iny                                     ; ACD3 C8                       .
        sta     $033E                           ; ACD4 8D 3E 03                 .>.
        lda     (@TempPointer),y                         ; ACD7 B1 44                    .D
        iny                                     ; ACD9 C8                       .
        sta     $033F                           ; ACDA 8D 3F 03                 .?.
        lda     (@TempPointer),y                         ; ACDD B1 44                    .D
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; ACDF 20 BD 8E                  ..
        jsr     PPUEnableNMI                           ; ACE2 20 DE 8B                  ..
        rts                                     ; ACE5 60                       `

LoadEncounterBackground:
        @TempPointer          = $00
        @TempDataPointer      = $02
        @TempPPUAddress       = $04
        @TempDuplicateCount   = $08
        @TempDuplicateOffset  = $09
        @TempPPUAddressCopy   = $0E
        @TempDrawWidth        = $0A
        @TempDrawHeight       = $0B
        @TempCopyRemaining    = $0C
        asl a
        tax
        lda EncounterBackgroundPointers,x
        sta @TempPointer
        lda EncounterBackgroundPointers+1,x
        sta @TempPointer+1
        jsr PPURenderHorizontal
        ldy #$00
        jsr @ReadNextPPUAddress
@Advance:
        lda (@TempPointer),y
        iny
        ; check if we are entering a new section
        cmp #$FF
        beq @NewSection
        jsr @LoadMetatilePointer
        jsr @DrawMetatile
        jsr @AdvancePPU1Metatile
        jmp @Advance

@NewSection:
        lda (@TempPointer),y
        bne @CheckForNextPPUADDR
        ; done drawing the encounter background!
        rts

@CheckForNextPPUADDR:
        iny
        cmp #$01
        bne @CheckForControlByte
        jsr @ReadNextPPUAddress
        jmp @Advance

@CheckForControlByte:
        cmp #$FD
        bcs @ControlFD

        ; we are not in a control section,
        ; skip the ppu offset ahead by the value read.
        tax
@AdvancePPUXMetatiles:
        jsr @AdvancePPU1Metatile
        dex
        bne @AdvancePPUXMetatiles
        beq @Advance

@ControlFD:
        ; branch if data != FD
        bne @ControlFE
        ; do ctl FFFD (start of copy section)
        lda (@TempPointer),y
        iny
        sta @TempDuplicateCount
        sty @TempDuplicateOffset
        jmp @Advance

@ControlFE:
        ; branch if data != FE
        cmp #$FE
        bne @ControlFF
        ; do ctl FFFE (end of copy section)
        dec @TempDuplicateCount
        beq @Advance
        ldy @TempDuplicateOffset
        jmp @Advance

@ControlFF:
        ; do ctl FFFF (start of )
        lda (@TempPointer),y
        iny
        sta @TempDrawWidth
        lda (@TempPointer),y
        iny
        sta @TempDrawHeight
        lda (@TempPointer),y
        iny
        jsr @LoadMetatilePointer
        lda @TempPPUAddress
        sta @TempPPUAddressCopy
        lda @TempPPUAddress+1
        sta @TempPPUAddressCopy+1
@DrawNextRow:
        lda @TempDrawWidth
        sta @TempCopyRemaining
@DrawNextMetatile:
        jsr @DrawMetatile
        jsr @AdvancePPU1Metatile
        dec @TempCopyRemaining
        bne @DrawNextMetatile
        lda @TempPPUAddressCopy
        clc
        adc #$40
        sta @TempPPUAddressCopy
        sta @TempPPUAddress
        lda @TempPPUAddressCopy+1
        adc #$00
        sta @TempPPUAddressCopy+1
        sta @TempPPUAddress+1
        dec @TempDrawHeight
        bne @DrawNextRow
        jmp @Advance
@ReadNextPPUAddress:
        lda (@TempPointer),y
        iny
        sta @TempPPUAddress
        lda (@TempPointer),y
        iny
        sta @TempPPUAddress+1
        rts
@AdvancePPU1Metatile:
        inc @TempPPUAddress
        inc @TempPPUAddress
        lda #$1F
        bit @TempPPUAddress
        bne @Done
        clc
        lda @TempPPUAddress
        adc #$20
        sta @TempPPUAddress
        lda @TempPPUAddress+1
        adc #$00
        sta @TempPPUAddress+1
@Done:
        rts

@DrawMetatile:
        tya
        tax
        ldy #$00
        lda @TempPPUAddress+1
        sta PPUADDR
        lda @TempPPUAddress+0
        sta PPUADDR
        lda (@TempDataPointer),y
        iny
        sta PPUDATA
        lda (@TempDataPointer),y
        iny
        sta PPUDATA
        lda @TempPPUAddress+1
        sta PPUADDR
        lda @TempPPUAddress+0
        ora #$20
        sta PPUADDR
        lda (@TempDataPointer),y
        iny
        sta PPUDATA
        lda (@TempDataPointer),y
        sta PPUDATA
        txa
        tay
        rts

@LoadMetatilePointer:
        sta @TempDataPointer
        lda #$00
        asl @TempDataPointer
        rol a
        asl @TempDataPointer
        rol a
        tax
        lda @TempDataPointer
        adc #<EncounterMetaTiles
        sta @TempDataPointer
        txa
        adc #>EncounterMetaTiles
        sta @TempDataPointer+1
        rts







AnimationMapBoatEW                   = $00
AnimationMapBoatN                    = $01
AnimationMapBoatS                    = $02
AnimationTitleJaws                   = $03
AnimationMapBoatStillEW              = $04
AnimationMapBoatStillN               = $05
AnimationMapBoatStillS               = $06
AnimationPortTracker                 = $07
AnimationOutroPlane1                 = $08
AnimationOutroPlane2                 = $09
AnimationOutroPlane3                 = $0A
AnimationFinaleJawsDeath             = $0B
AnimationPortBoat                    = $0C
AnimationMapSubmarine                = $0D
AnimationEncounterStingrayDeath      = $0E
AnimationEncounterBabysharkDeath     = $0F
AnimationMapJawsEW                   = $10
AnimationMapJawsN                    = $11
AnimationMapJawsS                    = $12
AnimationMapJawsDN                   = $13
AnimationMapJawsDS                   = $14
AnimationMapJawsEmergeEW             = $15
AnimationMapJawsSubmergeNS           = $16
AnimationEncounterJellyfishDeath     = $17
AnimationMapJawsSubmergeDN           = $18
AnimationMapJawsSubmergeDS           = $19
AnimationMapJawsSubmergeEW           = $1A
AnimationMapJawsEmergeNS             = $1B
AnimationUnused1                     = $1C
AnimationMapJawsEmergeDN             = $1D
AnimationMapJawsEmergeDS             = $1E
AnimationEncounterBabyshark          = $1F
AnimationEncounterBoat               = $20
AnimationEncounterSubmarine          = $21
AnimationEncounterPlane              = $22
AnimationEncounterSwim               = $23
AnimationEncounterPlayerDeath1       = $24
AnimationEncounterPlayerDeath2       = $25
AnimationUnused2                     = $26
AnimationUnused3                     = $27
AnimationEncounterBomb               = $28
AnimationEncounterBullet             = $29
AnimationEncounterParabomb           = $2A
AnimationEncounterHarpoon            = $2B
AnimationEncounterCrab               = $2C
AnimationEncounterShell              = $2D
AnimationEncounterStar               = $2E
AnimationUnused4                     = $2F
AnimationEncounterJaws               = $30
AnimationUnused5                     = $31
AnimationEncounter50Points           = $32
AnimationEncounter100Points          = $33
AnimationEncounter200Points          = $34
AnimationEncounter500Points          = $35
AnimationEncounter1000Points         = $36
AnimationEncounter2000Points         = $37
AnimationEncounterJellyfish          = $38
AnimationEncounterBubble             = $39
AnimationUnused6                     = $3A
AnimationUnused7                     = $3B
AnimationEncounterStingray           = $3C

AnimationPointers:
  .addr @AnimationMapBoatEW
  .addr @AnimationMapBoatN
  .addr @AnimationMapBoatS
  .addr @AnimationTitleJaws
  .addr @AnimationMapBoatStillEW
  .addr @AnimationMapBoatStillN
  .addr @AnimationMapBoatStillS
  .addr @AnimationPortTracker
  .addr @AnimationOutroPlane1
  .addr @AnimationOutroPlane2
  .addr @AnimationOutroPlane3
  .addr @AnimationFinaleJawsDeath
  .addr @AnimationPortBoat
  .addr @AnimationMapSubmarine
  .addr @AnimationEncounterStingrayDeath
  .addr @AnimationEncounterBabysharkDeath
  .addr @AnimationMapJawsEW
  .addr @AnimationMapJawsN
  .addr @AnimationMapJawsS
  .addr @AnimationMapJawsDN
  .addr @AnimationMapJawsDS
  .addr @AnimationMapJawsEmergeEW
  .addr @AnimationMapJawsSubmergeNS
  .addr @AnimationEncounterJellyfishDeath
  .addr @AnimationMapJawsSubmergeDN
  .addr @AnimationMapJawsSubmergeDS
  .addr @AnimationMapJawsSubmergeEW
  .addr @AnimationMapJawsEmergeNS
  .addr @AnimationUnused1
  .addr @AnimationMapJawsEmergeDN
  .addr @AnimationMapJawsEmergeDS
  .addr @AnimationEncounterBabyshark
  .addr @AnimationEncounterBoat
  .addr @AnimationEncounterSubmarine
  .addr @AnimationEncounterPlane
  .addr @AnimationEncounterSwim
  .addr @AnimationEncounterPlayerDeath1
  .addr @AnimationEncounterPlayerDeath2
  .addr @AnimationUnused2
  .addr @AnimationUnused3
  .addr @AnimationEncounterBomb
  .addr @AnimationEncounterBullet
  .addr @AnimationEncounterParabomb
  .addr @AnimationEncounterHarpoon
  .addr @AnimationEncounterCrab
  .addr @AnimationEncounterShell
  .addr @AnimationEncounterStar
  .addr @AnimationUnused4
  .addr @AnimationEncounterJaws
  .addr @AnimationUnused5
  .addr @AnimationEncounter50Points
  .addr @AnimationEncounter100Points
  .addr @AnimationEncounter200Points
  .addr @AnimationEncounter500Points
  .addr @AnimationEncounter1000Points
  .addr @AnimationEncounter2000Points
  .addr @AnimationEncounterJellyfish
  .addr @AnimationEncounterBubble
  .addr @AnimationUnused6
  .addr @AnimationUnused7
  .addr @AnimationEncounterStingray

;
; Sprite animations
;
; AnimationExample1:
;   .byte FRAMES                  ; how many frames this animation runs for
;   .addr SpritesetExample1       ; pointer to a set of sprites to show
;   .byte $FF                     ; animation terminates with $FF
;
; if FRAMES on the final frame is $00, the animation will not repeat.
; in this case the terminating $FF can be omitted.
;
@AnimationTitleJaws:
@AnimationUnused1:
@AnimationUnused2:
@AnimationUnused3:
@AnimationUnused4:
@AnimationUnused5:
@AnimationUnused6:
@AnimationUnused7:
.byte $00
.addr SpritesetTitleJaws
@AnimationPortTracker:
.byte $00
.addr SpritesetPortTracker
@AnimationPortBoat:
.byte $00
.addr SpritesetPortBoat
@AnimationMapBoatStillEW:
.byte $00
.addr SpritesetMapBoatEW1
@AnimationMapBoatStillN:
.byte $00
.addr SpritesetMapBoatN4
@AnimationMapBoatStillS:
.byte $00
.addr SpritesetMapBoatS4
@AnimationMapBoatEW:
.byte $06
.addr SpritesetMapBoatEW2
.byte $09
.addr SpritesetMapBoatEW3
.byte $09
.addr SpritesetMapBoatEW4
.byte $05
.addr SpritesetMapBoatEW5
.byte $0c
.addr SpritesetMapBoatEW6
.byte $ff
@AnimationMapBoatN:
.byte $08
.addr SpritesetMapBoatN1
.byte $08
.addr SpritesetMapBoatN2
.byte $08
.addr SpritesetMapBoatN1
.byte $08
.addr SpritesetMapBoatN3
.byte $ff
@AnimationMapBoatS:
.byte $08
.addr SpritesetMapBoatS3
.byte $08
.addr SpritesetMapBoatS2
.byte $08
.addr SpritesetMapBoatS3
.byte $08
.addr SpritesetMapBoatS1
.byte $ff
@AnimationMapSubmarine:
.byte $00
.addr SpritesetMapSubmarineEW1
@AnimationMapJawsEW:
.byte $07
.addr SpritesetMapJawsEW1
.byte $09
.addr SpritesetMapJawsEW2
.byte $08
.addr SpritesetMapJawsEW3
.byte $0c
.addr SpritesetMapJawsEW4
.byte $ff
@AnimationMapJawsN:
.byte $07
.addr SpritesetMapJawsS4
.byte $09
.addr SpritesetMapJawsN1
.byte $06
.addr SpritesetMapJawsN2
.byte $0c
.addr SpritesetMapJawsN3
.byte $ff
@AnimationMapJawsS:
.byte $0c
.addr SpritesetMapJawsS1
.byte $0a
.addr SpritesetMapJawsS2
.byte $0f
.addr SpritesetMapJawsS3
.byte $0a
.addr SpritesetMapJawsS4
.byte $ff
@AnimationMapJawsDN:
.byte $09
.addr SpritesetMapJawsDN1
.byte $08
.addr SpritesetMapJawsDN2
.byte $06
.addr SpritesetMapJawsDN3
.byte $0c
.addr SpritesetMapJawsDN4
.byte $ff
@AnimationMapJawsDS:
.byte $09
.addr SpritesetMapJawsDS1
.byte $08
.addr SpritesetMapJawsDS2
.byte $06
.addr SpritesetMapJawsDS3
.byte $0c
.addr SpritesetMapJawsDS4
.byte $ff
@AnimationMapJawsEmergeEW:
.byte $07
.addr SpritesetMapJawsSubmergeEW4
.byte $07
.addr SpritesetMapJawsSubmergeEW3
.byte $06
.addr SpritesetMapJawsSubmergeEW2
.byte $06
.addr SpritesetMapJawsSubmergeEW1
.byte $03
.addr SpritesetMapJawsEW3
.byte $00
.addr SpritesetMapJawsEW4
@AnimationMapJawsSubmergeNS:
.byte $08
.addr SpritesetMapJawsSubmergeNS1
.byte $08
.addr SpritesetMapJawsSubmergeNS2
.byte $08
.addr SpritesetMapJawsSubmergeNS3
.byte $00
.addr SpritesetMapJawsSubmergeNS4
@AnimationMapJawsSubmergeDN:
.byte $08
.addr SpritesetMapJawsSubmergeDN1
.byte $08
.addr SpritesetMapJawsSubmergeDN2
.byte $08
.addr SpritesetMapJawsSubmergeDN3
.byte $00
.addr SpritesetMapJawsDN3
@AnimationMapJawsSubmergeDS:
.byte $08
.addr SpritesetMapJawsSubmergeDS1
.byte $08
.addr SpritesetMapJawsSubmergeDS2
.byte $08
.addr SpritesetMapJawsSubmergeDS3
.byte $00
.addr SpritesetMapJawsDS3
@AnimationMapJawsSubmergeEW:
.byte $03
.addr SpritesetMapJawsEW4
.byte $03
.addr SpritesetMapJawsEW3
.byte $06
.addr SpritesetMapJawsSubmergeEW1
.byte $06
.addr SpritesetMapJawsSubmergeEW2
.byte $07
.addr SpritesetMapJawsSubmergeEW3
.byte $00
.addr SpritesetMapJawsSubmergeEW4
@AnimationMapJawsEmergeNS:
.byte $08
.addr SpritesetMapJawsSubmergeNS4
.byte $08
.addr SpritesetMapJawsSubmergeNS3
.byte $08
.addr SpritesetMapJawsSubmergeNS2
.byte $00
.addr SpritesetMapJawsSubmergeNS1
@AnimationMapJawsEmergeDN:
.byte $08
.addr SpritesetMapJawsDN3
.byte $08
.addr SpritesetMapJawsSubmergeDN3
.byte $08
.addr SpritesetMapJawsSubmergeDN2
.byte $00
.addr SpritesetMapJawsSubmergeDN1
@AnimationMapJawsEmergeDS:
.byte $08
.addr SpritesetMapJawsDS3
.byte $08
.addr SpritesetMapJawsSubmergeDS3
.byte $08
.addr SpritesetMapJawsSubmergeDS2
.byte $00
.addr SpritesetMapJawsSubmergeDS1
@AnimationEncounterBoat:
.byte $00
.addr SpritesetEncounterBoat1
@AnimationEncounterSubmarine:
.byte $00
.addr SpritesetEncounterSubmarine1
@AnimationEncounterPlane:
.byte $02
.addr SpritesetEncounterPlane1
.byte $02
.addr SpritesetEncounterPlane2
.byte $ff
@AnimationEncounterSwim:
.byte $08
.addr SpritesetEncounterSwim1
.byte $08
.addr SpritesetEncounterSwim2
.byte $ff
@AnimationEncounterPlayerDeath1:
.byte $20
.addr SpritesetEncounterDeath1
.byte $00
.addr SpritesetEncounterDeath1
@AnimationEncounterPlayerDeath2:
.byte $08
.addr SpritesetEncounterDeath2
.byte $08
.addr SpritesetEncounterDeath5
.byte $08
.addr SpritesetEncounterDeath7
.byte $08
.addr SpritesetEncounterDeath3
.byte $08
.addr SpritesetEncounterDeath4
.byte $08
.addr SpritesetEncounterDeath6
.byte $ff
@AnimationEncounterBomb:
.byte $00
.addr SpritesetEncounterBomb1
@AnimationEncounterBullet:
.byte $00
.addr SpritesetEncounterBullet1
@AnimationEncounterParabomb:
.byte $00
.addr SpritesetEncounterBombParabomb1
@AnimationEncounterHarpoon:
.byte $00
.addr SpritesetEncounterHarpoon1
@AnimationEncounterJaws:
.byte $10
.addr SpritesetEncounterJaws1
.byte $10
.addr SpritesetEncounterJaws6
.byte $10
.addr SpritesetEncounterJaws5
.byte $10
.addr SpritesetEncounterJaws2
.byte $10
.addr SpritesetEncounterJaws4
.byte $10
.addr SpritesetEncounterJaws3
.byte $ff
@AnimationEncounterJellyfish:
.byte $08
.addr SpritesetEncounterJellyfish1
.byte $04
.addr SpritesetEncounterJellyfish2
.byte $08
.addr SpritesetEncounterJellyfish3
.byte $00
.addr SpritesetEncounterJellyfish2
@AnimationEncounterJellyfishDeath:
.byte $08
.addr SpritesetEncounterJellyfish1
.byte $04
.addr SpritesetEncounterJellyfish2
.byte $08
.addr SpritesetEncounterJellyfish3
.byte $08
.addr SpritesetEncounterJellyfish2
.byte $ff
@AnimationEncounterBubble:
.byte $02
.addr SpritesetEncounterBubble5
.byte $02
.addr SpritesetEncounterBubble4
.byte $02
.addr SpritesetEncounterBubble3
.byte $02
.addr SpritesetEncounterBubble2
.byte $02
.addr SpritesetEncounterBubble1
.byte $02
.addr SpritesetEncounterBubble7
.byte $02
.addr SpritesetEncounterBubble6
.byte $02
.addr SpritesetEncounterBubble8
.byte $00
.addr SpritesetEncounterBubble8
@AnimationEncounterStingray:
.byte $10
.addr SpritesetEncounterStingray1
.byte $08
.addr SpritesetEncounterStingray2
.byte $08
.addr SpritesetEncounterStingray3
.byte $08
.addr SpritesetEncounterStingray4
.byte $08
.addr SpritesetEncounterStingray5
.byte $08
.addr SpritesetEncounterStingray6
.byte $08
.addr SpritesetEncounterStingray7
.byte $08
.addr SpritesetEncounterStingray8
.byte $ff
@AnimationEncounterStingrayDeath:
.byte $04
.addr SpritesetEncounterStingray2
.byte $04
.addr SpritesetEncounterStingray9
.byte $04
.addr SpritesetEncounterStingray2
.byte $04
.addr SpritesetEncounterStingray9
.byte $03
.addr SpritesetEncounterBubble1
.byte $03
.addr SpritesetEncounterBubble8
.byte $03
.addr SpritesetEncounterBubble6
.byte $00
.addr SpritesetEncounterBubble6
@AnimationEncounterBabyshark:
.byte $0a
.addr SpritesetEncounterBabyshark1
.byte $0a
.addr SpritesetEncounterBabyshark2
.byte $0a
.addr SpritesetEncounterBabyshark3
.byte $0a
.addr SpritesetEncounterBabyshark4
.byte $0a
.addr SpritesetEncounterBabyshark5
.byte $0a
.addr SpritesetEncounterBabyshark6
.byte $ff
@AnimationEncounterBabysharkDeath:
.byte $04
.addr SpritesetEncounterBabyshark1
.byte $04
.addr SpritesetEncounterBabyshark7
.byte $04
.addr SpritesetEncounterBabyshark1
.byte $04
.addr SpritesetEncounterBabyshark7
.byte $03
.addr SpritesetEncounterBubble1
.byte $03
.addr SpritesetEncounterBubble8
.byte $03
.addr SpritesetEncounterBubble6
.byte $00
.addr SpritesetEncounterBubble6
@AnimationEncounterCrab:
.byte $05
.addr SpritesetEncounterCrab1
.byte $05
.addr SpritesetEncounterCrab2
.byte $05
.addr SpritesetEncounterCrab1
.byte $05
.addr SpritesetEncounterCrab3
.byte $ff
@AnimationEncounterShell:
.byte $08
.addr SpritesetEncounterShell1
.byte $08
.addr SpritesetEncounterShell2
.byte $08
.addr SpritesetEncounterShell3
.byte $08
.addr SpritesetEncounterShell6
.byte $08
.addr SpritesetEncounterShell4
.byte $08
.addr SpritesetEncounterShell5
.byte $ff
@AnimationEncounterStar:
.byte $07
.addr SpritesetEncounterStar1
.byte $07
.addr SpritesetEncounterStar2
.byte $07
.addr SpritesetEncounterStar3
.byte $07
.addr SpritesetEncounterStar4
.byte $07
.addr SpritesetEncounterStar5
.byte $ff
@AnimationEncounter50Points:
.byte $20
.addr SpritesetEncounter50Points1
.byte $00
.addr SpritesetEncounter50Points1
@AnimationEncounter100Points:
.byte $20
.addr SpritesetEncounter100Points1
.byte $00
.addr SpritesetEncounter100Points1
@AnimationEncounter200Points:
.byte $20
.addr SpritesetEncounter200Points1
.byte $00
.addr SpritesetEncounter200Points1
@AnimationEncounter500Points:
.byte $20
.addr SpritesetEncounter500Points1
.byte $00
.addr SpritesetEncounter500Points1
@AnimationEncounter1000Points:
.byte $20
.addr SpritesetEncounter1000Points1
.byte $00
.addr SpritesetEncounter1000Points1
@AnimationEncounter2000Points:
.byte $20
.addr SpritesetEncounter2000Points1
.byte $00
.addr SpritesetEncounter2000Points1
@AnimationOutroPlane1:
.byte $00
.addr SpritesetOutroPlane01
@AnimationOutroPlane2:
.byte $00
.addr SpritesetOutroPlane02
@AnimationOutroPlane3:
.byte $18
.addr SpritesetOutroPlane03
.byte $14
.addr SpritesetOutroPlane04
.byte $12
.addr SpritesetOutroPlane05
.byte $10
.addr SpritesetOutroPlane06
.byte $06
.addr SpritesetOutroPlane07
.byte $06
.addr SpritesetOutroPlane08
.byte $08
.addr SpritesetOutroPlane09
.byte $08
.addr SpritesetOutroPlane10
.byte $08
.addr SpritesetOutroPlane11
.byte $08
.addr SpritesetOutroPlane12
.byte $06
.addr SpritesetOutroPlane09
.byte $06
.addr SpritesetOutroPlane13
.byte $06
.addr SpritesetOutroPlane09
.byte $08
.addr SpritesetOutroPlane08
.byte $08
.addr SpritesetOutroPlane07
.byte $00
.addr SpritesetOutroPlane07
@AnimationFinaleJawsDeath:
.byte $00
.addr SpritesetFinaleJawsDeath

;
; Sprite sets used for animations
;
; SpritesetExample1:
;   .byte U1, U2                  ; varying header.. not sure
;   .byte X, Y, Tile, Attributes  ; repeats for each sprite
;   .byte $80                     ; sprite set ends with $80
;
SpritesetMapBoatEW1:
.byte $06,$06
.byte $F4,$F0,$00,$01
.byte $FC,$F0,$01,$01
.byte $F4,$F8,$10,$01
.byte $FC,$F8,$11,$01
.byte $04,$F8,$12,$01
.byte $F4,$00,$50,$00
.byte $FC,$00,$51,$00
.byte $04,$00,$52,$00
.byte $80
SpritesetMapBoatEW2:
.byte $06,$06
.byte $F4,$F0,$00,$01
.byte $FC,$F0,$01,$01
.byte $F4,$F8,$10,$01
.byte $FC,$F8,$11,$01
.byte $04,$F8,$12,$01
.byte $F4,$00,$50,$00
.byte $FC,$00,$21,$00
.byte $04,$00,$22,$00
.byte $80
SpritesetMapBoatEW3:
.byte $06,$06
.byte $F4,$F1,$00,$01
.byte $FC,$F1,$01,$01
.byte $F4,$F9,$10,$01
.byte $FC,$F9,$11,$01
.byte $04,$F9,$12,$01
.byte $F4,$01,$30,$00
.byte $FC,$01,$31,$00
.byte $04,$01,$32,$00
.byte $80
SpritesetMapBoatEW4:
.byte $06,$06
.byte $F4,$F1,$00,$01
.byte $FC,$F1,$01,$01
.byte $F4,$F9,$10,$01
.byte $FC,$F9,$11,$01
.byte $04,$F9,$12,$01
.byte $F4,$01,$40,$00
.byte $FC,$01,$41,$00
.byte $04,$01,$52,$00
.byte $80
SpritesetMapBoatEW5:
.byte $06,$06
.byte $F4,$F0,$00,$01
.byte $FC,$F0,$01,$01
.byte $F4,$F8,$10,$01
.byte $FC,$F8,$11,$01
.byte $04,$F8,$12,$01
.byte $F4,$00,$20,$00
.byte $FC,$00,$51,$00
.byte $04,$00,$52,$00
.byte $80
SpritesetMapBoatEW6:
.byte $06,$06
.byte $F4,$EF,$00,$01
.byte $FC,$EF,$01,$01
.byte $F4,$F7,$10,$01
.byte $FC,$F7,$11,$01
.byte $04,$F7,$12,$01
.byte $F4,$FF,$30,$00
.byte $FC,$FF,$02,$00
.byte $04,$FF,$42,$00
.byte $80
SpritesetMapBoatN1:
.byte $03,$06
.byte $FC,$F4,$34,$01
.byte $F4,$FC,$43,$01
.byte $FC,$FC,$44,$01
.byte $F4,$04,$53,$01
.byte $FC,$04,$54,$00
.byte $04,$04,$55,$01
.byte $80
SpritesetMapBoatN2:
.byte $03,$06
.byte $FC,$F5,$04,$01
.byte $F4,$FD,$13,$01
.byte $FC,$FD,$14,$01
.byte $F4,$05,$23,$01
.byte $FC,$05,$24,$00
.byte $04,$05,$25,$01
.byte $80
SpritesetMapBoatN3:
.byte $03,$06
.byte $FC,$F4,$35,$01
.byte $F4,$FC,$46,$01
.byte $FC,$FC,$45,$01
.byte $F4,$04,$03,$01
.byte $FC,$04,$15,$00
.byte $04,$04,$05,$01
.byte $80
SpritesetMapBoatN4:
.byte $03,$06
.byte $FC,$F4,$34,$01
.byte $F4,$FC,$43,$01
.byte $FC,$FC,$44,$01
.byte $FC,$04,$36,$00
.byte $80
SpritesetMapBoatS1:
.byte $03,$06
.byte $F4,$F4,$37,$01
.byte $FC,$F4,$38,$01
.byte $F4,$FC,$47,$01
.byte $FC,$FC,$48,$01
.byte $F4,$04,$57,$01
.byte $FC,$04,$58,$00
.byte $04,$04,$3D,$01
.byte $80
SpritesetMapBoatS2:
.byte $03,$06
.byte $F4,$F6,$39,$01
.byte $FC,$F6,$3A,$01
.byte $F4,$FE,$49,$01
.byte $FC,$FE,$4A,$01
.byte $F4,$06,$59,$01
.byte $FC,$06,$5A,$00
.byte $04,$06,$4D,$01
.byte $80
SpritesetMapBoatS3:
.byte $03,$06
.byte $F4,$F5,$3B,$01
.byte $FC,$F5,$3C,$01
.byte $F4,$FD,$4B,$01
.byte $FC,$FD,$4C,$01
.byte $F4,$05,$5B,$01
.byte $FC,$05,$5C,$00
.byte $04,$05,$5D,$01
.byte $80
SpritesetMapBoatS4:
.byte $03,$06
.byte $F4,$F4,$3B,$01
.byte $FC,$F4,$3C,$01
.byte $F4,$FC,$4B,$01
.byte $FC,$FC,$4C,$01
.byte $FC,$04,$56,$00
.byte $80
SpritesetMapSubmarineEW1:
.byte $06,$06
.byte $F4,$F8,$60,$01
.byte $FC,$F8,$61,$01
.byte $04,$F8,$62,$01
.byte $F4,$00,$70,$03
.byte $FC,$00,$71,$03
.byte $04,$00,$72,$03
.byte $80
SpritesetMapUnused1:
.byte $06,$06
.byte $FC,$F4,$0B,$02
.byte $F4,$FC,$1A,$02
.byte $FC,$FC,$1B,$02
.byte $04,$FC,$1C,$02
.byte $F4,$04,$2A,$02
.byte $FC,$04,$2B,$02
.byte $04,$04,$2C,$02
.byte $80
SpritesetMapUnused2:
.byte $06,$06
.byte $F4,$F4,$0D,$00
.byte $FC,$F4,$0B,$02
.byte $04,$F4,$0E,$00
.byte $F4,$FC,$1A,$02
.byte $FC,$FC,$1B,$02
.byte $04,$FC,$1C,$02
.byte $F4,$04,$2A,$02
.byte $FC,$04,$2B,$02
.byte $04,$04,$2C,$02
.byte $80
SpritesetMapUnused3:
.byte $06,$06
.byte $F4,$F4,$1D,$00
.byte $FC,$F4,$0B,$02
.byte $04,$F4,$1E,$00
.byte $F4,$FC,$1A,$02
.byte $FC,$FC,$1B,$02
.byte $04,$FC,$1C,$02
.byte $F4,$04,$2A,$02
.byte $FC,$04,$2B,$02
.byte $04,$04,$2C,$02
.byte $80
SpritesetMapUnused4:
.byte $06,$06
.byte $F4,$F4,$0A,$00
.byte $FC,$F4,$0B,$02
.byte $04,$F4,$0C,$00
.byte $F4,$FC,$1A,$02
.byte $FC,$FC,$1B,$02
.byte $04,$FC,$1C,$02
.byte $F4,$04,$2A,$02
.byte $FC,$04,$2B,$02
.byte $04,$04,$2C,$02
.byte $80
SpritesetMapUnused5:
.byte $06,$06
.byte $F4,$F8,$06,$02
.byte $FC,$F8,$07,$02
.byte $04,$F8,$08,$02
.byte $F4,$00,$16,$02
.byte $FC,$00,$17,$02
.byte $04,$00,$18,$02
.byte $80
SpritesetMapUnused6:
.byte $06,$06
.byte $F4,$F8,$06,$02
.byte $FC,$F8,$07,$02
.byte $04,$F8,$08,$02
.byte $F4,$00,$16,$02
.byte $FC,$00,$17,$02
.byte $04,$00,$09,$02
.byte $80
SpritesetMapJawsEW1:
.byte $04,$04
.byte $F8,$F8,$80,$02
.byte $00,$F8,$81,$02
.byte $F8,$00,$90,$02
.byte $00,$00,$91,$02
.byte $80
SpritesetMapJawsEW2:
.byte $04,$04
.byte $F8,$F8,$82,$02
.byte $00,$F8,$83,$02
.byte $F8,$00,$92,$02
.byte $00,$00,$93,$02
.byte $80
SpritesetMapJawsEW3:
.byte $04,$04
.byte $F8,$F8,$84,$02
.byte $00,$F8,$85,$02
.byte $F8,$00,$94,$02
.byte $00,$00,$95,$02
.byte $80
SpritesetMapJawsEW4:
.byte $04,$04
.byte $F8,$F8,$86,$02
.byte $00,$F8,$87,$02
.byte $F8,$00,$96,$02
.byte $00,$00,$97,$02
.byte $80
SpritesetMapJawsS1:
.byte $04,$04
.byte $F8,$F9,$A8,$02
.byte $00,$F9,$A9,$02
.byte $F8,$01,$B8,$02
.byte $00,$01,$B9,$02
.byte $80
SpritesetMapJawsS2:
.byte $04,$04
.byte $F8,$FA,$AA,$02
.byte $00,$FA,$AB,$02
.byte $F8,$02,$BA,$02
.byte $00,$02,$BB,$02
.byte $80
SpritesetMapJawsS3:
.byte $04,$04
.byte $F8,$F9,$AC,$02
.byte $00,$F9,$AD,$02
.byte $F8,$01,$BC,$02
.byte $00,$01,$BD,$02
.byte $80
SpritesetMapJawsS4:
.byte $04,$04
.byte $F8,$F8,$AE,$02
.byte $00,$F8,$AF,$02
.byte $F8,$00,$BE,$02
.byte $00,$00,$BF,$02
.byte $80
; unused jaws north animation replaced with SpritesetMapJawsS4
SpritesetMapUnused7:
.byte $04,$04
.byte $F8,$F9,$88,$02
.byte $00,$F9,$89,$02
.byte $F8,$01,$98,$02
.byte $00,$01,$99,$02
.byte $80
SpritesetMapJawsN1:
.byte $04,$04
.byte $F8,$FA,$8A,$02
.byte $00,$FA,$8B,$02
.byte $F8,$02,$9A,$02
.byte $00,$02,$9B,$02
.byte $80
SpritesetMapJawsN2:
.byte $04,$04
.byte $F8,$F9,$8C,$02
.byte $00,$F9,$8D,$02
.byte $F8,$01,$9C,$02
.byte $00,$01,$9D,$02
.byte $80
SpritesetMapJawsN3:
.byte $04,$04
.byte $F8,$F8,$8E,$02
.byte $00,$F8,$8F,$02
.byte $F8,$00,$9E,$02
.byte $00,$00,$9F,$02
.byte $80
SpritesetMapJawsDN1:
.byte $04,$04
.byte $F8,$F8,$A0,$02
.byte $00,$F8,$A1,$02
.byte $F8,$00,$B0,$02
.byte $00,$00,$B1,$02
.byte $80
SpritesetMapJawsDN2:
.byte $04,$04
.byte $F8,$F8,$A2,$02
.byte $00,$F8,$A3,$02
.byte $F8,$00,$B2,$02
.byte $00,$00,$B3,$02
.byte $80
SpritesetMapJawsDN3:
.byte $04,$04
.byte $F8,$F8,$A4,$02
.byte $00,$F8,$A5,$02
.byte $F8,$00,$B4,$02
.byte $00,$00,$B5,$02
.byte $80
SpritesetMapJawsDN4:
.byte $04,$04
.byte $F8,$F8,$A6,$02
.byte $00,$F8,$A7,$02
.byte $F8,$00,$B6,$02
.byte $00,$00,$B7,$02
.byte $80
SpritesetMapJawsDS1:
.byte $04,$04
.byte $F8,$F8,$C0,$02
.byte $00,$F8,$C1,$02
.byte $F8,$00,$D0,$02
.byte $00,$00,$D1,$02
.byte $80
SpritesetMapJawsDS2:
.byte $04,$04
.byte $F8,$F8,$C2,$02
.byte $00,$F8,$C3,$02
.byte $F8,$00,$D2,$02
.byte $00,$00,$D3,$02
.byte $80
SpritesetMapJawsDS3:
.byte $04,$04
.byte $F8,$F8,$C4,$02
.byte $00,$F8,$C5,$02
.byte $F8,$00,$D4,$02
.byte $00,$00,$D5,$02
.byte $80
SpritesetMapJawsDS4:
.byte $04,$04
.byte $F8,$F8,$C6,$02
.byte $00,$F8,$C7,$02
.byte $F8,$00,$D6,$02
.byte $00,$00,$D7,$02
.byte $80
SpritesetMapJawsSubmergeEW1:
.byte $04,$04
.byte $F8,$FA,$84,$02
.byte $00,$FA,$85,$02
.byte $F8,$02,$C8,$02
.byte $00,$02,$C9,$02
.byte $80
SpritesetMapJawsSubmergeEW2:
.byte $04,$04
.byte $F8,$FC,$84,$02
.byte $00,$FC,$85,$02
.byte $F8,$04,$D8,$02
.byte $00,$04,$D9,$02
.byte $80
SpritesetMapJawsSubmergeEW3:
.byte $04,$04
.byte $F8,$FA,$84,$02
.byte $00,$FA,$85,$02
.byte $F8,$02,$CA,$02
.byte $00,$02,$CB,$02
.byte $80
SpritesetMapJawsSubmergeEW4:
.byte $04,$04
.byte $F8,$00,$DA,$02
.byte $00,$00,$DB,$02
.byte $80
SpritesetMapJawsSubmergeNS1:
.byte $02,$02
.byte $FC,$00,$DE,$02
.byte $80
SpritesetMapJawsSubmergeNS2:
.byte $02,$02
.byte $FC,$00,$CE,$02
.byte $80
SpritesetMapJawsSubmergeNS3:
.byte $02,$04
.byte $FC,$F8,$CD,$02
.byte $FC,$00,$DD,$02
.byte $80
SpritesetMapJawsSubmergeNS4:
.byte $02,$04
.byte $FC,$F8,$CC,$02
.byte $FC,$00,$DC,$02
.byte $80
SpritesetMapJawsSubmergeDN1:
.byte $03,$03
.byte $FA,$00,$CF,$02
.byte $80
SpritesetMapJawsSubmergeDN2:
.byte $03,$03
.byte $FA,$00,$E1,$02
.byte $80
SpritesetMapJawsSubmergeDN3:
.byte $04,$04
.byte $F8,$F8,$E0,$02
.byte $F8,$00,$F0,$02
.byte $00,$00,$F1,$02
.byte $80
SpritesetMapJawsSubmergeDS1:
.byte $03,$03
.byte $FA,$00,$DF,$02
.byte $80
SpritesetMapJawsSubmergeDS2:
.byte $03,$03
.byte $FA,$00,$E3,$02
.byte $80
SpritesetMapJawsSubmergeDS3:
.byte $04,$04
.byte $F8,$F8,$E2,$02
.byte $F8,$00,$F2,$02
.byte $00,$00,$F3,$02
.byte $80
SpritesetEncounterBoat1:
.byte $0C,$0C
.byte $F0,$F0,$04,$03
.byte $F8,$F0,$05,$03
.byte $00,$F0,$06,$03
.byte $F0,$F8,$14,$01
.byte $F8,$F8,$15,$01
.byte $00,$F8,$16,$01
.byte $08,$F8,$17,$03
.byte $F0,$00,$24,$00
.byte $F8,$00,$25,$00
.byte $00,$00,$26,$00
.byte $08,$00,$27,$00
.byte $80
SpritesetEncounterSubmarine1:
.byte $05,$04
.byte $F8,$F8,$08,$01
.byte $00,$F8,$09,$01
.byte $F8,$00,$18,$03
.byte $00,$00,$19,$03
.byte $80
SpritesetEncounterPlane1:
.byte $0C,$04
.byte $F0,$F8,$00,$02
.byte $F8,$F8,$01,$01
.byte $00,$F8,$02,$01
.byte $08,$F8,$03,$01
.byte $F0,$00,$10,$02
.byte $F8,$00,$11,$02
.byte $00,$00,$12,$02
.byte $08,$00,$13,$02
.byte $80
SpritesetEncounterPlane2:
.byte $0C,$04
.byte $F0,$F8,$00,$02
.byte $F8,$F8,$01,$01
.byte $00,$F8,$02,$01
.byte $08,$F8,$03,$01
.byte $F0,$00,$10,$02
.byte $F8,$00,$11,$02
.byte $00,$00,$12,$02
.byte $08,$00,$07,$02
.byte $80
SpritesetEncounterSwim1:
.byte $03,$02
.byte $F8,$F8,$0A,$01
.byte $00,$F8,$0B,$01
.byte $F8,$00,$1A,$03
.byte $00,$00,$1B,$03
.byte $80
SpritesetEncounterSwim2:
.byte $03,$02
.byte $F8,$F8,$0C,$01
.byte $00,$F8,$0D,$01
.byte $F8,$00,$1C,$03
.byte $00,$00,$1D,$03
.byte $80
SpritesetEncounterDeath1:
.byte $00,$00
.byte $08,$F8,$B0,$01
.byte $00,$F8,$B1,$01
.byte $F8,$00,$C0,$03
.byte $00,$00,$C1,$03
.byte $80
SpritesetEncounterDeath2:
.byte $00,$00
.byte $F8,$F0,$D0,$03
.byte $00,$F0,$D1,$03
.byte $F8,$F8,$E0,$03
.byte $00,$F8,$E1,$03
.byte $F8,$00,$F0,$03
.byte $00,$00,$F1,$03
.byte $80
SpritesetEncounterDeath3:
.byte $00,$00
.byte $F8,$F0,$D2,$03
.byte $00,$F0,$D3,$03
.byte $F8,$F8,$E2,$03
.byte $00,$F8,$E3,$03
.byte $F8,$00,$F2,$03
.byte $00,$00,$F3,$03
.byte $80
SpritesetEncounterDeath4:
.byte $00,$00
.byte $F8,$F0,$D4,$03
.byte $00,$F0,$D5,$03
.byte $F8,$F8,$E4,$03
.byte $00,$F8,$E5,$03
.byte $F8,$00,$F4,$03
.byte $00,$00,$F5,$03
.byte $80
SpritesetEncounterDeath5:
.byte $00,$00
.byte $F8,$F0,$D6,$03
.byte $00,$F0,$D7,$03
.byte $F8,$F8,$E6,$03
.byte $00,$F8,$E7,$03
.byte $F8,$00,$F6,$03
.byte $00,$00,$F7,$03
.byte $80
SpritesetEncounterDeath6:
.byte $00,$00
.byte $F8,$F0,$D8,$03
.byte $00,$F0,$D9,$03
.byte $F8,$F8,$E8,$03
.byte $00,$F8,$E9,$03
.byte $F8,$00,$F8,$03
.byte $00,$00,$F9,$03
.byte $80
SpritesetEncounterDeath7:
.byte $00,$00
.byte $F8,$F0,$DA,$03
.byte $00,$F0,$DB,$03
.byte $F8,$F8,$EA,$03
.byte $00,$F8,$EB,$03
.byte $F8,$00,$FA,$03
.byte $00,$00,$FB,$03
.byte $80
SpritesetEncounterBomb1:
.byte $03,$03
.byte $FC,$FC,$23,$01
.byte $80
SpritesetEncounterBullet1:
.byte $04,$03
.byte $FC,$FC,$21,$00
.byte $80
SpritesetEncounterHarpoon1:
.byte $04,$03
.byte $FC,$FC,$20,$00
.byte $80
SpritesetEncounterBombParabomb1:
.byte $05,$05
.byte $FC,$FC,$22,$01
.byte $80
SpritesetEncounterJaws1:
.byte $0D,$06
.byte $E8,$F0,$36,$02
.byte $F0,$F0,$37,$02
.byte $F8,$F0,$32,$02
.byte $00,$F0,$33,$02
.byte $E8,$F8,$46,$02
.byte $F0,$F8,$47,$02
.byte $F8,$F8,$42,$02
.byte $00,$F8,$43,$02
.byte $08,$F8,$44,$02
.byte $10,$F8,$45,$02
.byte $E8,$00,$56,$02
.byte $F0,$00,$57,$02
.byte $F8,$00,$52,$02
.byte $00,$00,$53,$02
.byte $08,$00,$54,$02
.byte $10,$00,$55,$02
.byte $80
SpritesetEncounterJaws2:
.byte $0D,$06
.byte $E8,$F0,$60,$02
.byte $F0,$F0,$61,$02
.byte $F8,$F0,$32,$02
.byte $00,$F0,$33,$02
.byte $E8,$F8,$70,$02
.byte $F0,$F8,$71,$02
.byte $F8,$F8,$42,$02
.byte $00,$F8,$43,$02
.byte $08,$F8,$44,$02
.byte $10,$F8,$45,$02
.byte $E8,$00,$80,$02
.byte $F0,$00,$81,$02
.byte $F8,$00,$52,$02
.byte $00,$00,$53,$02
.byte $08,$00,$54,$02
.byte $10,$00,$55,$02
.byte $80
SpritesetEncounterJaws3:
.byte $0D,$06
.byte $E8,$F0,$36,$02
.byte $F0,$F0,$37,$02
.byte $F8,$F0,$38,$02
.byte $00,$F0,$39,$02
.byte $E8,$F8,$46,$02
.byte $F0,$F8,$47,$02
.byte $F8,$F8,$48,$02
.byte $00,$F8,$49,$02
.byte $08,$F8,$4A,$02
.byte $10,$F8,$4B,$02
.byte $E8,$00,$56,$02
.byte $F0,$00,$57,$02
.byte $F8,$00,$58,$02
.byte $00,$00,$59,$02
.byte $08,$00,$5A,$02
.byte $10,$00,$5B,$02
.byte $80
SpritesetEncounterJaws4:
.byte $0D,$06
.byte $E8,$F0,$30,$02
.byte $F0,$F0,$31,$02
.byte $F8,$F0,$38,$02
.byte $00,$F0,$39,$02
.byte $E8,$F8,$40,$02
.byte $F0,$F8,$41,$02
.byte $F8,$F8,$48,$02
.byte $00,$F8,$49,$02
.byte $08,$F8,$4A,$02
.byte $10,$F8,$4B,$02
.byte $E8,$00,$50,$02
.byte $F0,$00,$51,$02
.byte $F8,$00,$58,$02
.byte $00,$00,$59,$02
.byte $08,$00,$5A,$02
.byte $10,$00,$5B,$02
.byte $80
SpritesetEncounterJaws5:
.byte $0D,$06
.byte $E8,$F0,$60,$02
.byte $F0,$F0,$61,$02
.byte $F8,$F0,$62,$02
.byte $00,$F0,$63,$02
.byte $E8,$F8,$70,$02
.byte $F0,$F8,$71,$02
.byte $F8,$F8,$72,$02
.byte $00,$F8,$73,$02
.byte $08,$F8,$74,$02
.byte $10,$F8,$75,$02
.byte $E8,$00,$80,$02
.byte $F0,$00,$81,$02
.byte $F8,$00,$82,$02
.byte $00,$00,$83,$02
.byte $08,$00,$84,$02
.byte $10,$00,$85,$02
.byte $80
SpritesetEncounterJaws6:
.byte $0D,$06
.byte $E8,$F0,$30,$02
.byte $F0,$F0,$31,$02
.byte $F8,$F0,$62,$02
.byte $00,$F0,$63,$02
.byte $E8,$F8,$40,$02
.byte $F0,$F8,$41,$02
.byte $F8,$F8,$72,$02
.byte $00,$F8,$73,$02
.byte $08,$F8,$74,$02
.byte $10,$F8,$75,$02
.byte $E8,$00,$50,$02
.byte $F0,$00,$51,$02
.byte $F8,$00,$82,$02
.byte $00,$00,$83,$02
.byte $08,$00,$84,$02
.byte $10,$00,$85,$02
.byte $80
SpritesetEncounterJellyfish1:
.byte $05,$05
.byte $F8,$F8,$2A,$00
.byte $00,$F8,$2B,$00
.byte $F8,$00,$3A,$00
.byte $00,$00,$3B,$00
.byte $80
SpritesetEncounterJellyfish2:
.byte $05,$05
.byte $F8,$F8,$2C,$00
.byte $00,$F8,$2D,$00
.byte $F8,$00,$3C,$00
.byte $00,$00,$3D,$00
.byte $80
SpritesetEncounterJellyfish3:
.byte $05,$05
.byte $F8,$F8,$2E,$00
.byte $00,$F8,$2F,$00
.byte $F8,$00,$3E,$00
.byte $00,$00,$3F,$00
.byte $80
SpritesetEncounterBubble1:
.byte $00,$00
.byte $FC,$FC,$A4,$00
.byte $80
SpritesetEncounterBubble2:
.byte $00,$00
.byte $FC,$FC,$A5,$00
.byte $80
SpritesetEncounterBubble3:
.byte $00,$00
.byte $FC,$FC,$A6,$00
.byte $80
SpritesetEncounterBubble4:
.byte $00,$00
.byte $F8,$F8,$96,$00
.byte $00,$F8,$96,$40
.byte $F8,$00,$96,$80
.byte $00,$00,$96,$C0
.byte $80
SpritesetEncounterBubble5:
.byte $00,$00
.byte $F8,$F8,$97,$00
.byte $00,$F8,$97,$40
.byte $F8,$00,$97,$80
.byte $00,$00,$97,$C0
.byte $80
SpritesetEncounterBubble6:
.byte $00,$00
.byte $F8,$F8,$99,$00
.byte $00,$F8,$9A,$00
.byte $F8,$00,$A9,$00
.byte $00,$00,$AA,$00
.byte $80
SpritesetEncounterBubble7:
.byte $00,$00
.byte $FC,$FC,$A7,$00
.byte $80
SpritesetEncounterBubble8:
.byte $00,$00
.byte $FC,$FC,$98,$00
.byte $80
SpritesetEncounterStingray1:
.byte $05,$02
.byte $F0,$FC,$4D,$03
.byte $F8,$FC,$4E,$03
.byte $00,$FC,$4F,$03
.byte $80
SpritesetEncounterStingray2:
.byte $05,$02
.byte $F0,$FC,$5D,$03
.byte $F8,$FC,$5E,$03
.byte $00,$FC,$5F,$03
.byte $80
SpritesetEncounterStingray3:
.byte $05,$02
.byte $F0,$FC,$6D,$03
.byte $F8,$FC,$6E,$03
.byte $00,$FC,$6F,$03
.byte $80
SpritesetEncounterStingray4:
.byte $05,$02
.byte $F0,$FC,$7D,$03
.byte $F8,$FC,$7E,$03
.byte $00,$FC,$7F,$03
.byte $80
SpritesetEncounterStingray5:
.byte $05,$02
.byte $F0,$FC,$7C,$03
.byte $F8,$FC,$7E,$03
.byte $00,$FC,$7F,$03
.byte $80
SpritesetEncounterStingray6:
.byte $05,$02
.byte $F0,$FC,$6C,$03
.byte $F8,$FC,$6E,$03
.byte $00,$FC,$6F,$03
.byte $80
SpritesetEncounterStingray7:
.byte $05,$02
.byte $F0,$FC,$5C,$03
.byte $F8,$FC,$5E,$03
.byte $00,$FC,$5F,$03
.byte $80
SpritesetEncounterStingray8:
.byte $05,$02
.byte $F0,$FC,$4C,$03
.byte $F8,$FC,$4E,$03
.byte $00,$FC,$4F,$03
.byte $80
SpritesetEncounterStingray9:
.byte $05,$02
.byte $F4,$FC,$5D,$01
.byte $FC,$FC,$5E,$01
.byte $04,$FC,$5F,$01
.byte $80
SpritesetEncounterBabyshark1:
.byte $08,$04
.byte $F0,$F4,$65,$02
.byte $FE,$F4,$76,$02
.byte $F0,$FC,$78,$02
.byte $F8,$FC,$79,$02
.byte $00,$FC,$6A,$02
.byte $08,$FC,$6B,$02
.byte $FD,$04,$77,$02
.byte $80
SpritesetEncounterBabyshark2:
.byte $08,$04
.byte $F0,$F4,$64,$02
.byte $FF,$F4,$66,$02
.byte $F0,$FC,$68,$02
.byte $F8,$FC,$69,$02
.byte $00,$FC,$6A,$02
.byte $08,$FC,$6B,$02
.byte $FD,$04,$67,$02
.byte $80
SpritesetEncounterBabyshark3:
.byte $08,$04
.byte $F0,$F4,$64,$02
.byte $FE,$F4,$76,$02
.byte $F0,$FC,$68,$02
.byte $F8,$FC,$69,$02
.byte $00,$FC,$7A,$02
.byte $08,$FC,$7B,$02
.byte $FD,$04,$77,$02
.byte $80
SpritesetEncounterBabyshark4:
.byte $08,$04
.byte $F0,$F4,$65,$02
.byte $FF,$F4,$86,$02
.byte $F0,$FC,$78,$02
.byte $F8,$FC,$79,$02
.byte $00,$FC,$8A,$02
.byte $08,$FC,$8B,$02
.byte $FD,$04,$87,$02
.byte $80
SpritesetEncounterBabyshark5:
.byte $08,$04
.byte $F0,$F4,$64,$02
.byte $FF,$F4,$86,$02
.byte $F0,$FC,$88,$02
.byte $F8,$FC,$89,$02
.byte $00,$FC,$8A,$02
.byte $08,$FC,$8B,$02
.byte $FD,$04,$87,$02
.byte $80
SpritesetEncounterBabyshark6:
.byte $08,$04
.byte $F0,$F4,$64,$02
.byte $FE,$F4,$76,$02
.byte $F0,$FC,$88,$02
.byte $F8,$FC,$89,$02
.byte $00,$FC,$7A,$02
.byte $08,$FC,$7B,$02
.byte $FD,$04,$77,$02
.byte $80
SpritesetEncounterBabyshark7:
.byte $08,$04
.byte $F0,$F4,$65,$01
.byte $00,$F4,$76,$01
.byte $F0,$FC,$78,$01
.byte $F8,$FC,$79,$01
.byte $00,$FC,$7A,$01
.byte $08,$FC,$A8,$01
.byte $00,$04,$77,$01
.byte $80
SpritesetEncounterCrab1:
.byte $06,$06
.byte $F8,$F8,$8C,$03
.byte $00,$F8,$8D,$03
.byte $F8,$00,$9C,$03
.byte $00,$00,$9D,$03
.byte $80
SpritesetEncounterCrab2:
.byte $06,$06
.byte $F8,$F8,$8E,$03
.byte $00,$F8,$8F,$03
.byte $F8,$00,$9E,$03
.byte $00,$00,$9F,$03
.byte $80
SpritesetEncounterCrab3:
.byte $06,$06
.byte $F8,$F8,$34,$03
.byte $00,$F8,$35,$03
.byte $F8,$00,$28,$03
.byte $00,$00,$29,$03
.byte $80
SpritesetEncounterShell1:
.byte $06,$06
.byte $F8,$F8,$0E,$02
.byte $00,$F8,$0F,$02
.byte $F8,$00,$1E,$02
.byte $00,$00,$1F,$02
.byte $80
SpritesetEncounterShell2:
.byte $06,$06
.byte $F8,$F8,$AE,$02
.byte $00,$F8,$AF,$02
.byte $F8,$00,$BE,$02
.byte $00,$00,$BF,$02
.byte $80
SpritesetEncounterShell3:
.byte $06,$06
.byte $F8,$F8,$AC,$02
.byte $00,$F8,$AD,$02
.byte $F8,$00,$BC,$02
.byte $00,$00,$BD,$02
.byte $80
SpritesetEncounterShell4:
.byte $06,$06
.byte $F8,$F8,$AE,$02
.byte $00,$F8,$AF,$02
.byte $F8,$00,$CE,$02
.byte $00,$00,$CF,$02
.byte $80
SpritesetEncounterShell5:
.byte $06,$06
.byte $F8,$F8,$0E,$02
.byte $00,$F8,$0F,$02
.byte $F8,$00,$DE,$02
.byte $00,$00,$DF,$02
.byte $80
SpritesetEncounterShell6:
.byte $06,$06
.byte $F8,$F8,$AC,$02
.byte $00,$F8,$AD,$02
.byte $F8,$00,$CC,$02
.byte $00,$00,$CD,$02
.byte $80
SpritesetEncounterStar1:
.byte $06,$06
.byte $F8,$F8,$DC,$03
.byte $00,$F8,$DD,$03
.byte $F8,$00,$EC,$03
.byte $00,$00,$ED,$03
.byte $80
SpritesetEncounterStar2:
.byte $06,$06
.byte $F8,$F8,$FC,$03
.byte $00,$F8,$FD,$03
.byte $F8,$00,$EE,$03
.byte $00,$00,$EF,$03
.byte $80
SpritesetEncounterStar3:
.byte $06,$06
.byte $FB,$F8,$9B,$03
.byte $FB,$00,$AB,$03
.byte $80
SpritesetEncounterStar4:
.byte $06,$06
.byte $FD,$F8,$9B,$43
.byte $FD,$00,$AB,$43
.byte $80
SpritesetEncounterStar5:
.byte $06,$06
.byte $F8,$F8,$FD,$43
.byte $00,$F8,$FC,$43
.byte $F8,$00,$EF,$43
.byte $00,$00,$EE,$43
.byte $80
SpritesetEncounter50Points1:
.byte $00,$00
.byte $F8,$FC,$90,$00
.byte $00,$FC,$91,$00
.byte $80
SpritesetEncounter100Points1:
.byte $00,$00
.byte $F8,$FC,$A0,$00
.byte $00,$FC,$A1,$00
.byte $80
SpritesetEncounter200Points1:
.byte $00,$00
.byte $F8,$FC,$92,$00
.byte $00,$FC,$93,$00
.byte $80
SpritesetEncounter500Points1:
.byte $00,$00
.byte $F8,$FC,$A2,$00
.byte $00,$FC,$A3,$00
.byte $80
SpritesetEncounter1000Points1:
.byte $00,$00
.byte $F8,$FC,$94,$00
.byte $00,$FC,$95,$00
.byte $80
SpritesetEncounter2000Points1:
.byte $00,$00
.byte $F4,$FC,$92,$00
.byte $FC,$FC,$93,$00
.byte $04,$FC,$91,$00
.byte $80
SpritesetOutroPlane01:
.byte $00,$00
.byte $10,$D0,$91,$00
.byte $08,$D8,$90,$00
.byte $10,$D8,$A0,$00
.byte $00,$E0,$A3,$00
.byte $E8,$E8,$B0,$00
.byte $F0,$E8,$B1,$00
.byte $F8,$E8,$B2,$00
.byte $00,$E8,$B3,$00
.byte $E8,$F0,$C0,$00
.byte $F0,$F0,$C1,$00
.byte $F8,$F0,$C2,$00
.byte $00,$F0,$C3,$00
.byte $E8,$F8,$D0,$00
.byte $F0,$F8,$D1,$00
.byte $F8,$F8,$D2,$00
.byte $00,$F8,$D3,$00
.byte $E0,$00,$F0,$00
.byte $E8,$00,$E0,$00
.byte $F0,$00,$E1,$00
.byte $F8,$00,$E2,$00
.byte $00,$00,$E3,$00
.byte $D8,$08,$A1,$00
.byte $E0,$08,$A2,$00
.byte $D0,$10,$F1,$00
.byte $D8,$10,$A0,$00
.byte $80
SpritesetOutroPlane02:
.byte $00,$00
.byte $F3,$E8,$A4,$00
.byte $F3,$F0,$B4,$00
.byte $FB,$F0,$B5,$00
.byte $03,$F0,$B6,$00
.byte $FB,$F8,$C5,$00
.byte $03,$F8,$C6,$00
.byte $03,$00,$D6,$00
.byte $0B,$00,$D7,$00
.byte $80
SpritesetOutroPlane03:
.byte $00,$00
.byte $E8,$F0,$96,$00
.byte $F0,$F0,$97,$00
.byte $F8,$F0,$98,$00
.byte $00,$F0,$99,$00
.byte $08,$F0,$9A,$00
.byte $10,$F0,$9B,$00
.byte $F8,$F8,$A8,$00
.byte $00,$F8,$A9,$00
.byte $80
SpritesetOutroPlane04:
.byte $00,$00
.byte $F0,$F0,$9C,$00
.byte $F8,$F0,$9D,$00
.byte $00,$F0,$9E,$00
.byte $08,$F0,$9F,$00
.byte $F8,$F8,$AD,$00
.byte $00,$F8,$AE,$00
.byte $80
SpritesetOutroPlane05:
.byte $00,$00
.byte $F0,$F7,$F3,$00
.byte $F8,$F7,$F4,$00
.byte $00,$F7,$F5,$00
.byte $08,$F7,$F6,$00
.byte $80
SpritesetOutroPlane06:
.byte $00,$00
.byte $F8,$F7,$E4,$00
.byte $00,$F7,$E5,$00
.byte $80
SpritesetOutroPlane07:
.byte $00,$00
.byte $FC,$F4,$F2,$00
.byte $80
SpritesetOutroPlane08:
.byte $00,$00
.byte $F4,$F1,$E6,$00
.byte $FC,$F1,$E7,$00
.byte $FC,$F9,$F7,$00
.byte $80
SpritesetOutroPlane09:
.byte $00,$00
.byte $F8,$EC,$A7,$00
.byte $F8,$F4,$B7,$00
.byte $00,$F4,$B8,$00
.byte $F8,$FC,$C7,$00
.byte $80
SpritesetOutroPlane10:
.byte $00,$00
.byte $F7,$F1,$AA,$00
.byte $FF,$F1,$AB,$00
.byte $F7,$F9,$BA,$00
.byte $FF,$F9,$BB,$00
.byte $80
SpritesetOutroPlane11:
.byte $00,$00
.byte $F4,$F1,$BC,$00
.byte $FC,$F1,$BD,$00
.byte $04,$F1,$BE,$00
.byte $FC,$F9,$CD,$00
.byte $80
SpritesetOutroPlane12:
.byte $00,$00
.byte $F7,$F1,$BA,$80
.byte $FF,$F1,$BB,$80
.byte $F7,$F9,$AA,$80
.byte $FF,$F9,$AB,$80
.byte $80
SpritesetOutroPlane13:
.byte $00,$00
.byte $FC,$EA,$B9,$00
.byte $F4,$F2,$C8,$00
.byte $FC,$F2,$C9,$00
.byte $04,$F2,$CA,$00
.byte $FC,$FA,$D9,$00
.byte $FC,$02,$D8,$00
.byte $80
SpritesetFinaleJawsDeath:
.byte $00,$00
.byte $F4,$E8,$B2,$02
.byte $FC,$E8,$B3,$02
.byte $04,$E8,$B4,$02
.byte $F4,$F0,$C2,$02
.byte $FC,$F0,$C3,$02
.byte $04,$F0,$C4,$02
.byte $F4,$F8,$B5,$02
.byte $FC,$F8,$B6,$02
.byte $04,$F8,$B7,$02
.byte $F4,$00,$C5,$02
.byte $FC,$00,$C6,$02
.byte $04,$00,$C7,$02
.byte $F4,$08,$B8,$02
.byte $FC,$08,$B9,$02
.byte $F4,$10,$C8,$02
.byte $FC,$10,$C9,$02
.byte $80
SpritesetTitleJaws:
.byte $00,$00
.byte $08,$00,$01,$01
.byte $10,$00,$02,$01
.byte $18,$00,$03,$01
.byte $20,$00,$04,$01
.byte $08,$08,$11,$01
.byte $10,$08,$12,$01
.byte $18,$08,$13,$01
.byte $20,$08,$14,$01
.byte $00,$10,$20,$01
.byte $08,$10,$21,$01
.byte $10,$10,$22,$01
.byte $18,$10,$23,$01
.byte $20,$10,$24,$01
.byte $28,$10,$25,$01
.byte $00,$18,$30,$01
.byte $08,$18,$31,$00
.byte $10,$18,$32,$00
.byte $18,$18,$33,$00
.byte $28,$18,$35,$01
.byte $00,$20,$40,$01
.byte $28,$20,$45,$01
.byte $00,$28,$50,$01
.byte $28,$28,$55,$01
.byte $00,$30,$60,$01
.byte $28,$30,$65,$01
.byte $00,$38,$70,$01
.byte $08,$38,$71,$03
.byte $10,$38,$72,$03
.byte $18,$38,$73,$03
.byte $20,$38,$74,$03
.byte $28,$38,$75,$01
.byte $48,$38,$62,$02
.byte $50,$38,$63,$02
.byte $00,$40,$80,$01
.byte $08,$40,$81,$03
.byte $10,$40,$82,$03
.byte $18,$40,$83,$03
.byte $20,$40,$84,$03
.byte $28,$40,$85,$01
.byte $00,$22,$34,$02
.byte $08,$1F,$41,$00
.byte $10,$1F,$42,$00
.byte $18,$1F,$43,$00
.byte $20,$1F,$44,$00
.byte $28,$22,$34,$42
.byte $08,$27,$51,$00
.byte $10,$27,$52,$00
.byte $18,$27,$53,$00
.byte $20,$27,$54,$00
.byte $08,$2F,$61,$00
.byte $20,$2F,$64,$00
.byte $00,$40,$00,$03
.byte $28,$40,$10,$03
.byte $80
SpritesetPortTracker:
.byte $00,$00
.byte $0F,$00,$94,$01
.byte $17,$00,$95,$01
.byte $0F,$08,$A4,$01
.byte $17,$08,$A5,$01
.byte $FF,$10,$90,$01
.byte $07,$10,$91,$01
.byte $0F,$10,$92,$01
.byte $17,$10,$93,$01
.byte $07,$18,$A1,$01
.byte $0F,$18,$A2,$01
.byte $17,$18,$A3,$01
.byte $FF,$20,$B0,$01
.byte $07,$20,$B1,$01
.byte $0F,$20,$B2,$01
.byte $17,$20,$B3,$01
.byte $07,$28,$C1,$01
.byte $0F,$28,$C2,$01
.byte $18,$28,$C3,$01
.byte $28,$17,$D0,$00
.byte $30,$17,$D1,$00
.byte $38,$17,$D2,$00
.byte $28,$1F,$E0,$00
.byte $30,$1F,$E1,$00
.byte $38,$1F,$E2,$00
.byte $28,$27,$F0,$00
.byte $30,$27,$F1,$00
.byte $38,$27,$F2,$00
.byte $80
SpritesetPortBoat:
.byte $00,$00
.byte $10,$B8,$4B,$02
.byte $18,$B8,$4C,$01
.byte $10,$C0,$5B,$02
.byte $18,$C0,$5C,$01
.byte $20,$C0,$5D,$02
.byte $08,$C8,$59,$02
.byte $10,$C8,$5A,$02
.byte $18,$C8,$79,$01
.byte $20,$C8,$6D,$02
.byte $08,$D0,$58,$02
.byte $18,$D0,$79,$01
.byte $20,$D0,$7D,$02
.byte $28,$D0,$6A,$02
.byte $00,$D8,$57,$02
.byte $18,$D8,$79,$01
.byte $28,$D8,$6B,$02
.byte $30,$D8,$6C,$02
.byte $00,$E0,$66,$02
.byte $08,$E0,$67,$02
.byte $10,$E0,$68,$02
.byte $18,$E0,$69,$01
.byte $30,$E0,$7C,$02
.byte $00,$E8,$76,$02
.byte $08,$E8,$77,$02
.byte $10,$E8,$78,$02
.byte $18,$E8,$79,$01
.byte $30,$E8,$7A,$02
.byte $38,$E8,$7B,$02
.byte $00,$F0,$86,$02
.byte $08,$F0,$87,$02
.byte $10,$F0,$88,$02
.byte $18,$F0,$89,$02
.byte $20,$F0,$8A,$02
.byte $28,$F0,$8B,$02
.byte $30,$F0,$8C,$01
.byte $38,$F0,$8D,$01
.byte $00,$F8,$96,$00
.byte $08,$F8,$97,$00
.byte $10,$F8,$98,$00
.byte $18,$F8,$99,$00
.byte $20,$F8,$9A,$00
.byte $28,$F8,$9B,$00
.byte $80





UnknownData3_00 = 0
UnknownData3_01 = 1
UnknownData3_02 = 2
UnknownData3_03 = 3
UnknownData3_04 = 4
UnknownData3_05 = 5
UnknownData3_06 = 6
UnknownData3_07 = 7
UnknownData3_08 = 8
UnknownData3_09 = 9
UnknownData3_10 = 10
UnknownData3_11 = 11
UnknownData3_12 = 12
UnknownData3_13 = 13
UnknownData3_14 = 14
UnknownData3_15 = 15
UnknownData3_16 = 16
UnknownData3_17 = 17
UnknownData3_18 = 18
UnknownData3_19 = 19
UnknownData3_20 = 20
UnknownData3_21 = 21
UnknownData3_22 = 22
UnknownData3_23 = 23
UnknownData3_24 = 24
UnknownData3_25 = 25
UnknownData3_26 = 26
UnknownData3_27 = 27
UnknownData3_28 = 28
UnknownData3_29 = 29
UnknownData3_30 = 30
UnknownData3_31 = 31

UnknownData3_Pointers:
  .addr UnknownData3_00Data
  .addr UnknownData3_01Data
  .addr UnknownData3_02Data
  .addr UnknownData3_03Data
  .addr UnknownData3_04Data
  .addr UnknownData3_05Data
  .addr UnknownData3_06Data
  .addr UnknownData3_07Data
  .addr UnknownData3_08Data
  .addr UnknownData3_09Data
  .addr UnknownData3_10Data
  .addr UnknownData3_11Data
  .addr UnknownData3_12Data
  .addr UnknownData3_13Data
  .addr UnknownData3_14Data
  .addr UnknownData3_15Data
  .addr UnknownData3_16Data
  .addr UnknownData3_17Data
  .addr UnknownData3_18Data
  .addr UnknownData3_19Data
  .addr UnknownData3_20Data
  .addr UnknownData3_21Data
  .addr UnknownData3_22Data
  .addr UnknownData3_23Data
  .addr UnknownData3_24Data
  .addr UnknownData3_25Data
  .addr UnknownData3_26Data
  .addr UnknownData3_27Data
  .addr UnknownData3_28Data
  .addr UnknownData3_29Data
  .addr UnknownData3_30Data
  .addr UnknownData3_31Data

UnknownData3_00Data:
.byte $02, $40
.addr Lc008
UnknownData3_01Data:
.byte $02, $40
.addr Lc021
UnknownData3_02Data:
.byte $03, $30
.addr Lc008
UnknownData3_03Data:
.byte $03, $30
.addr Lc021
UnknownData3_04Data:
.byte $03, $20
.addr Lc03a
UnknownData3_05Data:
.byte $03, $20
.addr Lc05b
UnknownData3_06Data:
.byte $04, $20
.addr Lc008
UnknownData3_07Data:
.byte $04, $20
.addr Lc021
UnknownData3_08Data:
.byte $04, $10
.addr Lc03a
UnknownData3_09Data:
.byte $04, $10
.addr Lc05b
UnknownData3_10Data:
.byte $03, $10
.addr Lc07c
UnknownData3_11Data:
.byte $03, $10
.addr Lc0a5
UnknownData3_12Data:
.byte $04, $10
.addr Lc0a5
UnknownData3_13Data:
.byte $02, $10
.addr Lc0c6
UnknownData3_14Data:
.byte $02, $10
.addr Lc0d7
UnknownData3_15Data:
.byte $02, $10
.addr Lc0f8
UnknownData3_16Data:
.byte $03, $08
.addr Lc0a5
UnknownData3_17Data:
.byte $03, $08
.addr Lc0c6
UnknownData3_18Data:
.byte $03, $08
.addr Lc0d7
UnknownData3_19Data:
.byte $03, $08
.addr Lc0f8
UnknownData3_20Data:
.byte $03, $08
.addr Lc119
UnknownData3_21Data:
.byte $03, $08
.addr Lc13a
UnknownData3_22Data:
.byte $03, $08
.addr Lc15b
UnknownData3_23Data:
.byte $03, $08
.addr Lc17c
UnknownData3_24Data:
.byte $04, $04
.addr Lc0a5
UnknownData3_25Data:
.byte $04, $04
.addr Lc0c6
UnknownData3_26Data:
.byte $04, $04
.addr Lc0d7
UnknownData3_27Data:
.byte $04, $04
.addr Lc0f8
UnknownData3_28Data:
.byte $04, $04
.addr Lc119
UnknownData3_29Data:
.byte $04, $04
.addr Lc13a
UnknownData3_30Data:
.byte $04, $04
.addr Lc15b
UnknownData3_31Data:
.byte $04, $04
.addr Lc17c

Lc008:
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $FF
Lc021:
.byte $01,$01,$00,$01
.byte $01,$00,$01,$01
.byte $00,$01,$01,$00
.byte $01,$01,$00,$01
.byte $01,$00,$01,$01
.byte $00,$01,$01,$03
.byte $FF
Lc03a:
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$01
.byte $00,$00,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $01,$01,$01,$00
.byte $01,$01,$01,$03
.byte $FF
Lc05b:
.byte $00,$01,$02,$00
.byte $01,$02,$00,$01
.byte $02,$03,$00,$01
.byte $02,$00,$01,$02
.byte $00,$01,$02,$03
.byte $00,$01,$02,$00
.byte $01,$02,$00,$01
.byte $02,$00,$01,$03
.byte $FF
Lc07c:
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$03
.byte $01,$01,$01,$01
.byte $01,$01,$01,$03
.byte $01,$01,$01,$01
.byte $01,$03,$01,$01
.byte $01,$01,$01,$03
.byte $01,$01,$01,$03
.byte $01,$01,$01,$03
.byte $FF
Lc0a5:
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $FF
Lc0c6:
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $FF
Lc0d7:
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $FF
Lc0f8:
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $FF
Lc119:
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $FF
Lc13a:
.byte $00,$01,$02,$03
.byte $04,$00,$01,$02
.byte $03,$04,$00,$01
.byte $02,$03,$04,$00
.byte $01,$02,$03,$04
.byte $00,$01,$02,$03
.byte $04,$00,$01,$02
.byte $03,$04,$00,$01
.byte $FF
Lc15b:
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $FF
Lc17c:
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $04,$02,$04,$03
.byte $FF



RomGraphicsTitleScreen = 0
RomGraphicsStatusLineText = 1
RomGraphicsEncounterShallow = 2
RomGraphicsEncounterDeep = 3
RomGraphicsFinaleScreen = 4
RomGraphicsBonusScreenHitsLabel = 5
RomGraphicsOutroScreen = 6
RomGraphicsGameOverScreen = 7
RomGraphicsGotTrackerScreen = 8
RomGraphicsBonusStartScreen = 9
RomGraphicsBonusEndScreen = 10
RomGraphicsStatusPowerLabel = 11
RomGraphicsTrackerIcon = 12
RomGraphicsPortScreen = 13
RomGraphicsIntroScreen = 14

RomGraphicsPtrs:
.addr @RomGraphicsTitleScreen
.addr @RomGraphicsStatusLineText
.addr @RomGraphicsEncounterShallow
.addr @RomGraphicsEncounterDeep
.addr @RomGraphicsFinaleScreen
.addr @RomGraphicsBonusScreenHitsLabel
.addr @RomGraphicsOutroScreen
.addr @RomGraphicsGameOverScreen
.addr @RomGraphicsGotTrackerScreen
.addr @RomGraphicsBonusStartScreen
.addr @RomGraphicsBonusEndScreen
.addr @RomGraphicsStatusPowerLabel
.addr @RomGraphicsTrackerIcon
.addr @RomGraphicsPortScreen
.addr @RomGraphicsIntroScreen

@RomGraphicsTitleScreen:
.byte $00, $20, $FF
.byte $FF, $20, $10, $02, $FF
.byte $01, $D7, $20, $A5, $B5, $FF
.byte $0E, $01, $01, $FF
.byte $05, $62, $01, $61, $A2, $A0, $02, $B2, $A4, $D0, $01, $01, $D3, $FF
.byte $0D, $01, $01, $FF
.byte $05, $72, $01, $71, $B2, $01, $E0, $01, $B4, $01, $01, $E2, $E3, $22, $23, $FF
.byte $0B, $01, $01, $FF
.byte $05, $82, $01, $81, $01, $01, $F0, $01, $C4, $01, $01, $F2, $F3, $FF
.byte $0A, $60, $90, $91, $01, $01, $02, $68, $69, $6A, $6B, $92, $01, $01, $01, $01, $01, $65, $D4, $D5, $01, $01, $C5, $FF
.byte $0A, $70, $01, $A1, $01, $A3, $02, $78, $79, $7A, $7B, $02, $62, $01, $63, $64, $01, $75, $E4, $E5, $F5, $01, $01, $FF
.byte $0A, $80, $B0, $01, $01, $B3, $02, $88, $89, $8A, $8B, $02, $72, $01, $73, $74, $01, $85, $F4, $01, $01, $01, $66, $FF
.byte $0B, $C0, $C1, $C2, $C3, $02, $98, $99, $9A, $9B, $02, $93, $94, $83, $84, $94, $95, $B1, $D1, $D2, $E1, $F1, $FF
.byte $0B, $86, $87, $A6, $A7, $02, $A8, $A9, $AA, $AB, $02, $8C, $8D, $8E, $8F, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $08, $96, $97, $B6, $B7, $02, $B8, $B9, $BA, $BB, $02, $9C, $9D, $9E, $9F, $FF
.byte $0D, $5C, $5D, $5D, $5F, $5C, $5D, $5E, $5F, $6C, $6D, $6E, $6F, $7C, $7D, $7E, $7F, $5C, $5D, $5E, $5F, $5C, $5D, $5E, $5F, $5C, $5D, $5E, $5F, $5C, $5D, $5E, $5F, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $04, $05, $06, $07, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $14, $15, $16, $17, $FF
.byte $01, $86, $22, $40, $31, $39, $38, $37, $20, $4C, $4A, $4E, $20, $54, $4F, $59, $53, $2C, $4C, $54, $44, $2E, $FF
.byte $13, $54, $4D, $26, $40, $31, $39, $38, $37, $FF
.byte $0F, $55, $4E, $49, $56, $45, $52, $53, $41, $4C, $20, $43, $49, $54, $59, $20, $53, $54, $55, $44, $49, $4F, $53, $2C, $49, $4E, $43, $2E, $FF
.byte $08, $41, $4C, $4C, $20, $52, $49, $47, $48, $54, $53, $20, $52, $45, $53, $45, $52, $56, $45, $44, $2E, $FF
.byte $09, $4C, $49, $43, $45, $4E, $53, $45, $44, $20, $42, $59, $20, $4D, $45, $52, $43, $48, $41, $4E, $44, $49, $53, $49, $4E, $47, $FF
.byte $07, $43, $4F, $52, $50, $4F, $52, $41, $54, $49, $4F, $4E, $20, $4F, $46, $20, $41, $4D, $45, $52, $49, $43, $41, $2C, $49, $4E, $43, $2E, $FF
.byte $06, $4C, $49, $43, $45, $4E, $53, $45, $44, $20, $42, $59, $20, $4E, $49, $4E, $54, $45, $4E, $44, $4F, $20, $4F, $46, $FF
.byte $0F, $41, $4D, $45, $52, $49, $43, $41, $2C, $49, $4E, $43, $2E, $FF
.byte $01, $C0, $23, $FF
.byte $FF, $12, $01, $AA, $FF
.byte $01, $D2, $23, $6A, $9A, $AA, $AA, $AA, $AA, $AA, $0A, $46, $19, $0A, $AA, $AA, $AA, $FF
.byte $FF, $20, $01, $00, $FF
.byte $00
@RomGraphicsStatusLineText:
.byte $00, $2B, $FF
.byte $FF, $20, $06, $20, $FF
.byte $01, $F0, $2B, $FF
.byte $FF, $10, $01, $00, $FF
.byte $01, $61, $2B, $53, $43, $4F, $52, $45, $FF
.byte $03, $10, $11, $12, $13, $10, $FF
.byte $06, $4A, $41, $57, $53, $2F, $50, $4F, $57, $45, $52, $FF
.byte $00
@RomGraphicsEncounterShallow:
.byte $C8, $23, $FF
.byte $FF, $18, $01, $FF
.byte $FF, $01, $E0, $23, $55, $55, $55, $55, $55, $55, $55, $55, $6A, $AA, $AA, $9A, $AA, $AA, $AA, $AA, $A6, $AA, $A9, $A9, $AA, $AA, $A6, $A9, $FF
.byte $00
@RomGraphicsEncounterDeep:
.byte $C8, $23, $FF
.byte $FF, $10, $01, $FF
.byte $FF, $01, $D8, $23, $5F, $5F, $5F, $5F, $5F, $5F, $5F, $5F, $FF
.byte $FF, $18, $01, $55, $FF
.byte $01, $F8, $23, $05, $05, $05, $05, $05, $05, $05, $05, $FF
.byte $01, $C0, $2B, $55, $55, $55, $55, $55, $55, $55, $55, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $FF
.byte $FF, $08, $01, $0A, $FF
.byte $00
@RomGraphicsFinaleScreen:
.byte $00, $20, $FF
.byte $FF, $20, $1A, $02, $FF
.byte $FF, $20, $04, $00, $FF
.byte $01, $40, $20, $0E, $0F, $FF
.byte $04, $0A, $0B, $0C, $0D, $0E, $0F, $FF
.byte $10, $0A, $0B, $0C, $0D, $1E, $1F, $FF
.byte $04, $1A, $1B, $1C, $1D, $1E, $1F, $02, $24, $25, $26, $27, $02, $0A, $0B, $0C, $0D, $0E, $0F, $25, $26, $27, $02, $1A, $1B, $1C, $1D, $74, $02, $24, $25, $26, $27, $FF
.byte $05, $74, $02, $34, $35, $36, $37, $02, $1A, $1B, $1C, $1D, $1E, $1F, $35, $36, $37, $FF
.byte $04, $74, $02, $02, $34, $35, $36, $37, $74, $75, $02, $17, $18, $19, $FF
.byte $03, $17, $18, $19, $FF
.byte $03, $74, $02, $02, $74, $75, $02, $17, $18, $19, $02, $02, $74, $75, $02, $02, $74, $75, $FF
.byte $05, $74, $74, $75, $FF
.byte $04, $74, $75, $02, $02, $17, $18, $19, $FF
.byte $03, $74, $75, $FF
.byte $30, $01, $01, $01, $01, $FF
.byte $02, $01, $01, $01, $01, $01, $01, $FF
.byte $14, $04, $05, $09, $01, $FF
.byte $02, $04, $05, $06, $07, $08, $09, $FF
.byte $06, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $51, $52, $54, $54, $54, $54, $54, $54, $51, $52, $54, $54, $54, $54, $53, $50, $51, $52, $54, $54, $54, $54, $54, $54, $51, $52, $54, $54, $54, $54, $54, $54, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $16, $16, $16, $16, $16, $16, $64, $65, $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $64, $65, $16, $16, $16, $16, $16, $16, $64, $65, $16, $16, $16, $16, $FF
.byte $20, $73, $73, $70, $71, $72, $73, $73, $73, $73, $73, $73, $73, $70, $71, $72, $73, $73, $73, $73, $73, $73, $73, $70, $71, $72, $73, $73, $73, $73, $73, $73, $73, $FF
.byte $01, $C0, $23, $FF
.byte $FF, $10, $01, $00, $FF
.byte $01, $D0, $23, $F0, $F0, $F0, $F8, $F2, $FA, $F2, $F0, $FF
.byte $FF, $28, $01, $FF
.byte $FF, $00
@RomGraphicsBonusScreenHitsLabel:
.byte $6F, $2B, $48, $49, $54, $53, $FF
.byte $01, $91, $2B, $30, $30, $FF
.byte $00
@RomGraphicsOutroScreen:
.byte $00, $20, $FF
.byte $FF, $20, $0A, $02, $FF
.byte $FF, $20, $14, $3C, $FF
.byte $01, $40, $20, $0E, $0F, $FF
.byte $04, $0A, $0B, $0C, $0D, $0E, $0F, $FF
.byte $10, $0A, $0B, $0C, $0D, $1E, $1F, $FF
.byte $04, $1A, $1B, $1C, $1D, $1E, $1F, $02, $24, $25, $26, $27, $02, $0A, $0B, $0C, $0D, $0E, $0F, $25, $26, $27, $02, $1A, $1B, $1C, $1D, $74, $02, $24, $25, $26, $27, $FF
.byte $05, $74, $02, $34, $35, $36, $37, $02, $1A, $1B, $1C, $1D, $1E, $1F, $35, $36, $37, $FF
.byte $04, $74, $02, $02, $34, $35, $36, $37, $74, $75, $02, $17, $18, $19, $FF
.byte $03, $17, $18, $19, $FF
.byte $03, $74, $02, $02, $74, $75, $02, $17, $18, $19, $02, $02, $74, $75, $02, $02, $74, $75, $FF
.byte $05, $74, $74, $75, $FF
.byte $04, $74, $75, $02, $02, $17, $18, $19, $FF
.byte $03, $74, $75, $FF
.byte $22, $47, $48, $49, $4A, $4B, $4C, $FF
.byte $1A, $3C, $3C, $3C, $3C, $3C, $4D, $2E, $2F, $28, $29, $2A, $2B, $FF
.byte $19, $3D, $3E, $3F, $38, $39, $3A, $3B, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $3C, $56, $57, $58, $59, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $20, $21, $22, $23, $3C, $66, $67, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $3C, $76, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $42, $43, $44, $44, $40, $41, $3C, $3C, $77, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $54, $54, $45, $46, $54, $54, $3C, $3C, $87, $54, $54, $54, $54, $54, $51, $52, $54, $54, $54, $54, $53, $50, $51, $52, $54, $54, $54, $54, $54, $54, $51, $52, $54, $54, $54, $54, $54, $54, $3C, $3C, $68, $16, $14, $15, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $14, $15, $16, $16, $16, $16, $3C, $3C, $78, $79, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $FF
.byte $03, $89, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $60, $61, $62, $63, $55, $55, $FF
.byte $03, $5A, $16, $16, $64, $65, $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $64, $65, $16, $16, $16, $16, $16, $16, $64, $65, $16, $16, $16, $16, $FF
.byte $03, $6A, $69, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $05, $7A, $8B, $73, $73, $73, $73, $73, $70, $71, $72, $73, $73, $73, $73, $73, $73, $73, $70, $71, $72, $73, $73, $73, $73, $73, $73, $73, $FF
.byte $07, $5B, $FF
.byte $FF, $18, $02, $02, $7B, $8B, $02, $84, $85, $84, $85, $02, $6C, $6D, $6E, $6F, $80, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $FF
.byte $09, $5C, $5D, $92, $93, $94, $95, $02, $7C, $7D, $7E, $7F, $81, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $0E, $7B, $8B, $02, $8D, $8E, $8F, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $0F, $5C, $82, $83, $5F, $02, $6C, $6D, $6E, $6F, $80, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $13, $68, $7C, $7D, $7E, $7F, $81, $16, $16, $16, $16, $16, $16, $16, $FF
.byte $13, $6A, $02, $8D, $8E, $8F, $02, $02, $02, $02, $02, $02, $02, $02, $FF
.byte $01, $E7, $22, $6B, $FF
.byte $01, $C0, $23, $FF
.byte $FF, $10, $01, $00, $FF
.byte $01, $D0, $23, $FF
.byte $FF, $08, $01, $F0, $FF
.byte $01, $D8, $23, $FF
.byte $FF, $28, $01, $FF, $FF
.byte $00
@RomGraphicsGameOverScreen:
.byte $8B, $21, $47, $41, $4D, $45, $20, $20, $4F, $56, $45, $52, $FF
.byte $01, $20, $23, $FF
.byte $FF, $20, $01, $01, $FF
.byte $00
@RomGraphicsGotTrackerScreen:
.byte $A5, $20, $59, $4F, $55, $20, $43, $41, $4E, $20, $4E, $4F, $57, $20, $54, $52, $41, $43, $4B, $20, $4A, $41, $57, $53, $FF
.byte $2D, $57, $49, $54, $48, $20, $54, $48, $45, $20, $52, $45, $43, $45, $49, $56, $45, $52, $2E, $FF
.byte $6F, $2A, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CE, $CF, $FF
.byte $12, $FF
.byte $FF, $01, $09, $3A, $DB, $FF
.byte $01, $8A, $21, $FF
.byte $FF, $0C, $09, $01, $FF
.byte $FF, $0C, $01, $76, $FF
.byte $01, $96, $21, $FF
.byte $FF, $01, $09, $67, $77, $FF
.byte $01, $B1, $21, $C7, $FF
.byte $1A, $F9, $C6, $FF
.byte $03, $D7, $D8, $D9, $DA, $FF
.byte $18, $D6, $C6, $01, $E6, $E7, $E8, $E9, $EA, $EB, $FF
.byte $18, $CC, $CD, $F6, $F7, $F8, $01, $FA, $FB, $FF
.byte $18, $DC, $DD, $C8, $C9, $CA, $01, $DE, $DF, $FF
.byte $18, $AC, $AD, $AE, $AF, $EC, $ED, $EE, $EF, $FF
.byte $18, $BC, $BD, $BE, $BF, $FC, $FD, $FE, $CB, $FF
.byte $01, $20, $23, $FF
.byte $FF, $20, $01, $01, $FF
.byte $01, $C0, $23, $FF
.byte $FF, $10, $01, $00, $FF
.byte $01, $D0, $23, $50, $50, $50, $50, $50, $50, $50, $50, $55, $55, $55, $F5, $55, $55, $55, $55, $55, $55, $55, $59, $FF
.byte $FF, $0C, $01, $55, $FF
.byte $00
@RomGraphicsBonusStartScreen:
.byte $8A, $21, $42, $4F, $4E, $55, $53, $20, $53, $43, $45, $4E, $45, $21, $FF
.byte $01, $20, $23, $FF
.byte $FF, $20, $01, $01, $FF
.byte $00
@RomGraphicsBonusEndScreen:
.byte $06, $21, $42, $4F, $4E, $55, $53, $20, $53, $43, $45, $4E, $45, $20, $52, $45, $53, $55, $4C, $54, $53, $2E, $FF
.byte $01, $20, $23, $FF
.byte $FF, $20, $01, $01, $FF
.byte $00
@RomGraphicsStatusPowerLabel:
.byte $6F, $2B, $18, $19, $1A, $FF
.byte $00
@RomGraphicsTrackerIcon:
.byte $6F, $2B, $0B, $0C, $FF
.byte $1E, $1B, $1C, $FF
.byte $00
@RomGraphicsPortScreen:
.byte $20, $20, $FF
.byte $FF, $20, $1D, $07, $FF
.byte $01, $5D, $20, $09, $0A, $0B, $FF
.byte $0A, $09, $0F, $07, $36, $38, $39, $3A, $3B, $FF
.byte $13, $09, $0A, $0F, $FF
.byte $04, $36, $37, $38, $39, $39, $3A, $3B, $0F, $FF
.byte $10, $36, $38, $39, $3A, $3B, $FF
.byte $07, $09, $0A, $0B, $0C, $0D, $0E, $0F, $FF
.byte $17, $36, $37, $38, $39, $3A, $3B, $FF
.byte $06, $36, $37, $3B, $FF
.byte $05, $09, $0F, $FF
.byte $06, $36, $37, $3B, $FF
.byte $05, $36, $37, $38, $39, $3A, $3B, $0F, $FF
.byte $1C, $36, $37, $3B, $FF
.byte $0E, $36, $37, $37, $3B, $FF
.byte $06, $09, $0A, $0E, $0F, $FF
.byte $09, $46, $47, $49, $47, $47, $48, $49, $4A, $4A, $FF
.byte $03, $46, $47, $49, $4A, $FF
.byte $0B, $46, $47, $49, $4A, $FF
.byte $08, $46, $47, $49, $4A, $FF
.byte $04, $46, $47, $48, $49, $4A, $FF
.byte $2F, $6E, $6F, $9D, $6E, $6F, $9D, $6E, $6F, $07, $9D, $6E, $6F, $FF
.byte $14, $7E, $7F, $9E, $7E, $7F, $9E, $7E, $7F, $07, $9E, $7E, $7F, $FF
.byte $03, $19, $1A, $1B, $1C, $1D, $1E, $1F, $1C, $1D, $1D, $1F, $1C, $1D, $1D, $1C, $1D, $1D, $8E, $8F, $9F, $8E, $8F, $9F, $8E, $8F, $07, $9F, $8E, $8F, $FF
.byte $03, $29, $2A, $2B, $2C, $2D, $2E, $2F, $2C, $2D, $2E, $2F, $2C, $2D, $2E, $2C, $2D, $2E, $FF
.byte $FF, $0C, $01, $3D, $FF
.byte $FF, $0C, $01, $4D, $AC, $07, $AC, $AD, $AC, $07, $AC, $AC, $07, $AD, $AC, $AD, $5E, $FF
.byte $01, $0C, $22, $3E, $FF
.byte $FF, $13, $01, $3F, $FF
.byte $01, $2C, $22, $4E, $FF
.byte $FF, $13, $01, $4F, $FF
.byte $FF, $13, $01, $5F, $FF
.byte $01, $64, $22, $AC, $07, $AD, $FF
.byte $03, $AC, $07, $AD, $07, $07, $AC, $AD, $AC, $07, $AC, $07, $07, $AC, $07, $07, $AC, $AD, $07, $07, $AC, $AD, $AD, $07, $07, $AC, $07, $BE, $07, $07, $AC, $FF
.byte $03, $AC, $07, $07, $AD, $07, $07, $AD, $AC, $07, $07, $AC, $07, $AD, $07, $AC, $07, $BE, $07, $AD, $AC, $07, $07, $BC, $BD, $07, $07, $BC, $BD, $07, $BF, $BE, $07, $07, $BC, $BD, $07, $07, $BE, $07, $BC, $BD, $07, $BE, $07, $BC, $BD, $07, $07, $BE, $BF, $07, $07, $BC, $BD, $FF
.byte $09, $BF, $FF
.byte $06, $BC, $BD, $FF
.byte $10, $AE, $AF, $07, $07, $BC, $BD, $FF
.byte $03, $AE, $AF, $FF
.byte $08, $AE, $AF, $07, $07, $BC, $BD, $FF
.byte $0D, $AE, $AF, $FF
.byte $07, $AE, $AF, $FF
.byte $04, $AE, $AF, $07, $07, $AE, $AF, $FF
.byte $01, $C0, $23, $FF
.byte $FF, $18, $01, $FF
.byte $FF, $01, $D8, $23, $FF
.byte $FF, $08, $01, $55, $FF
.byte $01, $E0, $23, $FF
.byte $FF, $20, $01, $AA, $FF
.byte $00
@RomGraphicsIntroScreen:
.byte $AB, $20, $76, $74, $15, $00, $13, $74, $70, $73, $0F, $6A, $FF
.byte $53, $89, $8A, $8B, $03, $03, $80, $81, $90, $91, $02, $03, $03, $03, $03, $03, $03, $FF
.byte $10, $03, $03, $03, $03, $82, $83, $84, $85, $86, $87, $03, $88, $89, $8A, $8B, $03, $FF
.byte $10, $03, $03, $98, $99, $92, $03, $94, $95, $96, $97, $03, $98, $99, $9A, $9B, $03, $FF
.byte $10, $03, $03, $03, $03, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $03, $03, $03, $03, $03, $FF
.byte $10, $03, $03, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $03, $03, $98, $99, $FF
.byte $10, $03, $03, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $03, $03, $03, $03, $FF
.byte $10, $DA, $DB, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DA, $DB, $FF
.byte $10, $03, $03, $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $03, $03, $03, $FF
.byte $10, $03, $03, $03, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $03, $03, $03, $03, $03, $03, $FF
.byte $53, $7B, $78, $17, $74, $14, $6B, $FF
.byte $37, $77, $78, $3B, $14, $72, $06, $13, $74, $6B, $FF
.byte $01, $20, $23, $FF
.byte $FF, $20, $01, $01, $FF
.byte $01, $D2, $23, $AA, $22, $88, $AA, $FF
.byte $04, $5A, $DA, $FA, $5A, $FF
.byte $04, $05, $0D, $0F, $05, $FF
.byte $00

;
; settings for each type of encounter.
; a little overkill since there's only two, but OK.
;
; struct:
;  -  u8 which background to draw
;  -  u8 graphics to render for the encounter
;  - u16 water level
;  -  u8 ? stored in $033E
;  -  u8 ? stored in $033F
;  -  u8 palette
;

EncounterTypeDeep = 0
EncounterType1 = 1
EncounterType2 = 2
EncounterTypeShallow = 3
EncounterType4 = 4

EncounterTypeSettings:
.word @EncounterTypeDeep
.word @EncounterTypeDeep
.word @EncounterTypeDeep
.word @EncounterTypeShallow
.word @EncounterTypeShallow

@EncounterTypeDeep:
.byte EncounterBackgroundDeep
.byte RomGraphicsEncounterDeep
.word $0048
.byte $20
.byte $01
.byte PaletteEncounterDeep

@EncounterTypeShallow:
.byte EncounterBackgroundShallow
.byte RomGraphicsEncounterShallow
.word $0058
.byte $C0
.byte $00
.byte PaletteEncounterShallow

;
; instructions for drawing the background of the encounter screens
;
; starts with the ppu address to start drawing at.
;
; after that there are a list of segments, each segment starts with a 2-byte control type:
;  - FF00 - marks ennd of data
;  - FF01 PPUADDRESS METATILE - moves ppuaddress to the first parameter (2 bytes), then draws metatile
;  - FFFD COUNT ... - denotes a copy section, followed by 1 byte for how many copies to draw, then the bytes to draw
;  - FFFE - decrements the copy count and returns to the last FFFD section
;  - FFFF W H METATILE - draws a WxH section of the metatile
;  - FFxx - FF followed by any other number skips the ppu ahead that many metatiles (2x2 tiles)
;
; any data outside of these sections are metatile identifiers, drawn at the ppu position
;

EncounterBackgroundShallow = 0
EncounterBackgroundDeep    = 1

EncounterBackgroundPointers:
.word @EncounterBackgroundShallowData
.word @EncounterBackgroundDeepData

@EncounterBackgroundShallowData:
.word $2080
.byte $FF,$FF,$10,$05,$81
.byte $FF,$FD,$08,$8E,$8F,$FF,$FE
.byte $FF,$FD,$08,$83,$84,$FF,$FE
.byte $FF,$FD,$08,$8C,$8D,$FF,$FE
.byte $FF,$FF,$10,$02,$80
.byte $80,$8B,$93,$80,$89,$80,$8B,$80,$93,$9A,$9B,$9E,$9F,$87,$89,$93
.byte $90,$91,$92,$90,$91,$94,$95,$91,$92,$96,$97,$98,$99,$90,$91,$92
.byte $FF,$01,$C2,$22,$8A
.byte $FF,$04
.byte $8A
.byte $FF,$03
.byte $9C,$9D
.byte $FF,$00

@EncounterBackgroundDeepData:
.word $2080
.byte $FF,$FF,$10,$04,$81
.byte $FF,$FD,$08,$8E,$8F,$FF,$FE
.byte $FF,$FD,$08,$83,$84,$FF,$FE
.byte $FF,$FD,$08,$85,$86,$FF,$FE
.byte $FF,$FD,$08,$8C,$8D,$FF,$FE
.byte $FF,$FF,$10,$05,$80
.byte $FF,$01,$80,$23,$A3
.byte $FF,$0B,$B2,$B4,$B5,$B6
.byte $FF,$01,$00,$28
.byte $FF,$FF,$10,$02,$81
.byte $FF,$FF,$10,$02,$80
.byte $90,$91,$92,$A0,$96,$98,$98,$98,$98,$94,$94,$A2,$A1,$91,$92,$96
.byte $FF,$01,$02,$28
.byte $A4,$A5,$A6,$A7,$A8,$AA,$87,$80,$80,$80,$B0,$B1,$B3
.byte $FF,$07
.byte $A9,$81,$AB,$AC,$AD,$AE,$AF
.byte $FF,$09
.byte $9C,$9D
.byte $FF,$0C
.byte $93,$9A,$9B,$9E,$9F
.byte $FF,$06
.byte $93
.byte $FF,$00


; offsets into 32 byte palette data block
PaletteTitleScreen      = (PaletteTitleScreenData      - PaletteData) / $20
PaletteMapScreen        = (PaletteMapScreenData        - PaletteData) / $20
PaletteEncounterShallow = (PaletteEncounterShallowData - PaletteData) / $20
PaletteEncounterDeep    = (PaletteEncounterDeepData    - PaletteData) / $20
PaletteFinaleScreen     = (PaletteFinaleScreenData     - PaletteData) / $20
PaletteOutroScreen      = (PaletteOutroScreenData      - PaletteData) / $20
PalettePort             = (PalettePortData             - PaletteData) / $20
PaletteBlackScreen      = (PaletteBlackScreenData      - PaletteData) / $20
PaletteIntroScreen      = (PaletteIntroScreenData      - PaletteData) / $20

PaletteData:
PaletteTitleScreenData:
.byte $02,$20,$21,$12
.byte $02,$3C,$0C,$1C
.byte $02,$16,$21,$06
.byte $02,$30,$0F,$0F
.byte $02,$20,$10,$0F
.byte $02,$3C,$0C,$1C
.byte $02,$20,$16,$06
.byte $02,$20,$21,$12
PaletteMapScreenData:
.byte $0F,$20,$15,$27
.byte $0F,$20,$17,$07
.byte $0F,$12,$21,$20
.byte $0F,$20,$08,$1A
.byte $0F,$20,$16,$10
.byte $0F,$20,$0F,$27
.byte $0F,$20,$03,$00
.byte $0F,$0F,$27,$17
PaletteEncounterShallowData:
.byte $0F,$20,$16,$27
.byte $0F,$11,$02,$2C
.byte $0F,$11,$18,$28
.byte $0F,$20,$21,$11
.byte $0F,$20,$16,$10
.byte $0F,$20,$0F,$27
.byte $0F,$20,$03,$00
.byte $0F,$0F,$27,$17
PaletteEncounterDeepData:
.byte $0F,$20,$16,$27
.byte $0F,$12,$0C,$21
.byte $0F,$0C,$07,$17
.byte $0F,$20,$21,$12
.byte $0F,$20,$16,$10
.byte $0F,$20,$0F,$27
.byte $0F,$20,$03,$00
.byte $0F,$0F,$27,$17
PaletteFinaleScreenData:
.byte $0F,$20,$21,$10
.byte $0F,$00,$00,$00
.byte $0F,$21,$17,$1A
.byte $0F,$20,$12,$02
.byte $0F,$20,$17,$0F
.byte $0F,$20,$0F,$00
.byte $0F,$20,$26,$0F
.byte $0F,$16,$26,$0F
PaletteOutroScreenData:
.byte $0F,$20,$26,$16
.byte $0F,$20,$0C,$23
.byte $0F,$00,$00,$00
.byte $0F,$26,$0C,$1C
.byte $0F,$25,$20,$05
.byte $0F,$13,$23,$33
.byte $0F,$16,$26,$36
.byte $0F,$19,$29,$39
PalettePortData:
.byte $0F,$20,$12,$26
.byte $0F,$0A,$12,$17
.byte $0F,$20,$1C,$13
.byte $0F,$20,$12,$22
.byte $0F,$20,$0F,$06
.byte $0F,$20,$0F,$26
.byte $0F,$20,$0F,$00
.byte $0F,$20,$0F,$0F
PaletteBlackScreenData:
.byte $0F,$20,$15,$27
.byte $0F,$12,$10,$00
.byte $0F,$18,$08,$28
.byte $0F,$12,$08,$28
.byte $0F,$20,$06,$00
.byte $0F,$25,$16,$12
.byte $0F,$00,$00,$00
.byte $0F,$00,$00,$00
PaletteIntroScreenData:
.byte $0F,$20,$12,$26
.byte $0F,$20,$16,$1C
.byte $0F,$20,$10,$12
.byte $0F,$06,$10,$1C
.byte $0F,$20,$06,$00
.byte $0F,$25,$16,$12
.byte $0F,$00,$00,$00
.byte $0F,$00,$00,$00

RunBonusScreen:
        jsr     PPUDisableNMI                           ; CF0E 20 EA 8B                  ..
        lda     #SFXSTOP                            ; CF11 A9 FF                    ..
        jsr     SoundPlay                           ; CF13 20 CD E2                  ..
        jsr     ClearEntityMemory                           ; CF16 20 7C 97                  |.
        jsr     ClearScreenAndSprites                           ; CF19 20 12 8E                  ..
        jsr     DrawStatusLine                           ; CF1C 20 8F A7                  ..
        lda     #PaletteBlackScreen                            ; CF1F A9 07                    ..
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; CF21 20 BD 8E                  ..
        lda     #RomGraphicsBonusStartScreen                            ; CF24 A9 09                    ..
        jsr     DrawRomGraphics                           ; CF26 20 69 8D                  i.
        lda     #$00                            ; CF29 A9 00                    ..
        sta     SCROLL_X                           ; CF2B 8D 20 03                 . .
        sta     SCROLL_Y                           ; CF2E 8D 22 03                 .".
        sta     UseHighPPUNametables                           ; CF31 8D 23 03                 .#.
        sta     ActiveCHR                           ; CF34 8D 07 03                 ...
        lda     #$01                            ; CF37 A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; CF39 8D 02 03                 ...
        sta     ShowStatusBarTextLine                           ; CF3C 8D 05 03                 ...
        lda     #MusicBonusScreenStart                            ; CF3F A9 03                    ..
        jsr     SoundPlay                           ; CF41 20 CD E2                  ..
        jsr     PPUEnableNMI                           ; CF44 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; CF47 20 C2 8B                  ..
        lda     #$B4                            ; CF4A A9 B4                    ..
        sta     $12                             ; CF4C 85 12                    ..
LCF4E:
        jsr     WaitFor1Frame                           ; CF4E 20 40 8C                  @.
        ldy     #$02                            ; CF51 A0 02                    ..
        jsr     WaitForYSpins                           ; CF53 20 60 8C                  `.
        jsr     RefreshPPUState                           ; CF56 20 83 8B                  ..
        dec     $12                             ; CF59 C6 12                    ..
        bne     LCF4E                           ; CF5B D0 F1                    ..
        jsr     PPUDisableNMI                           ; CF5D 20 EA 8B                  ..
        jsr     ClearScreenAndSprites                           ; CF60 20 12 8E                  ..
        jsr     DrawStatusLine                           ; CF63 20 8F A7                  ..
        lda     #RomGraphicsBonusScreenHitsLabel                            ; CF66 A9 05                    ..
        jsr     DrawRomGraphics                           ; CF68 20 69 8D                  i.
        lda     #EncounterBackgroundDeep                            ; CF6B A9 01                    ..
        jsr     LoadEncounterBackground                           ; CF6D 20 E6 AC                  ..
        lda     #RomGraphicsEncounterDeep                            ; CF70 A9 03                    ..
        jsr     DrawRomGraphics                           ; CF72 20 69 8D                  i.
        lda     #PaletteEncounterDeep                            ; CF75 A9 03                    ..
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; CF77 20 BD 8E                  ..
        lda     #CHREncounterAndIntroScreen
        sta     ActiveCHR                           ; CF7C 8D 07 03                 ...
        lda     #$00                            ; CF7F A9 00                    ..
        sta     SCROLL_X                           ; CF81 8D 20 03                 . .
        sta     UseHighPPUNametables                           ; CF84 8D 23 03                 .#.
        sta     CameraX                           ; CF87 8D 38 03                 .8.
        sta     CameraY                           ; CF8A 8D 3A 03                 .:.
        sta     CameraY+1                           ; CF8D 8D 3B 03                 .;.
        lda     #$10                            ; CF90 A9 10                    ..
        sta     CameraX+1                           ; CF92 8D 39 03                 .9.
        lda     #$20                            ; CF95 A9 20                    . 
        sta     SCROLL_Y                           ; CF97 8D 22 03                 .".
        lda     #$48                            ; CF9A A9 48                    .H
        sta     WaterHeight                           ; CF9C 8D 3C 03                 .<.
        lda     #$00                            ; CF9F A9 00                    ..
        sta     WaterHeight+1                           ; CFA1 8D 3D 03                 .=.
        lda     #$20                            ; CFA4 A9 20                    . 
        sta     $033E                           ; CFA6 8D 3E 03                 .>.
        lda     #$01                            ; CFA9 A9 01                    ..
        sta     $033F                           ; CFAB 8D 3F 03                 .?.
        lda     #$01                            ; CFAE A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; CFB0 8D 02 03                 ...
        sta     ShowStatusBarTextLine                           ; CFB3 8D 05 03                 ...
        lda     BonusScreensPlayed                           ; CFB6 AD 8B 03                 ...
        asl     a                               ; CFB9 0A                       .
        adc     BonusScreensPlayed                           ; CFBA 6D 8B 03                 m..
        asl     a                               ; CFBD 0A                       .
        adc     #$E2                            ; CFBE 69 E2                    i.
        sta     $50                             ; CFC0 85 50                    .P
        lda     #$00                            ; CFC2 A9 00                    ..
        adc     #$D4                            ; CFC4 69 D4                    i.
        sta     $51                             ; CFC6 85 51                    .Q
        lda     #$00                            ; CFC8 A9 00                    ..
        sta     $52                             ; CFCA 85 52                    .R
        sta     $53                             ; CFCC 85 53                    .S
        sta     $54                             ; CFCE 85 54                    .T
        jsr     PPUEnableNMI                           ; CFD0 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; CFD3 20 C2 8B                  ..
LCFD6:
        jsr     WaitFor1Frame                           ; CFD6 20 40 8C                  @.
        jsr     ReadJoypads                           ; CFD9 20 87 8C                  ..
        jsr     BonusRunPlayer                           ; CFDC 20 B6 D1                  ..
        jsr     BonusRunProjectiles                           ; CFDF 20 8D 9B                  ..
        jsr     BonusRunJellyfish                           ; CFE2 20 7E D2                  ~.
        jsr     UpdateEntitySprites                           ; CFE5 20 37 9A                  7.
        jsr     LA9B6                           ; CFE8 20 B6 A9                  ..
        jsr     L8B5F                           ; CFEB 20 5F 8B                  _.
        jsr     RefreshPPUState                           ; CFEE 20 83 8B                  ..
        bit     $53                             ; CFF1 24 53                    $S
        bpl     LCFD6                           ; CFF3 10 E1                    ..
        bvs     RunBonusScreenEnding                           ; CFF5 70 0B                    p.
        lda     #$78                            ; CFF7 A9 78                    .x
        sta     $52                             ; CFF9 85 52                    .R
        lda     #$C0                            ; CFFB A9 C0                    ..
        sta     $53                             ; CFFD 85 53                    .S
        jmp     LCFD6                           ; CFFF 4C D6 CF                 L..
RunBonusScreenEnding:
        dec     $52                             ; D002 C6 52                    .R
        bne     LCFD6                           ; D004 D0 D0                    ..
        jsr     PPUDisableNMI                           ; D006 20 EA 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; D009 20 C2 8B                  ..
        jsr     PPUClear                           ; D00C 20 2D 8E                  -.
        lda     #RomGraphicsBonusEndScreen                            ; D00F A9 0A                    ..
        jsr     DrawRomGraphics                           ; D011 20 69 8D                  i.
        lda     #$00                            ; D014 A9 00                    ..
        sta     SCROLL_X                           ; D016 8D 20 03                 . .
        sta     SCROLL_Y                           ; D019 8D 22 03                 .".
        sta     UseHighPPUNametables                           ; D01C 8D 23 03                 .#.
        sta     ActiveCHR                           ; D01F 8D 07 03                 ...
        lda     #$01                            ; D022 A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; D024 8D 02 03                 ...
        sta     ShowStatusBarTextLine                           ; D027 8D 05 03                 ...
        jsr     PPUEnableNMI                           ; D02A 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; D02D 20 C2 8B                  ..
        lda     #MusicBonusScreenEnd                            ; D030 A9 1A                    ..
        jsr     SoundPlay                           ; D032 20 CD E2                  ..
        lda     #$78                            ; D035 A9 78                    .x
        jsr     WaitForAFramesAndRefreshPPU                           ; D037 20 1F D1                  ..
        jsr     CopyToVRAMBuffer                           ; D03A 20 A1 A8                  ..
        .addr   CopyTextBonusNumberOfHits                         ; D03D 50 D1                    P.
; ----------------------------------------------------------------------------
        lda     #$00                            ; D03F A9 00                    ..
        sta     VRAMBufferActive                           ; D041 8D 00 01                 ...
        ldx     VRAMBufferOffset                           ; D044 AE 01 01                 ...
        lda     #$A1                            ; D047 A9 A1                    ..
        sta     VRAMBuffer,x                         ; D049 9D 02 01                 ...
        inx                                     ; D04C E8                       .
        lda     #$7B                            ; D04D A9 7B                    .{
        sta     VRAMBuffer,x                         ; D04F 9D 02 01                 ...
        inx                                     ; D052 E8                       .
        lda     #$02                            ; D053 A9 02                    ..
        sta     VRAMBuffer,x                         ; D055 9D 02 01                 ...
        inx                                     ; D058 E8                       .
        lda     $54                             ; D059 A5 54                    .T
        jsr     ConvertAToBCD                           ; D05B 20 39 D1                  9.
        jsr     MoveAAndYToAsciiTable                           ; D05E 20 46 D1                  F.
        sta     VRAMBuffer+1,x                         ; D061 9D 03 01                 ...
        tya                                     ; D064 98                       .
        sta     VRAMBuffer,x                         ; D065 9D 02 01                 ...
        inx                                     ; D068 E8                       .
        inx                                     ; D069 E8                       .
        stx     VRAMBufferOffset                           ; D06A 8E 01 01                 ...
        lda     #$80                            ; D06D A9 80                    ..
        sta     VRAMBufferActive                           ; D06F 8D 00 01                 ...
        lda     $0304                           ; D072 AD 04 03                 ...
        ora     #$10                            ; D075 09 10                    ..
        sta     $0304                           ; D077 8D 04 03                 ...
        lda     #$78                            ; D07A A9 78                    .x
        jsr     WaitForAFramesAndRefreshPPU                           ; D07C 20 1F D1                  ..
        jsr     CopyToVRAMBuffer                           ; D07F 20 A1 A8                  ..
        .addr   CopyTextBonusShellsCollected                         ; D082 67 D1                    g.
; ----------------------------------------------------------------------------
        lda     #$00                            ; D084 A9 00                    ..
        sta     VRAMBufferActive                           ; D086 8D 00 01                 ...
        ldx     VRAMBufferOffset                           ; D089 AE 01 01                 ...
        lda     #$A1                            ; D08C A9 A1                    ..
        sta     VRAMBuffer,x                         ; D08E 9D 02 01                 ...
        inx                                     ; D091 E8                       .
        lda     #$DB                            ; D092 A9 DB                    ..
        sta     VRAMBuffer,x                         ; D094 9D 02 01                 ...
        inx                                     ; D097 E8                       .
        lda     #$02                            ; D098 A9 02                    ..
        sta     VRAMBuffer,x                         ; D09A 9D 02 01                 ...
        inx                                     ; D09D E8                       .
        lda     $54                             ; D09E A5 54                    .T
        ldy     #$00                            ; D0A0 A0 00                    ..
LD0A2:
        cmp     #$03                            ; D0A2 C9 03                    ..
        bcc     LD0AC                           ; D0A4 90 06                    ..
        sbc     #$03                            ; D0A6 E9 03                    ..
        iny                                     ; D0A8 C8                       .
        jmp     LD0A2                           ; D0A9 4C A2 D0                 L..

; ----------------------------------------------------------------------------
LD0AC:
        tya                                     ; D0AC 98                       .
        sta     $00                             ; D0AD 85 00                    ..
        jsr     ConvertAToBCD                           ; D0AF 20 39 D1                  9.
        jsr     MoveAAndYToAsciiTable                           ; D0B2 20 46 D1                  F.
        sta     VRAMBuffer+1,x                         ; D0B5 9D 03 01                 ...
        tya                                     ; D0B8 98                       .
        sta     VRAMBuffer,x                         ; D0B9 9D 02 01                 ...
        inx                                     ; D0BC E8                       .
        inx                                     ; D0BD E8                       .
        stx     VRAMBufferOffset                           ; D0BE 8E 01 01                 ...
        lda     #$80                            ; D0C1 A9 80                    ..
        sta     VRAMBufferActive                           ; D0C3 8D 00 01                 ...
        lda     $0304                           ; D0C6 AD 04 03                 ...
        ora     #$10                            ; D0C9 09 10                    ..
        sta     $0304                           ; D0CB 8D 04 03                 ...
        lda     #$3C                            ; D0CE A9 3C                    .<
        jsr     WaitForAFramesAndRefreshPPU                           ; D0D0 20 1F D1                  ..
        lda     $00                             ; D0D3 A5 00                    ..
        clc                                     ; D0D5 18                       .
        adc     PlayerShellCount                           ; D0D6 6D 90 03                 m..
        cmp     #$64                            ; D0D9 C9 64                    .d
        bcc     LD0DF                           ; D0DB 90 02                    ..
        .byte   $A9,$63                         ; D0DD A9 63                    .c
; ----------------------------------------------------------------------------
LD0DF:
        sta     PlayerShellCount                           ; D0DF 8D 90 03                 ...
        lda     $0304                           ; D0E2 AD 04 03                 ...
        ora     #$08                            ; D0E5 09 08                    ..
        sta     $0304                           ; D0E7 8D 04 03                 ...
        lda     $54                             ; D0EA A5 54                    .T
        cmp     #$1E                            ; D0EC C9 1E                    ..
        bcs     LD0FB                           ; D0EE B0 0B                    ..
        lda     #SFXEncounterJawsHit
        jsr     SoundPlay
        lda     #$78
        jsr     WaitForAFramesAndRefreshPPU
        rts
; ----------------------------------------------------------------------------
LD0FB:
        lda     #$3C                            ; D0FB A9 3C                    .<
        jsr     WaitForAFramesAndRefreshPPU                           ; D0FD 20 1F D1                  ..
        jsr     CopyToVRAMBuffer                           ; D100 20 A1 A8                  ..
        .addr   CopyTextBonusGotThemAll                        ; D103 82 D1                    ..
; ----------------------------------------------------------------------------
        lda     #$3C                            ; D105 A9 3C                    .<
        jsr     WaitForAFramesAndRefreshPPU                           ; D107 20 1F D1                  ..
        jsr     CopyToVRAMBuffer                           ; D10A 20 A1 A8                  ..
        .addr   CopyTextBonus10000BonusPoints                         ; D10D 97 D1                    ..
; ----------------------------------------------------------------------------
        lda     #$11                            ; D10F A9 11                    ..
        jsr     AwardPoints                           ; D111 20 D0 8C                  ..
        lda     #SFXEncounterPickup                            ; D114 A9 15                    ..
        jsr     SoundPlay                           ; D116 20 CD E2                  ..
        lda     #$78                            ; D119 A9 78                    .x
        jsr     WaitForAFramesAndRefreshPPU                           ; D11B 20 1F D1                  ..
        rts                                     ; D11E 60                       `

; ----------------------------------------------------------------------------
WaitForAFramesAndRefreshPPU:
        sta     $12
@KeepWaiting:
        jsr     WaitFor1Frame
        ldy     #$02
        jsr     WaitForYSpins
        jsr     L8B5F
        lda     #$01
        sta     NMISpriteHandlingDisabled
        jsr     RefreshPPUState
        dec     $12
        bne     @KeepWaiting
        rts

; ----------------------------------------------------------------------------
; Converts the value in the A register to Binary Coded Decimal.
; Stores the low byte in A and the high byte in Y.
;
; Example:
;   lda #$23           ; load decimal 35 into A
;   jsr ConvertAToBCD  ; convert to BCD
;   sty $0             ; Stores #$03 into $0
;   sta $1             ; Stores #$05 into $1
;
ConvertAToBCD:
        ldy     #$00
@IncrementYUntilALowerThan10:
        cmp     #$0A
        bcc     @Done
        sbc     #$0A
        iny
        jmp     @IncrementYUntilALowerThan10
@Done:
        rts

; ----------------------------------------------------------------------------
MoveAAndYToAsciiTable:
        clc
        adc #$30
        pha
        tya
        adc #$30
        tay
        pla
        rts

; ----------------------------------------------------------------------------

CopyTextBonusNumberOfHits:
        .byte $66,$21,$14
        .byte "NUMBER OF HITS     "
        .byte $2B

CopyTextBonusShellsCollected:
        .byte $C2,$21,$18
        .byte "BONUS SHELLS COLLECTED "
        .byte $2B

CopyTextBonusGotThemAll:
        .byte $27,$22,$12
        .byte "YOU GOT THEM ALL!"
        .byte $21

CopyTextBonus10000BonusPoints:
        .byte $62,$22,$1C
        .byte "YOU GET 10000 BONUS POINTS!!"

; ----------------------------------------------------------------------------
BonusRunPlayer:
        lda     #<PlayerData                            ; D1B6 A9 80                    ..
        sta     WorksetPtr                             ; D1B8 85 40                    .@
        lda     #>PlayerData                            ; D1BA A9 06                    ..
        sta     WorksetPtr+1                             ; D1BC 85 41                    .A
        jsr     WorksetLoad                           ; D1BE 20 54 97                  T.
        bit     Workset + EntityActive                             ; D1C1 24 20                    $ 
        bmi     LD1E7                           ; D1C3 30 22                    0"
        lda     #$C0                            ; D1C5 A9 C0                    ..
        sta     Workset + EntityActive                             ; D1C7 85 20                    . 
        lda     #$C0                            ; D1C9 A9 C0                    ..
        sta     Workset + EntityX                             ; D1CB 85 22                    ."
        lda     #$0F                            ; D1CD A9 0F                    ..
        sta     Workset + EntityX  + 1                            ; D1CF 85 23                    .#
        lda     #$30                            ; D1D1 A9 30                    .0
        sta     Workset + EntityY                             ; D1D3 85 24                    .$
        lda     #$00                            ; D1D5 A9 00                    ..
        sta     Workset + EntityY + 1                             ; D1D7 85 25                    .%
        sta     Workset + EntityV10                             ; D1D9 85 30                    .0
        lda     #$02                            ; D1DB A9 02                    ..
        sta     Workset + EntityXSpeed                             ; D1DD 85 31                    .1
        lda     #AnimationEncounterPlane                            ; D1DF A9 22                    ."
        jsr     WorksetAnimationPlay                           ; D1E1 20 AD 97                  ..
        jmp     WorksetSave                           ; D1E4 4C 61 97                 La.

; ----------------------------------------------------------------------------
LD1E7:
        jsr     WorksetAnimationAdvance                           ; D1E7 20 BE 97                  ..
        jsr     WorksetMoveX                           ; D1EA 20 FA 97                  ..
        lda     #$10                            ; D1ED A9 10                    ..
        bit     Workset + EntityActive                             ; D1EF 24 20                    $ 
        bne     LD216                           ; D1F1 D0 23                    .#
        ldx     #$F8                            ; D1F3 A2 F8                    ..
        ldy     #$01                            ; D1F5 A0 01                    ..
        bit     Joy1Inputs                           ; D1F7 2C 30 03                 ,0.
        bvs     LD205                           ; D1FA 70 09                    p.
        bmi     LD201                           ; D1FC 30 03                    0.
        .byte   $C8,$D0,$02                     ; D1FE C8 D0 02                 ...
; ----------------------------------------------------------------------------
LD201:
        ldy     #$03                            ; D201 A0 03                    ..
        ldx     #$08                            ; D203 A2 08                    ..
LD205:
        txa                                     ; D205 8A                       .
        jsr     L983C                           ; D206 20 3C 98                  <.
        lda     Workset + EntityX                             ; D209 A5 22                    ."
        cmp     #$40                            ; D20B C9 40                    .@
        lda     Workset + EntityX  + 1                            ; D20D A5 23                    .#
        sbc     #$11                            ; D20F E9 11                    ..
        bcs     LD236                           ; D211 B0 23                    .#
        jmp     LD24F                           ; D213 4C 4F D2                 LO.

; ----------------------------------------------------------------------------
LD216:
        ldx     #$08                            ; D216 A2 08                    ..
        ldy     #$FF                            ; D218 A0 FF                    ..
        bit     Joy1Inputs                           ; D21A 2C 30 03                 ,0.
        bmi     LD228                           ; D21D 30 09                    0.
        bvs     LD224                           ; D21F 70 03                    p.
        .byte   $88,$D0,$02                     ; D221 88 D0 02                 ...
; ----------------------------------------------------------------------------
LD224:
        ldy     #$FD                            ; D224 A0 FD                    ..
        ldx     #$F8                            ; D226 A2 F8                    ..
LD228:
        txa                                     ; D228 8A                       .
        jsr     L983C                           ; D229 20 3C 98                  <.
        lda     Workset + EntityX                             ; D22C A5 22                    ."
        cmp     #$C0                            ; D22E C9 C0                    ..
        lda     Workset + EntityX  + 1                            ; D230 A5 23                    .#
        sbc     #$0F                            ; D232 E9 0F                    ..
        bcs     LD24F                           ; D234 B0 19                    ..
LD236:
        lda     Workset + EntityXSpeed                             ; D236 A5 31                    .1
        eor     #$FF                            ; D238 49 FF                    I.
        tay                                     ; D23A A8                       .
        lda     Workset + EntityV10                             ; D23B A5 30                    .0
        eor     #$FF                            ; D23D 49 FF                    I.
        clc                                     ; D23F 18                       .
        adc     #$01                            ; D240 69 01                    i.
        sta     Workset + EntityV10                             ; D242 85 30                    .0
        tya                                     ; D244 98                       .
        adc     #$00                            ; D245 69 00                    i.
        sta     Workset + EntityXSpeed                             ; D247 85 31                    .1
        lda     Workset + EntityActive                             ; D249 A5 20                    . 
        eor     #$10                            ; D24B 49 10                    I.
        sta     Workset + EntityActive                             ; D24D 85 20                    . 
LD24F:
        lda     Workset + EntityX  + 1                            ; D24F A5 23                    .#
        cmp     #$10                            ; D251 C9 10                    ..
        bne     LD27B                           ; D253 D0 26                    .&
        lda     #$03                            ; D255 A9 03                    ..
        bit     Joy1Pressed                           ; D257 2C 32 03                 ,2.
        beq     LD27B                           ; D25A F0 1F                    ..
        ldx     #$00                            ; D25C A2 00                    ..
        lda     $06A0,x                         ; D25E BD A0 06                 ...
        bpl     LD271                           ; D261 10 0E                    ..
        ldx     #$20                            ; D263 A2 20                    . 
        lda     $06A0,x                         ; D265 BD A0 06                 ...
        bpl     LD271                           ; D268 10 07                    ..
        ldx     #$40                            ; D26A A2 40                    .@
        lda     $06A0,x                         ; D26C BD A0 06                 ...
        bmi     LD27B                           ; D26F 30 0A                    0.
LD271:
        lda     #$04                            ; D271 A9 04                    ..
        sta     $06A1,x                         ; D273 9D A1 06                 ...
        lda     #$80                            ; D276 A9 80                    ..
        sta     $06A0,x                         ; D278 9D A0 06                 ...
LD27B:
        jmp     WorksetSave                           ; D27B 4C 61 97                 La.

; ----------------------------------------------------------------------------
BonusRunJellyfish:
        @TempCounter = $46
        @TempLivingEnemiesFound = $00
        lda     #<Enemy1Data
        sta     WorksetPtr
        lda     #>Enemy1Data
        sta     WorksetPtr+1
        ; count down for every enemy in a wave
        lda     #5
        sta     @TempCounter
        lda     #$00
        sta     @TempLivingEnemiesFound
@CheckNextEnemy:
        ; skip enemy if it is dead
        ldy     #$00
        lda     (WorksetPtr),y
        bpl     @Continue
        ; otherwise load the enemy and continue animating
        inc     @TempLivingEnemiesFound
        jsr     WorksetLoad
        jsr     BonusRunSingleJellyfish
        jsr     WorksetSave
@Continue:
        jsr     WorksetNext
        dec     @TempCounter
        bne     @CheckNextEnemy
        ; if we found no living enemies, we need to prepare the next wave
        lda     @TempLivingEnemiesFound
        beq     @AllEnemiesDead
        rts
@AllEnemiesDead:
        lda     $53                             ; D2AB A5 53                    .S
        bmi     LD2B7                           ; D2AD 30 08                    0.
        cmp     #$06                            ; D2AF C9 06                    ..
        bcc     LD2B8                           ; D2B1 90 05                    ..
        lda     #$80                            ; D2B3 A9 80                    ..
        sta     $53                             ; D2B5 85 53                    .S
LD2B7:
        rts                                     ; D2B7 60                       `

; ----------------------------------------------------------------------------
LD2B8:
        ldy     $52                             ; D2B8 A4 52                    .R
        lda     ($50),y                         ; D2BA B1 50                    .P
        iny                                     ; D2BC C8                       .
        sty     $52                             ; D2BD 84 52                    .R
        sta     $44                             ; D2BF 85 44                    .D
        asl     a                               ; D2C1 0A                       .
        adc     $44                             ; D2C2 65 44                    eD
        asl     a                               ; D2C4 0A                       .
        adc     #$12                            ; D2C5 69 12                    i.
        sta     $44                             ; D2C7 85 44                    .D
        lda     #$00                            ; D2C9 A9 00                    ..
        adc     #$D5                            ; D2CB 69 D5                    i.
        sta     $45                             ; D2CD 85 45                    .E
        ldy     #$00                            ; D2CF A0 00                    ..
        lda     ($44),y                         ; D2D1 B1 44                    .D
        iny                                     ; D2D3 C8                       .
        sta     $12                             ; D2D4 85 12                    ..
        ldx     #$00                            ; D2D6 A2 00                    ..
        lda     #$40                            ; D2D8 A9 40                    .@
        sta     $00                             ; D2DA 85 00                    ..
        lda     #$00                            ; D2DC A9 00                    ..
        sta     $01                             ; D2DE 85 01                    ..
        lda     #$05                            ; D2E0 A9 05                    ..
        sta     $46                             ; D2E2 85 46                    .F
LD2E4:
        lda     #$80                            ; D2E4 A9 80                    ..
        sta     JawsData,x                         ; D2E6 9D 00 07                 ...
        lda     ($44),y                         ; D2E9 B1 44                    .D
        sta     $0714,x                         ; D2EB 9D 14 07                 ...
        iny                                     ; D2EE C8                       .
        lda     $12                             ; D2EF A5 12                    ..
        sta     $0715,x                         ; D2F1 9D 15 07                 ...
        lda     #$10                            ; D2F4 A9 10                    ..
        clc                                     ; D2F6 18                       .
        adc     $00                             ; D2F7 65 00                    e.
        sta     $00                             ; D2F9 85 00                    ..
        sta     $0716,x                         ; D2FB 9D 16 07                 ...
        lda     $01                             ; D2FE A5 01                    ..
        adc     $01                             ; D300 65 01                    e.
        sta     $01                             ; D302 85 01                    ..
        sta     $0717,x                         ; D304 9D 17 07                 ...
        txa                                     ; D307 8A                       .
        clc                                     ; D308 18                       .
        adc     #$20                            ; D309 69 20                    i 
        tax                                     ; D30B AA                       .
        dec     $46                             ; D30C C6 46                    .F
        bne     LD2E4                           ; D30E D0 D4                    ..
        inc     $53                             ; D310 E6 53                    .S
        lda     #$00                            ; D312 A9 00                    ..
        sta     $55                             ; D314 85 55                    .U
        rts                                     ; D316 60                       `

; ----------------------------------------------------------------------------
BonusRunSingleJellyfish:
        bit Workset + EntityActive
        bvs @AlreadyInitialized
        lda #$C0
        sta Workset + EntityActive
        lda $34
        and #$1F
        asl a
        asl a
        tax
        lda BonusJellyfishStartingPositions,x
        sta Workset + EntityX
        lda BonusJellyfishStartingPositions+1,x
        sta Workset + EntityX  + 1
        lda BonusJellyfishStartingPositions+2,x
        sta Workset + EntityY
        lda BonusJellyfishStartingPositions+3,x
        sta Workset + EntityY + 1
        lda Workset + EntityV15
        asl a
        tax
        lda LD616,x
        sta $38
        lda LD617,x
        sta Workset + EntityV19
        lda #$00
        sta Workset + EntityV15
        sta Workset + EntityV1A
        sta Workset + EntityV1D
        lda #AnimationEncounterJellyfishDeath
        jmp WorksetAnimationPlay
@AlreadyInitialized:
        bit     Workset + EntityV1D                             ; D355 24 3D                    $=
        bpl     LD35C                           ; D357 10 03                    ..
        jmp     LD4B8                           ; D359 4C B8 D4                 L..

; ----------------------------------------------------------------------------
LD35C:
        bit     Workset + EntityV15                             ; D35C 24 35                    $5
        bmi     LD377                           ; D35E 30 17                    0.
        lda     Workset + EntityV16                            ; D360 A5 36                    .6
        sec                                     ; D362 38                       8
        sbc     #$01                            ; D363 E9 01                    ..
        sta     Workset + EntityV16                            ; D365 85 36                    .6
        lda     Workset + EntityV17                            ; D367 A5 37                    .7
        sbc     #$00                            ; D369 E9 00                    ..
        sta     Workset + EntityV17                            ; D36B 85 37                    .7
        bpl     LD376                           ; D36D 10 07                    ..
        lda     #$80                            ; D36F A9 80                    ..
        sta     Workset + EntityV15                             ; D371 85 35                    .5
        jmp     LD468                           ; D373 4C 68 D4                 Lh.

; ----------------------------------------------------------------------------
LD376:
        rts                                     ; D376 60                       `

; ----------------------------------------------------------------------------
LD377:
        ldx     #$00                            ; D377 A2 00                    ..
        lda     #$03                            ; D379 A9 03                    ..
        sta     $47                             ; D37B 85 47                    .G
LD37D:
        lda     $06A0,x                         ; D37D BD A0 06                 ...
        bpl     LD3A5                           ; D380 10 23                    .#
        asl     a                               ; D382 0A                       .
        bpl     LD3A5                           ; D383 10 20                    . 
        lda     $06A2,x                         ; D385 BD A2 06                 ...
        sec                                     ; D388 38                       8
        sbc     Workset + EntityX                             ; D389 E5 22                    ."
        tay                                     ; D38B A8                       .
        lda     $06A3,x                         ; D38C BD A3 06                 ...
        sbc     Workset + EntityX  + 1                            ; D38F E5 23                    .#
        bcs     LD39F                           ; D391 B0 0C                    ..
        eor     #$FF                            ; D393 49 FF                    I.
        pha                                     ; D395 48                       H
        tya                                     ; D396 98                       .
        eor     #$FF                            ; D397 49 FF                    I.
        adc     #$01                            ; D399 69 01                    i.
        tay                                     ; D39B A8                       .
        pla                                     ; D39C 68                       h
        adc     #$00                            ; D39D 69 00                    i.
LD39F:
        bne     LD3A5                           ; D39F D0 04                    ..
        cpy     #$08                            ; D3A1 C0 08                    ..
        bcc     LD3A8                           ; D3A3 90 03                    ..
LD3A5:
        jmp     LD432                           ; D3A5 4C 32 D4                 L2.

; ----------------------------------------------------------------------------
LD3A8:
        lda     $06A4,x                         ; D3A8 BD A4 06                 ...
        sec                                     ; D3AB 38                       8
        sbc     Workset + EntityY                             ; D3AC E5 24                    .$
        tay                                     ; D3AE A8                       .
        lda     $06A5,x                         ; D3AF BD A5 06                 ...
        sbc     Workset + EntityY + 1                             ; D3B2 E5 25                    .%
        bcs     LD3C2                           ; D3B4 B0 0C                    ..
        eor     #$FF                            ; D3B6 49 FF                    I.
        pha                                     ; D3B8 48                       H
        tya                                     ; D3B9 98                       .
        eor     #$FF                            ; D3BA 49 FF                    I.
        adc     #$01                            ; D3BC 69 01                    i.
        tay                                     ; D3BE A8                       .
        pla                                     ; D3BF 68                       h
        adc     #$00                            ; D3C0 69 00                    i.
LD3C2:
        bne     LD432                           ; D3C2 D0 6E                    .n
        cpy     #$08                            ; D3C4 C0 08                    ..
        bcs     LD432                           ; D3C6 B0 6A                    .j
        lda     $06BF,x                         ; D3C8 BD BF 06                 ...
        ora     #$80                            ; D3CB 09 80                    ..
        sta     $06BF,x                         ; D3CD 9D BF 06                 ...
        inc     $54                             ; D3D0 E6 54                    .T
        ldx     $55                             ; D3D2 A6 55                    .U
        inc     $55                             ; D3D4 E6 55                    .U
        lda     LD4D8,x                         ; D3D6 BD D8 D4                 ...
        sta     Workset + EntityV1C                             ; D3D9 85 3C                    .<
        lda     LD4DD,x                         ; D3DB BD DD D4                 ...
        jsr     AwardPoints                           ; D3DE 20 D0 8C                  ..
        lda     #$80                            ; D3E1 A9 80                    ..
        sta     Workset + EntityV1D                             ; D3E3 85 3D                    .=
        lda     #$00                            ; D3E5 A9 00                    ..
        sta     Workset + EntityV12                            ; D3E7 85 32                    .2
        lda     #$FF                            ; D3E9 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; D3EB 85 33                    .3
        lda     #$00                            ; D3ED A9 00                    ..
        sta     VRAMBufferActive                           ; D3EF 8D 00 01                 ...
        ldx     VRAMBufferOffset                           ; D3F2 AE 01 01                 ...
        lda     #$AB                            ; D3F5 A9 AB                    ..
        sta     VRAMBuffer,x                         ; D3F7 9D 02 01                 ...
        inx                                     ; D3FA E8                       .
        lda     #$91                            ; D3FB A9 91                    ..
        sta     VRAMBuffer,x                         ; D3FD 9D 02 01                 ...
        inx                                     ; D400 E8                       .
        lda     #$02                            ; D401 A9 02                    ..
        sta     VRAMBuffer,x                         ; D403 9D 02 01                 ...
        inx                                     ; D406 E8                       .
        lda     $54                             ; D407 A5 54                    .T
        jsr     ConvertAToBCD                           ; D409 20 39 D1                  9.
        jsr     MoveAAndYToAsciiTable                           ; D40C 20 46 D1                  F.
        sta     VRAMBuffer+1,x                         ; D40F 9D 03 01                 ...
        tya                                     ; D412 98                       .
        sta     VRAMBuffer,x                         ; D413 9D 02 01                 ...
        inx                                     ; D416 E8                       .
        inx                                     ; D417 E8                       .
        stx     VRAMBufferOffset                           ; D418 8E 01 01                 ...
        lda     #$80                            ; D41B A9 80                    ..
        sta     VRAMBufferActive                           ; D41D 8D 00 01                 ...
        lda     $0304                           ; D420 AD 04 03                 ...
        ora     #$10                            ; D423 09 10                    ..
        sta     $0304                           ; D425 8D 04 03                 ...
        lda     #SFXEncounterEnemyDeath                            ; D428 A9 0E                    ..
        jsr     SoundPlay                           ; D42A 20 CD E2                  ..
        lda     #AnimationEncounterBubble                            ; D42D A9 39                    .9
        jmp     WorksetAnimationPlay                           ; D42F 4C AD 97                 L..

; ----------------------------------------------------------------------------
LD432:
        txa                                     ; D432 8A                       .
        clc                                     ; D433 18                       .
        adc     #$20                            ; D434 69 20                    i 
        tax                                     ; D436 AA                       .
        dec     $47                             ; D437 C6 47                    .G
        beq     LD43E                           ; D439 F0 03                    ..
        jmp     LD37D                           ; D43B 4C 7D D3                 L}.

; ----------------------------------------------------------------------------
LD43E:
        jsr     WorksetAnimationAdvance                           ; D43E 20 BE 97                  ..
        jsr     WorksetMoveX                           ; D441 20 FA 97                  ..
        jsr     L981B                           ; D444 20 1B 98                  ..
        bit     Workset + EntityV15                             ; D447 24 35                    $5
        bvs     LD458                           ; D449 70 0D                    p.
        lda     #$01                            ; D44B A9 01                    ..
        bit     Workset + EntityV1F                             ; D44D 24 3F                    $?
        beq     LD463                           ; D44F F0 12                    ..
        lda     #$C0                            ; D451 A9 C0                    ..
        sta     Workset + EntityV15                             ; D453 85 35                    .5
        jmp     LD463                           ; D455 4C 63 D4                 Lc.

; ----------------------------------------------------------------------------
LD458:
        lda     #$01                            ; D458 A9 01                    ..
        bit     Workset + EntityV1F                             ; D45A 24 3F                    $?
        bne     LD463                           ; D45C D0 05                    ..
        .byte   $A9,$00,$85,$20,$60             ; D45E A9 00 85 20 60           ... `
; ----------------------------------------------------------------------------
LD463:
        dec     Workset + EntityV16                            ; D463 C6 36                    .6
        beq     LD468                           ; D465 F0 01                    ..
        rts                                     ; D467 60                       `

; ----------------------------------------------------------------------------
LD468:
        lda     #$00                            ; D468 A9 00                    ..
        sta     Workset + EntityXSpeed                             ; D46A 85 31                    .1
        sta     Workset + EntityYSpeed                             ; D46C 85 33                    .3
        ldy     Workset + EntityV1A                             ; D46E A4 3A                    .:
        lda     ($38),y                         ; D470 B1 38                    .8
        bne     LD479                           ; D472 D0 05                    ..
        .byte   $A9,$00,$85,$20,$60             ; D474 A9 00 85 20 60           ... `
; ----------------------------------------------------------------------------
LD479:
        iny                                     ; D479 C8                       .
        sta     Workset + EntityV16                            ; D47A 85 36                    .6
        lda     ($38),y                         ; D47C B1 38                    .8
        iny                                     ; D47E C8                       .
        sty     Workset + EntityV1A                             ; D47F 84 3A                    .:
        asl     a                               ; D481 0A                       .
        bcc     LD486                           ; D482 90 02                    ..
        .byte   $C6,$31                         ; D484 C6 31                    .1
; ----------------------------------------------------------------------------
LD486:
        asl     a                               ; D486 0A                       .
        rol     Workset + EntityXSpeed                             ; D487 26 31                    &1
        asl     a                               ; D489 0A                       .
        rol     Workset + EntityXSpeed                             ; D48A 26 31                    &1
        tay                                     ; D48C A8                       .
        and     #$80                            ; D48D 29 80                    ).
        sta     Workset + EntityV10                             ; D48F 85 30                    .0
        tya                                     ; D491 98                       .
        asl     a                               ; D492 0A                       .
        asl     a                               ; D493 0A                       .
        bcc     LD498                           ; D494 90 02                    ..
        dec     Workset + EntityYSpeed                             ; D496 C6 33                    .3
LD498:
        asl     a                               ; D498 0A                       .
        rol     Workset + EntityYSpeed                             ; D499 26 33                    &3
        asl     a                               ; D49B 0A                       .
        rol     Workset + EntityYSpeed                             ; D49C 26 33                    &3
        sta     Workset + EntityV12                            ; D49E 85 32                    .2
        bit     $34                             ; D4A0 24 34                    $4
        bpl     LD4B7                           ; D4A2 10 13                    ..
        lda     Workset + EntityXSpeed                             ; D4A4 A5 31                    .1
        eor     #$FF                            ; D4A6 49 FF                    I.
        tay                                     ; D4A8 A8                       .
        lda     Workset + EntityV10                             ; D4A9 A5 30                    .0
        eor     #$FF                            ; D4AB 49 FF                    I.
        clc                                     ; D4AD 18                       .
        adc     #$01                            ; D4AE 69 01                    i.
        sta     Workset + EntityV10                             ; D4B0 85 30                    .0
        tya                                     ; D4B2 98                       .
        adc     #$00                            ; D4B3 69 00                    i.
        sta     Workset + EntityXSpeed                             ; D4B5 85 31                    .1
LD4B7:
        rts                                     ; D4B7 60                       `

; ----------------------------------------------------------------------------
LD4B8:
        jsr     WorksetAnimationAdvance
        jsr     L981B
        bit     Workset + EntityV1D
        bvs     @LD4CF
        lda     Workset + EntityAnimTimer
        bne     @Done
        lda     #$C0
        sta     Workset + EntityV1D
        lda     Workset + EntityV1C
        jmp     WorksetAnimationPlay
@LD4CF:
        lda     Workset + EntityAnimTimer
        bne     @Done
        lda     #$00
        sta     Workset + EntityActive
@Done:
        rts

; ----------------------------------------------------------------------------
LD4D8:
        .byte   $32,$32,$33,$34,$35             ; D4D8 32 32 33 34 35           22345
LD4DD:
        .byte   $04,$04,$06,$08,$0A,$00,$01,$00 ; D4DD 04 04 06 08 0A 00 01 00  ........
        .byte   $01,$02,$03,$04,$05,$04,$05,$06 ; D4E5 01 02 03 04 05 04 05 06  ........
        .byte   $07,$08,$09,$08,$09,$0A,$0B,$0C ; D4ED 07 08 09 08 09 0A 0B 0C  ........
        .byte   $0D,$0C,$0D,$0E,$0F,$10,$11,$10 ; D4F5 0D 0C 0D 0E 0F 10 11 10  ........
        .byte   $11,$12,$13,$14,$15,$14,$15,$16 ; D4FD 11 12 13 14 15 14 15 16  ........
        .byte   $17,$18,$19,$18,$19,$1A,$1B,$1C ; D505 17 18 19 18 19 1A 1B 1C  ........
        .byte   $1D,$1C,$1D,$1E,$1F,$00,$00,$00 ; D50D 1D 1C 1D 1E 1F 00 00 00  ........
        .byte   $00,$00,$00,$00,$81,$81,$81,$81 ; D515 00 00 00 00 81 81 81 81  ........
        .byte   $81,$01,$00,$00,$00,$00,$00,$01 ; D51D 81 01 00 00 00 00 00 01  ........
        .byte   $81,$81,$81,$81,$81,$02,$02,$02 ; D525 81 81 81 81 81 02 02 02  ........
        .byte   $02,$02,$02,$02,$83,$83,$83,$83 ; D52D 02 02 02 02 83 83 83 83  ........
        .byte   $83,$03,$04,$04,$04,$04,$04,$03 ; D535 83 03 04 04 04 04 04 03  ........
        .byte   $85,$85,$85,$85,$85,$04,$0C,$0D ; D53D 85 85 85 85 85 04 0C 0D  ........
        .byte   $0E,$0F,$10,$04,$90,$8F,$8E,$8D ; D545 0E 0F 10 04 90 8F 8E 8D  ........
        .byte   $8C,$05,$00,$00,$00,$00,$00,$05 ; D54D 8C 05 00 00 00 00 00 05  ........
        .byte   $81,$81,$81,$81,$81,$06,$0E,$8E ; D555 81 81 81 81 81 06 0E 8E  ........
        .byte   $0E,$8E,$0E,$06,$8E,$0E,$8E,$0E ; D55D 0E 8E 0E 06 8E 0E 8E 0E  ........
        .byte   $8E,$07,$02,$02,$02,$02,$02,$07 ; D565 8E 07 02 02 02 02 02 07  ........
        .byte   $83,$83,$83,$83,$83,$08,$06,$06 ; D56D 83 83 83 83 83 08 06 06  ........
        .byte   $06,$06,$06,$08,$87,$87,$87,$87 ; D575 06 06 06 08 87 87 87 87  ........
        .byte   $87,$09,$08,$08,$08,$08,$08,$09 ; D57D 87 09 08 08 08 08 08 09  ........
        .byte   $89,$89,$89,$89,$89,$0A,$0C,$0D ; D585 89 89 89 89 89 0A 0C 0D  ........
        .byte   $0E,$0F,$10,$0A,$90,$8F,$8E,$8D ; D58D 0E 0F 10 0A 90 8F 8E 8D  ........
        .byte   $8C,$0B,$0A,$0A,$0A,$0A,$0A,$0B ; D595 8C 0B 0A 0A 0A 0A 0A 0B  ........
        .byte   $8B,$8B,$8B,$8B,$8B,$0C,$0A,$0A ; D59D 8B 8B 8B 8B 8B 0C 0A 0A  ........
        .byte   $0A,$0A,$0A,$0C,$8B,$8B,$8B,$8B ; D5A5 0A 0A 0A 0C 8B 8B 8B 8B  ........
        .byte   $8B,$0D,$0A,$0A,$0A,$0A,$0A,$0D ; D5AD 8B 0D 0A 0A 0A 0A 0A 0D  ........
        .byte   $8B,$8B,$8B,$8B,$8B,$0E,$0A,$0A ; D5B5 8B 8B 8B 8B 8B 0E 0A 0A  ........
        .byte   $0A,$0A,$0A,$0E,$8B,$8B,$8B,$8B ; D5BD 0A 0A 0A 0E 8B 8B 8B 8B  ........
        .byte   $8B,$0F,$0A,$0A,$0A,$0A,$0A,$0F ; D5C5 8B 0F 0A 0A 0A 0A 0A 0F  ........
        .byte   $8B,$8B,$8B,$8B,$8B             ; D5CD 8B 8B 8B 8B 8B           .....







;
; Used for setting starting positions of the bonus stage jellyfish
;
; Each spawn position has 2 16-bit values, X then Y coordinates.
;
BonusJellyfishStartingPositions:
        .word $1020, $00D8
        .word $10E0, $00D8
        .word $0FE0, $00D8
        .word $1120, $00D8
        .word $1020, $00E8
        .word $10E0, $00E8
        .word $1000, $00D8
        .word $1100, $00D8
        .word $0FF0, $00E8
        .word $1110, $00E8
        .word $0FF0, $0058
        .word $1110, $0058
        .word $1030, $00D8
        .word $1058, $00D8
        .word $1080, $00D8
        .word $10A8, $00D8
        .word $10D0, $00D8


LD616:
        .byte   $36                             ; D616 36                       6
LD617:
        .byte   $D6,$3D,$D6,$66,$D6,$6D,$D6,$88 ; D617 D6 3D D6 66 D6 6D D6 88  .=.f.m..
        .byte   $D6,$9F,$D6,$AA,$D6,$BD,$D6,$C6 ; D61F D6 9F D6 AA D6 BD D6 C6  ........
        .byte   $D6,$D3,$D6,$E4,$D6,$EF,$D6,$04 ; D627 D6 D3 D6 E4 D6 EF D6 04  ........
        .byte   $D7,$21,$D7,$32,$D7,$55,$D7,$40 ; D62F D7 21 D7 32 D7 55 D7 40  .!.2.U.@
        .byte   $0C,$C0,$21,$80,$C0,$00,$30,$0E ; D637 0C C0 21 80 C0 00 30 0E  ..!...0.
        .byte   $20,$1E,$20,$2E,$18,$4F,$08,$41 ; D63F 20 1E 20 2E 18 4F 08 41   . ..O.A
        .byte   $08,$33,$08,$14,$08,$F4,$08,$D3 ; D647 08 33 08 14 08 F4 08 D3  .3......
        .byte   $08,$C1,$08,$CF,$08,$DD,$08,$FC ; D64F 08 C1 08 CF 08 DD 08 FC  ........
        .byte   $08,$1C,$08,$3D,$08,$4F,$18,$41 ; D657 08 1C 08 3D 08 4F 18 41  ...=.O.A
        .byte   $20,$22,$20,$12,$30,$02,$00,$80 ; D65F 20 22 20 12 30 02 00 80   " .0...
        .byte   $4E,$60,$C0,$80,$42,$00,$40,$0C ; D667 4E 60 C0 80 42 00 40 0C  N`..B.@.
        .byte   $08,$4C,$10,$40,$08,$44,$20,$04 ; D66F 08 4C 10 40 08 44 20 04  .L.@.D .
        .byte   $08,$44,$10,$40,$08,$4C,$20,$0C ; D677 08 44 10 40 08 4C 20 0C  .D.@.L .
        .byte   $08,$4C,$10,$40,$08,$44,$40,$04 ; D67F 08 4C 10 40 08 44 40 04  .L.@.D@.
        .byte   $00,$30,$0C,$04,$C0,$04,$CC,$08 ; D687 00 30 0C 04 C0 04 CC 08  .0......
        .byte   $0C,$04,$4C,$08,$40,$04,$44,$08 ; D68F 0C 04 4C 08 40 04 44 08  ..L.@.D.
        .byte   $04,$04,$C4,$04,$C0,$60,$02,$00 ; D697 04 04 C4 04 C0 60 02 00  .....`..
        .byte   $40,$0C,$60,$41,$60,$C0,$60,$41 ; D69F 40 0C 60 41 60 C0 60 41  @.`A`.`A
        .byte   $80,$C0,$00,$60,$0E,$10,$1E,$08 ; D6A7 80 C0 00 60 0E 10 1E 08  ...`....
        .byte   $2E,$10,$2F,$10,$20,$10,$21,$08 ; D6AF 2E 10 2F 10 20 10 21 08  ../. .!.
        .byte   $22,$10,$12,$60,$02,$00,$80,$4E ; D6B7 22 10 12 60 02 00 80 4E  "..`...N
        .byte   $30,$04,$60,$CE,$40,$04,$00,$40 ; D6BF 30 04 60 CE 40 04 00 40  0.`.@..@
        .byte   $4C,$30,$C0,$30,$44,$30,$4C,$30 ; D6C7 4C 30 C0 30 44 30 4C 30  L0.0D0L0
        .byte   $C0,$40,$44,$00,$30,$2A,$20,$26 ; D6CF C0 40 44 00 30 2A 20 26  .@D.0* &
        .byte   $20,$2A,$20,$26,$20,$2A,$20,$26 ; D6D7 20 2A 20 26 20 2A 20 26   * & * &
        .byte   $20,$2A,$30,$26,$00,$40,$0C,$10 ; D6DF 20 2A 30 26 00 40 0C 10   *0&.@..
        .byte   $20,$20,$E0,$10,$20,$80,$02,$00 ; D6E7 20 20 E0 10 20 80 02 00    .. ...
        .byte   $70,$40,$08,$44,$08,$C4,$50,$C0 ; D6EF 70 40 08 44 08 C4 50 C0  p@.D..P.
        .byte   $08,$C4,$08,$44,$50,$40,$08,$44 ; D6F7 08 C4 08 44 50 40 08 44  ...DP@.D
        .byte   $08,$C4,$70,$C0,$00,$48,$40,$10 ; D6FF 08 C4 70 C0 00 48 40 10  ..p..H@.
        .byte   $41,$08,$44,$10,$14,$10,$F4,$08 ; D707 41 08 44 10 14 10 F4 08  A.D.....
        .byte   $C4,$10,$C1,$10,$CF,$08,$CC,$10 ; D70F C4 10 C1 10 CF 08 CC 10  ........
        .byte   $FC,$10,$1C,$08,$4C,$10,$4F,$48 ; D717 FC 10 1C 08 4C 10 4F 48  ....L.OH
        .byte   $40,$00,$18,$40,$20,$31,$20,$22 ; D71F 40 00 18 40 20 31 20 22  @..@ 1 "
        .byte   $20,$13,$20,$1D,$20,$2E,$20,$3F ; D727 20 13 20 1D 20 2E 20 3F   . . . ?
        .byte   $18,$40,$00,$10,$40,$20,$06,$10 ; D72F 18 40 00 10 40 20 06 10  .@..@ ..
        .byte   $40,$20,$0A,$10,$40,$20,$06,$10 ; D737 40 20 0A 10 40 20 06 10  @ ..@ ..
        .byte   $40,$20,$0A,$10,$40,$20,$06,$10 ; D73F 40 20 0A 10 40 20 06 10  @ ..@ ..
        .byte   $40,$20,$0A,$10,$40,$20,$06,$10 ; D747 40 20 0A 10 40 20 06 10  @ ..@ ..
        .byte   $40,$20,$0A,$10,$40,$00,$18,$40 ; D74F 40 20 0A 10 40 00 18 40  @ ..@..@
        .byte   $30,$04,$30,$4C,$30,$44,$30,$0C ; D757 30 04 30 4C 30 44 30 0C  0.0L0D0.
        .byte   $18,$40,$00                     ; D75F 18 40 00                 .@.
; ----------------------------------------------------------------------------
EnterFinaleScreen:
        lda     #SFXSTOP                            ; D762 A9 FF                    ..
        jsr     SoundPlay                           ; D764 20 CD E2                  ..
        jsr     PPUDisableNMI                           ; D767 20 EA 8B                  ..
        jsr     PPUDisableRendering                           ; D76A 20 B6 8B                  ..
        jsr     ClearScreenAndSprites                           ; D76D 20 12 8E                  ..
        lda     #PaletteFinaleScreen                                 ; D770 A9 04                    ..
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; D772 20 BD 8E                  ..
        lda     #CHRFinaleAndOutroScreen
        sta     ActiveCHR                           ; D777 8D 07 03                 ...
        lda     #RomGraphicsFinaleScreen                            ; D77A A9 04                    ..
        jsr     DrawRomGraphics                           ; D77C 20 69 8D                  i.
        lda     #$00                            ; D77F A9 00                    ..
        sta     SCROLL_X                           ; D781 8D 20 03                 . .
        sta     SCROLL_Y                           ; D784 8D 22 03                 .".
        sta     UseHighPPUNametables                           ; D787 8D 23 03                 .#.
        ldx     #$00                            ; D78A A2 00                    ..
LD78C:
        lda     LD890,x                         ; D78C BD 90 D8                 ...
        sta     SpritePosY,x                         ; D78F 9D 00 02                 ...
        inx                                     ; D792 E8                       .
        cpx     #$20                            ; D793 E0 20                    . 
        bcc     LD78C                           ; D795 90 F5                    ..
        ldx     #$1F                            ; D797 A2 1F                    ..
        lda     #$00                            ; D799 A9 00                    ..
LD79B:
        sta     $20,x                           ; D79B 95 20                    . 
        dex                                     ; D79D CA                       .
        bpl     LD79B                           ; D79E 10 FB                    ..
        ldx     #$00                            ; D7A0 A2 00                    ..
        ldy     #$00                            ; D7A2 A0 00                    ..
LD7A4:
        lda     LD8B0,y                         ; D7A4 B9 B0 D8                 ...
        iny                                     ; D7A7 C8                       .
        sta     SpriteTile + (SPR*8),x                         ; D7A8 9D 21 02                 .!.
        lda     LD8B0,y                         ; D7AB B9 B0 D8                 ...
        iny                                     ; D7AE C8                       .
        sta     SpriteAttr + (SPR*8),x                         ; D7AF 9D 22 02                 .".
        lda     LD8B0,y                         ; D7B2 B9 B0 D8                 ...
        iny                                     ; D7B5 C8                       .
        sta     SpritePosX + (SPR*8),x                         ; D7B6 9D 23 02                 .#.
        inx                                     ; D7B9 E8                       .
        inx                                     ; D7BA E8                       .
        inx                                     ; D7BB E8                       .
        inx                                     ; D7BC E8                       .
        cpx     #$90                            ; D7BD E0 90                    ..
        bcc     LD7A4                           ; D7BF 90 E3                    ..
        ldy     #$00                            ; D7C1 A0 00                    ..
        jsr     LD947                           ; D7C3 20 47 D9                  G.
        lda     #$00                            ; D7C6 A9 00                    ..
        sta     $08                             ; D7C8 85 08                    ..
        sta     $09                             ; D7CA 85 09                    ..
        sta     $0306                           ; D7CC 8D 06 03                 ...
        ldx     #$5F                            ; D7CF A2 5F                    ._
        lda     #$00                            ; D7D1 A9 00                    ..
        sta     BGDataPage3                           ; D7D3 8D 60 04                 .`.
@ClearBGData:
        sta     BGDataPage1,x                         ; D7D6 9D 00 04                 ...
        dex                                     ; D7D9 CA                       .
        bpl     @ClearBGData                           ; D7DA 10 FA                    ..
        lda     #$01                            ; D7DC A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; D7DE 8D 02 03                 ...
        lda     #MusicFinaleScreen                            ; D7E1 A9 02                    ..
        jsr     SoundPlay                           ; D7E3 20 CD E2                  ..
        jsr     PPUEnableNMI                           ; D7E6 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; D7E9 20 C2 8B                  ..
LD7EC:
        jsr     WaitFor1Frame                           ; D7EC 20 40 8C                  @.
        ldy     #$01                            ; D7EF A0 01                    ..
        jsr     WaitForYSpins                           ; D7F1 20 60 8C                  `.
        jsr     LDA3A                           ; D7F4 20 3A DA                  :.
        jsr     LDBFA                           ; D7F7 20 FA DB                  ..
        jsr     LD963                           ; D7FA 20 63 D9                  c.
        jsr     LF600                           ; D7FD 20 00 F6                  ..
        jsr     ReadJoypads
        lda     Joy1Inputs
        and     #(JOY_LEFT | JOY_RIGHT)
        beq     LD831                           ; D808 F0 27                    .'
        bpl     LD820                           ; D80A 10 14                    ..
        lda     BGDataPage3                           ; D80C AD 60 04                 .`.
        clc                                     ; D80F 18                       .
        adc     #$04                            ; D810 69 04                    i.
        sta     BGDataPage3                           ; D812 8D 60 04                 .`.
        lda     SCROLL_X                           ; D815 AD 20 03                 . .
        adc     #$00                            ; D818 69 00                    i.
        sta     SCROLL_X                           ; D81A 8D 20 03                 . .
        jmp     LD831                           ; D81D 4C 31 D8                 L1.

; ----------------------------------------------------------------------------
LD820:
        lda     $0460                           ; D820 AD 60 04                 .`.
        sec                                     ; D823 38                       8
        sbc     #$08                            ; D824 E9 08                    ..
        sta     $0460                           ; D826 8D 60 04                 .`.
        lda     SCROLL_X                           ; D829 AD 20 03                 . .
        sbc     #$00                            ; D82C E9 00                    ..
        sta     SCROLL_X                           ; D82E 8D 20 03                 . .
LD831:
        lda     PlayerStrobeCount                           ; D831 AD 93 03                 ...
        clc                                     ; D834 18                       .
        adc     #$06                            ; D835 69 06                    i.
        sta     SpriteTile + (SPR*7)                           ; D837 8D 1D 02                 ...
        jsr     LD862                           ; D83A 20 62 D8                  b.
        bit     $0306                           ; D83D 2C 06 03                 ,..
        bmi     LD84C                           ; D840 30 0A                    0.
        lda     PlayerStrobeCount                           ; D842 AD 93 03                 ...
        bne     LD7EC                           ; D845 D0 A5                    ..
        .byte   $24,$21,$30,$A1,$60             ; D847 24 21 30 A1 60           $!0.`
; ----------------------------------------------------------------------------
LD84C:
        lda     #$40                            ; D84C A9 40                    .@
        sta     $12                             ; D84E 85 12                    ..
LD850:
        jsr     WaitFor1Frame                           ; D850 20 40 8C                  @.
        ldy     #$02                            ; D853 A0 02                    ..
        jsr     WaitForYSpins                           ; D855 20 60 8C                  `.
        jsr     LF600                           ; D858 20 00 F6                  ..
        dec     $12                             ; D85B C6 12                    ..
        bne     LD850                           ; D85D D0 F1                    ..
        jmp     EnterOutroScreen                           ; D85F 4C C1 DC                 L..

; ----------------------------------------------------------------------------
LD862:
        lda     Workset + EntityX  + 1                            ; D862 A5 23                    .#
        bne     LD86C                           ; D864 D0 06                    ..
        lda     #$F0                            ; D866 A9 F0                    ..
        sta     SpritePosY + (SPR * 44) ;$02B0                           ; D868 8D B0 02                 ...
        rts                                     ; D86B 60                       `

; ----------------------------------------------------------------------------
LD86C:
        .byte   $A9,$D8,$8D,$B0,$02,$A9,$29,$8D ; D86C A9 D8 8D B0 02 A9 29 8D  ......).
        .byte   $B1,$02,$24,$23,$10,$0B,$A9,$40 ; D874 B1 02 24 23 10 0B A9 40  ..$#...@
        .byte   $8D,$B2,$02,$A9,$20,$8D,$B3,$02 ; D87C 8D B2 02 A9 20 8D B3 02  .... ...
        .byte   $60,$A9,$00,$8D,$B2,$02,$A9,$D8 ; D884 60 A9 00 8D B2 02 A9 D8  `.......
        .byte   $8D,$B3,$02,$60                 ; D88C 8D B3 02 60              ...`
LD890:
        .byte   $47,$FF,$20,$C4,$D8,$30,$00,$60 ; D890 47 FF 20 C4 D8 30 00 60  G. ..0.`
        .byte   $D8,$31,$00,$68,$D8,$32,$00,$70 ; D898 D8 31 00 68 D8 32 00 70  .1.h.2.p
        .byte   $D8,$40,$00,$78,$D8,$41,$00,$80 ; D8A0 D8 40 00 78 D8 41 00 80  .@.x.A..
        .byte   $D8,$42,$00,$88,$D8,$09,$00,$98 ; D8A8 D8 42 00 88 D8 09 00 98  .B......
LD8B0:
        .byte   $03,$02,$78,$03,$40,$80,$13,$02 ; D8B0 03 02 78 03 40 80 13 02  ..x.@...
        .byte   $78,$13,$40,$80,$01,$00,$70,$02 ; D8B8 78 13 40 80 01 00 70 02  x.@...p.
        .byte   $02,$78,$02,$40,$80,$01,$40,$88 ; D8C0 02 78 02 40 80 01 40 88  .x.@..@.
        .byte   $10,$00,$68,$11,$01,$70,$12,$01 ; D8C8 10 00 68 11 01 70 12 01  ..h..p..
        .byte   $78,$12,$41,$80,$11,$41,$88,$10 ; D8D0 78 12 41 80 11 41 88 10  x.A..A..
        .byte   $40,$90,$20,$01,$68,$21,$01,$70 ; D8D8 40 90 20 01 68 21 01 70  @. .h!.p
        .byte   $22,$00,$78,$22,$40,$80,$21,$41 ; D8E0 22 00 78 22 40 80 21 41  ".x"@.!A
        .byte   $88,$20,$41,$90,$DB,$01,$60,$DC ; D8E8 88 20 41 90 DB 01 60 DC  . A...`.
        .byte   $01,$68,$DD,$00,$70,$DE,$00,$78 ; D8F0 01 68 DD 00 70 DE 00 78  .h..p..x
        .byte   $DE,$40,$80,$DD,$40,$88,$DC,$41 ; D8F8 DE 40 80 DD 40 88 DC 41  .@..@..A
        .byte   $90,$DB,$41,$98,$EB,$01,$60,$EC ; D900 90 DB 41 98 EB 01 60 EC  ..A...`.
        .byte   $01,$68,$ED,$00,$70,$EE,$00,$78 ; D908 01 68 ED 00 70 EE 00 78  .h..p..x
        .byte   $EE,$40,$80,$ED,$40,$88,$EC,$41 ; D910 EE 40 80 ED 40 88 EC 41  .@..@..A
        .byte   $90,$EB,$41,$98                 ; D918 90 EB 41 98              ..A.
LD91C:
        .byte   $02,$A7,$02,$AF,$04,$B7,$06,$BF ; D91C 02 A7 02 AF 04 B7 06 BF  ........
        .byte   $06,$C7,$10,$F0,$00,$02,$9F,$02 ; D924 06 C7 10 F0 00 02 9F 02  ........
        .byte   $A7,$04,$AF,$06,$B7,$06,$BF,$08 ; D92C A7 04 AF 06 B7 06 BF 08  ........
        .byte   $C7,$08,$F0,$00,$02,$97,$02,$9F ; D934 C7 08 F0 00 02 97 02 9F  ........
        .byte   $04,$A7,$06,$AF,$06,$B7,$08,$BF ; D93C 04 A7 06 AF 06 B7 08 BF  ........
        .byte   $08,$C7,$00                     ; D944 08 C7 00                 ...
; ----------------------------------------------------------------------------
LD947:
        ldx     #$00                            ; D947 A2 00                    ..
LD949:
        lda     LD91C,y                         ; D949 B9 1C D9                 ...
        bne     LD94F                           ; D94C D0 01                    ..
        rts                                     ; D94E 60                       `

; ----------------------------------------------------------------------------
LD94F:
        sta     $12                             ; D94F 85 12                    ..
        iny                                     ; D951 C8                       .
        lda     LD91C,y                         ; D952 B9 1C D9                 ...
        iny                                     ; D955 C8                       .
LD956:
        sta     SpritePosY + (SPR*8),x                         ; D956 9D 20 02                 . .
        inx                                     ; D959 E8                       .
        inx                                     ; D95A E8                       .
        inx                                     ; D95B E8                       .
        inx                                     ; D95C E8                       .
        dec     $12                             ; D95D C6 12                    ..
        bne     LD956                           ; D95F D0 F5                    ..
        beq     LD949                           ; D961 F0 E6                    ..
LD963:
        lda     Workset + EntityType                             ; D963 A5 21                    .!
        bmi     LD98C                           ; D965 30 25                    0%
        lda     PlayerStrobeCount                           ; D967 AD 93 03                 ...
        beq     LD9AB                           ; D96A F0 3F                    .?
        lda     #$01                            ; D96C A9 01                    ..
        bit     Joy1Pressed                           ; D96E 2C 32 03                 ,2.
        beq     LD9AB                           ; D971 F0 38                    .8
        dec     PlayerStrobeCount                           ; D973 CE 93 03                 ...
        lda     Workset + EntityType                             ; D976 A5 21                    .!
        and     #$01                            ; D978 29 01                    ).
        ora     #$80                            ; D97A 09 80                    ..
        sta     Workset + EntityType                             ; D97C 85 21                    .!
        lda     $08                             ; D97E A5 08                    ..
        ora     #$10                            ; D980 09 10                    ..
        sta     $08                             ; D982 85 08                    ..
        lda     #SFXFinaleStrobe                            ; D984 A9 17                    ..
        jsr     SoundPlay                           ; D986 20 CD E2                  ..
        jmp     LD9AB                           ; D989 4C AB D9                 L..

; ----------------------------------------------------------------------------
LD98C:
        bit     $08                             ; D98C 24 08                    $.
        bmi     LD9B0                           ; D98E 30 20                    0 
        lda     #$10                            ; D990 A9 10                    ..
        bit     $08                             ; D992 24 08                    $.
        beq     LD99D                           ; D994 F0 07                    ..
        lda     #$02                            ; D996 A9 02                    ..
        bit     Joy1Pressed                           ; D998 2C 32 03                 ,2.
        bne     LD99E                           ; D99B D0 01                    ..
LD99D:
        rts                                     ; D99D 60                       `

; ----------------------------------------------------------------------------
LD99E:
        lda     #$80                            ; D99E A9 80                    ..
        sta     $08                             ; D9A0 85 08                    ..
        lda     #$02                            ; D9A2 A9 02                    ..
        sta     $09                             ; D9A4 85 09                    ..
        ldy     #$0D                            ; D9A6 A0 0D                    ..
        jmp     LD947                           ; D9A8 4C 47 D9                 LG.

; ----------------------------------------------------------------------------
LD9AB:
        bit     $08                             ; D9AB 24 08                    $.
        bmi     LD9B0                           ; D9AD 30 01                    0.
        rts                                     ; D9AF 60                       `

; ----------------------------------------------------------------------------
LD9B0:
        bvs     LD9C6                           ; D9B0 70 14                    p.
        dec     $09                             ; D9B2 C6 09                    ..
        bne     LD9EA                           ; D9B4 D0 34                    .4
        jsr     LD9EB                           ; D9B6 20 EB D9                  ..
        lda     #$C0                            ; D9B9 A9 C0                    ..
        sta     $08                             ; D9BB 85 08                    ..
        lda     #$08                            ; D9BD A9 08                    ..
        sta     $09                             ; D9BF 85 09                    ..
        ldy     #$1C                            ; D9C1 A0 1C                    ..
        jmp     LD947                           ; D9C3 4C 47 D9                 LG.

; ----------------------------------------------------------------------------
LD9C6:
        .byte   $A5,$08,$29,$01,$D0,$11,$C6,$09 ; D9C6 A5 08 29 01 D0 11 C6 09  ..).....
        .byte   $D0,$1A,$A9,$C1,$85,$08,$A9,$02 ; D9CE D0 1A A9 C1 85 08 A9 02  ........
        .byte   $85,$09,$A0,$0D,$4C,$47,$D9,$C6 ; D9D6 85 09 A0 0D 4C 47 D9 C6  ....LG..
        .byte   $09,$D0,$09,$A9,$00,$85,$08,$A0 ; D9DE 09 D0 09 A9 00 85 08 A0  ........
        .byte   $00,$4C,$47,$D9                 ; D9E6 00 4C 47 D9              .LG.
; ----------------------------------------------------------------------------
LD9EA:
        rts                                     ; D9EA 60                       `

; ----------------------------------------------------------------------------
LD9EB:
        lda     Workset + EntityX  + 1                            ; D9EB A5 23                    .#
        bne     LDA31                           ; D9ED D0 42                    .B
        lda     Workset + EntityX                             ; D9EF A5 22                    ."
        cmp     #$7C                            ; D9F1 C9 7C                    .|
        bcc     LDA31                           ; D9F3 90 3C                    .<
        cmp     #$84                            ; D9F5 C9 84                    ..
        bcs     LDA31                           ; D9F7 B0 38                    .8
        lda     Workset + EntityY + 1                             ; D9F9 A5 25                    .%
        bne     LDA31                           ; D9FB D0 34                    .4
        lda     Workset + EntityY                             ; D9FD A5 24                    .$
        cmp     #$A8                            ; D9FF C9 A8                    ..
        bcc     LDA31                           ; DA01 90 2E                    ..
        cmp     #$B0                            ; DA03 C9 B0                    ..
        bcs     LDA31                           ; DA05 B0 2A                    .*
        lda     #$20                            ; DA07 A9 20                    . 
        bit     Workset + EntityV1E                             ; DA09 24 3E                    $>
        beq     LDA31                           ; DA0B F0 24                    .$
        lda     #$80                            ; DA0D A9 80                    ..
        sta     $0306                           ; DA0F 8D 06 03                 ...
        lda     #SFXFinaleHit                            ; DA12 A9 18                    ..
        jsr     SoundPlay                           ; DA14 20 CD E2                  ..
        ldx     #$00                            ; DA17 A2 00                    ..
        ldy     #$00                            ; DA19 A0 00                    ..
LDA1B:
        lda     LDA32,y                         ; DA1B B9 32 DA                 .2.
        sta     SpriteTile + (SPR * 8),x                         ; DA1E 9D 21 02                 .!.
        lda     LDA33,y                         ; DA21 B9 33 DA                 .3.
        sta     SpriteAttr + (SPR * 8),x                         ; DA24 9D 22 02                 .".
        inx                                     ; DA27 E8                       .
        inx                                     ; DA28 E8                       .
        inx                                     ; DA29 E8                       .
        inx                                     ; DA2A E8                       .
        iny                                     ; DA2B C8                       .
        iny                                     ; DA2C C8                       .
        cpy     #$08                            ; DA2D C0 08                    ..
        bcc     LDA1B                           ; DA2F 90 EA                    ..
LDA31:
        rts                                     ; DA31 60                       `

; ----------------------------------------------------------------------------
LDA32:
        .byte   $1C                             ; DA32 1C                       .
LDA33:
        .byte   $03,$1D,$03,$2C,$03,$2D,$03     ; DA33 03 1D 03 2C 03 2D 03     ...,.-.
; ----------------------------------------------------------------------------
LDA3A:
        bit     Workset + EntityActive                             ; DA3A 24 20                    $ 
        bvs     LDA58                           ; DA3C 70 1A                    p.
        lda     #$C0                            ; DA3E A9 C0                    ..
        sta     Workset + EntityActive                             ; DA40 85 20                    . 
        lda     #$00                            ; DA42 A9 00                    ..
        sta     Workset + EntityType                             ; DA44 85 21                    .!
        sta     $38                             ; DA46 85 38                    .8
        lda     #$80                            ; DA48 A9 80                    ..
        sta     Workset + EntityX                             ; DA4A 85 22                    ."
        lda     #$00                            ; DA4C A9 00                    ..
        sta     Workset + EntityX  + 1                            ; DA4E 85 23                    .#
        lda     #$50                            ; DA50 A9 50                    .P
        sta     Workset + EntityY                              ; DA52 85 24                    .$
        lda     #$00                            ; DA54 A9 00                    ..
        sta     Workset + EntityY + 1                             ; DA56 85 25                    .%
LDA58:
        bit     Workset + EntityType                             ; DA58 24 21                    $!
        bpl     LDA5F                           ; DA5A 10 03                    ..
        jmp     LDB80                           ; DA5C 4C 80 DB                 L..

; ----------------------------------------------------------------------------
LDA5F:
        jsr     LDBB2                           ; DA5F 20 B2 DB                  ..
        bit     Workset + EntityType                             ; DA62 24 21                    $!
        bvs     LDA75                           ; DA64 70 0F                    p.
        lda     Workset + EntityType                             ; DA66 A5 21                    .!
        ora     #$40                            ; DA68 09 40                    .@
        sta     Workset + EntityType                             ; DA6A 85 21                    .!
        lda     #$FF                            ; DA6C A9 FF                    ..
        sta     Workset + EntityV15                             ; DA6E 85 35                    .5
        lda     Workset + EntityV16                            ; DA70 A5 36                    .6
        jmp     LDA7B                           ; DA72 4C 7B DA                 L{.

; ----------------------------------------------------------------------------
LDA75:
        lda     Workset + EntityV16                            ; DA75 A5 36                    .6
        cmp     Workset + EntityV17                            ; DA77 C5 37                    .7
        beq     LDA99                           ; DA79 F0 1E                    ..
LDA7B:
        sta     Workset + EntityV17                            ; DA7B 85 37                    .7
        asl     a                               ; DA7D 0A                       .
        sta     $12                             ; DA7E 85 12                    ..
        lda     Workset + EntityType                             ; DA80 A5 21                    .!
        and     #$01                            ; DA82 29 01                    ).
        clc                                     ; DA84 18                       .
        adc     $12                             ; DA85 65 12                    e.
        adc     #$04                            ; DA87 69 04                    i.
        jsr     LDBE5                           ; DA89 20 E5 DB                  ..
        jsr     RNGAdvance                           ; DA8C 20 69 8C                  i.
        and     #$03                            ; DA8F 29 03                    ).
        beq     LDA97                           ; DA91 F0 04                    ..
        cmp     #$03                            ; DA93 C9 03                    ..
        bcs     LDA99                           ; DA95 B0 02                    ..
LDA97:
        sta     $38                             ; DA97 85 38                    .8
LDA99:
        lda     $34                             ; DA99 A5 34                    .4
        cmp     Workset + EntityV15                             ; DA9B C5 35                    .5
        beq     LDAFE                           ; DA9D F0 5F                    ._
        sta     Workset + EntityV15                             ; DA9F 85 35                    .5
        asl     a                               ; DAA1 0A                       .
        tax                                     ; DAA2 AA                       .
        lda     LF580,x                         ; DAA3 BD 80 F5                 ...
        sta     $18                             ; DAA6 85 18                    ..
        lda     LF581,x                         ; DAA8 BD 81 F5                 ...
        sta     $19                             ; DAAB 85 19                    ..
        lda     $18                             ; DAAD A5 18                    ..
        sta     Workset + EntityV10                             ; DAAF 85 30                    .0
        lda     $19                             ; DAB1 A5 19                    ..
        sta     Workset + EntityXSpeed                             ; DAB3 85 31                    .1
        lsr     $19                             ; DAB5 46 19                    F.
        ror     $18                             ; DAB7 66 18                    f.
        lda     $18                             ; DAB9 A5 18                    ..
        sta     Workset + EntityV12                            ; DABB 85 32                    .2
        lda     $19                             ; DABD A5 19                    ..
        sta     Workset + EntityYSpeed                             ; DABF 85 33                    .3
        lda     $38                             ; DAC1 A5 38                    .8
        bne     LDACE                           ; DAC3 D0 09                    ..
        lda     #$00                            ; DAC5 A9 00                    ..
        sta     Workset + EntityV10                             ; DAC7 85 30                    .0
        sta     Workset + EntityXSpeed                             ; DAC9 85 31                    .1
        jmp     LDAE5                           ; DACB 4C E5 DA                 L..

; ----------------------------------------------------------------------------
LDACE:
        cmp     #$01                            ; DACE C9 01                    ..
        beq     LDAE5                           ; DAD0 F0 13                    ..
        lda     Workset + EntityXSpeed                             ; DAD2 A5 31                    .1
        eor     #$FF                            ; DAD4 49 FF                    I.
        tay                                     ; DAD6 A8                       .
        lda     Workset + EntityV10                             ; DAD7 A5 30                    .0
        eor     #$FF                            ; DAD9 49 FF                    I.
        clc                                     ; DADB 18                       .
        adc     #$01                            ; DADC 69 01                    i.
        sta     Workset + EntityV10                             ; DADE 85 30                    .0
        tya                                     ; DAE0 98                       .
        adc     #$00                            ; DAE1 69 00                    i.
        sta     Workset + EntityXSpeed                             ; DAE3 85 31                    .1
LDAE5:
        lda     #$01                            ; DAE5 A9 01                    ..
        bit     Workset + EntityType                             ; DAE7 24 21                    $!
        beq     LDAFE                           ; DAE9 F0 13                    ..
        .byte   $A5,$33,$49,$FF,$A8,$A5,$32,$49 ; DAEB A5 33 49 FF A8 A5 32 49  .3I...2I
        .byte   $FF,$18,$69,$01,$85,$32,$98,$69 ; DAF3 FF 18 69 01 85 32 98 69  ..i..2.i
        .byte   $00,$85,$33                     ; DAFB 00 85 33                 ..3
; ----------------------------------------------------------------------------
LDAFE:
        lda     $34                             ; DAFE A5 34                    .4
        asl     a                               ; DB00 0A                       .
        tax                                     ; DB01 AA                       .
        lda     #$C0                            ; DB02 A9 C0                    ..
        and     Joy1Inputs                           ; DB04 2D 30 03                 -0.
        beq     LDB2F                           ; DB07 F0 26                    .&
        bpl     LDB1D                           ; DB09 10 12                    ..
        lda     Workset + EntityV10                             ; DB0B A5 30                    .0
        sec                                     ; DB0D 38                       8
        sbc     LF580,x                         ; DB0E FD 80 F5                 ...
        sta     $16                             ; DB11 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB13 A5 31                    .1
        sbc     LF581,x                         ; DB15 FD 81 F5                 ...
        sta     $17                             ; DB18 85 17                    ..
        jmp     LDB37                           ; DB1A 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB1D:
        lda     Workset + EntityV10                             ; DB1D A5 30                    .0
        clc                                     ; DB1F 18                       .
        adc     LF580,x                         ; DB20 7D 80 F5                 }..
        sta     $16                             ; DB23 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB25 A5 31                    .1
        adc     LF581,x                         ; DB27 7D 81 F5                 }..
        sta     $17                             ; DB2A 85 17                    ..
        jmp     LDB37                           ; DB2C 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB2F:
        lda     Workset + EntityV10                             ; DB2F A5 30                    .0
        sta     $16                             ; DB31 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB33 A5 31                    .1
        sta     $17                             ; DB35 85 17                    ..
LDB37:
        lda     $2C                             ; DB37 A5 2C                    .,
        clc                                     ; DB39 18                       .
        adc     $16                             ; DB3A 65 16                    e.
        sta     $2C                             ; DB3C 85 2C                    .,
        lda     Workset + EntityX                             ; DB3E A5 22                    ."
        adc     $17                             ; DB40 65 17                    e.
        sta     Workset + EntityX                             ; DB42 85 22                    ."
        lda     $17                             ; DB44 A5 17                    ..
        bmi     LDB4F                           ; DB46 30 07                    0.
        lda     Workset + EntityX  + 1                             ; DB48 A5 23                    .#
        adc     #$00                            ; DB4A 69 00                    i.
        jmp     LDB53                           ; DB4C 4C 53 DB                 LS.

; ----------------------------------------------------------------------------
LDB4F:
        lda     Workset + EntityX  + 1                             ; DB4F A5 23                    .#
        adc     #$FF                            ; DB51 69 FF                    i.
LDB53:
        sta     Workset + EntityX  + 1                             ; DB53 85 23                    .#
        jsr     L981B                           ; DB55 20 1B 98                  ..
        lda     #$01                            ; DB58 A9 01                    ..
        bit     Workset + EntityType                             ; DB5A 24 21                    $!
        bne     LDB6F                           ; DB5C D0 11                    ..
        lda     Workset + EntityY                              ; DB5E A5 24                    .$
        cmp     #$B8                            ; DB60 C9 B8                    ..
        bcc     LDB6C                           ; DB62 90 08                    ..
        .byte   $A9,$B8,$85,$24,$A9,$01,$85,$21 ; DB64 A9 B8 85 24 A9 01 85 21  ...$...!
; ----------------------------------------------------------------------------
LDB6C:
        jmp     LDBB1                           ; DB6C 4C B1 DB                 L..

; ----------------------------------------------------------------------------
LDB6F:
        .byte   $A5,$24,$C9,$50,$B0,$F7,$A9,$50 ; DB6F A5 24 C9 50 B0 F7 A9 50  .$.P...P
        .byte   $85,$24,$A9,$00,$85,$21,$4C,$B1 ; DB77 85 24 A9 00 85 21 4C B1  .$...!L.
        .byte   $DB                             ; DB7F DB                       .
; ----------------------------------------------------------------------------
LDB80:
        bit     Workset + EntityType                             ; DB80 24 21                    $!
        bvs     LDBA5                           ; DB82 70 21                    p!
        lda     Workset + EntityType                             ; DB84 A5 21                    .!
        ora     #$40                            ; DB86 09 40                    .@
        sta     Workset + EntityType                             ; DB88 85 21                    .!
        lda     Workset + EntityX  + 1                             ; DB8A A5 23                    .#
        bmi     LDB94                           ; DB8C 30 06                    0.
        bne     LDB9A                           ; DB8E D0 0A                    ..
        lda     Workset + EntityX                              ; DB90 A5 22                    ."
        bmi     LDB9A                           ; DB92 30 06                    0.
LDB94:
        lda     Workset + EntityActive                             ; DB94 A5 20                    . 
        ora     #$10                            ; DB96 09 10                    ..
        bne     LDB9E                           ; DB98 D0 04                    ..
LDB9A:
        .byte   $A5,$20,$29,$EF                 ; DB9A A5 20 29 EF              . ).
; ----------------------------------------------------------------------------
LDB9E:
        sta     Workset + EntityActive                             ; DB9E 85 20                    . 
        lda     Workset + EntityV16                            ; DBA0 A5 36                    .6
        jmp     LDBE5                           ; DBA2 4C E5 DB                 L..

; ----------------------------------------------------------------------------
LDBA5:
        lda     #$02                            ; DBA5 A9 02                    ..
        bit     Workset + EntityV1F                             ; DBA7 24 3F                    $?
        beq     LDBB1                           ; DBA9 F0 06                    ..
        .byte   $A5,$21,$29,$01,$85,$21         ; DBAB A5 21 29 01 85 21        .!)..!
; ----------------------------------------------------------------------------
LDBB1:
        rts                                     ; DBB1 60                       `

; ----------------------------------------------------------------------------
LDBB2:
        ldy     #$00                            ; DBB2 A0 00                    ..
        lda     Workset + EntityY                              ; DBB4 A5 24                    .$
        sec                                     ; DBB6 38                       8
        sbc     #$50                            ; DBB7 E9 50                    .P
        bcs     LDBBD                           ; DBB9 B0 02                    ..
        .byte   $A9,$00                         ; DBBB A9 00                    ..
; ----------------------------------------------------------------------------
LDBBD:
        cmp     #$10                            ; DBBD C9 10                    ..
        bcc     LDBE0                           ; DBBF 90 1F                    ..
        iny                                     ; DBC1 C8                       .
        sbc     #$10                            ; DBC2 E9 10                    ..
        lsr     a                               ; DBC4 4A                       J
        cmp     #$08                            ; DBC5 C9 08                    ..
        bcs     LDBCE                           ; DBC7 B0 05                    ..
        adc     #$10                            ; DBC9 69 10                    i.
        jmp     LDBE0                           ; DBCB 4C E0 DB                 L..

; ----------------------------------------------------------------------------
LDBCE:
        iny                                     ; DBCE C8                       .
        sbc     #$08                            ; DBCF E9 08                    ..
        lsr     a                               ; DBD1 4A                       J
        cmp     #$08                            ; DBD2 C9 08                    ..
        bcc     LDBD8                           ; DBD4 90 02                    ..
        lda     #$07                            ; DBD6 A9 07                    ..
LDBD8:
        clc                                     ; DBD8 18                       .
        adc     #$18                            ; DBD9 69 18                    i.
        cmp     #$1E                            ; DBDB C9 1E                    ..
        bcc     LDBE0                           ; DBDD 90 01                    ..
        iny                                     ; DBDF C8                       .
LDBE0:
        sta     $34                             ; DBE0 85 34                    .4
        sty     Workset + EntityV16                            ; DBE2 84 36                    .6
        rts                                     ; DBE4 60                       `

; ----------------------------------------------------------------------------
LDBE5:
        asl     a                               ; DBE5 0A                       .
        tax                                     ; DBE6 AA                       .
        lda     LDED3,x                         ; DBE7 BD D3 DE                 ...
        sta     Workset + EntityAnimPtr                             ; DBEA 85 28                    .(
        lda     LDED4,x                         ; DBEC BD D4 DE                 ...
        sta     $29                             ; DBEF 85 29                    .)
        lda     #$00                            ; DBF1 A9 00                    ..
        sta     $2A                             ; DBF3 85 2A                    .*
        lda     #$01                            ; DBF5 A9 01                    ..
        sta     Workset + EntityAnimTimer                             ; DBF7 85 2B                    .+
        rts                                     ; DBF9 60                       `

; ----------------------------------------------------------------------------
LDBFA:
        lda     Workset + EntityAnimTimer                             ; DBFA A5 2B                    .+
        beq     LDC39                           ; DBFC F0 3B                    .;
        dec     Workset + EntityAnimTimer                             ; DBFE C6 2B                    .+
        bne     LDC39                           ; DC00 D0 37                    .7
        ldy     $2A                             ; DC02 A4 2A                    .*
LDC04:
        lda     ($28),y                         ; DC04 B1 28                    .(
        bne     LDC11                           ; DC06 D0 09                    ..
        .byte   $A5,$3F,$09,$02,$85,$3F,$4C,$39 ; DC08 A5 3F 09 02 85 3F 4C 39  .?...?L9
        .byte   $DC                             ; DC10 DC                       .
; ----------------------------------------------------------------------------
LDC11:
        iny                                     ; DC11 C8                       .
        cmp     #$FF                            ; DC12 C9 FF                    ..
        bne     LDC1A                           ; DC14 D0 04                    ..
        ldy     #$00                            ; DC16 A0 00                    ..
        beq     LDC04                           ; DC18 F0 EA                    ..
LDC1A:
        sta     Workset + EntityAnimTimer                             ; DC1A 85 2B                    .+
        tax                                     ; DC1C AA                       .
        lda     Workset + EntityV1F                             ; DC1D A5 3F                    .?
        and     #$FD                            ; DC1F 29 FD                    ).
        sta     Workset + EntityV1F                             ; DC21 85 3F                    .?
        lda     ($28),y                         ; DC23 B1 28                    .(
        iny                                     ; DC25 C8                       .
        sta     Workset + (EntitySpritesetPtr + 0)                            ; DC26 85 26                    .&
        lda     ($28),y                         ; DC28 B1 28                    .(
        iny                                     ; DC2A C8                       .
        sta     Workset + (EntitySpritesetPtr + 1)                             ; DC2B 85 27                    .'
        txa                                     ; DC2D 8A                       .
        and     #$1F                            ; DC2E 29 1F                    ).
        sta     Workset + EntityAnimTimer                             ; DC30 85 2B                    .+
        sty     $2A                             ; DC32 84 2A                    .*
        txa                                     ; DC34 8A                       .
        and     #$60                            ; DC35 29 60                    )`
        sta     Workset + EntityV1E                             ; DC37 85 3E                    .>
LDC39:
        ldy     #$00                            ; DC39 A0 00                    ..
        ldx     #$00                            ; DC3B A2 00                    ..
        lda     #$12                            ; DC3D A9 12                    ..
        sta     $00                             ; DC3F 85 00                    ..
        lda     Workset + EntityActive                             ; DC41 A5 20                    . 
        asl     a                               ; DC43 0A                       .
        asl     a                               ; DC44 0A                       .
        eor     Workset + EntityV1E                             ; DC45 45 3E                    E>
        and     #$40                            ; DC47 29 40                    )@
        ora     #$01                            ; DC49 09 01                    ..
        sta     $01                             ; DC4B 85 01                    ..
LDC4D:
        lda     ($26),y                         ; DC4D B1 26                    .&
        cmp     #$80                            ; DC4F C9 80                    ..
        beq     LDCAB                           ; DC51 F0 58                    .X
        iny                                     ; DC53 C8                       .
        bit     $01                             ; DC54 24 01                    $.
        bvc     LDC5D                           ; DC56 50 05                    P.
        eor     #$FF                            ; DC58 49 FF                    I.
        clc                                     ; DC5A 18                       .
        adc     #$F8                            ; DC5B 69 F8                    i.
LDC5D:
        clc                                     ; DC5D 18                       .
        and     #$FF                            ; DC5E 29 FF                    ).
        bmi     LDC6F                           ; DC60 30 0D                    0.
        adc     Workset + EntityX                             ; DC62 65 22                    e"
        sta     SpritePosX + (SPR * 46),x                         ; DC64 9D BB 02                 ...
        lda     Workset + EntityX  + 1                             ; DC67 A5 23                    .#
        adc     #$00                            ; DC69 69 00                    i.
        beq     LDC7A                           ; DC6B F0 0D                    ..
        .byte   $D0,$37                         ; DC6D D0 37                    .7
; ----------------------------------------------------------------------------
LDC6F:
        adc     Workset + EntityX                             ; DC6F 65 22                    e"
        sta     SpritePosX + (SPR * 46),x                         ; DC71 9D BB 02                 ...
        lda     Workset + EntityX  + 1                            ; DC74 A5 23                    .#
        adc     #$FF                            ; DC76 69 FF                    i.
        bne     LDCA6                           ; DC78 D0 2C                    .,
LDC7A:
        lda     ($26),y                         ; DC7A B1 26                    .&
        clc                                     ; DC7C 18                       .
        bmi     LDC86                           ; DC7D 30 07                    0.
        .byte   $65,$24,$9D,$B8,$02,$A9,$00     ; DC7F 65 24 9D B8 02 A9 00     e$.....
; ----------------------------------------------------------------------------
LDC86:
        adc     Workset + EntityY                              ; DC86 65 24                    e$
        sta     SpritePosY + (SPR * 46),x                         ; DC88 9D B8 02                 ...
        lda     #$FF                            ; DC8B A9 FF                    ..
        adc     Workset + EntityY + 1                             ; DC8D 65 25                    e%
        bne     LDCA6                           ; DC8F D0 15                    ..
        iny                                     ; DC91 C8                       .
        lda     ($26),y                         ; DC92 B1 26                    .&
        iny                                     ; DC94 C8                       .
        sta     SpriteTile + (SPR * 46),x                         ; DC95 9D B9 02                 ...
        lda     $01                             ; DC98 A5 01                    ..
        sta     SpriteAttr + (SPR * 46),x                         ; DC9A 9D BA 02                 ...
        inx                                     ; DC9D E8                       .
        inx                                     ; DC9E E8                       .
        inx                                     ; DC9F E8                       .
        inx                                     ; DCA0 E8                       .
        dec     $00                             ; DCA1 C6 00                    ..
        jmp     LDC4D                           ; DCA3 4C 4D DC                 LM.

; ----------------------------------------------------------------------------
LDCA6:
        .byte   $C8,$C8,$4C,$4D,$DC             ; DCA6 C8 C8 4C 4D DC           ..LM.
; ----------------------------------------------------------------------------
LDCAB:
        ldy     $00                             ; DCAB A4 00                    ..
        beq     LDCBB                           ; DCAD F0 0C                    ..
        lda     #$F0                            ; DCAF A9 F0                    ..
LDCB1:
        sta     SpritePosY + (SPR * 46),x                         ; DCB1 9D B8 02                 ...
        inx                                     ; DCB4 E8                       .
        inx                                     ; DCB5 E8                       .
        inx                                     ; DCB6 E8                       .
        inx                                     ; DCB7 E8                       .
        dey                                     ; DCB8 88                       .
        bne     LDCB1                           ; DCB9 D0 F6                    ..
LDCBB:
        lda     #$01                            ; DCBB A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; DCBD 8D 02 03                 ...
        rts                                     ; DCC0 60                       `

; ----------------------------------------------------------------------------
EnterOutroScreen:
        jsr     PPUDisableNMI                           ; DCC1 20 EA 8B                  ..
        jsr     ClearScreenAndSprites                           ; DCC4 20 12 8E                  ..
        jsr     DrawStatusLine                           ; DCC7 20 8F A7                  ..
        lda     #RomGraphicsBonusScreenHitsLabel                            ; DCCA A9 05                    ..
        jsr     DrawRomGraphics                           ; DCCC 20 69 8D                  i.
        lda     #EncounterBackgroundDeep                            ; DCCF A9 01                    ..
        jsr     LoadEncounterBackground                           ; DCD1 20 E6 AC                  ..
        lda     #RomGraphicsEncounterDeep                            ; DCD4 A9 03                    ..
        jsr     DrawRomGraphics                           ; DCD6 20 69 8D                  i.
        lda     #PaletteEncounterDeep                            ; DCD9 A9 03                    ..
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; DCDB 20 BD 8E                  ..
        lda     #CHREncounterAndIntroScreen
        sta     ActiveCHR                           ; DCE0 8D 07 03                 ...
        lda     #$00                            ; DCE3 A9 00                    ..
        sta     SCROLL_X                           ; DCE5 8D 20 03                 . .
        sta     UseHighPPUNametables                           ; DCE8 8D 23 03                 .#.
        sta     CameraX                           ; DCEB 8D 38 03                 .8.
        sta     CameraX+1                           ; DCEE 8D 39 03                 .9.
        sta     CameraY+1                           ; DCF1 8D 3B 03                 .;.
        lda     #$20                            ; DCF4 A9 20                    . 
        sta     SCROLL_Y                           ; DCF6 8D 22 03                 .".
        sta     CameraY                           ; DCF9 8D 3A 03                 .:.
        jsr     ClearEntityMemory                           ; DCFC 20 7C 97                  |.
        sta     NMISpriteHandlingDisabled                           ; DCFF 8D 02 03                 ...
        jsr     PPUEnableNMI                           ; DD02 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; DD05 20 C2 8B                  ..
LDD08:
        jsr     WaitFor1Frame                           ; DD08 20 40 8C                  @.
        jsr     LDE92                           ; DD0B 20 92 DE                  ..
        jsr     UpdateEntitySprites                           ; DD0E 20 37 9A                  7.
        lda     $0680                           ; DD11 AD 80 06                 ...
        bne     LDD08                           ; DD14 D0 F2                    ..
        jsr     PPUDisableNMI                           ; DD16 20 EA 8B                  ..
        jsr     PPUDisableRendering                           ; DD19 20 B6 8B                  ..
        lda     PPUCTRL_MIRROR                           ; DD1C AD 0E 03                 ...
        ora     #$18                            ; DD1F 09 18                    ..
        sta     PPUCTRL_MIRROR                           ; DD21 8D 0E 03                 ...
        jsr     ClearScreenAndSprites                           ; DD24 20 12 8E                  ..
        lda     #PaletteOutroScreen                            ; DD27 A9 05                    ..
        jsr     StoreActivePaletteAndWaitFor1Frame                           ; DD29 20 BD 8E                  ..
        lda     #CHRFinaleAndOutroScreen
        sta     ActiveCHR                           ; DD2E 8D 07 03                 ...
        lda     #RomGraphicsOutroScreen                            ; DD31 A9 06                    ..
        jsr     DrawRomGraphics                           ; DD33 20 69 8D                  i.
        lda     #$00                            ; DD36 A9 00                    ..
        sta     SCROLL_X                           ; DD38 8D 20 03                 . .
        sta     SCROLL_Y                           ; DD3B 8D 22 03                 .".
        sta     UseHighPPUNametables                           ; DD3E 8D 23 03                 .#.
        sta     CameraX                           ; DD41 8D 38 03                 .8.
        sta     CameraX+1                           ; DD44 8D 39 03                 .9.
        sta     CameraY                           ; DD47 8D 3A 03                 .:.
        sta     CameraY+1                           ; DD4A 8D 3B 03                 .;.
        jsr     ClearEntityMemory                           ; DD4D 20 7C 97                  |.
        lda     #$01                            ; DD50 A9 01                    ..
        sta     NMISpriteHandlingDisabled                           ; DD52 8D 02 03                 ...
        jsr     PPUEnableNMI                           ; DD55 20 DE 8B                  ..
        jsr     PPUEnableAndWaitFor1Frame                           ; DD58 20 C2 8B                  ..
        lda     #$00                            ; DD5B A9 00                    ..
        sta     $0301                           ; DD5D 8D 01 03                 ...
LDD60:
        jsr     WaitFor1Frame                           ; DD60 20 40 8C                  @.
        jsr     LDDC5                           ; DD63 20 C5 DD                  ..
        jsr     UpdateEntitySprites                           ; DD66 20 37 9A                  7.
        lda     $0680                           ; DD69 AD 80 06                 ...
        bne     LDD60                           ; DD6C D0 F2                    ..
        ldy     #$3C                            ; DD6E A0 3C                    .<
        jsr     WaitForYFrames                           ; DD70 20 50 8C                  P.
        jsr     CopyToVRAMBuffer                           ; DD73 20 A1 A8                  ..
        .addr   LDDA9
; ----------------------------------------------------------------------------
        jsr     CopyToVRAMBuffer                           ; DD78 20 A1 A8                  ..
        .addr   LDDB4                         ; DD7B B4 DD                    ..
; ----------------------------------------------------------------------------
        jsr     CopyToVRAMBuffer                           ; DD7D 20 A1 A8                  ..
        .addr   LDDBF                        ; DD80 BF DD                    ..
; ----------------------------------------------------------------------------
        jsr     L8B5F                           ; DD82 20 5F 8B                  _.
        lda     #MusicOutroScreen                            ; DD85 A9 04                    ..
        jsr     SoundPlay                           ; DD87 20 CD E2                  ..
LDD8A:
        jsr     WaitFor1Frame                           ; DD8A 20 40 8C                  @.
        lda     $0574                           ; DD8D AD 74 05                 .t.
        bmi     LDD8A                           ; DD90 30 F8                    0.
        jsr     ReadJoypads                           ; DD92 20 87 8C                  ..
        lda     #$08                            ; DD95 A9 08                    ..
        bit     Joy1Pressed                           ; DD97 2C 32 03                 ,2.
        beq     LDD8A                           ; DD9A F0 EE                    ..
        .byte   $AD,$0E,$03,$29,$E7,$09,$08,$8D ; DD9C AD 0E 03 29 E7 09 08 8D  ...)....
        .byte   $0E,$03,$4C,$48,$81
LDDA9:
        .byte   $56,$23,$08 ; DDA4 0E 03 4C 48 81 56 23 08  ..LH.V#.
        .byte   $E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF ; DDAC E8 E9 EA EB EC ED EE EF  ........
LDDB4:
        .byte   $76,$23,$08,$F8,$F9,$FA,$FB,$FC ; DDB4 76 23 08 F8 F9 FA FB FC  v#......
        .byte   $FD,$FE,$FF
LDDBF:
        .byte $F5,$23,$03,$7F,$5F ; DDBC FD FE FF F5 23 03 7F 5F  ....#.._
        .byte   $DF                             ; DDC4 DF                       .
; ----------------------------------------------------------------------------
LDDC5:
        lda     #<PlayerData                            ; DDC5 A9 80                    ..
        sta     WorksetPtr                             ; DDC7 85 40                    .@
        lda     #>PlayerData                            ; DDC9 A9 06                    ..
        sta     WorksetPtr+1                             ; DDCB 85 41                    .A
        jsr     WorksetLoad                           ; DDCD 20 54 97                  T.
        bit     Workset + EntityActive                             ; DDD0 24 20                    $ 
        bmi     LDE00                           ; DDD2 30 2C                    0,
        lda     #$C0                            ; DDD4 A9 C0                    ..
        sta     Workset + EntityActive                             ; DDD6 85 20                    . 
        lda     #$40                            ; DDD8 A9 40                    .@
        sta     Workset + EntityX                             ; DDDA 85 22                    ."
        lda     #$01                            ; DDDC A9 01                    ..
        sta     Workset + EntityX  + 1                            ; DDDE 85 23                    .#
        lda     #$90                            ; DDE0 A9 90                    ..
        sta     Workset + EntityY                             ; DDE2 85 24                    .$
        lda     #$00                            ; DDE4 A9 00                    ..
        sta     Workset + EntityY + 1                             ; DDE6 85 25                    .%
        lda     #$00                            ; DDE8 A9 00                    ..
        sta     Workset + EntityV10                             ; DDEA 85 30                    .0
        lda     #$FC                            ; DDEC A9 FC                    ..
        sta     Workset + EntityXSpeed                             ; DDEE 85 31                    .1
        lda     #$00                            ; DDF0 A9 00                    ..
        sta     Workset + EntityV12                            ; DDF2 85 32                    .2
        lda     #$FF                            ; DDF4 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; DDF6 85 33                    .3
        lda     #AnimationOutroPlane1                            ; DDF8 A9 08                    ..
        jsr     WorksetAnimationPlay                           ; DDFA 20 AD 97                  ..
        jmp     WorksetSave                           ; DDFD 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE00:
        lda     $34                             ; DE00 A5 34                    .4
        bne     LDE4D                           ; DE02 D0 49                    .I
        jsr     WorksetMoveX                           ; DE04 20 FA 97                  ..
        jsr     L981B                           ; DE07 20 1B 98                  ..
        bit     Workset + EntityV15                             ; DE0A 24 35                    $5
        bmi     LDE1B                           ; DE0C 30 0D                    0.
        lda     #$01                            ; DE0E A9 01                    ..
        bit     Workset + EntityV1F                             ; DE10 24 3F                    $?
        beq     LDE18                           ; DE12 F0 04                    ..
        lda     #$80                            ; DE14 A9 80                    ..
        sta     Workset + EntityV15                             ; DE16 85 35                    .5
LDE18:
        jmp     WorksetSave                           ; DE18 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE1B:
        lda     #$01                            ; DE1B A9 01                    ..
        bit     Workset + EntityV1F                             ; DE1D 24 3F                    $?
        bne     LDE18                           ; DE1F D0 F7                    ..
        lda     #$38                            ; DE21 A9 38                    .8
        sta     Workset + EntityY                             ; DE23 85 24                    .$
        lda     #$00                            ; DE25 A9 00                    ..
        sta     Workset + EntityY + 1                             ; DE27 85 25                    .%
        lda     #$80                            ; DE29 A9 80                    ..
        sta     Workset + EntityV10                             ; DE2B 85 30                    .0
        lda     #$02                            ; DE2D A9 02                    ..
        sta     Workset + EntityXSpeed                             ; DE2F 85 31                    .1
        lda     #$10                            ; DE31 A9 10                    ..
        sta     Workset + EntityV12                            ; DE33 85 32                    .2
        lda     #$00                            ; DE35 A9 00                    ..
        sta     Workset + EntityYSpeed                             ; DE37 85 33                    .3
        lda     #$01                            ; DE39 A9 01                    ..
        sta     $34                             ; DE3B 85 34                    .4
        lda     #$00                            ; DE3D A9 00                    ..
        sta     Workset + EntityV15                             ; DE3F 85 35                    .5
        lda     #$10                            ; DE41 A9 10                    ..
        sta     Workset + EntityV16                            ; DE43 85 36                    .6
        lda     #AnimationOutroPlane2                            ; DE45 A9 09                    ..
        jsr     WorksetAnimationPlay                           ; DE47 20 AD 97                  ..
        jmp     WorksetSave                           ; DE4A 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE4D:
        cmp     #$01                            ; DE4D C9 01                    ..
        bne     LDE84                           ; DE4F D0 33                    .3
        lda     Workset + EntityV16                            ; DE51 A5 36                    .6
        beq     LDE5A                           ; DE53 F0 05                    ..
        dec     Workset + EntityV16                            ; DE55 C6 36                    .6
        jmp     WorksetSave                           ; DE57 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE5A:
        jsr     WorksetMoveX                           ; DE5A 20 FA 97                  ..
        jsr     L981B                           ; DE5D 20 1B 98                  ..
        bit     Workset + EntityV15                             ; DE60 24 35                    $5
        bmi     LDE71                           ; DE62 30 0D                    0.
        lda     #$01                            ; DE64 A9 01                    ..
        bit     Workset + EntityV1F                             ; DE66 24 3F                    $?
        beq     LDE6E                           ; DE68 F0 04                    ..
        lda     #$80                            ; DE6A A9 80                    ..
        sta     Workset + EntityV15                             ; DE6C 85 35                    .5
LDE6E:
        jmp     WorksetSave                           ; DE6E 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE71:
        ldy     #$04                            ; DE71 A0 04                    ..
        jsr     L98B8                           ; DE73 20 B8 98                  ..
        bcc     LDE6E                           ; DE76 90 F6                    ..
        lda     #$02                            ; DE78 A9 02                    ..
        sta     $34                             ; DE7A 85 34                    .4
        lda     #AnimationOutroPlane3                            ; DE7C A9 0A                    ..
        jsr     WorksetAnimationPlay                           ; DE7E 20 AD 97                  ..
        jmp     WorksetSave                           ; DE81 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE84:
        jsr     WorksetAnimationAdvance                           ; DE84 20 BE 97                  ..
        lda     Workset + EntityAnimTimer                             ; DE87 A5 2B                    .+
        bne     LDE8F                           ; DE89 D0 04                    ..
        lda     #$00                            ; DE8B A9 00                    ..
        sta     Workset + EntityActive                             ; DE8D 85 20                    . 
LDE8F:
        jmp     WorksetSave                           ; DE8F 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE92:
        lda     #<PlayerData                            ; DE92 A9 80                    ..
        sta     WorksetPtr                             ; DE94 85 40                    .@
        lda     #>PlayerData                            ; DE96 A9 06                    ..
        sta     WorksetPtr+1                             ; DE98 85 41                    .A
        jsr     WorksetLoad                           ; DE9A 20 54 97                  T.
        jsr     LDEA3                           ; DE9D 20 A3 DE                  ..
        jmp     WorksetSave                           ; DEA0 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDEA3:
        bit     Workset + EntityActive                             ; DEA3 24 20                    $ 
        bvs     LDEC4                           ; DEA5 70 1D                    p.
        lda     #$C0                            ; DEA7 A9 C0                    ..
        sta     Workset + EntityActive                             ; DEA9 85 20                    . 
        lda     #$80                            ; DEAB A9 80                    ..
        sta     Workset + EntityX                             ; DEAD 85 22                    ."
        lda     #$A0                            ; DEAF A9 A0                    ..
        sta     Workset + EntityY                             ; DEB1 85 24                    .$
        lda     #$80                            ; DEB3 A9 80                    ..
        sta     Workset + EntityV12                            ; DEB5 85 32                    .2
        lda     #$10                            ; DEB7 A9 10                    ..
        sta     Workset + EntityV10                             ; DEB9 85 30                    .0
        lda     #$C0                            ; DEBB A9 C0                    ..
        sta     $34                             ; DEBD 85 34                    .4
        lda     #AnimationFinaleJawsDeath                            ; DEBF A9 0B                    ..
        jmp     WorksetAnimationPlay                           ; DEC1 4C AD 97                 L..

; ----------------------------------------------------------------------------
LDEC4:
        jsr     WorksetMoveX                           ; DEC4 20 FA 97                  ..
        jsr     L981B                           ; DEC7 20 1B 98                  ..
        dec     $34                             ; DECA C6 34                    .4
        bne     LDED2                           ; DECC D0 04                    ..
        lda     #$00                            ; DECE A9 00                    ..
        sta     Workset + EntityActive                             ; DED0 85 20                    . 
LDED2:
        rts                                     ; DED2 60                       `

; ----------------------------------------------------------------------------
LDED3:
        .byte   $EB                             ; DED3 EB                       .
LDED4:
        .byte   $DE,$0D,$DF,$2F,$DF,$51,$DF,$79 ; DED4 DE 0D DF 2F DF 51 DF 79  .../.Q.y
        .byte   $DF,$80,$DF,$84,$DF,$8B,$DF,$8F ; DEDC DF 80 DF 84 DF 8B DF 8F  ........
        .byte   $DF,$99,$DF,$9D,$DF,$A7,$DF,$08 ; DEE4 DF 99 DF 9D DF A7 DF 08  ........
        .byte   $AB,$DF,$08,$B2,$DF,$08,$B9,$DF ; DEEC AB DF 08 B2 DF 08 B9 DF  ........
        .byte   $0C,$C6,$DF,$0C,$D3,$DF,$0C,$E0 ; DEF4 0C C6 DF 0C D3 DF 0C E0  ........
        .byte   $DF,$4C,$D3,$DF,$4C,$C6,$DF,$48 ; DEFC DF 4C D3 DF 4C C6 DF 48  .L..L..H
        .byte   $B9,$DF,$48,$B2,$DF,$48,$AB,$DF ; DF04 B9 DF 48 B2 DF 48 AB DF  ..H..H..
        .byte   $00,$08,$ED,$DF,$08,$F7,$DF,$08 ; DF0C 00 08 ED DF 08 F7 DF 08  ........
        .byte   $04,$E0,$0C,$17,$E0,$0C,$33,$E0 ; DF14 04 E0 0C 17 E0 0C 33 E0  ......3.
        .byte   $0C,$4C,$E0,$4C,$33,$E0,$4C,$17 ; DF1C 0C 4C E0 4C 33 E0 4C 17  .L.L3.L.
        .byte   $E0,$48,$04,$E0,$48,$F7,$DF,$48 ; DF24 E0 48 04 E0 48 F7 DF 48  .H..H..H
        .byte   $ED,$DF,$00,$08,$03,$E1,$08,$F0 ; DF2C ED DF 00 08 03 E1 08 F0  ........
        .byte   $E0,$08,$D4,$E0,$0C,$65,$E0,$0C ; DF34 E0 08 D4 E0 0C 65 E0 0C  .....e..
        .byte   $B2,$E0,$0C,$87,$E0,$4C,$B2,$E0 ; DF3C B2 E0 0C 87 E0 4C B2 E0  .....L..
        .byte   $4C,$65,$E0,$48,$D4,$E0,$48,$F0 ; DF44 4C 65 E0 48 D4 E0 48 F0  Le.H..H.
        .byte   $E0,$48,$03,$E1,$00,$06,$FA,$E1 ; DF4C E0 48 03 E1 00 06 FA E1  .H......
        .byte   $06,$E7,$E1,$06,$CB,$E1,$06,$A0 ; DF54 06 E7 E1 06 CB E1 06 A0  ........
        .byte   $E1,$0A,$0D,$E1,$2A,$3B,$E1,$2A ; DF5C E1 0A 0D E1 2A 3B E1 2A  ....*;.*
        .byte   $6C,$E1,$6A,$3B,$E1,$4A,$0D,$E1 ; DF64 6C E1 6A 3B E1 4A 0D E1  l.j;.J..
        .byte   $46,$A0,$E1,$46,$CB,$E1,$46,$E7 ; DF6C 46 A0 E1 46 CB E1 46 E7  F..F..F.
        .byte   $E1,$46,$FA,$E1,$00,$08,$04,$E2 ; DF74 E1 46 FA E1 00 08 04 E2  .F......
        .byte   $08,$08,$E2,$FF,$01,$0C,$E2,$00 ; DF7C 08 08 E2 FF 01 0C E2 00  ........
        .byte   $08,$10,$E2,$08,$1D,$E2,$FF,$01 ; DF84 08 10 E2 08 1D E2 FF 01  ........
        .byte   $2A,$E2,$00,$06,$31,$E2,$06,$3E ; DF8C 2A E2 00 06 31 E2 06 3E  *...1..>
        .byte   $E2,$06,$4B,$E2,$FF,$01,$58,$E2 ; DF94 E2 06 4B E2 FF 01 58 E2  ..K...X.
        .byte   $00,$06,$5F,$E2,$06,$6F,$E2,$06 ; DF9C 00 06 5F E2 06 6F E2 06  .._..o..
        .byte   $7F,$E2,$FF,$01,$8F,$E2,$00,$F8 ; DFA4 7F E2 FF 01 8F E2 00 F8  ........
        .byte   $F8,$AF,$00,$F8,$9F,$80,$F8,$F8 ; DFAC F8 AF 00 F8 9F 80 F8 F8  ........
        .byte   $AD,$00,$F8,$AE,$80,$F8,$F0,$AB ; DFB4 AD 00 F8 AE 80 F8 F0 AB  ........
        .byte   $00,$F0,$AC,$F8,$F8,$BB,$00,$F8 ; DFBC 00 F0 AC F8 F8 BB 00 F8  ........
        .byte   $BC,$80,$F8,$F0,$A5,$00,$F0,$A6 ; DFC4 BC 80 F8 F0 A5 00 F0 A6  ........
        .byte   $F8,$F8,$B5,$00,$F8,$B6,$80,$F8 ; DFCC F8 F8 B5 00 F8 B6 80 F8  ........
        .byte   $F0,$A9,$00,$F0,$AA,$F8,$F8,$B9 ; DFD4 F0 A9 00 F0 AA F8 F8 B9  ........
        .byte   $00,$F8,$BA,$80,$F8,$F0,$A7,$00 ; DFDC 00 F8 BA 80 F8 F0 A7 00  ........
        .byte   $F0,$A8,$F8,$F8,$B7,$00,$F8,$B8 ; DFE4 F0 A8 F8 F8 B7 00 F8 B8  ........
        .byte   $80,$F0,$F8,$E3,$F8,$F8,$E4,$00 ; DFEC 80 F0 F8 E3 F8 F8 E4 00  ........
        .byte   $F8,$F4,$80,$F0,$F8,$C3,$F8,$F8 ; DFF4 F8 F4 80 F0 F8 C3 F8 F8  ........
        .byte   $C4,$00,$F8,$D3,$08,$F8,$D4,$80 ; DFFC C4 00 F8 D3 08 F8 D4 80  ........
        .byte   $F8,$F0,$91,$00,$F0,$92,$F0,$F8 ; E004 F8 F0 91 00 F0 92 F0 F8  ........
        .byte   $F0,$F8,$F8,$F1,$00,$F8,$F2,$08 ; E00C F0 F8 F8 F1 00 F8 F2 08  ........
        .byte   $F8,$F3,$80,$F8,$E8,$91,$00,$E8 ; E014 F8 F3 80 F8 E8 91 00 E8  ........
        .byte   $92,$F0,$F0,$A0,$F8,$F0,$A1,$00 ; E01C 92 F0 F0 A0 F8 F0 A1 00  ........
        .byte   $F0,$A2,$F0,$F8,$B0,$F8,$F8,$B1 ; E024 F0 A2 F0 F8 B0 F8 F8 B1  ........
        .byte   $00,$F8,$B2,$08,$F8,$9E,$80,$F8 ; E02C 00 F8 B2 08 F8 9E 80 F8  ........
        .byte   $E8,$93,$00,$E8,$94,$F8,$F0,$A3 ; E034 E8 93 00 E8 94 F8 F0 A3  ........
        .byte   $00,$F0,$A4,$F0,$F8,$90,$F8,$F8 ; E03C 00 F0 A4 F0 F8 90 F8 F8  ........
        .byte   $B3,$00,$F8,$B4,$08,$F8,$C0,$80 ; E044 B3 00 F8 B4 08 F8 C0 80  ........
        .byte   $F8,$E8,$C1,$00,$E8,$C2,$F8,$F0 ; E04C F8 E8 C1 00 E8 C2 F8 F0  ........
        .byte   $D1,$00,$F0,$D2,$F0,$F8,$E0,$F8 ; E054 D1 00 F0 D2 F0 F8 E0 F8  ........
        .byte   $F8,$E1,$00,$F8,$E2,$08,$F8,$D0 ; E05C F8 E1 00 F8 E2 08 F8 D0  ........
        .byte   $80,$F9,$E0,$04,$01,$E0,$05,$F9 ; E064 80 F9 E0 04 01 E0 05 F9  ........
        .byte   $E8,$14,$01,$E8,$15,$F1,$F0,$23 ; E06C E8 14 01 E8 15 F1 F0 23  .......#
        .byte   $F9,$F0,$24,$01,$F0,$25,$F1,$F8 ; E074 F9 F0 24 01 F0 25 F1 F8  ..$..%..
        .byte   $33,$F9,$F8,$34,$01,$F8,$35,$09 ; E07C 33 F9 F8 34 01 F8 35 09  3..4..5.
        .byte   $F8,$36,$80,$F7,$E0,$16,$FF,$E0 ; E084 F8 36 80 F7 E0 16 FF E0  .6......
        .byte   $50,$F7,$E8,$26,$FF,$E8,$60,$F7 ; E08C 50 F7 E8 26 FF E8 60 F7  P..&..`.
        .byte   $F0,$17,$FF,$F0,$70,$E7,$F8,$19 ; E094 F0 17 FF F0 70 E7 F8 19  ....p...
        .byte   $EF,$F8,$28,$F7,$F8,$27,$FF,$F8 ; E09C EF F8 28 F7 F8 27 FF F8  ..(..'..
        .byte   $80,$07,$F8,$81,$0F,$F8,$82,$EF ; E0A4 80 07 F8 81 0F F8 82 EF  ........
        .byte   $F0,$18,$07,$F0,$71,$80,$F8,$E0 ; E0AC F0 18 07 F0 71 80 F8 E0  ....q...
        .byte   $53,$00,$E0,$54,$F8,$E8,$63,$00 ; E0B4 53 00 E0 54 F8 E8 63 00  S..T..c.
        .byte   $E8,$64,$F0,$F0,$51,$F8,$F0,$73 ; E0BC E8 64 F0 F0 51 F8 F0 73  .d..Q..s
        .byte   $00,$F0,$74,$F0,$F8,$61,$F8,$F8 ; E0C4 00 F0 74 F0 F8 61 F8 F8  ..t..a..
        .byte   $83,$00,$F8,$84,$08,$F8,$52,$80 ; E0CC 83 00 F8 84 08 F8 52 80  ......R.
        .byte   $F8,$E8,$04,$00,$E8,$05,$F0,$F0 ; E0D4 F8 E8 04 00 E8 05 F0 F0  ........
        .byte   $37,$F8,$F0,$14,$00,$F0,$47,$F0 ; E0DC 37 F8 F0 14 00 F0 47 F0  7.....G.
        .byte   $F8,$43,$F8,$F8,$44,$00,$F8,$45 ; E0E4 F8 43 F8 F8 44 00 F8 45  .C..D..E
        .byte   $08,$F8,$46,$80,$F7,$F0,$04,$FF ; E0EC 08 F8 46 80 F7 F0 04 FF  ..F.....
        .byte   $F0,$05,$EF,$F8,$38,$F7,$F8,$39 ; E0F4 F0 05 EF F8 38 F7 F8 39  ....8..9
        .byte   $FF,$F8,$3A,$07,$F8,$3B,$80,$EE ; E0FC FF F8 3A 07 F8 3B 80 EE  ..:..;..
        .byte   $F8,$48,$F6,$F8,$49,$FE,$F8,$4A ; E104 F8 48 F6 F8 49 FE F8 4A  .H..I..J
        .byte   $80,$F4,$D8,$55,$FC,$D8,$56,$F4 ; E10C 80 F4 D8 55 FC D8 56 F4  ...U..V.
        .byte   $E0,$65,$FC,$E0,$66,$04,$E0,$67 ; E114 E0 65 FC E0 66 04 E0 67  .e..f..g
        .byte   $F4,$E8,$75,$FC,$E8,$76,$04,$E8 ; E11C F4 E8 75 FC E8 76 04 E8  ..u..v..
        .byte   $77,$F4,$F0,$85,$FC,$F0,$86,$04 ; E124 77 F4 F0 85 FC F0 86 04  w.......
        .byte   $F0,$87,$EC,$F8,$57,$F4,$F8,$95 ; E12C F0 87 EC F8 57 F4 F8 95  ....W...
        .byte   $FC,$F8,$96,$04,$F8,$97,$80,$F4 ; E134 FC F8 96 04 F8 97 80 F4  ........
        .byte   $D8,$58,$FC,$D8,$59,$04,$D8,$5A ; E13C D8 58 FC D8 59 04 D8 5A  .X..Y..Z
        .byte   $F4,$E0,$68,$FC,$E0,$69,$04,$E0 ; E144 F4 E0 68 FC E0 69 04 E0  ..h..i..
        .byte   $6A,$F4,$E8,$78,$FC,$E8,$79,$04 ; E14C 6A F4 E8 78 FC E8 79 04  j..x..y.
        .byte   $E8,$7A,$F4,$F0,$88,$FC,$F0,$89 ; E154 E8 7A F4 F0 88 FC F0 89  .z......
        .byte   $04,$F0,$8A,$EC,$F8,$4B,$F4,$F8 ; E15C 04 F0 8A EC F8 4B F4 F8  .....K..
        .byte   $98,$FC,$F8,$99,$04,$F8,$9A,$80 ; E164 98 FC F8 99 04 F8 9A 80  ........
        .byte   $F4,$D8,$5B,$FC,$D8,$5C,$04,$D8 ; E16C F4 D8 5B FC D8 5C 04 D8  ..[..\..
        .byte   $5D,$F4,$E0,$6B,$FC,$E0,$6C,$04 ; E174 5D F4 E0 6B FC E0 6C 04  ]..k..l.
        .byte   $E0,$6D,$F4,$E8,$7B,$FC,$E8,$7C ; E17C E0 6D F4 E8 7B FC E8 7C  .m..{..|
        .byte   $04,$E8,$7D,$F4,$F0,$8B,$FC,$F0 ; E184 04 E8 7D F4 F0 8B FC F0  ..}.....
        .byte   $8C,$04,$F0,$8D,$EC,$F8,$3C,$F4 ; E18C 8C 04 F0 8D EC F8 3C F4  ......<.
        .byte   $F8,$9B,$FC,$F8,$9C,$04,$F8,$9D ; E194 F8 9B FC F8 9C 04 F8 9D  ........
        .byte   $0C,$F8,$4C,$80,$F4,$E0,$55,$FC ; E19C 0C F8 4C 80 F4 E0 55 FC  ..L...U.
        .byte   $E0,$56,$F4,$E8,$65,$FC,$E8,$66 ; E1A4 E0 56 F4 E8 65 FC E8 66  .V..e..f
        .byte   $04,$E8,$67,$F4,$F0,$2E,$FC,$F0 ; E1AC 04 E8 67 F4 F0 2E FC F0  ..g.....
        .byte   $76,$04,$F0,$77,$0C,$F0,$2F,$EC ; E1B4 76 04 F0 77 0C F0 2F EC  v..w../.
        .byte   $F8,$3D,$F4,$F8,$3E,$FC,$F8,$3F ; E1BC F8 3D F4 F8 3E FC F8 3F  .=..>..?
        .byte   $04,$F8,$1E,$0C,$F8,$1F,$80,$F4 ; E1C4 04 F8 1E 0C F8 1F 80 F4  ........
        .byte   $E8,$55,$FC,$E8,$56,$F4,$F0,$65 ; E1CC E8 55 FC E8 56 F4 F0 65  .U..V..e
        .byte   $FC,$F0,$66,$04,$F0,$67,$F4,$F8 ; E1D4 FC F0 66 04 F0 67 F4 F8  ..f..g..
        .byte   $4D,$FC,$F8,$4E,$04,$F8,$4F,$0C ; E1DC 4D FC F8 4E 04 F8 4F 0C  M..N..O.
        .byte   $F8,$5E,$80,$F4,$F0,$55,$FC,$F0 ; E1E4 F8 5E 80 F4 F0 55 FC F0  .^...U..
        .byte   $56,$F4,$F8,$6E,$FC,$F8,$6F,$04 ; E1EC 56 F4 F8 6E FC F8 6F 04  V..n..o.
        .byte   $F8,$7E,$0C,$F8,$7F,$80,$F4,$F8 ; E1F4 F8 7E 0C F8 7F 80 F4 F8  .~......
        .byte   $8E,$FC,$F8,$8F,$04,$F8,$5F,$80 ; E1FC 8E FC F8 8F 04 F8 5F 80  ......_.
        .byte   $FC,$F8,$C7,$80,$FC,$F8,$D7,$80 ; E204 FC F8 C7 80 FC F8 D7 80  ........
        .byte   $FC,$F8,$CF,$80,$FC,$F0,$D5,$F4 ; E20C FC F8 CF 80 FC F0 D5 F4  ........
        .byte   $F8,$C8,$FC,$F8,$C9,$04,$F8,$CA ; E214 F8 C8 FC F8 C9 04 F8 CA  ........
        .byte   $80,$FC,$F0,$D5,$F4,$F8,$D8,$FC ; E21C 80 FC F0 D5 F4 F8 D8 FC  ........
        .byte   $F8,$D9,$04,$F8,$DA,$80,$FC,$F0 ; E224 F8 D9 04 F8 DA 80 FC F0  ........
        .byte   $D5,$FC,$F8,$DF,$80,$FC,$F0,$CB ; E22C D5 FC F8 DF 80 FC F0 CB  ........
        .byte   $F4,$F8,$E8,$FC,$F8,$E9,$04,$F8 ; E234 F4 F8 E8 FC F8 E9 04 F8  ........
        .byte   $EA,$80,$FC,$F0,$CB,$F4,$F8,$F8 ; E23C EA 80 FC F0 CB F4 F8 F8  ........
        .byte   $FC,$F8,$F9,$04,$F8,$FA,$80,$FC ; E244 FC F8 F9 04 F8 FA 80 FC  ........
        .byte   $F0,$CB,$F4,$F8,$CC,$FC,$F8,$CD ; E24C F0 CB F4 F8 CC FC F8 CD  ........
        .byte   $04,$F8,$CE,$80,$FC,$F0,$CB,$FC ; E254 04 F8 CE 80 FC F0 CB FC  ........
        .byte   $F8,$EF,$80,$FC,$E8,$C6,$FC,$F0 ; E25C F8 EF 80 FC E8 C6 FC F0  ........
        .byte   $D6,$F4,$F8,$F5,$FC,$F8,$F6,$04 ; E264 D6 F4 F8 F5 FC F8 F6 04  ........
        .byte   $F8,$F7,$80,$FC,$E8,$C6,$FC,$F0 ; E26C F8 F7 80 FC E8 C6 FC F0  ........
        .byte   $D6,$F4,$F8,$BD,$FC,$F8,$BE,$04 ; E274 D6 F4 F8 BD FC F8 BE 04  ........
        .byte   $F8,$BF,$80,$FC,$E8,$C6,$FC,$F0 ; E27C F8 BF 80 FC E8 C6 FC F0  ........
        .byte   $D6,$F4,$F8,$E5,$FC,$F8,$E6,$04 ; E284 D6 F4 F8 E5 FC F8 E6 04  ........
        .byte   $F8,$E7,$80,$FC,$E8,$C6,$FC,$F0 ; E28C F8 E7 80 FC E8 C6 FC F0  ........
        .byte   $D6,$FC,$F8,$C5,$80             ; E294 D6 FC F8 C5 80           .....

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

; End of Sound system













LF580:
        .byte   $08                             ; F580 08                       .
LF581:
        .byte   $00,$10,$00,$18,$00,$20,$00,$28 ; F581 00 10 00 18 00 20 00 28  ..... .(
        .byte   $00,$30,$00,$38,$00,$40,$00,$48 ; F589 00 30 00 38 00 40 00 48  .0.8.@.H
        .byte   $00,$50,$00,$58,$00,$60,$00,$68 ; F591 00 50 00 58 00 60 00 68  .P.X.`.h
        .byte   $00,$70,$00,$78,$00,$80,$00,$88 ; F599 00 70 00 78 00 80 00 88  .p.x....
        .byte   $00,$90,$00,$98,$00,$A0,$00,$A8 ; F5A1 00 90 00 98 00 A0 00 A8  ........
        .byte   $00,$B0,$00,$B8,$00,$C0,$00,$C8 ; F5A9 00 B0 00 B8 00 C0 00 C8  ........
        .byte   $00,$D0,$00,$D8,$00,$E0,$00,$E8 ; F5B1 00 D0 00 D8 00 E0 00 E8  ........
        .byte   $00,$F0,$00,$F8,$00,$00         ; F5B9 00 F0 00 F8 00 00        ......



LF5BF:
        .byte   $01                             ; F5BF 01                       .
LF5C0:
        .byte   $00,$02,$02,$02,$02,$02,$00,$02 ; F5C0 00 02 02 02 02 02 00 02  ........
        .byte   $02,$02,$02,$02,$00,$02,$02,$02 ; F5C8 02 02 02 02 00 02 02 02  ........
        .byte   $02,$02,$00,$02,$02,$02,$02,$02 ; F5D0 02 02 00 02 02 02 02 02  ........
        .byte   $00,$02,$02,$02,$02,$02,$00,$02 ; F5D8 00 02 02 02 02 02 00 02  ........
        .byte   $00,$19,$08,$18,$08,$18,$08,$18 ; F5E0 00 19 08 18 08 18 08 18  ........
        .byte   $00,$19,$08,$18,$08,$18,$08,$18 ; F5E8 00 19 08 18 08 18 08 18  ........
        .byte   $04,$46,$02,$46,$04,$46,$04,$46 ; F5F0 04 46 02 46 04 46 04 46  .F.F.F.F
        .byte   $02,$46,$04,$46,$04,$46,$02,$46 ; F5F8 02 46 04 46 04 46 02 46  .F.F.F.F
; ----------------------------------------------------------------------------
LF600:
        ldx     #$00                            ; F600 A2 00                    ..
        ldy     #$00                            ; F602 A0 00                    ..
:       bit     PPUSTATUS                           ; F604 2C 02 20                 ,. 
        bvc     :-                           ; F607 50 FB                    P.
        bvs     LF611                           ; F609 70 06                    p.
LF60B:
        ldy     LF5BF,x                         ; F60B BC BF F5                 ...
LF60E:
        dey                                     ; F60E 88                       .
        bne     LF60E                           ; F60F D0 FD                    ..
LF611:
        lda     BGDataPage1+1,x                         ; F611 BD 01 04                 ...
        sta     PPUSCROLL                           ; F614 8D 05 20                 .. 
        lda     #$00                            ; F617 A9 00                    ..
        sta     PPUSCROLL                           ; F619 8D 05 20                 .. 
        lda     Joy1Inputs                           ; F61C AD 30 03                 .0.
        and     #(JOY_LEFT|JOY_RIGHT)                            ; F61F 29 C0                    ).
        beq     LF655                           ; F621 F0 32                    .2
        bpl     LF63E                           ; F623 10 19                    ..
        jmp     LF628                           ; F625 4C 28 F6                 L(.

; ----------------------------------------------------------------------------
LF628:
        lda     BGDataPage1,x                         ; F628 BD 00 04                 ...
        clc                                     ; F62B 18                       .
        adc     LF580,x                         ; F62C 7D 80 F5                 }..
        sta     BGDataPage1,x                         ; F62F 9D 00 04                 ...
        lda     BGDataPage1+1,x                         ; F632 BD 01 04                 ...
        adc     LF581,x                         ; F635 7D 81 F5                 }..
        sta     BGDataPage1+1,x                         ; F638 9D 01 04                 ...
        jmp     LF66E                           ; F63B 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF63E:
        nop                                     ; F63E EA                       .
        lda     BGDataPage1,x                         ; F63F BD 00 04                 ...
        sec                                     ; F642 38                       8
        sbc     LF580,x                         ; F643 FD 80 F5                 ...
        sta     BGDataPage1,x                         ; F646 9D 00 04                 ...
        lda     BGDataPage1+1,x                         ; F649 BD 01 04                 ...
        sbc     LF581,x                         ; F64C FD 81 F5                 ...
        sta     BGDataPage1+1,x                         ; F64F 9D 01 04                 ...
        jmp     LF66E                           ; F652 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF655:
        bne     LF657                           ; F655 D0 00                    ..
LF657:
        nop                                     ; F657 EA                       .
        lda     BGDataPage1,x                         ; F658 BD 00 04                 ...
        clc                                     ; F65B 18                       .
        adc     LF580,x                         ; F65C 7D 80 F5                 }..
        sta     $0460,y                         ; F65F 99 60 04                 .`.
        lda     BGDataPage1+1,x                         ; F662 BD 01 04                 ...
        adc     LF581,x                         ; F665 7D 81 F5                 }..
        sta     $0460,y                         ; F668 99 60 04                 .`.
        jmp     LF66E                           ; F66B 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF66E:
        ldy     LF5C0,x                         ; F66E BC C0 F5                 ...
        inx                                     ; F671 E8                       .
        inx                                     ; F672 E8                       .
        cpx     #$40                            ; F673 E0 40                    .@
        bcs     LF695                           ; F675 B0 1E                    ..
        lda     LF696,y                         ; F677 B9 96 F6                 ...
        sta     $0462                           ; F67A 8D 62 04                 .b.
        lda     LF697,y                         ; F67D B9 97 F6                 ...
        sta     $0463                           ; F680 8D 63 04                 .c.
        jmp     ($0462)                         ; F683 6C 62 04                 lb.

; ----------------------------------------------------------------------------
        nop                                     ; F686 EA                       .
        nop                                     ; F687 EA                       .
        nop                                     ; F688 EA                       .
        cmp     $00                             ; F689 C5 00                    ..
        jmp     LF60B                           ; F68B 4C 0B F6                 L..

; ----------------------------------------------------------------------------
        .byte   $EA                             ; F68E EA                       .
; ----------------------------------------------------------------------------
        nop                                     ; F68F EA                       .
        nop                                     ; F690 EA                       .
        nop                                     ; F691 EA                       .
        jmp     LF60B                           ; F692 4C 0B F6                 L..

; ----------------------------------------------------------------------------
LF695:
        rts                                     ; F695 60                       `

; ----------------------------------------------------------------------------
LF696:
        .byte   $88                             ; F696 88                       .
LF697:
        .byte   $F6,$8F,$F6,$87,$F6,$8E,$F6,$86 ; F697 F6 8F F6 87 F6 8E F6 86  ........
        .byte   $F6 ; F69F F6

CopyTextPause:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "             PAUSE              "
        
        .byte $00,$00,$00,$00 ; F6BF 20 20 20 20 00 00 00 00      ....
        .byte   $00,$FF,$FF,$FF,$FF,$FC,$F8,$F0 ; F6C7 00 FF FF FF FF FC F8 F0  ........
        .byte   $E3,$00,$00,$00,$00,$00,$00,$00 ; F6CF E3 00 00 00 00 00 00 00  ........
        .byte   $00,$87,$E1,$C0,$00,$00,$00,$80 ; F6D7 00 87 E1 C0 00 00 00 80  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; F6DF 00 00 00 00 00 00 00 00  ........
        .byte   $00,$EF,$8E,$88,$00,$00,$00,$00 ; F6E7 00 EF 8E 88 00 00 00 00  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; F6EF 00 00 00 00 00 00 00 00  ........
        .byte   $00,$FF,$0F,$03,$07,$03,$00,$00 ; F6F7 00 FF 0F 03 07 03 00 00  ........
        .byte   $00
        
        

; WorldMapData:
; first byte is top left of the map, descends in Y order, each line is full height of the map.
.byte $78,$78,$47,$48,$46,$49,$47,$48,$73,$34,$80,$3F,$80,$80,$80,$80,$3C,$1E,$82,$05,$35,$23,$20,$13
.byte $40,$41,$43,$40,$49,$4A,$60,$78,$73,$1B,$24,$80,$80,$80,$80,$2F,$3D,$1D,$0D,$06,$36,$05,$35,$31
.byte $78,$42,$44,$40,$45,$48,$65,$67,$64,$74,$72,$3A,$80,$10,$13,$80,$80,$3C,$08,$09,$28,$03,$36,$23
.byte $78,$4B,$4C,$7A,$71,$63,$66,$61,$71,$63,$66,$34,$2C,$08,$31,$80,$80,$3D,$1D,$30,$06,$81,$37,$35
.byte $78,$4B,$4D,$69,$07,$0B,$1A,$2A,$0A,$1A,$2A,$80,$80,$11,$32,$80,$80,$80,$11,$33,$09,$19,$29,$39
.byte $78,$4E,$56,$6A,$72,$1B,$24,$80,$80,$80,$80,$0F,$80,$80,$80,$80,$0E,$80,$80,$80,$11,$21,$1D,$82
.byte $78,$4F,$55,$59,$64,$74,$72,$1B,$14,$24,$80,$1F,$80,$80,$0F,$80,$80,$80,$80,$80,$80,$80,$3C,$1E
.byte $78,$50,$57,$58,$5A,$78,$64,$62,$62,$72,$3A,$3F,$80,$80,$1F,$0E,$80,$80,$0E,$80,$80,$80,$3D,$1D
.byte $45,$51,$54,$65,$71,$67,$78,$78,$78,$73,$5F,$80,$80,$80,$3F,$0E,$80,$80,$2F,$80,$80,$80,$80,$11
.byte $41,$52,$53,$73,$0B,$76,$78,$78,$65,$66,$31,$80,$80,$80,$80,$2F,$2F,$80,$80,$80,$0F,$80,$80,$80
.byte $65,$71,$63,$66,$3B,$61,$71,$63,$66,$30,$23,$20,$13,$80,$80,$80,$80,$80,$80,$80,$80,$80,$0F,$80
.byte $66,$30,$21,$12,$80,$11,$12,$22,$21,$33,$05,$35,$31,$80,$80,$80,$80,$10,$20,$13,$80,$80,$1F,$80
.byte $21,$32,$80,$80,$04,$24,$80,$80,$80,$2C,$06,$36,$23,$13,$80,$80,$2D,$05,$35,$31,$80,$80,$3F,$80
.byte $80,$80,$2F,$2C,$05,$35,$3A,$0E,$2F,$2C,$09,$28,$35,$31,$80,$0E,$2E,$09,$39,$31,$80,$80,$80,$80
.byte $80,$80,$0E,$2C,$09,$39,$34,$3F,$80,$80,$3C,$06,$36,$31,$80,$2F,$80,$11,$21,$32,$80,$2F,$80,$80
.byte $80,$80,$80,$80,$0A,$2A,$80,$80,$80,$80,$3D,$09,$39,$31,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
.byte $80,$80,$80,$80,$10,$20,$20,$20,$13,$80,$80,$11,$21,$32,$80,$80,$80,$80,$0E,$80,$80,$80,$80,$80
.byte $80,$80,$80,$2D,$6B,$70,$62,$72,$31,$80,$2F,$80,$80,$80,$80,$0E,$80,$80,$1F,$80,$80,$10,$20,$13
.byte $80,$0F,$80,$2E,$61,$67,$78,$73,$5E,$80,$80,$80,$80,$0F,$80,$2F,$80,$80,$2F,$80,$2D,$05,$35,$31
.byte $80,$1F,$80,$80,$22,$61,$71,$66,$34,$80,$80,$0F,$80,$1F,$80,$80,$0E,$80,$80,$10,$20,$09,$39,$23
.byte $80,$2F,$80,$04,$24,$0A,$1A,$2A,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$10,$5D,$0D,$82,$82,$82
.byte $80,$80,$2D,$6B,$72,$1B,$24,$80,$04,$24,$10,$13,$80,$80,$80,$80,$80,$10,$5D,$08,$82,$05,$15,$25
.byte $0F,$80,$5B,$76,$64,$74,$72,$5C,$6B,$62,$72,$23,$13,$80,$80,$0E,$2D,$05,$15,$25,$35,$06,$81,$81
.byte $1F,$2C,$6B,$77,$78,$78,$69,$07,$76,$78,$64,$72,$31,$80,$80,$80,$2E,$09,$02,$81,$37,$03,$81,$81
.byte $3F,$80,$76,$78,$78,$78,$6A,$70,$77,$78,$78,$73,$31,$80,$80,$80,$80,$22,$09,$19,$02,$38,$19,$29
.byte $80,$2C,$76,$78,$78,$78,$78,$78,$78,$78,$78,$73,$31,$80,$80,$80,$1F,$80,$11,$08,$09,$39,$05,$15
.byte $80,$2D,$76,$65,$75,$63,$67,$78,$78,$78,$78,$73,$31,$80,$80,$80,$2F,$80,$10,$0D,$00,$08,$06,$81
.byte $80,$2E,$61,$79,$72,$30,$61,$67,$78,$78,$65,$66,$31,$80,$80,$80,$10,$20,$05,$15,$25,$35,$06,$81
.byte $80,$80,$3C,$76,$73,$31,$11,$61,$71,$63,$66,$68,$31,$80,$10,$20,$05,$15,$03,$81,$81,$36,$09,$81
.byte $80,$80,$3D,$61,$66,$31,$80,$11,$21,$1D,$30,$21,$32,$2D,$05,$35,$06,$81,$81,$81,$81,$37,$26,$81
.byte $80,$0F,$80,$11,$21,$32,$2F,$80,$80,$22,$32,$80,$80,$2E,$06,$37,$03,$81,$81,$81,$81,$81,$81,$81
.byte $80,$80,$80,$80,$80,$80,$80,$0E,$80,$80,$80,$80,$80,$80,$06,$81,$81,$81,$81,$81,$81,$81,$81,$81

; map attributes
.byte $FF,$FF,$FF,$FF,$AF,$AA,$0A,$AA,$AA,$6A,$55,$66,$0A
.byte $FF,$FF,$FF,$FF,$FF,$AF,$0A,$A6,$AA,$9A,$59,$55,$06
.byte $FF,$FF,$AE,$AA,$AA,$AA,$0A,$AA,$AA,$AA,$9A,$99,$09
.byte $FF,$FF,$FF,$EF,$EE,$AA,$0A,$AA,$AA,$AA,$AA,$AA,$0A
.byte $FF,$FF,$FB,$FF,$FF,$AA,$0A,$AA,$AA,$AA,$AA,$AA,$0A
.byte $BF,$BB,$BA,$BB,$AB,$66,$0A,$AA,$AA,$AA,$AA,$AA,$0A
.byte $AA,$AA,$66,$AA,$AA,$55,$06,$AA,$AA,$55,$AA,$AA,$0A
.byte $AA,$AA,$99,$AA,$AA,$5A,$05,$AA,$AA,$AA,$AA,$AA,$0A
.byte $AA,$AA,$EE,$EE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$0A
.byte $AA,$AA,$FB,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$55,$0A
.byte $AA,$EA,$AE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$96,$66,$06
.byte $AA,$FE,$FF,$AF,$FF,$EF,$AA,$AA,$AA,$55,$55,$55,$05
.byte $AA,$FF,$FF,$FF,$FF,$FF,$AA,$AA,$AA,$9A,$55,$55,$05
.byte $AA,$FF,$BF,$FF,$FF,$FF,$AA,$AA,$AA,$6A,$55,$55,$05
.byte $AA,$FA,$AF,$BA,$BB,$BB,$AA,$6A,$56,$55,$55,$55,$05
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$5A,$55,$55,$55,$55,$05

MapMetaTiles:
.byte $03,$03,$07,$07
.byte $03,$00,$00,$00
.byte $03,$03,$07,$07
.byte $03,$00,$00,$00
.byte $80,$80,$C0,$C0
.byte $80,$00,$00,$00
.byte $80,$80,$C0,$C0
.byte $80,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

; im sure not all of these are the actual metatiles.. but whatever.
EncounterMetaTiles:
.byte $01,$01,$01,$58 ; metatile $00
.byte $FF,$FF,$FF,$FF ; metatile $01
.byte $02,$10,$02,$02 ; metatile $02
.byte $10,$02,$02,$02 ; metatile $03
.byte $11,$08,$11,$18 ; metatile $04
.byte $04,$05,$14,$15 ; metatile $05
.byte $10,$10,$02,$02 ; metatile $06
.byte $8E,$8F,$9E,$9F ; metatile $07
.byte $58,$01,$01,$01 ; metatile $08
.byte $0A,$0B,$1A,$1B ; metatile $09
.byte $09,$11,$19,$11 ; metatile $0A
.byte $06,$07,$19,$11 ; metatile $0B
.byte $06,$07,$39,$11 ; metatile $0C
.byte $01,$01,$58,$01 ; metatile $0D
.byte $68,$69,$01,$01 ; metatile $0E
.byte $01,$01,$68,$69 ; metatile $0F
.byte $0C,$0D,$1C,$1D ; metatile $10
.byte $0E,$0F,$1E,$1F ; metatile $11
.byte $2E,$2F,$29,$11 ; metatile $12
.byte $4C,$4D,$11,$5D ; metatile $13
.byte $11,$28,$11,$18 ; metatile $14
.byte $20,$21,$30,$31 ; metatile $15
.byte $02,$02,$90,$91 ; metatile $16
.byte $80,$80,$81,$81 ; metatile $17
.byte $02,$02,$92,$93 ; metatile $18
.byte $2A,$2B,$3A,$3B ; metatile $19
.byte $29,$11,$19,$11 ; metatile $1A
.byte $16,$17,$11,$18 ; metatile $1B
.byte $16,$17,$11,$38 ; metatile $1C
.byte $48,$49,$03,$03 ; metatile $1D
.byte $48,$59,$03,$03 ; metatile $1E
.byte $78,$79,$68,$69 ; metatile $1F
.byte $2C,$2D,$1C,$1D ; metatile $20
.byte $2E,$2F,$1E,$1F ; metatile $21
.byte $19,$11,$1E,$34 ; metatile $22
.byte $8C,$8D,$9C,$9D ; metatile $23
.byte $11,$28,$11,$38 ; metatile $24
.byte $40,$41,$50,$51 ; metatile $25
.byte $84,$85,$94,$95 ; metatile $26
.byte $86,$87,$96,$97 ; metatile $27
.byte $64,$10,$74,$75 ; metatile $28
.byte $4A,$4B,$5A,$5B ; metatile $29
.byte $29,$11,$39,$11 ; metatile $2A
.byte $25,$26,$11,$11 ; metatile $2B
.byte $11,$11,$12,$13 ; metatile $2C
.byte $11,$11,$3C,$3D ; metatile $2D
.byte $11,$11,$3E,$3F ; metatile $2E
.byte $78,$79,$01,$01 ; metatile $2F
.byte $6C,$6D,$7C,$7D ; metatile $30
.byte $6E,$6F,$7E,$7F ; metatile $31
.byte $5E,$5F,$11,$11 ; metatile $32
.byte $5E,$5F,$4F,$3F ; metatile $33
.byte $27,$07,$11,$11 ; metatile $34
.byte $60,$61,$70,$71 ; metatile $35
.byte $62,$63,$72,$73 ; metatile $36
.byte $64,$65,$74,$75 ; metatile $37
.byte $66,$67,$76,$77 ; metatile $38
.byte $6A,$6B,$7A,$7B ; metatile $39
.byte $16,$24,$11,$11 ; metatile $3A
.byte $16,$07,$12,$13 ; metatile $3B
.byte $19,$11,$1E,$5C ; metatile $3C
.byte $11,$11,$3E,$3F ; metatile $3D
.byte $7C,$5E,$7C,$4F ; metatile $3E
.byte $01,$01,$78,$79 ; metatile $3F
.byte $03,$22,$03,$22 ; metatile $40
.byte $03,$23,$22,$33 ; metatile $41
.byte $22,$32,$23,$03 ; metatile $42
.byte $23,$22,$33,$22 ; metatile $43
.byte $33,$03,$03,$22 ; metatile $44
.byte $03,$22,$03,$23 ; metatile $45
.byte $03,$03,$03,$22 ; metatile $46
.byte $03,$03,$03,$23 ; metatile $47
.byte $32,$33,$03,$03 ; metatile $48
.byte $03,$23,$32,$33 ; metatile $49
.byte $03,$23,$22,$33 ; metatile $4A
.byte $53,$32,$03,$03 ; metatile $4B
.byte $23,$53,$33,$03 ; metatile $4C
.byte $32,$53,$03,$03 ; metatile $4D
.byte $53,$42,$03,$52 ; metatile $4E
.byte $03,$03,$53,$43 ; metatile $4F
.byte $22,$53,$22,$03 ; metatile $50
.byte $53,$33,$03,$03 ; metatile $51
.byte $22,$03,$23,$03 ; metatile $52
.byte $33,$03,$03,$03 ; metatile $53
.byte $23,$32,$33,$03 ; metatile $54
.byte $03,$42,$43,$52 ; metatile $55
.byte $32,$42,$03,$52 ; metatile $56
.byte $23,$03,$33,$22 ; metatile $57
.byte $03,$22,$42,$23 ; metatile $58
.byte $42,$03,$52,$53 ; metatile $59
.byte $52,$33,$03,$03 ; metatile $5A
.byte $11,$35,$44,$45 ; metatile $5B
.byte $54,$55,$44,$45 ; metatile $5C
.byte $36,$37,$03,$03 ; metatile $5D
.byte $6E,$6F,$7E,$46 ; metatile $5E
.byte $25,$47,$11,$57 ; metatile $5F
.byte $23,$03,$33,$03 ; metatile $60
.byte $A2,$A3,$B2,$B3 ; metatile $61
.byte $E0,$E1,$F0,$F1 ; metatile $62
.byte $E2,$E3,$F2,$F3 ; metatile $63
.byte $A8,$A9,$B8,$B9 ; metatile $64
.byte $AA,$AB,$BA,$BB ; metatile $65
.byte $C4,$C5,$D4,$D5 ; metatile $66
.byte $AA,$E6,$AA,$AA ; metatile $67
.byte $01,$01,$01,$E7 ; metatile $68
.byte $E4,$E4,$E5,$E5 ; metatile $69
.byte $AA,$AA,$F6,$F7 ; metatile $6A
.byte $A0,$A1,$B0,$B1 ; metatile $6B
.byte $00,$00,$00,$00 ; metatile $6C
.byte $00,$00,$00,$00 ; metatile $6D
.byte $00,$00,$00,$00 ; metatile $6E
.byte $00,$00,$00,$00 ; metatile $6F
.byte $C0,$C1,$D0,$D1 ; metatile $70
.byte $C2,$C3,$D2,$D3 ; metatile $71
.byte $A4,$A5,$B4,$B5 ; metatile $72
.byte $A6,$A7,$B6,$B7 ; metatile $73
.byte $C8,$C9,$D8,$D9 ; metatile $74
.byte $CA,$CB,$DA,$DB ; metatile $75
.byte $E6,$E6,$A9,$A9 ; metatile $76
.byte $E6,$AA,$AA,$AA ; metatile $77
.byte $AA,$AA,$AA,$AA ; metatile $78
.byte $A8,$E6,$B8,$B9 ; metatile $79
.byte $AA,$AA,$F4,$F5 ; metatile $7A
.byte $00,$00,$00,$00 ; metatile $7B
.byte $00,$00,$00,$00 ; metatile $7C
.byte $04,$04,$02,$02 ; metatile $7D
.byte $05,$04,$02,$02 ; metatile $7E
.byte $05,$05,$02,$02 ; metatile $7F
.byte $01,$01,$01,$01 ; metatile $80
.byte $02,$02,$02,$02 ; metatile $81
.byte $03,$03,$03,$03 ; metatile $82
.byte $6C,$6D,$7C,$7D ; metatile $83
.byte $6E,$6F,$7E,$7F ; metatile $84
.byte $8C,$8D,$9C,$9D ; metatile $85
.byte $8E,$8F,$9E,$9F ; metatile $86
.byte $08,$09,$18,$19 ; metatile $87
.byte $50,$51,$53,$54 ; metatile $88
.byte $01,$01,$01,$28 ; metatile $89
.byte $01,$01,$10,$11 ; metatile $8A
.byte $20,$21,$30,$31 ; metatile $8B
.byte $AC,$AD,$BC,$BD ; metatile $8C
.byte $AE,$AF,$BE,$BF ; metatile $8D
.byte $02,$02,$CC,$CD ; metatile $8E
.byte $02,$02,$CE,$CF ; metatile $8F
.byte $32,$33,$25,$25 ; metatile $90
.byte $34,$35,$25,$25 ; metatile $91
.byte $36,$37,$25,$25 ; metatile $92
.byte $01,$01,$26,$27 ; metatile $93
.byte $22,$23,$25,$25 ; metatile $94
.byte $24,$33,$25,$25 ; metatile $95
.byte $38,$39,$25,$25 ; metatile $96
.byte $3A,$02,$25,$25 ; metatile $97
.byte $02,$02,$25,$25 ; metatile $98
.byte $02,$3F,$25,$25 ; metatile $99
.byte $01,$01,$01,$29 ; metatile $9A
.byte $1A,$1B,$2A,$2B ; metatile $9B
.byte $01,$01,$01,$0B ; metatile $9C
.byte $01,$01,$0C,$0D ; metatile $9D
.byte $1C,$1D,$02,$2D ; metatile $9E
.byte $1E,$01,$2E,$2F ; metatile $9F
.byte $38,$02,$25,$25 ; metatile $A0
.byte $2C,$33,$25,$25 ; metatile $A1
.byte $23,$24,$25,$25 ; metatile $A2
.byte $44,$01,$02,$55 ; metatile $A3
.byte $40,$41,$02,$02 ; metatile $A4
.byte $01,$45,$52,$02 ; metatile $A5
.byte $59,$01,$47,$45 ; metatile $A6
.byte $01,$01,$46,$40 ; metatile $A7
.byte $01,$01,$41,$01 ; metatile $A8
.byte $02,$52,$02,$02 ; metatile $A9
.byte $01,$01,$43,$44 ; metatile $AA
.byte $55,$01,$02,$56 ; metatile $AB
.byte $01,$01,$57,$58 ; metatile $AC
.byte $01,$01,$59,$5A ; metatile $AD
.byte $01,$01,$45,$46 ; metatile $AE
.byte $01,$4C,$5B,$02 ; metatile $AF
.byte $01,$01,$01,$3C ; metatile $B0
.byte $53,$54,$3D,$3E ; metatile $B1
.byte $01,$01,$50,$51 ; metatile $B2
.byte $48,$02,$02,$02 ; metatile $B3
.byte $4D,$4E,$5D,$5E ; metatile $B4
.byte $4F,$59,$5F,$02 ; metatile $B5
.byte $46,$40,$02,$02 ; metatile $B6
.byte $00,$00,$00,$00 ; metatile $B7
.byte $00,$00,$00,$00 ; metatile $B8
.byte $00,$00,$00,$00 ; metatile $B9
.byte $00,$00,$00,$00 ; metatile $BA
.byte $00,$00,$00,$00 ; metatile $BB
.byte $00,$00,$00,$00 ; metatile $BC
.byte $00,$00,$00,$00 ; metatile $BD
.byte $00,$00,$00,$00 ; metatile $BE
.byte $00,$00,$00,$00 ; metatile $BF
.byte $66,$66,$66,$66 ; metatile $C0
.byte $66,$66,$40,$00 ; metatile $C1
.byte $00,$00,$00,$00 ; metatile $C2
.byte $00,$00,$00,$00 ; metatile $C3
.byte $66,$66,$66,$66 ; metatile $C4
.byte $66,$64,$30,$00 ; metatile $C5
.byte $00,$00,$00,$00 ; metatile $C6
.byte $00,$00,$00,$00 ; metatile $C7
.byte $66,$66,$66,$66 ; metatile $C8
.byte $66,$64,$00,$00 ; metatile $C9
.byte $00,$00,$00,$36 ; metatile $CA
.byte $66,$66,$30,$00 ; metatile $CB
.byte $66,$66,$66,$66 ; metatile $CC
.byte $66,$63,$00,$00 ; metatile $CD
.byte $00,$00,$36,$66 ; metatile $CE
.byte $66,$66,$66,$40 ; metatile $CF
.byte $66,$66,$B6,$66 ; metatile $D0
.byte $63,$00,$36,$63 ; metatile $D1
.byte $46,$63,$36,$66 ; metatile $D2
.byte $66,$66,$66,$43 ; metatile $D3
.byte $66,$66,$33,$66 ; metatile $D4
.byte $66,$64,$36,$63 ; metatile $D5
.byte $46,$66,$33,$66 ; metatile $D6
.byte $66,$64,$44,$30 ; metatile $D7
.byte $66,$66,$33,$66 ; metatile $D8
.byte $66,$63,$03,$30 ; metatile $D9
.byte $46,$66,$33,$66 ; metatile $DA
.byte $66,$66,$40,$00 ; metatile $DB
.byte $66,$66,$30,$36 ; metatile $DC
.byte $66,$63,$00,$00 ; metatile $DD
.byte $46,$66,$30,$3A ; metatile $DE
.byte $66,$66,$64,$00 ; metatile $DF
.byte $66,$66,$30,$36 ; metatile $E0
.byte $66,$64,$00,$00 ; metatile $E1
.byte $34,$43,$03,$66 ; metatile $E2
.byte $66,$66,$64,$00 ; metatile $E3
.byte $33,$66,$30,$36 ; metatile $E4
.byte $66,$43,$00,$00 ; metatile $E5
.byte $00,$00,$03,$66 ; metatile $E6
.byte $66,$66,$64,$30 ; metatile $E7
.byte $03,$66,$30,$03 ; metatile $E8
.byte $34,$46,$66,$30 ; metatile $E9
.byte $00,$00,$04,$66 ; metatile $EA
.byte $66,$66,$64,$30 ; metatile $EB
.byte $00,$33,$00,$00 ; metatile $EC
.byte $00,$46,$66,$66 ; metatile $ED
.byte $40,$00,$03,$46 ; metatile $EE
.byte $66,$66,$64,$00 ; metatile $EF
.byte $00,$00,$00,$00 ; metatile $F0
.byte $00,$34,$46,$66 ; metatile $F1
.byte $40,$00,$00,$34 ; metatile $F2
.byte $44,$44,$43,$00 ; metatile $F3
.byte $00,$46,$40,$00 ; metatile $F4
.byte $00,$00,$34,$44 ; metatile $F5
.byte $30,$00,$00,$00 ; metatile $F6
.byte $00,$00,$00,$00 ; metatile $F7
.byte $00,$34,$30,$00 ; metatile $F8
.byte $00,$00,$00,$00 ; metatile $F9
.byte $00,$00,$00,$00 ; metatile $FA
.byte $00,$00,$46,$66 ; metatile $FB
.byte $00,$00,$00,$00 ; metatile $FC
.byte $00,$00,$00,$00 ; metatile $FD
.byte $00,$00,$00,$00 ; metatile $FE
.byte $00,$00,$46,$66 ; metatile $FF
.byte $30,$00,$00,$00 ; metatile $100
.byte $00,$00,$00,$00 ; metatile $101
.byte $00,$00,$00,$00 ; metatile $102
.byte $00,$04,$66,$66 ; metatile $103
.byte $44,$30,$00,$00 ; metatile $104
.byte $00,$04,$66,$40 ; metatile $105
.byte $00,$00,$04,$66 ; metatile $106
.byte $30,$04,$66,$66 ; metatile $107
.byte $46,$64,$40,$00 ; metatile $108
.byte $00,$04,$66,$40 ; metatile $109
.byte $00,$00,$44,$66 ; metatile $10A
.byte $64,$46,$66,$66 ; metatile $10B
.byte $66,$64,$30,$00 ; metatile $10C
.byte $00,$03,$44,$30 ; metatile $10D
.byte $00,$04,$46,$66 ; metatile $10E
.byte $66,$66,$66,$66 ; metatile $10F
.byte $66,$66,$64,$00 ; metatile $110
.byte $00,$00,$00,$00 ; metatile $111
.byte $00,$04,$66,$66 ; metatile $112
.byte $66,$66,$66,$66 ; metatile $113
.byte $46,$66,$64,$00 ; metatile $114
.byte $00,$00,$00,$00 ; metatile $115
.byte $04,$66,$66,$66 ; metatile $116
.byte $66,$66,$66,$66 ; metatile $117
.byte $46,$66,$64,$30 ; metatile $118
.byte $00,$00,$00,$00 ; metatile $119
.byte $04,$66,$66,$66 ; metatile $11A
.byte $66,$66,$66,$66 ; metatile $11B
.byte $44,$46,$64,$44 ; metatile $11C
.byte $40,$00,$00,$00 ; metatile $11D
.byte $04,$44,$66,$66 ; metatile $11E
.byte $66,$66,$66,$66 ; metatile $11F

AwardPointsTable:
        .byte  $00,$00,$00,$00,$00,$01
        .byte  $00,$00,$00,$00,$00,$02
        .byte  $00,$00,$00,$00,$00,$03
        .byte  $00,$00,$00,$00,$00,$04
        .byte  $00,$00,$00,$00,$00,$05
        .byte  $00,$00,$00,$00,$00,$08
        .byte  $00,$00,$00,$00,$01,$00
        .byte  $00,$00,$00,$00,$01,$05
        .byte  $00,$00,$00,$00,$02,$00
        .byte  $00,$00,$00,$00,$03,$00
        .byte  $00,$00,$00,$00,$05,$00
        .byte  $00,$00,$00,$00,$08,$00
        .byte  $00,$00,$00,$01,$00,$00
        .byte  $00,$00,$00,$01,$05,$00
        .byte  $00,$00,$00,$02,$00,$00
        .byte  $00,$00,$00,$03,$00,$00
        .byte  $00,$00,$00,$05,$00,$00
        .byte  $00,$00,$01,$00,$00,$00

.byte   $70,$FF,$FF,$FF,$3C,$3C
.byte   $3C,$FC,$FC,$FC,$F8,$E0
.byte   $DF,$DF

.segment "VECTORS"
.word VNMI
.word VBOOT
.word VIRQ

; End of "game" segment
; ----------------------------------------------------------------------------
.code

