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


NextBGUpdate          = $0303
PendingBGUpdates      = $0304
CheatsEnabled         = $0308
SoundtestSelected     = $00

; this flag is raised during NMI.
; it's used in the main loops of each screen
; to delay until NMI has been raised.
NMIRaisedFlag         = $0301

UseHighPPUNametables  = $0323
RNG0                  = $0324
RNG1                  = $0325
Joy1Inputs            = $0330
Joy1Pressed           = $0332
Joy2Inputs            = $0331
Joy2Pressed           = $0333

EncounterModifier     = $0340


; these previous x/y positions are used when jaws or the player is unloaded.
; that way we can restore them to roughly the correct location when needed.
JawsStashedX          = $0348 ; 8 bit approximation of jaws last X coord
JawsStashedY          = $0349 ; 8 bit approximation of jaws last Y coord
PlayerStashedX        = $038C ; 8 bit approximation of jaws last X coord
PlayerStashedY        = $038D ; 8 bit approximation of jaws last Y coord

ShowStatusBarTextLine = $0305
EventFlags            = $0306

EventFlagsMapEnterPort = %00000001
EventFlagsMapTriggerEncounter = %00000100

EventFlagsEncounterJawsDead   = %00100000
EventFlagsEncounterFinished   = %01000000
EventFlagsEncounterPlayerDead = %10000000

HighScore             = $0350
CurrentScore          = $0380

EnemySettingsPtr = $0482
EnemyPatternIndex = $0481
EnemyPatternTiming = $0484
EnemyPatternUnused1 = $0485
EnemyNextPatternTiming = $0486

EncounterMaxDepth     = $033E ; 16 bit
WaterHeight           = $033C ; 16 bit
JawsDamagedByProjectileType = $034A
WaterAnimationFrame   = $031B
WaterAnimationTimer   = $031A

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
MapScrollX            = $0328
MapScrollY            = $032A
; there seems to be a duplicate of the scroll position
; stored here. not quite sure why.
MapScrollXCopy        = $032C


ActivePalette         = $046F

VRAMBufferActive      = $0100
VRAMBufferOffset      = $0101
VRAMBuffer            = $0102



EntityData            = $0680 ; 680 - 87F
PlayerData            = EntityData
FirstNonPlayerEntity  = EntityData + ( 1 * $20)
PlayerProjectile1Data = FirstNonPlayerEntity
PlayerProjectile2Data = EntityData + ( 2 * $20)
PlayerProjectile3Data = EntityData + ( 3 * $20)
JawsData              = EntityData + ( 4 * $20)
Enemy1Data            = JawsData
Enemy2Data            = EntityData + ( 5 * $20)
MaxEnemies            = $05
MaxEntities           = $08
EntityDataSize        = $20


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

TrackerTimer          = $0345
TrackerAnimationIndex = $0342
TrackerAnimationTimer = $0343
TrackerDistancePrev   = $0344
TrackerDistanceNext   = $0346


PlayerNumberOfLives   = $0387
PlayerHasSubmarine    = $038A
PlayerHasTracker      = $0341
PlayerNextActivePort  = $034D
PlayerShellCount      = $0390
PlayerPowerLevel      = $0391
PlayerCrabLevel       = $0392
PlayerStrobeCount     = $0393

PowerLevelShellCost   = $034C


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

EntityHeader          = $00
EntityType            = $01
EntityX               = $02 ; 16 bit
EntityY               = $04 ; 16 bit
EntitySpritesetPtr    = $06 ; 16 bit
EntityAnimPtr         = $08 ; 16 bit
EntityAnimOffset      = $0A
EntityAnimTimer       = $0B
EntityBBoxW           = $0E
EntityBBoxH           = $0F
EntityXSubpixel       = $0C
EntityYSubpixel       = $0D
EntityXSubspeed       = $10
EntityXSpeed          = $11
EntityYSubspeed       = $12
EntityYSpeed          = $13
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


EntityTypeParachuteBomb     = $04

EntityHeaderActive          = %10000000
EntityHeader7               = %01000000
EntityHeader6               = %00100000
EntityHeaderFacingLeft      = %00010000
EntityHeader2               = %00000010
EntityHeader1               = %00000001


DrawStatusbarScoreFlag          = %10000000
DrawStatusbarJawsPowerFlag      = %01000000
DrawBGEncounterWater            = %00100000
DrawVRAMBufferFlag              = %00010000
DrawStatusbarShellsFlag         = %00001000

; ---

JOY_A                 = %00000001
JOY_B                 = %00000010
JOY_SELECT            = %00000100
JOY_START             = %00001000
JOY_UP                = %00010000
JOY_DOWN              = %00100000
JOY_LEFT              = %01000000
JOY_RIGHT             = %10000000

VRAMFlagMultipleBytes = %10000000

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
        sta CheatsEnabled
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
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
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
        jsr SetNextPendingBGUpdate
        lda #(JOY_START)
        bit Joy1Pressed
        ; keep looping until player presses start
        beq @TitleScreenMainLoop
        rts

; ----------------------------------------------------------------------------
Soundtest:
        bit CheatsEnabled
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
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
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
        sta PlayerNextActivePort
        sta PlayerHasTracker
        sta MapSubmarineVisible
        sta PlayerHasSubmarine
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
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        jsr PPUClear
        jsr DrawStatusLine
        bit PlayerHasTracker
        bmi @RunMapScreenWithTracker
        jsr DrawStatusLine_PowerLabel
        jmp @RunMapScreenContinue
@RunMapScreenWithTracker:
        lda #$80
        sta PlayerHasTracker
        sta TrackerDistancePrev
        sta TrackerDistanceNext
        lda #RomGraphicsTrackerIcon
        jsr DrawRomGraphics
@RunMapScreenContinue:
        jsr ClearEntityMemory
        lda #$00
        sta EventFlags
        jsr UnstashPlayerLocation
        jsr MapSetPlayerActive
        lda #PaletteMapScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #CHRMapScreen
        sta ActiveCHR
        jsr MapRunCamera
        jsr MapSetStartingScroll
        lda #$01
        sta NMISpriteHandlingDisabled
        sta ShowStatusBarTextLine
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        lda #MusicMapScreen
        jsr SoundPlay
        jsr WaitFor1Frame
MapScreenMainLoop:
        jsr ReadJoypads
        jsr MapRunJaws
        jsr MapRunPlayer
        jsr MapShowSubmarine
        jsr MapRunCamera
        jsr MapUpdateScroll
        jsr UpdateEntitySprites
        lda #$00
        sta EncounterJawsActive
        lda EventFlags
        lsr a
        bcc @CheckEnterPort
        jmp RunEncounterScreen
@CheckEnterPort:
        lsr a
        bcc @CheckEnterEncounter
        jmp RunPortScreen
@CheckEnterEncounter:
        lsr a
        bcc @CheckNeedMoreConchShells
        inc EncounterJawsActive
        lda JawsData + EntityHeader
        and #$01
        beq RunEncounterScreen
        inc EncounterJawsActive
        jmp RunEncounterScreen
@CheckNeedMoreConchShells:
        lsr a
        bcc @CheckForPause
        jmp MapShowConchShellsMessage
@CheckForPause:
        lda #(JOY_START)
        bit Joy1Pressed
        bne @PauseGameInMap
        jsr MapRunJawsTracker
        jsr SetNextPendingBGUpdate
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jmp MapScreenMainLoop
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
@WaitForUnpause:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr SetNextPendingBGUpdate
        jsr ReadJoypads
        lda #(JOY_START)
        bit Joy1Pressed
        bne @Unpause
        ldy #$02
        jsr WaitForYSpins
        jmp @WaitForUnpause
@Unpause:
        lda #$00
        sta $4A
        lda #$01
        sta ShowStatusBarTextLine         
        bit CheatsEnabled
        bpl @ReturnToMainLoop
        ; pressing A and B on joypad 2
        ; triggers an encounter
        lda Joy2Inputs
        and #(JOY_A | JOY_B)
        bne @TriggerEncounter
@ReturnToMainLoop:
        jmp MapScreenMainLoop
@TriggerEncounter:
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
        lda #$81
        sta ShowStatusBarTextLine
        lda #$01
        sta NMISpriteHandlingDisabled
@DelayUntilSoundStops:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr SetNextPendingBGUpdate
        ldy #$02
        jsr WaitForYSpins
        lda $0574
        bmi @DelayUntilSoundStops
        ; run encounter
        lda #$01
        sta ShowStatusBarTextLine
        jsr PPUDisableNMI
        lda #SFXSTOP
        jsr SoundPlay
        jsr PPUDisableRendering
        jsr StashPlayerLocation
        jsr StashJawsLocation
        jsr ClearEntityMemory
        lda #$00
        sta EventFlags
        jsr EncounterLoadSettings
        lda #$00
        sta SCROLL_X
        lda #$00
        sta CameraX
        lda #$10
        sta CameraX+1
        jsr PrepareEnemySettings
        jsr EncounterRunCamera
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        ; load music based on if the player has the submarine.
        ; always loads the regular encounter music.
        ldx PlayerHasSubmarine
        lda EncounterTypeMusic,x
        jsr SoundPlay
        lda #$00
        sta NMIRaisedFlag
@EncounterMainLoop:
        jsr ReadJoypads
        jsr EncounterRunPlayer
        jsr EncounterRunProjectiles
        jsr EncounterRunJaws
        jsr EncounterRunEnemies
        jsr EncounterRunCamera
        jsr UpdateEntitySprites
        lda EventFlags
        and #(EventFlagsEncounterJawsDead | EventFlagsEncounterPlayerDead | EventFlagsEncounterFinished)
        bne @EncounterEnding
        lda #(JOY_START)
        bit Joy1Pressed
        bne @PauseGameInEncounter
        jsr RefreshPPUState
        jsr AdvanceWaterAnimation
        jsr SetNextPendingBGUpdate
        jmp @EncounterMainLoop
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
@PauseLoop:                   
        jsr RefreshPPUState
        jsr SetNextPendingBGUpdate
        jsr WaitFor1Frame
        jsr ReadJoypads
        lda #(JOY_START)
        bit Joy1Pressed
        bne @Unpause
        ldy #$02
        jsr WaitForYSpins
        jmp @PauseLoop
@Unpause:
        lda #$00
        sta $4A
        lda #$01
        sta ShowStatusBarTextLine
        bit CheatsEnabled
        bpl @EncounterMainLoop
        ; check for joypad 2 A+B press
        ; give 9 lives if found
        lda Joy2Inputs
        and #(JOY_A | JOY_B)
        beq @EncounterMainLoop
        tax
        dex
        bne @Continue
        lda #EventFlagsEncounterFinished
        sta EventFlags
        jmp @EncounterMainLoop
@Continue:
        dex
        bne @Give9Lives
        lda #EventFlagsEncounterJawsDead
        sta EventFlags
        jmp @EncounterMainLoop
@Give9Lives:
        ; player is cheating, give em some lives!
        lda #$09
        sta PlayerNumberOfLives
        jmp @EncounterMainLoop
@EncounterEnding:
        ; if jaws is dead, go to the finale jaws fight
        lda #EventFlagsEncounterJawsDead
        bit EventFlags
        beq @CheckPlayerDeath
        jmp TransitionToFinaleScreen
@CheckPlayerDeath:
        ; branch away if the player died
        bmi ProcessPlayerDeath
        ; otherwise increment encounter counter
        inc TotalEncountersPlayed
        lda TotalEncountersPlayed
        cmp #$20
        bcc @CheckForBonusScreen
        ; if we reach 32 encounters played, lower the counter to 24.
        lda #$18
        sta TotalEncountersPlayed
@CheckForBonusScreen:
        ; decrement the remaining encounters until bonus screen
        dec BonusScreenEncounterCountdown
        bne @NoBonusScreenYet
        ; otherwise jump to bonus screen and run it.
        ; will return here after the bonus screen is complete.
        jsr RunBonusScreen
        ; reset bonus screen countdown
        lda #$03
        sta BonusScreenEncounterCountdown
        ; increment the bonus screens completed counter.
        ; this is used to give different types of bonus screens,
        ldx BonusScreensPlayed
        inx
        txa
        ; max out at 8.
        and #$07
        sta BonusScreensPlayed
@NoBonusScreenYet:
        ; restore some of jaws health before exiting
        lda JawsHP+1
        clc
        adc #$04
        cmp #>JawsMaxHP
        bcc @DoneRestoringHealth
        lda #<JawsMaxHP
        sta JawsHP
        lda #>JawsMaxHP
@DoneRestoringHealth:
        sta JawsHP+1
        ; and the encounter has completed!
        jmp RunMapScreen

;
; if the player dies by touching something in an encounter,
; we need to run an animation, lower their power/crab levels and life count.
;
ProcessPlayerDeath:
        jsr RunPlayerDeathAnimation
        ; if we're out of lives, show the game over screen.
        dec PlayerNumberOfLives
        beq RunGameOverScreen
        ; otherwise reduce shells by half
        lsr PlayerShellCount
        ; decrease power level by 1 (but dont wrap around..)
        dec PlayerPowerLevel
        bpl @ReduceCrabLevel
        lda #0
        sta PlayerPowerLevel
@ReduceCrabLevel:
        ; decrease crab level by 1 (but dont wrap around..)
        dec PlayerCrabLevel
        bpl @ReturnToGame
        lda #0
        sta PlayerCrabLevel
@ReturnToGame:
        ; jump to the intro screen
        jmp StartGameAfterDeath


RunGameOverScreen:
        jsr PPUDisableNMI
        lda #SFXSTOP
        jsr SoundPlay
        jsr PPUDisableRendering
        jsr ClearScreenAndSprites
        lda #PaletteBlackScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #$00
        sta SCROLL_X
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta ActiveCHR
        lda #$01
        sta NMISpriteHandlingDisabled
        sta ShowStatusBarTextLine
        lda #RomGraphicsGameOverScreen
        jsr DrawRomGraphics
        jsr DrawStatusLine
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        lda #MusicGameOverScreen
        jsr SoundPlay
@DelayUntilSoundFinished:
        jsr WaitFor1Frame
        ldy #$02
        jsr WaitForYSpins
        jsr RefreshPPUState
        bit $05AC
        bmi @DelayUntilSoundFinished
        ; go back to the startup code to show the title screen
        jmp GameStartup

; ----------------------------------------------------------------------------
TransitionToFinaleScreen:
        @TempDelayTime = $13
        lda #$06
        sta @TempDelayTime
@Wait:
        ; refill jaws hp
        lda #>JawsMaxHP
        sta JawsHP+1
        ; mark jaws health to be updated
        lda PendingBGUpdates
        ora #DrawStatusbarJawsPowerFlag
        sta PendingBGUpdates
        ; delay for 10 frames
        lda #$10
        jsr WaitForAFramesAndRefreshPPU
        ; clear jaws hp
        lda #$00
        sta JawsHP+1
        ; mark jaws health to be updated again.
        lda PendingBGUpdates
        ora #DrawStatusbarJawsPowerFlag
        sta PendingBGUpdates
        ; wait for another 18 frames
        lda #$18
        jsr WaitForAFramesAndRefreshPPU
        ; decrement and loop
        dec @TempDelayTime
        bne @Wait
        ; now we can finally go to the finale!
        jsr EnterFinaleScreen
        ; seemingly unused code
        .byte   $A9,$00,$8D,$88,$03,$A9,$14,$8D
        .byte   $89,$03,$A9,$03,$8D,$93,$03,$4C
        .byte   $ED,$82       
                 
; ----------------------------------------------------------------------------

RunPlayerDeathAnimation:
        lda #SFXSTOP
        sta SoundPlay
        lda #EntityHeaderActive
        sta PlayerData + EntityHeader
@Delay:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr @Animate
        jsr UpdateEntitySprites
        bit PlayerData + EntityHeader
        ; wait until the animation is completed
        bmi @Delay
        rts
@Animate:
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityHeader
        bvs @L8644
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$00
        sta Workset + EntityV14
        lda #$20
        sta Workset + EntityV15
        lda #AnimationEncounterPlayerDeath1
        jsr WorksetAnimationPlay
        jmp WorksetSave
@L8644:
        bit Workset + EntityV14
        bmi @L8681
        dec Workset + EntityV15
        beq @RemoveOtherEntities
        jmp WorksetSave
@RemoveOtherEntities:
        ; remove everything but the player entity
        @TempEntityPointer = $44
        lda #<FirstNonPlayerEntity
        sta @TempEntityPointer
        lda #>FirstNonPlayerEntity
        sta @TempEntityPointer+1
        ldy #$00
@NextEntity:
        tya
        ; clear active flag
        sta (@TempEntityPointer),y
        lda @TempEntityPointer
        clc
        ; advance to next entity
        adc #EntityDataSize
        sta @TempEntityPointer
        lda @TempEntityPointer+1
        adc #$00
        sta @TempEntityPointer+1
        cmp #MaxEntities
        bcc @NextEntity
        ; play secondary death animation
        lda #$80
        sta Workset + EntityV14
        lda #AnimationEncounterPlayerDeath2
        jsr WorksetAnimationPlay
        lda #$00
        sta Workset + EntityYSubspeed
        ; make player descend off the screen
        lda #$01
        sta Workset + EntityYSpeed
        jmp WorksetSave
@L8681:
        lda #$01
        bit Workset + EntityV1F
        bne @KeepAnimating
        lda #$00
        sta Workset + EntityHeader
        jmp WorksetSave
@KeepAnimating:
        jsr WorksetAnimationAdvance
        jsr WorksetMoveY
        jmp WorksetSave

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
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        jsr ClearScreenAndSprites
        jsr DrawStatusLine
        lda #RomGraphicsIntroScreen
        jsr DrawRomGraphics
        lda #PaletteIntroScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        jsr PPURenderHorizontal
        lda #$00
        sta SCROLL_X
        sta $0321    ; clear $0321, not used anywhere else
        sta SCROLL_Y
        sta UseHighPPUNametables
        ; disable status bar text
        lda #$01
        sta ShowStatusBarTextLine
        sta NMISpriteHandlingDisabled
        lda #CHREncounterAndIntroScreen
        sta ActiveCHR
        ; set ppu to $2272 and draw lives counter
        lda #$22
        sta PPUADDR
        lda #$72
        sta PPUADDR
        lda PlayerNumberOfLives
        clc
        adc #$60
        ; set ppu to $22B1 and draw score
        sta PPUDATA
        lda #$22
        sta PPUADDR
        lda #$B1
        sta PPUADDR
        jsr DrawHighScore
        ; play music and start scene
        lda #MusicIntroScreen
        jsr SoundPlay
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
@DelayUntilMusicStops:
        lda #$01
        jsr WaitForAFramesAndRefreshPPU
        lda $05AC
        bmi @DelayUntilMusicStops
        rts

; ----------------------------------------------------------------------------
DrawHighScore:
        ldx #$00
@SkipSpaces:
        lda HighScore,x
        bne @DrawNumber
        lda #$00
        sta PPUDATA
        inx
        bpl @SkipSpaces
@DrawNumbers:
        lda HighScore,x
@DrawNumber:
        adc #$60
        sta PPUDATA
        inx
        cpx #$07
        bcc @DrawNumbers
        rts

; ----------------------------------------------------------------------------
PayWithShells:
        lda PlayerShellCount
        sec
        sbc PowerLevelShellCost
        sta PlayerShellCount
        lda PendingBGUpdates
        ora #DrawStatusbarShellsFlag
        sta PendingBGUpdates
        rts

; ----------------------------------------------------------------------------
MapShowConchShellsMessage:
        @TempDelayTime = $12
        lda #SFXPortNeedMoreConchShells
        jsr SoundPlay
        lda #$81
        sta ShowStatusBarTextLine
        jsr CopyToVRAMBuffer
        .addr CopyTextYouNeedMoreConchShells
        lda #$78
        sta @TempDelayTime
@Wait:
        jsr RefreshPPUState
        jsr WaitFor1Frame
        jsr SetNextPendingBGUpdate
        ldy #$02
        jsr WaitForYSpins
        dec @TempDelayTime
        bne @Wait
        lda #$01
        sta ShowStatusBarTextLine
        lda #%00000000
        sta EventFlags
        jsr SoundPlay
        jmp MapScreenMainLoop

CopyTextYouNeedMoreConchShells:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "   YOU NEED MORE CONCH SHELLS.  "

; ----------------------------------------------------------------------------
DrawStatusLine_PowerLabel:
        lda #RomGraphicsStatusPowerLabel
        jsr DrawRomGraphics
        ; set ppu to $2B91, where the "power" label is positioned
        lda #$2B
        sta PPUADDR
        lda #$91
        sta PPUADDR
        ; shift player power level into ascii range
        lda PlayerPowerLevel
        clc
        adc #$31
        sta PPUDATA
        rts

; ----------------------------------------------------------------------------
RunPortScreen:
        lda #MusicPortPowerup
        jsr SoundPlay
        bit PlayerHasTracker
        bpl @RunPortBuyingTracker
        jmp @RunPortBuyingPowerUp
@RunPortBuyingTracker:
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        jsr StashPlayerLocation
        jsr StashJawsLocation
        jsr ClearEntityMemory
        lda #CHRTitleAndBlackScreen
        sta EventFlags
        sta ActiveCHR
        jsr ClearScreenAndSprites
        lda #RomGraphicsGotTrackerScreen
        jsr DrawRomGraphics
        jsr DrawStatusLine
        lda #PaletteBlackScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #$00
        sta SCROLL_X
        sta CameraX
        sta CameraX+1
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta CameraY
        sta CameraY+1
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #AnimationPortTracker
        jsr WorksetAnimationPlay
        lda #$68
        sta Workset + EntityX
        lda #$67
        sta Workset + EntityY
        jsr WorksetSave
        jsr UpdateEntitySprites
        lda #$01
        sta ShowStatusBarTextLine
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        lda #$78
        jsr WaitForAFramesAndRefreshPPU
        jsr CopyToVRAMBuffer
        .addr @TrackerTiles1
        jsr CopyToVRAMBuffer
        .addr @TrackerTiles2
        jsr PayWithShells
        lda #$78
        jsr WaitForAFramesAndRefreshPPU
        lda #$80
        sta PlayerHasTracker
        jmp RunMapScreen
@TrackerTiles1:
        .byte $6F,$2B,$02,$0B,$0C
@TrackerTiles2:
        .byte $8F,$2B,$02,$1B,$1C


; ----------------------------------------------------------------------------
@RunPortBuyingPowerUp:
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        lda PPUCTRL_MIRROR
        and #%11100111            ; disable sprite+bg rendering flags
        sta PPUCTRL_MIRROR
        jsr StashPlayerLocation
        jsr StashJawsLocation
        jsr ClearEntityMemory
        lda #CHRTitleAndBlackScreen
        sta EventFlags
        sta ActiveCHR
        jsr ClearScreenAndSprites
        lda #RomGraphicsPortScreen
        jsr DrawRomGraphics
        jsr DrawStatusLine
        jsr DrawStatusLine_PowerLabel
        lda #PalettePort
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #$00
        sta SCROLL_X
        sta CameraX
        sta CameraX+1
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta CameraY
        sta CameraY+1
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #AnimationPortBoat
        jsr WorksetAnimationPlay
        lda #(EntityHeaderActive | EntityHeader7)
        ; set the background sprite position
        sta Workset + EntityX
        lda #$FF
        sta Workset + EntityX  + 1
        lda #$94
        sta Workset + EntityY
        lda #$00
        sta Workset + EntityY + 1
        lda #$80
        sta Workset + EntityXSubspeed
        lda #$00
        sta Workset + EntityXSpeed
        jsr WorksetSave
        jsr UpdateEntitySprites
        lda #$01
        sta ShowStatusBarTextLine
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
@WaitForBoatToArriveAtPort:
        jsr WaitFor1Frame
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        jsr WorksetMoveX
        jsr WorksetSave
        ; delay until we're in position
        lda Workset + EntityX  + 1
        bmi @Delay
        lda Workset + EntityX
        cmp #$08
        bcs @IncreasePowerLevel
@Delay:
        jsr UpdateEntitySprites
        jsr RefreshPPUState
        jmp @WaitForBoatToArriveAtPort
@IncreasePowerLevel:
        lda PlayerPowerLevel
        cmp #$08
        bcs @PortBuyStrobes
        jsr CopyToVRAMBuffer
        .addr CopyTextPowerLevelRaised
        jsr RefreshPPUState
        lda #$3C
        jsr WaitForAFramesAndRefreshPPU
        inc PlayerPowerLevel
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; set ppu position to $2B91, where the power level is written
        lda #$2B
        sta VRAMBuffer,x
        inx
        lda #$91
        sta VRAMBuffer,x
        inx
        ; add powerlevel up to ascii and draw it
        lda PlayerPowerLevel
        clc
        adc #$31
        sta VRAMBuffer,x
        inx
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
        jsr PayWithShells
        lda #$81
        sta ShowStatusBarTextLine
        lda #$B4
        jsr WaitForAFramesAndRefreshPPU
        lda PPUCTRL_MIRROR
        ora #%00010000                     ; set background table to $1000
        sta PPUCTRL_MIRROR
        lda #$01
        sta ShowStatusBarTextLine
        jmp RunMapScreen

@PortBuyStrobes:
        ; if we were already at max power level,
        ; we'll be buying some strobes instead.
        jsr CopyToVRAMBuffer
        .addr CopyTextCollectOneStrobe
        lda #$81
        sta ShowStatusBarTextLine
        inc PlayerStrobeCount
        lda PlayerStrobeCount
        cmp #$09
        bcc @Skip
        ; max out at 9 strobes.. otherwise just take the players money!
        lda #$09
        sta PlayerStrobeCount
@Skip:
        jsr PayWithShells
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
        
; restores the players coordinates from the stash
UnstashPlayerLocation:
        @Temp1 = $16
        @Temp2 = $17
        lda PlayerStashedX
        jsr SplitByteNybbles
        lda @Temp1
        clc
        adc #$08
        sta PlayerX
        lda @Temp2
        adc #$00
        sta PlayerX+1
        lda PlayerStashedY
        jsr SplitByteNybbles
        lda @Temp1
        clc
        adc #$08
        sta PlayerY
        lda @Temp2
        adc #$00
        sta PlayerY+1
        rts

; store an approximation of the players coordinates in PlayerStashedX and PlayerStashedY
StashPlayerLocation:
        lda PlayerX+1
        lsr a
        lda PlayerX
        ror a
        lsr a
        lsr a
        lsr a
        sta PlayerStashedX
        lda PlayerY+1
        lsr a
        lda PlayerY
        ror a
        lsr a
        lsr a
        lsr a
        sta PlayerStashedY
        rts

; store an approximation of jaws coordinates in JawsStashedX and JawsStashedY
StashJawsLocation:
        lda JawsX+1
        lsr a
        lda JawsX
        ror a
        lsr a
        lsr a
        lsr a
        sta JawsStashedX
        lda JawsY+1
        lsr a
        lda JawsY
        ror a
        lsr a
        lsr a
        lsr a
        sta JawsStashedY
        rts

; ----------------------------------------------------------------------------
VNMI:
        pha
        txa
        pha
        tya
        pha
        lda #$01
        sta NMIRaisedFlag
        lda NMISpriteHandlingDisabled
        beq @RunBGUpdateOrChangePalette
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
@RunBGUpdateOrChangePalette:
        lda #$01
        bit PaletteLoadPending
        beq @RunBGUpdate
        ; if palette load is pending, do that instead of statusbar
        jsr WritePalette
        jmp @Continue
@RunBGUpdate:
        jsr RunBGUpdate
@Continue:
        ; set base nametable to $2000 or $2400
        lda PPUCTRL_MIRROR
        and #%11111101
        tax
        ; if the high nametables flag is set, use nametables $2800 or $2C00
        lda UseHighPPUNametables
        and #$01
        beq @UpdatePPURegisters
        inx
        inx
@UpdatePPURegisters:
        stx PPUCTRL_MIRROR
        stx PPUCTRL
        lda PPUMASK_MIRROR
        sta PPUMASK
        lda PPUSTATUS
        lda SCROLL_X
        sta PPUSCROLL
        lda SCROLL_Y
        sta PPUSCROLL
        ldx ActiveCHR
        lda CHRBANKS,x
        sta CHRBANKS,x
        lda SoundIsPlaying
        bne @Exit
        jsr SoundUpdate
@Exit:
        pla
        tay
        pla
        tax
        pla
        rti

; ----------------------------------------------------------------------------
RunBGUpdate:
        @TempJumpTarget = $0334
        ldx NextBGUpdate
        dex 
        bpl @KeepDrawing
        rts
@KeepDrawing:
        txa
        asl a
        tax
        lda BackgroundItemPointers,x
        sta @TempJumpTarget
        lda BackgroundItemPointers+1,x
        sta @TempJumpTarget+1
        jmp (@TempJumpTarget)

BackgroundItemPointers:
        .addr DrawBGMapRight1
        .addr DrawBGMapRight2
        .addr DrawBGMapLeft1
        .addr DrawBGMapLeft2
        .addr DrawStatusbarScore
        .addr DrawStatusbarJawsPower
        .addr DrawBGWaterAnimation
        .addr DrawVRAMBuffer
        .addr DrawStatusbarShells

; ----------------------------------------------------------------------------
DrawStatusbarScore:
        jsr DrawStatusLine_Score
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawStatusbarJawsPower:
        jsr DrawStatusLine_JawsPower
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGWaterAnimation:
        jsr DrawWaterAnimation
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawStatusbarShells:
        jsr DrawStatusLine_Shells
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
;
; so this will take the index of the highest set bit of 304,
; we then clear that bit in 304 and if it was lower than 5, we set 303 to the bit index + 5.
; this seems like a pretty overcomplicated way of updating the background..
;
SetNextPendingBGUpdate:
        lda NextBGUpdate
        bne @Done
        ldx #$00
        lda #$80
@FindHighestSetBit:
        bit PendingBGUpdates
        bne @BitFound
        inx
        lsr a
        bcc @FindHighestSetBit
        rts
@BitFound:
        ; clear bit
        eor PendingBGUpdates
        sta PendingBGUpdates
        txa
        ; check if out update is in the 1-4 range
        cmp #5
        bcs @Done
        ; if so, add 5 and store it as the next draw value.
        ; this is to skip all of the background map update values.
        adc #5
        sta NextBGUpdate
@Done:
        rts

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

;
; this procedure takes a value from the A register and:
;  - shifts its high nybble into the low nybble of $17
;  - shifts its low nybble in the high nybble of $16
;
; example:
;  lda #$A7
;  jsr SplitByteNybbles
;  lda $16 ; A is now $70
;  lda $17 ; A is not $0A
;
SplitByteNybbles:
        sta $16
        lda #$00
        sta $17
        asl $16
        rol $17
        asl $16
        rol $17
        asl $16
        rol $17
        asl $16
        rol $17
        rts

; ----------------------------------------------------------------------------
WaitFor1Frame:
        lda #$00
        sta NMIRaisedFlag
@Wait:
        ; we enter an infinite loop here, which will be interrupted by the NMI.
        ; once the NMI has occured NMIRaisedFlag will be set, and we can continue.
        lda NMIRaisedFlag
        beq @Wait
        lda #$00
        sta NMIRaisedFlag
        rts

; ----------------------------------------------------------------------------
WaitForYFrames:
        jsr WaitFor1Frame
        dey
        bne WaitForYFrames
        rts

; seemingly unused code?
; ----------------------------------------------------------------------------
        .byte   $A0,$3C,$20,$50,$8C,$CA,$D0,$F8 ; 8C57 A0 3C 20 50 8C CA D0 F8  .< P....
        .byte   $60                             ; 8C5F 60                       `
; ----------------------------------------------------------------------------

; waits for roughly 1300 * Y cycles by calling dex and bne over repeatedly.
WaitForYSpins:
        ldx #$00
@Wait:
        dex
        bne @Wait
        dey
        bne @Wait
        rts

; ----------------------------------------------------------------------------
RNGAdvance:
        clc
        lda RNG1
        and #%00000101
        beq @Carry
        cmp #$05
        bne @Continue
@Carry:
        sec
@Continue:
        rol RNG0
        rol RNG1
        lda RNG1
        and #%00000111
        adc RNG0
        eor #%01011010
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
        asl a
        sta $13
        asl a
        adc $13
        ; add 5 to get ending offset in points table
        adc #$05
        tax
        ; count down from 5 awarding points from the table
        ldy #$05
        clc
@AwardNext:
        lda AwardPointsTable,x
        adc CurrentScore,y
        cmp #$0A
        bcc @Advance
        ; subtract 10 points if the point value reaches 11.
        ; this will carry up to the next byte.
        sbc #$0A
@Advance:
        sta CurrentScore,y
        dex
        dey
        bpl @AwardNext
        lda PendingBGUpdates
        ora #DrawStatusbarScoreFlag
        sta PendingBGUpdates
        ldx #$00
@CheckForNewHighScore:
        ; check if we surpassed the highscore
        lda HighScore,x
        cmp CurrentScore,x
        bcc @FoundNewHighScore
        bne @CheckIfSubmarineShouldSpawn
        inx
        cpx #$06
        bcc @CheckForNewHighScore
        jmp @CheckIfSubmarineShouldSpawn
@FoundNewHighScore:
        ; great news we beat the highscore!
        ; copy our current score over the highscore value.
        ldx #$00
@CopyToHighScore:
        lda CurrentScore,x
        sta HighScore,x
        inx
        cpx #$06
        bcc @CopyToHighScore
@CheckIfSubmarineShouldSpawn:
        ldx #$00
@CheckSubmarineScore:
        lda ScoreForNextSubmarine,x
        cmp CurrentScore,x
        bne @NoSubmarineForNow
        inx
        cpx #$03
        bcc @CheckSubmarineScore
        jmp @SpawnSubmarine
@NoSubmarineForNow:
        bcs @Done
@SpawnSubmarine:
        ; player is already a submarine owner,
        ; lets give the player an extra life.
        lda PlayerHasSubmarine
        bne @GiveExtraLife
        ; there is already a submarine on the map.
        ; lets give the player an extra life.
        lda MapSubmarineVisible
        bne @GiveExtraLife
        ; set submarine to spawn
        lda #$80
        sta MapSubmarineVisible
        jmp @SetupNextSubmarineSpawn
@GiveExtraLife:
        lda #SFXExtraLife
        jsr SoundPlay
        inc PlayerNumberOfLives
        lda PlayerNumberOfLives
        cmp #$0A
        bcc @SetupNextSubmarineSpawn
        lda #$09
        sta PlayerNumberOfLives
@SetupNextSubmarineSpawn:
        ; adding 30k to score
        ldx #$02
        lda #$03
        clc
@NextValue:
        adc ScoreForNextSubmarine,x
        cmp #$0A
        bcc @StoreSubmarineScore
        ; carry score
        sbc #$0A
@StoreSubmarineScore:
        sta ScoreForNextSubmarine,x
        lda #$00
        ; keep going to propagate the carry
        dex
        bpl @NextValue
@Done:
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
        sta     NextBGUpdate
        sta     NMISpriteHandlingDisabled
        sta     PendingBGUpdates
        sta     ShowStatusBarTextLine
        jsr     ClearScreen
        jsr     MoveAllSpritesOffscreen
        rts

; ----------------------------------------------------------------------------
PPUClear:
        lda     #$00
        sta     NextBGUpdate
        sta     PendingBGUpdates
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
        lda PPUCTRL_MIRROR
        and #%11111011
        sta PPUCTRL
        lda ActivePalette
        ; move pointer to the $20-byte offset in PaletteData
        sta @TempPalettePointer + 1
        lda #$00
        lsr @TempPalettePointer + 1
        ror a
        lsr @TempPalettePointer + 1
        ror a
        lsr @TempPalettePointer + 1
        ror a
        adc #<PaletteData
        sta @TempPalettePointer
        lda @TempPalettePointer + 1
        adc #>PaletteData
        sta @TempPalettePointer + 1
        ; set ppu address to palette starting offset
        lda #$3F
        sta PPUADDR
        lda #$00
        sta PPUADDR
        tay
        ; copy $20 bytes of data
        ldx #$20
@KeepCopying:
        lda (@TempPalettePointer),y
        sta PPUDATA
        iny
        dex
        bne @KeepCopying
        ; set ppu address back to palette start offset
        lda #$3F
        sta PPUADDR
        lda #$00
        sta PPUADDR
        ; set ppu address to 0...
        sta PPUADDR
        sta PPUADDR
        ; clear palette load flag
        lda PaletteLoadPending
        and #%11111110
        sta PaletteLoadPending
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
        jsr     LoadPlayerWorkset
        bit     Workset + EntityHeader
        bvs     @PlayerIsActive
        ; activate player
        lda     #(EntityHeaderActive | EntityHeader7)
        sta     Workset + EntityHeader
        lda     #$08
        sta     Workset + EntityV14
        lda     #$FF
        sta     Workset + EntityV15
        jsr     MapRunPlayerAnimation
        jsr     L98ED
        jmp     SaveWorksetAndRTS
@PlayerIsActive:
        lda     #$08
        bit     Workset + EntityV14
        beq     L8F9F
        jsr     L90F4
        cmp     #$08
        bcc     L8F83
        jsr     MapRunPlayerAnimation
        jmp     SaveWorksetAndRTS

; ----------------------------------------------------------------------------
L8F83:
        sta     Workset + EntityV14                             ; 8F83 85 34                    .4
        jsr     L915D                           ; 8F85 20 5D 91                  ].
        bcs     L8F93                           ; 8F88 B0 09                    ..
        jsr     MapRunPlayerAnimation                           ; 8F8A 20 A7 90                  ..
        jsr     L9123                           ; 8F8D 20 23 91                  #.
        jmp     L8FBA                           ; 8F90 4C BA 8F                 L..

; ----------------------------------------------------------------------------
L8F93:
        lda Workset + EntityV14                             ; 8F93 A5 34                    .4
        ora #$08                            ; 8F95 09 08                    ..
        sta Workset + EntityV14                             ; 8F97 85 34                    .4
        jsr MapRunPlayerAnimation                           ; 8F99 20 A7 90                  ..
        jmp SaveWorksetAndRTS                           ; 8F9C 4C 9C 90                 L..

; ----------------------------------------------------------------------------
L8F9F:
        jsr L90F4                           ; 8F9F 20 F4 90                  ..
        cmp #$08                            ; 8FA2 C9 08                    ..
        bcs L8FB7                           ; 8FA4 B0 11                    ..
        tax                                 ; 8FA6 AA                       .
        adc Workset + EntityV14                             ; 8FA7 65 34                    e4
        and #$07                            ; 8FA9 29 07                    ).
        cmp #$04                            ; 8FAB C9 04                    ..
        bne L8FB7                           ; 8FAD D0 08                    ..
        stx Workset + EntityV14                             ; 8FAF 86 34                    .4
        jsr MapRunPlayerAnimation                           ; 8FB1 20 A7 90                  ..
        jsr L9123                           ; 8FB4 20 23 91                  #.
L8FB7:
        jsr WorksetAnimationAdvance                           ; 8FB7 20 BE 97                  ..
L8FBA:
        jsr WorksetMoveX                           ; 8FBA 20 FA 97                  ..
        jsr WorksetMoveY                           ; 8FBD 20 1B 98                  ..
        lda Workset + EntityX                             ; 8FC0 A5 22                    ."
        and #$0F                            ; 8FC2 29 0F                    ).
        cmp #$08                            ; 8FC4 C9 08                    ..
        beq L8FCB                           ; 8FC6 F0 03                    ..
        jmp SaveWorksetAndRTS                           ; 8FC8 4C 9C 90                 L..

; ----------------------------------------------------------------------------
L8FCB:
        lda Workset + EntityY                             ; 8FCB A5 24                    .$
        and #$0F                            ; 8FCD 29 0F                    ).
        cmp #$08                            ; 8FCF C9 08                    ..
        beq @L8FD6                           ; 8FD1 F0 03                    ..
        jmp SaveWorksetAndRTS                           ; 8FD3 4C 9C 90                 L..
@L8FD6:
        lda Workset + EntityV14                             ; 8FD6 A5 34                    .4
        ora #$08                            ; 8FD8 09 08                    ..
        sta Workset + EntityV14                             ; 8FDA 85 34                    .4
        jsr L98ED                           ; 8FDC 20 ED 98                  ..
        jsr CopyWorksetCoordinatesToTempCoordinate                           ; 8FDF 20 E4 95                  ..
        jsr CheckEncounterTypeAtTempCoordinate                           ; 8FE2 20 2D 96                  -.
        sec                                 ; 8FE5 38                       8
        sbc #$0A                            ; 8FE6 E9 0A                    ..
        bcc @CheckForSubmarinePickup                           ; 8FE8 90 5B                    .[
        cmp #$02                            ; 8FEA C9 02                    ..
        bcs @CheckForSubmarinePickup                           ; 8FEC B0 57                    .W
        sta $12                             ; 8FEE 85 12                    ..
        eor PlayerNextActivePort                           ; 8FF0 4D 4D 03                 MM.
        bne @CheckForSubmarinePickup                           ; 8FF3 D0 50                    .P
        bit PlayerHasTracker                           ; 8FF5 2C 41 03                 ,A.
        bmi @L9006                           ; 8FF8 30 0C                    0.
        lda PlayerShellCount                           ; 8FFA AD 90 03                 ...
        cmp #$05                            ; 8FFD C9 05                    ..
        bcc @L903A                           ; 8FFF 90 39                    .9
        lda #$05                            ; 9001 A9 05                    ..
        jmp @L9024                           ; 9003 4C 24 90                 L$.
@L9006:
        ldx PlayerPowerLevel                           ; 9006 AE 91 03                 ...
        cpx #$08                            ; 9009 E0 08                    ..
        bcs @L901B                           ; 900B B0 0E                    ..
        lda PlayerShellCount                           ; 900D AD 90 03                 ...
        cmp ShellPricePerPowerLevel,x                         ; 9010 DD 9F 90                 ...
        bcc @L903A                           ; 9013 90 25                    .%
        lda ShellPricePerPowerLevel,x                         ; 9015 BD 9F 90                 ...
        jmp @L9024                           ; 9018 4C 24 90                 L$.
@L901B:
        lda PlayerShellCount
        cmp #$0A
        bcc @L903A
        lda #$0A
@L9024:
        sta PowerLevelShellCost
        lda EventFlags
        ora #%00000010
        sta EventFlags
        ; switch next port to active so player can't
        ; just keep going to the same port over and over.
        lda PlayerNextActivePort
        eor #%00000001
        sta PlayerNextActivePort
        jmp SaveWorksetAndRTS
@L903A:
        lda EventFlags
        ora #%00001000
        sta EventFlags
        jmp SaveWorksetAndRTS
@CheckForSubmarinePickup:
        @TempPlayerX = $16
        @TempPlayerY = $18
        bit MapSubmarineVisible
        bpl @CheckForEncounter
        bvc @CheckForEncounter
        jsr CopyWorksetCoordinatesToTempCoordinate ; copy X/Y into $16/$18
        ; compare player x position to submarine x
        lsr @TempPlayerX+1
        ror @TempPlayerX
        lsr @TempPlayerX
        lsr @TempPlayerX
        lsr @TempPlayerX
        lda MapSubmarineX
        cmp @TempPlayerX
        ; branch away if we're not at the right x coordinate.
        bne @CheckForEncounter
        ; compare player y position to submarine y
        lsr @TempPlayerY+1
        ror @TempPlayerY
        lsr @TempPlayerY
        lsr @TempPlayerY
        lsr @TempPlayerY
        lda MapSubmarineY
        cmp @TempPlayerY
        ; branchy away if we're not at the right y coordinate
        bne @CheckForEncounter
        ; give the player their submarine!
        lda #$01
        sta PlayerHasSubmarine
        ; and clear visibility flag.
        lda #$00
        sta $06A0
        sta MapSubmarineVisible
@CheckForEncounter:
        ; check the rng to determine if 
        jsr RNGAdvance
        and #%00011111
        bne SaveWorksetAndRTS
        lda EventFlags
        ora #EventFlagsMapTriggerEncounter
        sta EventFlags
        jsr CopyWorksetCoordinatesToTempCoordinate
        jsr CheckEncounterTypeAtTempCoordinate
        ; re-set the encounter type to 4 if it was greater than 5.
        ; this is likely not quite correct..
        cmp #$06
        bcc @NoCarry
        lda #EncounterType4
@NoCarry:
        sta EncounterModifier
SaveWorksetAndRTS:
        jmp WorksetSave

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
MapRunPlayerAnimation:
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
        lda     Workset + EntityHeader
        and     #%11001111
        ora     (@TempPointer),y
        sta     Workset + EntityHeader
        iny
        lda     (@TempPointer),y
        jsr     WorksetAnimationPlay
@Done:
        rts
@Animations:
        .addr @BoatAnimations
        .addr @BoatAnimations
        .addr @BoatAnimations

; first byte is OR'ed with EntityHeader, used to flip the sprites.
@BoatAnimations:
.byte $00,AnimationMapBoatEW        ; boat heading east
.byte $00,AnimationMapBoatEW        ; unused
.byte $00,AnimationMapBoatS         ; boat heading south
.byte $00,AnimationMapBoatS         ; unused
.byte $10,AnimationMapBoatEW        ; boat heading west
.byte $10,AnimationMapBoatEW        ; unused
.byte $00,AnimationMapBoatN         ; boat heading north
.byte $00,AnimationMapBoatN         ; unused
.byte $00,AnimationMapBoatStillEW   ; boat facing east
.byte $00,AnimationMapBoatStillEW   ; unused
.byte $00,AnimationMapBoatStillS    ; boat facing south
.byte $00,AnimationMapBoatStillS    ; unused
.byte $10,AnimationMapBoatStillEW   ; boat facing west
.byte $10,AnimationMapBoatStillEW   ; unused
.byte $00,AnimationMapBoatStillN    ; boat facing north
.byte $00,AnimationMapBoatStillN    ; unused

; ----------------------------------------------------------------------------
L90F4:
        lda Workset + EntityType
        asl a
        tax
        lda PTRS,x
        sta $44
        lda PTRS+1,x
        sta $45
        lda Joy1Inputs
        lsr a
        lsr a
        lsr a
        lsr a
        tay
        lda ($44),y
        rts


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
        sta     Workset + EntityXSubspeed                             ; 912B 85 30                    .0
        lda     L913E,x                         ; 912D BD 3E 91                 .>.
        sta     Workset + EntityXSpeed                             ; 9130 85 31                    .1
        lda     L913F,x                         ; 9132 BD 3F 91                 .?.
        sta     Workset + EntityYSubspeed                            ; 9135 85 32                    .2
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
        lda     #(EntityHeaderActive | EntityHeader7)
        sta     Workset + EntityHeader
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
        ;       X,   Y
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
        bit     Workset + EntityHeader
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
        lda     #(EntityHeaderActive | EntityHeader7)
        sta     Workset + EntityHeader
        jmp     WorksetSave
L9231:
        lda     EncounterJawsActive
        beq     L923D
        dec     Workset + EntityV1D
        beq     L9241
        jmp     WorksetSave
; -------------------------------------------
L923D:
        bit     Workset + EntityV1F
        bpl     L925F
L9241:
        lda     Workset + EntityHeader
        and     #($FF ^ EntityHeader7)                   ; clear flag 7
        sta     Workset + EntityHeader
        lda     #SFXEncounterBoatDespawn
        jsr     SoundPlay
        lda     PlayerHasSubmarine
        bne     L9258
        lda     #$02
        sta     Workset + EntityType
        jmp     EncounterRunPlayerSwim

; ----------------------------------------------------------------------------
L9258:
        lda     #$01                            ; 9258 A9 01                    ..
        sta     Workset + EntityType                             ; 925A 85 21                    .!
        jmp     EncounterRunPlayerSubmarine                           ; 925C 4C FE 92                 L..

; ----------------------------------------------------------------------------
L925F:
        bit     Joy1Inputs
        bpl     L9297
        lda     Workset + EntityHeader
        and     #($FF ^ EntityHeaderFacingLeft) ; clear left facing flag
        sta     Workset + EntityHeader
        lda     PlayerCrabLevel
        asl     a
        tax
        lda     Workset + EntityXSubpixel
        clc
        adc     L92F4,x
        sta     Workset + EntityXSubpixel
        lda     Workset + EntityX
        adc     L92F5,x
        sta     Workset + EntityX
        tay
        lda     Workset + EntityX  + 1
        adc     #$00
        sta     Workset + EntityX  + 1
        cpy     #$E0
        sbc     #$10
        bcc     L9297
        .byte   $A9,$00,$85,$2C,$A9,$E0,$85,$22
        .byte   $A9,$10,$85,$23
; ----------------------------------------------------------------------------
L9297:
        bit     Joy1Inputs
        bvc     L92CF
        lda     Workset + EntityHeader
        ora     #EntityHeaderFacingLeft
        sta     Workset + EntityHeader
        lda     PlayerCrabLevel
        asl     a
        tax
        lda     Workset + EntityXSubpixel
        sec
        sbc     L92F4,x
        sta     Workset + EntityXSubpixel
        lda     Workset + EntityX
        sbc     L92F5,x
        sta     Workset + EntityX
        tay
        lda     Workset + EntityX  + 1
        sbc     #$00
        sta     Workset + EntityX  + 1
        cpy     #$1F
        sbc     #$10
        bcs     L92CF
        lda     #$00
        sta     Workset + EntityXSubpixel
        lda     #$20
        sta     Workset + EntityX
        lda     #$10
        sta     Workset + EntityX  + 1
L92CF:
        lda     #$03
        bit     Joy1Pressed
        beq     L92F1
        jsr     L95D0
        bmi     L92F1
        lda     #$00
        sta     $06A1,x
        lda     #$01
        bit     Joy1Pressed
        beq     L92EC
        lda     #$80
        jmp     L92EE

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
        bit     Workset + EntityHeader
        bvs     L931A
        lda     Workset + EntityHeader
        and     #(EntityHeaderActive | EntityHeaderFacingLeft)
        ora     #(EntityHeader7 | EntityHeader2)
        sta     Workset + EntityHeader
        lda     #AnimationEncounterSubmarine
        jsr     WorksetAnimationPlay
        lda     #$00
        sta     Workset + EntityV1F
        lda     #$B4
        sta     Workset + EntityV1D
        jmp     WorksetSave

; ----------------------------------------------------------------------------
L931A:
        lda     Workset + EntityV1D
        beq     L9328
        dec     Workset + EntityV1D
        bne     L9343
        lda     Workset + EntityHeader
        and     #($FF ^ EntityHeader2)
        sta     Workset + EntityHeader
L9328:
        bit     Workset + EntityV1F
        bpl     L9343
        lda     Workset + EntityHeader
        and     #($FF ^ EntityHeader7)
        sta     Workset + EntityHeader
        lda     #$00
        sta     PlayerHasSubmarine
        lda     #$02
        sta     Workset + EntityType
        lda     #SFXEncounterBoatDespawnDupe
        jsr     SoundPlay
        jmp     EncounterRunPlayerSwim

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
        lda     Workset + EntityHeader                             ; 9364 A5 20                    . 
        and     #($FF ^ EntityHeaderFacingLeft)
        sta     Workset + EntityHeader                             ; 9368 85 20                    . 
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
        lda     Workset + EntityHeader                             ; 9393 A5 20                    . 
        ora     #EntityHeaderFacingLeft                            ; 9395 09 10                    ..
        sta     Workset + EntityHeader                             ; 9397 85 20                    . 
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
        jsr     WorksetMoveY                           ; 93ED 20 1B 98                  ..
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
        lda     Workset + EntityHeader                             ; 9438 A5 20                    . 
        and     #(EntityHeaderActive | EntityHeaderFacingLeft)                            ; 943A 29 90                    ).
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
        bit     Workset + EntityHeader                             ; 9456 24 20                    $ 
        bvs     L9472                           ; 9458 70 18                    p.
        lda     Workset + EntityHeader                             ; 945A A5 20                    . 
        and     #(EntityHeaderActive | EntityHeaderFacingLeft)                            ; 945C 29 90                    ).
        ora     #(EntityHeader7 | EntityHeader2)                            ; 945E 09 42                    .B
        sta     Workset + EntityHeader                             ; 9460 85 20                    . 
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
        lda     Workset + EntityHeader                             ; 947A A5 20                    . 
        and     #($FF ^ EntityHeader2)                            ; 947C 29 FD                    ).
        sta     Workset + EntityHeader                             ; 947E 85 20                    . 
L9480:
        bit     Workset + EntityV1F                             ; 9480 24 3F                    $?
        bpl     L948F                           ; 9482 10 0B                    ..
        lda     #SFXPlayerDeath                            ; 9484 A9 12                    ..
        jsr     SoundPlay                           ; 9486 20 CD E2                  ..
        lda     #%10000000                            ; 9489 A9 80                    ..
        sta     EventFlags                           ; 948B 8D 06 03                 ...
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
        lda     Workset + EntityHeader                             ; 94B9 A5 20                    . 
        and     #($FF ^ EntityHeaderFacingLeft)                            ; 94BB 29 EF                    ).
        sta     Workset + EntityHeader                             ; 94BD 85 20                    . 
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
        lda     Workset + EntityHeader                             ; 94FA A5 20                    . 
        ora     #EntityHeaderFacingLeft                            ; 94FC 09 10                    ..
        sta     Workset + EntityHeader                             ; 94FE 85 20                    . 
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
        jsr     WorksetMoveY                           ; 9572 20 1B 98                  ..
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
        lda     Workset + EntityHeader                             ; 95AD A5 20                    . 
        and     #(EntityHeaderActive | EntityHeaderFacingLeft)                           ; 95AF 29 90                    ).
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
CopyWorksetCoordinatesToTempCoordinate:
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
        jsr     CopyWorksetCoordinatesToTempCoordinate                           ; 95F5 20 E4 95                  ..
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
        jmp     CheckEncounterTypeAtTempCoordinate                           ; 962A 4C 2D 96                 L-.

; ----------------------------------------------------------------------------
CheckEncounterTypeAtTempCoordinate:
        @TempPlayerX = $16
        @TempPlayerY = $18
        ; clear low nybble of Y
        lda @TempPlayerY
        and #$F0
        sta @TempPlayerY
        cmp #$80
        lda @TempPlayerY+1
        ; if we're too far away from any ports we can do a quick exit
        sbc #$01
        bcs @ReturnF
        lda @TempPlayerX+1
        cmp #$02
        bcs @ReturnF
        ; shift the high x nybble into low
        lsr a
        lda @TempPlayerX
        ror a
        lsr a
        lsr a
        lsr a
        lsr a
        ; and OR in the high nybble of Y
        ora @TempPlayerY
        ; this way we've converted X:0123 Y:018A into $92
        clc
        ; get a pointer in the MapEncounterTypeTable table to
        ; the approximation of our X/Y.
        adc #<MapEncounterTypeTable
        sta @TempPlayerY
        lda @TempPlayerY+1
        adc #>MapEncounterTypeTable
        sta @TempPlayerY+1
        ldy #$00
        ; and load it into X
        lda (@TempPlayerY),y
        tax
        ; if the low bit of the X value is 1,
        ; return high nybble (shifted down) of the byte.
        ; otherwise clear high nybble.
        lda #%00010000
        bit @TempPlayerX
        bne @ClearHighNybble
        txa
        lsr a
        lsr a
        lsr a
        lsr a
        rts
@ClearHighNybble:
        txa
        and #$0F
        rts
@ReturnF:
        lda #$0F
        rts
; ----------------------------------------------------------------------------

MapRunCamera:
        ; subtract $80 from player X, this is the minimum scroll X
        lda PlayerX
        sec
        sbc #$80
        tax
        lda PlayerX+1
        sbc #$00
        tay
        bcs @ClampScrollX
        ; we are too close to the left edge, clear scroll.
        ldx #$00
        ldy #$00
        bcc @UpdateCameraX
@ClampScrollX:
        ; get max scroll x positions for the map, then subtract player scroll.
        txa
        cmp #$10
        tya
        sbc #$01
        bcc @UpdateCameraX
        ; we are too close to the right edge, clamp scroll.
        ldx #$10
        ldy #$01
@UpdateCameraX:
        ; store scroll position
        stx MapScrollX
        sty MapScrollX+1
        ; offset and store into camera and ppu scroll mirror.
        txa
        sec
        sbc #$08
        sta CameraX
        sta SCROLL_X
        tya
        sbc #$00
        sta CameraX+1
        ; now we need to do the same thing for Y.
        ; subtract $60 from player Y, this is the minimum scroll Y
        lda PlayerY
        sec
        sbc #$60
        tax
        lda PlayerY+1
        sbc #$00
        tay
        bcs @ClampScrollY
        ; we are too close to the top, clear scroll.
        ldx #$00
        ldy #$00
        bcc @UpdateCameraY
@ClampScrollY:
        ; get max scroll y positions for the map, then subtract player scroll.
        txa
        cmp     #$C6
        tya
        sbc     #$00
        bcc     @UpdateCameraY
        ; we are too close to the bottom, clear scroll.
        ldx     #$C6
        ldy     #$00
@UpdateCameraY:
        ; store scroll position
        stx MapScrollY
        sty MapScrollY+1
        ; offset and store into camera and ppu scroll mirror.
        txa
        sec
        sbc #$0F
        sta CameraY
        tya
        sbc #$00
        sta CameraY+1
        ; if we are somehow in a very different scroll position,
        ; we shift ppu nametables. i don't know how this would happen.
        txa
        clc
        adc #$10
        tax
        tya
        adc #$00
        tay
        txa
        cmp #$F0
        bcc @Done
        adc #$0F
        iny
@Done:
        sta     SCROLL_Y
        sty     UseHighPPUNametables
        rts

; ----------------------------------------------------------------------------
EncounterRunCamera:
        ; subtract $60 from player y position, minimum scroll Y
        lda PlayerY
        sec
        sbc #$60
        tax
        lda PlayerY+1
        sbc #$00
        tay
        bcs @ClampScrollHeight
        ; if we're above $60, we won't scroll the screen.
        ldx #$00
        ldy #$00
        beq @UpdateCameraPosition
@ClampScrollHeight:
        @TempEncounterMaxDepth = $16
        ; player scroll distance is in X and Y.
        ; store max possible scroll height in $16-$17.
        ; these are different depending on if the encounter is shallow or deep.
        lda EncounterMaxDepth
        sec
        sbc #$C0
        sta @TempEncounterMaxDepth
        lda EncounterMaxDepth+1
        sbc #$00
        sta @TempEncounterMaxDepth+1
        ; check so player scroll is not greater than max scroll height.
        txa
        cmp @TempEncounterMaxDepth
        tya
        sbc @TempEncounterMaxDepth+1
        bcc @UpdateCameraPosition
        ; clamp scroll height to whatever is set as max.
        ldx @TempEncounterMaxDepth
        ldy @TempEncounterMaxDepth+1
@UpdateCameraPosition:
        ; store resulting scroll height (minus a small margin) in
        ; the camera scroll position.
        txa
        sec
        sbc #$0B     ; shift camera height a little
        sta CameraY
        tya
        sbc #$00
        sta CameraY+1
        ; check if we are very deep. if we are, we should change nametables.
        ; this never actually happens. none of the encounters are even nearly deep enough.
        txa
        clc
        adc #$14
        tax
        tya
        adc #$00
        tay
        txa
        cmp #$F0
        bcc @Done
        adc #$0F
        iny
@Done:
        ; update ppu scroll height mirror!
        sta SCROLL_Y
        sty UseHighPPUNametables
        rts

; ----------------------------------------------------------------------------
MapSetPlayerActive:
        lda #EntityHeaderActive
        sta PlayerData + EntityHeader
        rts

; ----------------------------------------------------------------------------
LoadPlayerWorkset:
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1

WorksetLoad:
        ldy #$00
@Continue:
        lda (WorksetPtr),y
        sta Workset,y
        iny
        cpy #$20
        bcc @Continue
        rts

; ----------------------------------------------------------------------------
WorksetSave:
        ldy #$00
@Continue:
        lda Workset,y
        sta (WorksetPtr),y
        iny 
        cpy #$20
        bcc @Continue
        rts

; ----------------------------------------------------------------------------
WorksetNext:
        lda WorksetPtr
        clc
        adc #$20
        sta WorksetPtr
        lda WorksetPtr+1
        adc #$00
        sta WorksetPtr+1
        rts

; ----------------------------------------------------------------------------
; clear memory range from $680 to $800
ClearEntityMemory:
        @TempPointer = $16
        @BytesToClear = $18
        lda #<PlayerData
        sta @TempPointer
        lda #>PlayerData
        sta @TempPointer+1
        lda #$80
        sta @BytesToClear
        lda #$01
        sta @BytesToClear+1
        jmp @ClearMemory
@ClearMemory:
        ldy #$00
@KeepClearing:
        lda #$00
        sta (@TempPointer),y
        inc @TempPointer
        bne @Continue
        inc @TempPointer+1
@Continue:
        lda @BytesToClear
        sec
        sbc #$01
        sta @BytesToClear
        lda @BytesToClear+1
        sbc #$00
        sta @BytesToClear+1
        ora @BytesToClear
        ; keep clearing until BytesToClear is 0
        bne @KeepClearing
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
        ; and update the hitbox
        ldy #$00
        lda (Workset + EntitySpritesetPtr),y
        sta Workset + EntityBBoxW
        iny
        lda (Workset + EntitySpritesetPtr),y
        sta Workset + EntityBBoxH
        ; skip past the 2 byte spriteset header
        lda #$02
        clc
        adc Workset + EntitySpritesetPtr
        sta Workset + EntitySpritesetPtr
        ; carry if needed
        lda Workset + (EntitySpritesetPtr + 1)
        adc #$00
        sta Workset + (EntitySpritesetPtr + 1)
WorksetAnimationRTS:
        rts

; ----------------------------------------------------------------------------
WorksetMoveX:
        lda Workset + EntityXSubspeed
        clc
        adc Workset + EntityXSubpixel
        sta Workset + EntityXSubpixel
        lda Workset + EntityXSpeed
        bmi @MoveNegative
        adc Workset + EntityX
        sta Workset + EntityX
        lda Workset + EntityX + 1
        adc #$00
        sta Workset + EntityX + 1
        rts
@MoveNegative:
        adc Workset + EntityX
        sta Workset + EntityX
        lda Workset + EntityX + 1
        adc #$FF
        sta Workset + EntityX + 1
        rts

; ----------------------------------------------------------------------------
WorksetMoveY:
        lda Workset + EntityYSubspeed
        clc
        adc Workset + EntityYSubpixel
        sta Workset + EntityYSubpixel
        lda Workset + EntityYSpeed
        bmi @MoveNegative
        adc Workset + EntityY
        sta Workset + EntityY
        lda Workset + EntityY + 1
        adc #$00
        sta Workset + EntityY + 1
        rts
@MoveNegative:
        adc Workset + EntityY
        sta Workset + EntityY
        lda Workset + EntityY + 1
        adc #$FF
        sta Workset + EntityY + 1
        rts

; ----------------------------------------------------------------------------
ApproachXSpeed:
        ldx #EntityXSubspeed
        jmp ApproachSpeed
ApproachYSpeed:
        ldx #EntityYSubspeed

;
; # ApproachSpeed
; Parameters:
;  - A is subspeed value to add.
;  - Y is the maximum fullspeed, speed will get clamped to this.
;  - X is EntityXSubspeed or EntityYSubspeed depending on which direction to add.
; Note:
;  Negative A values will trigger subtraction.
;
ApproachSpeed:
        pha
        clc
        ; add A to the subspeed.
        adc Workset,x
        sta Workset,x
        ; if A was negative, go handle that.
        pla
        bmi @NegativeValue
        ; add carry to speed.
        lda #$00
        adc Workset+1,x
        sta Workset+1,x
        ; bail if signs don't match.
        tya
        eor Workset+1,x
        bmi @ExitWithoutCarry
        ; we're done if speed has not reached target.
        tya
        clc
        sbc Workset+1,x
        bcs @ExitWithoutCarry
        ; we've reached our target speed, clamp the value.
        sty Workset+1,x
        lda #$00
        sta Workset,x
        beq @ExitWithCarry
@NegativeValue:
        ; add carry to speed.
        lda #$FF
        adc Workset+1,x
        sta Workset+1,x
        ; bail if signs don't match.
        tya
        eor Workset+1,x
        bmi @ExitWithoutCarry
        ; we're done if speed has not reached target.
        dey
        tya
        cmp Workset+1,x
        iny
        tya
        bcc @ExitWithoutCarry
        ; we've reached our target speed, clamp the value.
        sta Workset+1,x
        lda #$00
        sta Workset,x
@ExitWithCarry:
        sec
        rts
@ExitWithoutCarry:
        clc
        rts

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
        sta     Workset + EntityXSubspeed                             ; 98EF 85 30                    .0
        sta     Workset + EntityXSpeed                             ; 98F1 85 31                    .1
        sta     Workset + EntityYSubspeed                            ; 98F3 85 32                    .2
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
        sta     JawsDamagedByProjectileType                           ; 992B 8D 4A 03                 .J.
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
        lda     #EntityHeader2                            ; 9940 A9 02                    ..
        bit     PlayerData + EntityHeader                           ; 9942 2C 80 06                 ,..
        bne     @Exit                           ; 9945 D0 19                    ..
        lda     Workset + EntityV1F                             ; 9947 A5 3F                    .?
        and     #$7F                            ; 9949 29 7F                    ).
        sta     Workset + EntityV1F                             ; 994B 85 3F                    .?
        jsr     HitDetectAgainstPlayer                           ; 994D 20 61 99                  a.
        bcc     @Exit                           ; 9950 90 0E                    ..
        lda     Workset + EntityV1F                             ; 9952 A5 3F                    .?
        ora     #$80                            ; 9954 09 80                    ..
        sta     Workset + EntityV1F                             ; 9956 85 3F                    .?
        lda     $069F                           ; 9958 AD 9F 06                 ...
        ora     #$80                            ; 995B 09 80                    ..
        sta     $069F                           ; 995D 8D 9F 06                 ...
@Exit:
        rts                                     ; 9960 60                       `

; ----------------------------------------------------------------------------
HitDetectAgainstPlayer:
        @TempPlayerPointer = $42
        lda #<PlayerData
        sta @TempPlayerPointer
        lda #>PlayerData
        sta @TempPlayerPointer+1
HitDetect:
        @TempTargetPointer = $42
        @TempXDistance     = $1A
        @TempYDistance     = $1C
        @TempUnused        = $15 ; seems to be unused? maybe a caller uses it?
        ldy #$02
        lda #$00
        sta @TempUnused
        ; diff x coordinate low bytes
        lda (@TempTargetPointer),y
        sec
        sbc Workset + EntityX
        iny
        sta @TempXDistance
        ; diff x coordinate high bytes
        lda (@TempTargetPointer),y
        sbc Workset + EntityX  + 1
        iny
        sta @TempXDistance+1
        ; branch if positive distance
        bcs @CompareY
        inc @TempUnused
        ; convert to positive distance
        eor #$FF
        sta @TempXDistance+1
        lda @TempXDistance
        eor #$FF
        sta @TempXDistance
        ; and add 1
        inc @TempXDistance
        bne @CompareY
        inc @TempXDistance+1
@CompareY:
        ; diff y coordinate low bytes
        lda (@TempTargetPointer),y
        sec
        sbc Workset + EntityY
        iny
        sta @TempYDistance
        ; diff y coordinate high bytes
        lda (@TempTargetPointer),y
        sbc Workset + EntityY + 1
        sta @TempYDistance+1
        bcs @CombineDistances
        inc @TempUnused
        inc @TempUnused
        ; convert to positive distance
        eor #$FF
        sta @TempYDistance+1
        lda @TempYDistance
        eor #$FF
        sta @TempYDistance
        ; and add 1
        inc @TempYDistance
        bne @CombineDistances
        inc @TempYDistance+1
@CombineDistances:
        clc
        lda @TempXDistance+1
        ora @TempYDistance+1
        bne @Exit
        ldy #EntityBBoxW
        lda (@TempTargetPointer),y
        ; check if within X bounding box
        adc Workset + EntityBBoxW
        cmp @TempXDistance
        bcc @Exit
        ; or if within Y bounding box
        iny
        lda (@TempTargetPointer),y
        clc
        adc Workset + EntityBBoxH
        cmp @TempYDistance
@Exit:
        rts

; ----------------------------------------------------------------------------
L99D0:
        lda     EncounterMaxDepth                           ; 99D0 AD 3E 03                 .>.
        sec                                     ; 99D3 38                       8
        sbc     #$10                            ; 99D4 E9 10                    ..
        sta     $16                             ; 99D6 85 16                    ..
        lda     EncounterMaxDepth+1                           ; 99D8 AD 3F 03                 .?.
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
        lda     Workset + EntityBBoxH                             ; 99F2 A5 2F                    ./
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
        lda     Workset + EntityBBoxH                             ; 9A14 A5 2F                    ./
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
        @TempUnknown = $0336
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
        lda     @TempUnknown                           ; 9A4B AD 36 03                 .6.
        beq     @L9A54                           ; 9A4E F0 04                    ..
        ldx     #$FC                            ; 9A50 A2 FC                    ..
        ldy     #$00                            ; 9A52 A0 00                    ..
@L9A54:
        stx     $0F                             ; 9A54 86 0F                    ..
        sty     @TempUnknown                           ; 9A56 8C 36 03                 .6.
L9A59:
        ; clear bit 1 of the last byte of the entity
        ldy     #EntityV1F
        lda     (WorksetPtr),y                         ; 9A5B B1 40                    .@
        and     #$FE                            ; 9A5D 29 FE                    ).
        sta     (WorksetPtr),y                         ; 9A5F 91 40                    .@
        ; check if entity is active, and if so, place out sprites
        ldy     #EntityHeader
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
        lda Workset + EntityHeader
        bpl @AdvanceToNextEntity
        lda #>(@SaveEntity - 1)
        pha
        lda #<(@SaveEntity - 1)
        pha
        lda Workset + EntityType
        jsr JumpEngine
        .addr EncounterBoatProjectile
        .addr EncounterSubmarineBulletProjectile
        .addr EncounterSubmarineBombProjectile
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
        lda     Workset + EntityHeader                             ; 9B9C A5 20                    . 
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
        bit     Workset + EntityHeader                             ; 9BAE 24 20                    $ 
        bvs     L9BBD                           ; 9BB0 70 0B                    p.
        jsr     EncounterPrepareProjectile                           ; 9BB2 20 C7 9C                  ..
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
        sta     Workset + EntityXSubspeed                             ; 9BD7 85 30                    .0
        sta     Workset + EntityXSpeed                             ; 9BD9 85 31                    .1
        lda     #$80                            ; 9BDB A9 80                    ..
        ora     $38                             ; 9BDD 05 38                    .8
        sta     $38                             ; 9BDF 85 38                    .8
        lsr     Workset + EntityYSpeed                             ; 9BE1 46 33                    F3
        ror     Workset + EntityYSubspeed                            ; 9BE3 66 32                    f2
        jmp     L9BF2                           ; 9BE5 4C F2 9B                 L..

; ----------------------------------------------------------------------------
L9BE8:
        lda     #$40                            ; 9BE8 A9 40                    .@
        ldy     #$04                            ; 9BEA A0 04                    ..
        jsr     ApproachYSpeed                           ; 9BEC 20 41 98                  A.
        jsr     WorksetMoveX                           ; 9BEF 20 FA 97                  ..
L9BF2:
        jsr     WorksetMoveY                           ; 9BF2 20 1B 98                  ..
        jsr     L99D0                           ; 9BF5 20 D0 99                  ..
        bcc     L9C05                           ; 9BF8 90 0B                    ..
        .byte   $B0,$05                         ; 9BFA B0 05                    ..
; ----------------------------------------------------------------------------
L9BFC:
        lda     #$00                            ; 9BFC A9 00                    ..
        sta     JawsDamagedByProjectileType                           ; 9BFE 8D 4A 03                 .J.
L9C01:
        lda     #$00                            ; 9C01 A9 00                    ..
        sta     Workset + EntityHeader                             ; 9C03 85 20                    . 
L9C05:
        rts                                     ; 9C05 60                       `

; ----------------------------------------------------------------------------
EncounterSubmarineBulletProjectile:
        bit     Workset + EntityHeader
        bvs     @L9C6C
        jsr     EncounterPrepareProjectile
        lda     #SFXEncounterBoatFire
        jsr     SoundPlay
        jmp     @SharedRTS1
@L9C6C:
        lda     Workset + EntityV1F
        bmi     @L9C7A
        and     #$01
        beq     @L9C7A
        jsr     WorksetMoveX
        jmp     @SharedRTS1
@L9C7A:
        lda     #$00
        sta     Workset + EntityHeader
@SharedRTS1:
        rts

; ----------------------------------------------------------------------------
EncounterSubmarineBombProjectile:
        bit     Workset + EntityHeader                             ; 9C28 24 20                    $ 
        bvs     L9C37                                              ; 9C2A 70 0B                    p.
        jsr     EncounterPrepareProjectile                           ; 9C2C 20 C7 9C                  ..
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
        jsr     WorksetMoveY                           ; 9C42 20 1B 98                  ..
        lda     #$20                            ; 9C45 A9 20                    . 
        ldy     #$10                            ; 9C47 A0 10                    ..
        jsr     ApproachYSpeed                           ; 9C49 20 41 98                  A.
        ldy     #$08                            ; 9C4C A0 08                    ..
        jsr     L98B8                           ; 9C4E 20 B8 98                  ..
        jsr     L99D0                           ; 9C51 20 D0 99                  ..
        bcc     L9C5C                           ; 9C54 90 06                    ..
        .byte   $B0,$00                         ; 9C56 B0 00                    ..
; ----------------------------------------------------------------------------
L9C58:
        lda     #$00                            ; 9C58 A9 00                    ..
        sta     Workset + EntityHeader                             ; 9C5A 85 20                    . 
L9C5C:
        rts                                     ; 9C5C 60                       `


EncounterHarpoonProjectile:
        bit     Workset + EntityHeader
        bvs     @HarpoonActive
        jsr     EncounterPrepareProjectile
        lda     #SFXEncounterHarpoonFire
        jsr     SoundPlay
        jmp     SharedRTS1
@HarpoonActive:
        lda     Workset + EntityV1F
        bmi     @RemoveHarpoon
        and     #$01
        beq     @RemoveHarpoon
        jsr     WorksetMoveX
        jmp     SharedRTS1
@RemoveHarpoon:
        lda     #$00
        sta     Workset + EntityHeader
SharedRTS1:
        rts

; ----------------------------------------------------------------------------
EncounterPlaneProjectile:
        bit     Workset + EntityHeader                             ; 9C7F 24 20                    $ 
        bvs     L9C8E                           ; 9C81 70 0B                    p.
        jsr     EncounterPrepareProjectile                           ; 9C83 20 C7 9C                  ..
        lda     #SFXBonusPlaneFire                            ; 9C86 A9 09                    ..
        jsr     SoundPlay                           ; 9C88 20 CD E2                  ..
        jmp     SharedRTS1                           ; 9C8B 4C 7E 9C                 L~.

; ----------------------------------------------------------------------------
L9C8E:
        lda     Workset + EntityV1F                             ; 9C8E A5 3F                    .?
        bmi     L9CC2                           ; 9C90 30 30                    00
        and     #$01                            ; 9C92 29 01                    ).
        beq     L9CC2                           ; 9C94 F0 2C                    .,
        jsr     WorksetMoveY                           ; 9C96 20 1B 98                  ..
        lda     $38                             ; 9C99 A5 38                    .8
        bne     L9CBB                           ; 9C9B D0 1E                    ..
        lda     Workset + EntityY                             ; 9C9D A5 24                    .$
        cmp     WaterHeight                           ; 9C9F CD 3C 03                 .<.
        lda     Workset + EntityY + 1                             ; 9CA2 A5 25                    .%
        sbc     WaterHeight+1                           ; 9CA4 ED 3D 03                 .=.
        bcc     L9CC6                           ; 9CA7 90 1D                    ..
        inc     $38                             ; 9CA9 E6 38                    .8
        lda     #$00                            ; 9CAB A9 00                    ..
        sta     Workset + EntityYSubspeed                            ; 9CAD 85 32                    .2
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
        sta     Workset + EntityHeader                             ; 9CC4 85 20                    . 
L9CC6:
        rts                                     ; 9CC6 60                       `

; ----------------------------------------------------------------------------
EncounterPrepareProjectile:
        lda     #$00
        ; start by clearing some state off the workset
        ldx     #EntityV14
@ClearPreviousState:
        sta     Workset,x
        inx
        cpx     #EntityV1F+1
        bcc     @ClearPreviousState
        ; load offset in the projectile data table for this
        ; projectile type.
        lda     Workset + EntityType
        asl     a
        asl     a
        asl     a
        tax
        lda     Workset + EntityHeader
        ora     #EntityHeader7
        sta     Workset + EntityHeader
        and     #EntityHeaderFacingLeft
        bne     L9CFF
        lda     PlayerX
        clc
        adc     EncounterProjectileSettings,x
        sta     Workset + EntityX
        lda     PlayerX+1
        adc     #$00
        sta     Workset + EntityX  + 1
        lda     EncounterProjectileSettings+2,x
        sta     Workset + EntityXSubspeed
        lda     EncounterProjectileSettings+3,x
        sta     Workset + EntityXSpeed
        jmp     L9D23
L9CFF:
        lda     PlayerX
        sec
        sbc     EncounterProjectileSettings,x
        sta     Workset + EntityX
        lda     PlayerX+1
        sbc     #$00
        sta     Workset + EntityX + 1
        lda     EncounterProjectileSettings+2,x
        eor     #$FF
        sta     Workset + EntityXSubspeed
        lda     EncounterProjectileSettings+3,x
        eor     #$FF
        sta     Workset + EntityXSpeed
        inc     Workset + EntityXSubspeed
        bne     L9D23
        inc     Workset + EntityXSpeed
L9D23:
        lda     EncounterProjectileSettings+4,x
        sta     Workset + EntityYSubspeed
        lda     EncounterProjectileSettings+5,x
        sta     Workset + EntityYSpeed
        clc
        lda     EncounterProjectileSettings+1,x
        bmi     @UnusedNegativeYOffset
        adc     PlayerY
        sta     Workset + EntityY
        lda     PlayerY+1
        adc     #$00
        jmp     L9D4A

; this would be called if the Y offset of a projectile was negative, which it never is.
@UnusedNegativeYOffset:
        adc PlayerY
        sta Workset + EntityY
        lda PlayerY + 1
        adc #$FF
L9D4A:
        sta     Workset + EntityY + 1
        lda     EncounterProjectileSettings+6,x
        jmp     WorksetAnimationPlay

; ----------------------------------------------------------------------------

;
; spawn information for each type of projectile
;
; 8 bytes per type:
;  - u8 starting X offset from player
;  - u8 starting Y offset from player
;  - u8 x subspeed
;  - u8 x speed
;  - u8 y subspeed
;  - u8 y speed
;  - u8 projectile animation
;  - u8 null terminator
;
EncounterProjectileSettings:
        .byte $0C,$00,$80,$01,$00,$FD,AnimationEncounterBomb    ,$00 ; boat bomb
        .byte $08,$00,$00,$04,$00,$00,AnimationEncounterBullet  ,$00 ; submarine bullet
        .byte $08,$00,$00,$03,$00,$00,AnimationEncounterBomb    ,$00 ; submarine bomb
        .byte $08,$00,$00,$03,$00,$00,AnimationEncounterHarpoon ,$00 ; harpoon
        .byte $00,$08,$00,$00,$80,$01,AnimationEncounterParabomb,$00 ; plane bomb

; ----------------------------------------------------------------------------
MapRunJaws:
        lda #<JawsData
        sta WorksetPtr
        lda #>JawsData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityHeader
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
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeader1)
        sta Workset + EntityHeader
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
        jsr CopyWorksetCoordinatesToTempCoordinate
        jsr CheckEncounterTypeAtTempCoordinate
        sta EncounterModifier
        lda #%00000001
        sta EventFlags
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
        lda     #(EntityHeaderActive | EntityHeader7 | EntityHeader1)                            ; 9E0D A9 C1                    ..
        sta     Workset + EntityHeader                             ; 9E0F 85 20                    . 
        lda     #$00                            ; 9E11 A9 00                    ..
        sta     Workset + EntityV17                            ; 9E13 85 37                    .7
L9E15:
        jsr     L9EFA                           ; 9E15 20 FA 9E                  ..
        lda     TrackerDistancePrev                           ; 9E18 AD 44 03                 .D.
        cmp     #$03                            ; 9E1B C9 03                    ..
        lda     #EntityHeader1                            ; 9E1D A9 01                    ..
        bit     Workset + EntityHeader                             ; 9E1F 24 20                    $ 
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
        jsr     WorksetMoveY                           ; 9E4D 20 1B 98                  ..
        jmp     WorksetSave                           ; 9E50 4C 61 97                 La.

; ----------------------------------------------------------------------------
L9E53:
        txa                                     ; 9E53 8A                       .
        clc                                     ; 9E54 18                       .
        adc     Workset + EntityV14                             ; 9E55 65 34                    e4
        asl     a                               ; 9E57 0A                       .
        tax                                     ; 9E58 AA                       .
        lda     Workset + EntityHeader                             ; 9E59 A5 20                    . 
        and     #($FF ^ EntityHeaderFacingLeft ^ EntityHeader6)                            ; 9E5B 29 CF                    ).
        ora     L9E6F,x                         ; 9E5D 1D 6F 9E                 .o.
        sta     Workset + EntityHeader                             ; 9E60 85 20                    . 
        lda     L9E70,x                         ; 9E62 BD 70 9E                 .p.
        jsr     WorksetAnimationPlay                           ; 9E65 20 AD 97                  ..
        lda     Workset + EntityHeader                             ; 9E68 A5 20                    . 
        and     #$FE                            ; 9E6A 29 FE                    ).
        sta     Workset + EntityHeader                             ; 9E6C 85 20                    . 
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
        sta     Workset + EntityXSubspeed                             ; 9EC8 85 30                    .0
        lda     L9EDB,x                         ; 9ECA BD DB 9E                 ...
        sta     Workset + EntityXSpeed                             ; 9ECD 85 31                    .1
        lda     L9EDC,x                         ; 9ECF BD DC 9E                 ...
        sta     Workset + EntityYSubspeed                            ; 9ED2 85 32                    .2
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
        bit     Workset + EntityHeader                             ; 9F95 24 20                    $ 
        bvs     L9FFD                           ; 9F97 70 64                    pd
        jsr     RNGAdvance                           ; 9F99 20 69 8C                  i.
        and     #$10                            ; 9F9C 29 10                    ).
        bne     L9FB7                           ; 9F9E D0 17                    ..
        lda     #(EntityHeaderActive | EntityHeader7)                            ; 9FA0 A9 C0                    ..
        sta     Workset + EntityHeader                             ; 9FA2 85 20                    . 
        lda     #$C0                            ; 9FA4 A9 C0                    ..
        sta     Workset + EntityX                             ; 9FA6 85 22                    ."
        lda     #$0F                            ; 9FA8 A9 0F                    ..
        sta     Workset + EntityX  + 1                            ; 9FAA 85 23                    .#
        lda     #$00                            ; 9FAC A9 00                    ..
        sta     Workset + EntityXSubspeed                             ; 9FAE 85 30                    .0
        lda     #$01                            ; 9FB0 A9 01                    ..
        sta     Workset + EntityXSpeed                             ; 9FB2 85 31                    .1
        jmp     L9FCB                           ; 9FB4 4C CB 9F                 L..

; ----------------------------------------------------------------------------
L9FB7:
        lda     #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)                            ; 9FB7 A9 D0                    ..
        sta     Workset + EntityHeader                             ; 9FB9 85 20                    . 
        lda     #$40                            ; 9FBB A9 40                    .@
        sta     Workset + EntityX                             ; 9FBD 85 22                    ."
        lda     #$11                            ; 9FBF A9 11                    ..
        sta     Workset + EntityX  + 1                            ; 9FC1 85 23                    .#
        lda     #$00                            ; 9FC3 A9 00                    ..
        sta     Workset + EntityXSubspeed                             ; 9FC5 85 30                    .0
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
        ror     Workset + EntityXSubspeed                             ; A01F 66 30                    f0
        jsr     WorksetMoveX                           ; A021 20 FA 97                  ..
        asl     Workset + EntityXSubspeed                             ; A024 06 30                    .0
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
        lda     Workset + EntityHeader                             ; A059 A5 20                    . 
        eor     #EntityHeaderFacingLeft                            ; A05B 49 10                    I.
        sta     Workset + EntityHeader                             ; A05D 85 20                    . 
        lda     Workset + EntityXSpeed                             ; A05F A5 31                    .1
        eor     #$FF                            ; A061 49 FF                    I.
        tay                                     ; A063 A8                       .
        lda     Workset + EntityXSubspeed                             ; A064 A5 30                    .0
        eor     #$FF                            ; A066 49 FF                    I.
        clc                                     ; A068 18                       .
        adc     #$01                            ; A069 69 01                    i.
        sta     Workset + EntityXSubspeed                             ; A06B 85 30                    .0
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
        ldx     JawsDamagedByProjectileType                           ; A092 AE 4A 03                 .J.
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
        lda     EventFlags                           ; A0BB AD 06 03                 ...
        ora     #%00100000                            ; A0BE 09 20                    . 
        sta     EventFlags                           ; A0C0 8D 06 03                 ...
        jmp     WorksetSave                           ; A0C3 4C 61 97                 La.

; ----------------------------------------------------------------------------
LA0C6:
        ldx     JawsDamagedByProjectileType                           ; A0C6 AE 4A 03                 .J.
        lda     JawsHitSounds,x                         ; A0C9 BD 23 A1                 .#.
        jsr     SoundPlay                           ; A0CC 20 CD E2                  ..
        lda     #$18                            ; A0CF A9 18                    ..
        sta     $38                             ; A0D1 85 38                    .8
        lda     PendingBGUpdates                           ; A0D3 AD 04 03                 ...
        ora     #DrawStatusbarJawsPowerFlag                            ; A0D6 09 40                    .@
        sta     PendingBGUpdates                           ; A0D8 8D 04 03                 ...
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
        sta     Workset + EntityYSubspeed                            ; A0F0 85 32                    .2
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
        sta     Workset + EntityYSubspeed                            ; A106 85 32                    .2
        lda     #$00                            ; A108 A9 00                    ..
        sta     Workset + EntityYSpeed                             ; A10A 85 33                    .3
        jmp     LA117                           ; A10C 4C 17 A1                 L..

; ----------------------------------------------------------------------------
LA10F:
        lda     #$80                            ; A10F A9 80                    ..
        sta     Workset + EntityYSubspeed                            ; A111 85 32                    .2
        lda     #$FF                            ; A113 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; A115 85 33                    .3
LA117:
        jsr     WorksetMoveY                           ; A117 20 1B 98                  ..
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
EncounterRunEnemies:
        lda     EventFlags
        ora     #%00000001
        sta     EventFlags
        lda     EnemyNextPatternTiming
        ora     $0487
        beq     LA157
        lda     EnemyNextPatternTiming
        sec
        sbc     #$01
        sta     EnemyNextPatternTiming
        lda     $0487
        sbc     #$00
        sta     $0487
LA157:
        lda     #<Enemy2Data
        sta     WorksetPtr
        lda     #>Enemy2Data
        sta     WorksetPtr+1
        lda     $0480
        sta     $46
LA164:
        ldy     #$00
        lda     (WorksetPtr),y
        bmi     LA1B0
        lda     EnemyNextPatternTiming
        ora     $0487
        bne     LA1C1
        lda     EnemySettingsPtr
        sta     $44
        lda     EnemySettingsPtr + 1
        sta     $45
        ldy     EnemyPatternIndex
        lda     #%00000010
        bit     EventFlags
        bne     LA1C1
        lda     ($44),y
        cmp     #$FF
        bne     LA197
        lda     EventFlags
        ora     #%00000010
        sta     EventFlags
        jmp     LA1C1

; ----------------------------------------------------------------------------
LA197:
        iny
        sty     EnemyPatternIndex
        ldy     #$01
        sta     (WorksetPtr),y
        dey
        lda     #$80
        sta     (WorksetPtr),y
        lda     EnemyPatternTiming
        sta     EnemyNextPatternTiming
        lda     EnemyPatternUnused1
        sta     $0487
LA1B0:
        lda     EventFlags
        and     #($FF ^ %00000001)
        sta     EventFlags
        jsr     WorksetLoad
        jsr     RunEntity
        jsr     WorksetSave
LA1C1:
        lda     WorksetPtr
        clc
        adc     #$20
        sta     WorksetPtr
        lda     WorksetPtr+1
        adc     #$00
        sta     WorksetPtr+1
        dec     $46
        bne     LA164
        lda     #%00000100
        bit     EventFlags
        beq     @LA1EA
        lda     EnemyNextPatternTiming
        ora     $0487
        bne     @Exit
        lda     EventFlags
        ora     #%01000000
        sta     EventFlags
        rts

; ----------------------------------------------------------------------------
@LA1EA:
        lda     #%00000011
        and     EventFlags
        cmp     #%00000011
        bne     @Exit
        lda     EventFlags
        ora     #%00000100
        sta     EventFlags
        lda     #$40
        sta     EnemyNextPatternTiming
        lda     #$00
        sta     $0487
@Exit:
        rts

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
        bit     Workset + EntityHeader
        bvs     @EntityIsActive
        lda     #$00
        sta     Workset + EntityV1F
        lda     #(EntityHeaderActive | EntityHeader7)
        sta     Workset + EntityHeader
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
        jsr     WorksetMoveY                           ; A24D 20 1B 98                  ..
        jsr     L99F2                           ; A250 20 F2 99                  ..
        bcs     WorksetDisableEntity                           ; A253 B0 3B                    .;
        ldy     #$08                            ; A255 A0 08                    ..
        jsr     L98BD                           ; A257 20 BD 98                  ..
        bcc     SharedRTS                           ; A25A 90 38                    .8
LA25C:
        lda     #$00                            ; A25C A9 00                    ..
        sta     Workset + EntityYSubspeed                            ; A25E 85 32                    .2
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
        lda     #EntityHeaderActive
        sta     Workset + EntityHeader
        jmp     RunEntity
WorksetDisableEntity:
        lda     #$00
        sta     Workset + EntityHeader
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
        bit     Workset + EntityHeader
        bvs     @EntityIsActive
        lda     #$00
        sta     Workset + EntityV1F
        lda     #(EntityHeaderActive | EntityHeader7)
        sta     Workset + EntityHeader
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
        jsr     WorksetMoveY
        jsr     L99F2
        bcs     @Disable
        ldy     #$08
        jsr     L98BD
        bcc     @Exit
@Continue1:
        lda     #$00
        sta     Workset + EntityYSubspeed        
        lda     #$FE
        sta     Workset + EntityYSpeed        
        lda     Workset + EntityX
        cmp     $0682
        bcs     @LA2DB
        lda     #$80
        sta     Workset + EntityXSubspeed
        lda     #$00
        sta     Workset + EntityXSpeed       
        jmp     $A2FD
@LA2DB:
        lda     #$80
        sta     Workset + EntityXSubspeed
        lda     #$FF
        sta     Workset + EntityXSpeed        
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
        lda     #EntityHeaderActive
        sta     Workset + EntityHeader
        jmp     RunEntity
@Disable:
        lda     #$00
        sta     Workset + EntityHeader
@Exit:
        rts

; ----------------------------------------------------------------------------
LA32F:
        lda     EncounterMaxDepth                           ; A32F AD 3E 03                 .>.
        clc                                     ; A332 18                       .
        adc     #$20                            ; A333 69 20                    i 
        sta     Workset + EntityY                             ; A335 85 24                    .$
        lda     EncounterMaxDepth+1                           ; A337 AD 3F 03                 .?.
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
        bit     Workset + EntityHeader                             ; A379 24 20                    $ 
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
        lda     #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)                            ; A3B1 A9 D0                    ..
        sta     Workset + EntityHeader                             ; A3B3 85 20                    . 
        inx                                     ; A3B5 E8                       .
        inx                                     ; A3B6 E8                       .
        lda     #$10                            ; A3B7 A9 10                    ..
        sta     Workset + EntityX                             ; A3B9 85 22                    ."
        lda     #$11                            ; A3BB A9 11                    ..
        bne     LA3C9                           ; A3BD D0 0A                    ..
LA3BF:
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A3BF A9 C0                    ..
        sta     Workset + EntityHeader                             ; A3C1 85 20                    . 
        lda     #$F0                            ; A3C3 A9 F0                    ..
        sta     Workset + EntityX                             ; A3C5 85 22                    ."
        lda     #$0F                            ; A3C7 A9 0F                    ..
LA3C9:
        sta     Workset + EntityX  + 1                            ; A3C9 85 23                    .#
        lda     LA491,x                         ; A3CB BD 91 A4                 ...
        sta     Workset + EntityXSubspeed                             ; A3CE 85 30                    .0
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
        lda     #EntityHeaderFacingLeft                            ; A3F4 A9 10                    ..
        bit     Workset + EntityHeader                             ; A3F6 24 20                    $ 
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
        lda     #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)                            ; A407 A9 D0                    ..
        sta     Workset + EntityHeader                             ; A409 85 20                    . 
        ldx     Workset + EntityV17                            ; A40B A6 37                    .7
        lda     LA493,x                         ; A40D BD 93 A4                 ...
        sta     Workset + EntityXSubspeed                             ; A410 85 30                    .0
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
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A425 A9 C0                    ..
        sta     Workset + EntityHeader                             ; A427 85 20                    . 
        ldx     Workset + EntityV17                            ; A429 A6 37                    .7
        lda     LA491,x                         ; A42B BD 91 A4                 ...
        sta     Workset + EntityXSubspeed                             ; A42E 85 30                    .0
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
        lda     #EntityHeaderActive                           ; A47D A9 80                    ..
        sta     Workset + EntityHeader                             ; A47F 85 20                    . 
        jmp     RunEntity                           ; A481 4C 06 A2                 L..

; ----------------------------------------------------------------------------
LA484:
        lda     #$00                            ; A484 A9 00                    ..
        sta     Workset + EntityHeader                             ; A486 85 20                    . 
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
        bit     Workset + EntityHeader                             ; A499 24 20                    $ 
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
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A4CF A9 C0                    ..
        sta     Workset + EntityHeader                             ; A4D1 85 20                    . 
        lda     #$E0                            ; A4D3 A9 E0                    ..
        sta     Workset + EntityX                             ; A4D5 85 22                    ."
        lda     #$0F                            ; A4D7 A9 0F                    ..
        sta     Workset + EntityX  + 1                            ; A4D9 85 23                    .#
        lda     #$00                            ; A4DB A9 00                    ..
        sta     Workset + EntityXSubspeed                             ; A4DD 85 30                    .0
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
        ror     Workset + EntityXSubspeed                             ; A50C 66 30                    f0
        jsr     WorksetMoveX                           ; A50E 20 FA 97                  ..
        asl     Workset + EntityXSubspeed                             ; A511 06 30                    .0
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
        jsr     WorksetMoveY                           ; A526 20 1B 98                  ..
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
        sta     Workset + EntityYSubspeed                            ; A5A3 85 32                    .2
        sta     Workset + EntityYSpeed                             ; A5A5 85 33                    .3
        rts                                     ; A5A7 60                       `

; ----------------------------------------------------------------------------
LA5A8:
        lda     #$02                            ; A5A8 A9 02                    ..
        bit     $15                             ; A5AA 24 15                    $.
        bne     LA5B7                           ; A5AC D0 09                    ..
        lda     #$80                            ; A5AE A9 80                    ..
        sta     Workset + EntityYSubspeed                            ; A5B0 85 32                    .2
        lda     #$00                            ; A5B2 A9 00                    ..
        sta     Workset + EntityYSpeed                             ; A5B4 85 33                    .3
        rts                                     ; A5B6 60                       `

; ----------------------------------------------------------------------------
LA5B7:
        lda #$80
        sta Workset + EntityYSubspeed        
        lda #$FF
        sta Workset + EntityYSpeed        
        rts 

; ----------------------------------------------------------------------------
LA5C0:
        jsr     WorksetAnimationAdvance                           ; A5C0 20 BE 97                  ..
        lda     Workset + EntityAnimTimer                             ; A5C3 A5 2B                    .+
        beq     LA5C8                           ; A5C5 F0 01                    ..
        rts                                     ; A5C7 60                       `

; ----------------------------------------------------------------------------
LA5C8:
        lda     #EntityHeaderActive                            ; A5C8 A9 80                    ..
        sta     Workset + EntityHeader                             ; A5CA 85 20                    . 
        lda     #$09                            ; A5CC A9 09                    ..
        sta     Workset + EntityType                             ; A5CE 85 21                    .!
        jmp     RunEntity                           ; A5D0 4C 06 A2                 L..

; ----------------------------------------------------------------------------
RunEntityCrab:
        bit Workset + EntityHeader                             ; A5D3 24 20                    $ 
        bvs EncounterCrab                           ; A5D5 70 20                    p 
        lda PlayerCrabLevel                           ; A5D7 AD 92 03                 ...
        cmp #$03                            ; A5DA C9 03                    ..
        bcc LA5E5                           ; A5DC 90 07                    ..
        lda #$0A
        sta Workset + EntityType
        jmp RunEntityStar

; ----------------------------------------------------------------------------
LA5E5:
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A5E5 A9 C0                    ..
        sta     Workset + EntityHeader                             ; A5E7 85 20                    . 
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
        jsr     ApproachYSpeed
        jsr     WorksetMoveY
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
        bit     Workset + EntityHeader                             ; A659 24 20                    $ 
        bvs     LA66D                           ; A65B 70 10                    p.
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A65D A9 C0                    ..
        sta     Workset + EntityHeader                             ; A65F 85 20                    . 
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
        lda     PendingBGUpdates                           ; A68B AD 04 03                 ...
        ora     #DrawStatusbarShellsFlag                            ; A68E 09 08                    ..
        sta     PendingBGUpdates                           ; A690 8D 04 03                 ...
        lda     #$00                            ; A693 A9 00                    ..
        sta     Workset + EntityHeader                             ; A695 85 20                    . 
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
        jsr     ApproachYSpeed                           ; A6A9 20 41 98                  A.
        jsr     WorksetMoveY                           ; A6AC 20 1B 98                  ..
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
        bit     Workset + EntityHeader                             ; A6BD 24 20                    $ 
        bvs     LA6D3                           ; A6BF 70 12                    p.
        lda     #(EntityHeaderActive | EntityHeader7)                            ; A6C1 A9 C0                    ..
        sta     Workset + EntityHeader                             ; A6C3 85 20                    . 
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
        jsr     WorksetMoveY                           ; A6D7 20 1B 98                  ..
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
        sta     Workset + EntityYSubspeed                            ; A702 85 32                    .2
        lda     #$FF                            ; A704 A9 FF                    ..
        sta     Workset + EntityYSpeed                             ; A706 85 33                    .3
        pla                                     ; A708 68                       h
        jmp     WorksetAnimationPlay                           ; A709 4C AD 97                 L..

; ----------------------------------------------------------------------------
LA70C:
        lda     #$00                            ; A70C A9 00                    ..
        sta     Workset + EntityHeader                             ; A70E 85 20                    . 
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
        jsr     ApproachYSpeed                           ; A722 20 41 98                  A.
        jsr     WorksetMoveY                           ; A725 20 1B 98                  ..
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
PrepareEnemySettings:
        @TempPointer = $44
        lda TotalEncountersPlayed
        asl a
        tax
        lda EnemySettings,x
        sta @TempPointer
        lda EnemySettings+1,x
        sta @TempPointer+1
        ldy #$00
        lda (@TempPointer),y
        iny
        cmp #$03
        bcc @LA76A
        ldx EncounterJawsActive
        cpx #$02
        bcs @LA76A
        lda #$03
@LA76A:
        sta $0480
        lda (@TempPointer),y
        iny
        sta EnemyPatternTiming
        sta EnemyNextPatternTiming
        lda (@TempPointer),y
        iny
        sta EnemySettingsPtr
        lda (@TempPointer),y
        sta EnemySettingsPtr + 1
        lda #$00
        sta EnemyPatternIndex
        lda #$00
        sta EnemyPatternUnused1
        sta $0487
        rts

; ----------------------------------------------------------------------------
DrawStatusLine:
        lda #RomGraphicsStatusLineText
        jsr DrawRomGraphics
        jsr DrawStatusLine_Score
        jsr DrawStatusLine_JawsPower
        jsr DrawStatusLine_Shells
        rts

; ----------------------------------------------------------------------------
DrawStatusLine_Score:
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
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
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
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
        rts
@IncrementPointer:
        inc @TempPointer
        bne @Done
        inc @TempPointer+1
@Done:
        rts

; ----------------------------------------------------------------------------
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
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawStatusLine_JawsPower:
        jsr PPURenderHorizontal
        ; draw at $2B94, where the jaws power bar is
        lda #$2B
        sta PPUADDR
        lda #$94
        sta PPUADDR
        ldy #$08
        ; we need to draw 10 tiles 
        ldx #$0A
        lda JawsHP+1
@DrawFullBar:
        cmp #$02
        bcc @DrawHalfBar
        sty PPUDATA
        sbc #$02
        dex
        bne @DrawFullBar
        rts
@DrawHalfBar:
        cmp #$00
        beq @DrawEmptyBars
        ldy #$09
        sty PPUDATA
        dex
        beq @Done
@DrawEmptyBars:
        ldy #$0A
@DrawEmptyBar:
        sty PPUDATA
        dex
        bne @DrawEmptyBar
@Done:
        rts

; ----------------------------------------------------------------------------
DrawStatusLine_Shells:
        jsr PPURenderHorizontal
        ; draw at $2B94, where the shell counter is
        lda #$2B
        sta PPUADDR
        lda #$8C
        sta PPUADDR
        lda PlayerShellCount
        jsr ConvertAToBCD
        jsr MoveAAndYToAsciiTable
        pha
        tya
        ; make doubly-certain that we're in the ascii table and
        ; then write the shell counter to ppu
        ora #$30
        sta PPUDATA
        pla
        ora #$30
        sta PPUDATA
        rts

; ----------------------------------------------------------------------------
AdvanceWaterAnimation:
        ; don't run until the timer is ready
        lda WaterAnimationTimer
        cmp #$10
        bcc @IncrementTimer
        ; delay updating until nothing else is planned
        lda NextBGUpdate
        bne @Done
        ; reset timer and increment animation frame
        lda #$00
        sta WaterAnimationTimer
        inc WaterAnimationFrame
        lda WaterAnimationFrame
        ; loop animation if needed
        cmp #MaxWaterAnimationFrameCount
        bcc @Update
        lda #$00
        sta WaterAnimationFrame
@Update:
        ; mark water update required
        lda PendingBGUpdates
        ora #DrawBGEncounterWater
        sta PendingBGUpdates
        bne @Done
@IncrementTimer:
        inc WaterAnimationTimer
@Done:
        rts

; ----------------------------------------------------------------------------
DrawWaterAnimation:
        @Temp1 = $FA
        @Temp2 = $FB
        @Temp3 = $FC
        @Temp4 = $FD
        jsr PPURenderHorizontal
        lda WaterHeight
        ; map height of water to ppu coordinates
        clc
        adc #$20
        sta @Temp1
        lda #$08
        asl @Temp1
        rol a
        asl @Temp1
        rol a
        sta PPUADDR
        lda @Temp1
        sta PPUADDR
        ; get offset to animation frame
        lda WaterAnimationFrame
        asl a
        asl a
        tax
        lda @WaterAnimationFrames,x
        inx
        sta @Temp1
        lda @WaterAnimationFrames,x
        inx
        sta @Temp2
        lda @WaterAnimationFrames,x
        inx
        sta @Temp3
        lda @WaterAnimationFrames,x
        sta @Temp4
        ; draw a full line (32 tiles) of surface waves
        ldx #$08
@KeepDrawingWaves:
        lda @Temp1
        sta PPUDATA
        lda @Temp2
        sta PPUDATA
        lda @Temp3
        sta PPUDATA
        lda @Temp4
        sta PPUDATA
        dex
        bne @KeepDrawingWaves
        rts
@WaterAnimationFrames:
        .byte $CC,$CD,$CE,$CF
        .byte $DC,$DD,$DE,$DF
        .byte $EC,$ED,$EE,$EF
        .byte $FC,$FD,$FE,$FF
        .byte $EC,$ED,$EE,$EF
        .byte $DC,$DD,$DE,$DF
MaxWaterAnimationFrameCount = (* - @WaterAnimationFrames) / 4

; ----------------------------------------------------------------------------
MapUpdateScroll:
        ; if there is another update scheduled,
        ; we wont update the scroll position until it's done.
        lda NextBGUpdate
        beq @CheckIfUpdateIsNeeded
        rts
@CheckIfUpdateIsNeeded:
        ; check if our copies of the scroll positions are different
        ; from the requested positions..
        lda MapScrollXCopy+1
        cmp MapScrollX+1
        bne @UpdateNeeded
        lda MapScrollXCopy
        cmp MapScrollX
        bne @UpdateNeeded
        ; camera has not moved, we don't need to do anything.
        rts
@UpdateNeeded:
        ; okay the camera has moved. we need to do some work..
        bcs LAA7A
        ldy #$01
        lda MapScrollX
        clc
        adc #$F0
        tax
        lda MapScrollX+1
        adc #$00
        cmp #$02
        bcc LAA8B
        rts

; ----------------------------------------------------------------------------
LAA7A:
        ldy #$03
        lda MapScrollX
        sec
        sbc #$00
        tax
        lda MapScrollX+1
        sbc #$00
        bpl LAA8B
        rts
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
        sty     NextBGUpdate                           ; AA9D 8C 03 03                 ...
        jsr     LAAF0                           ; AAA0 20 F0 AA                  ..
        jsr     LAB50                           ; AAA3 20 50 AB                  P.
LAAA6:
        lda     MapScrollX                           ; AAA6 AD 28 03                 .(.
        sta     MapScrollXCopy                           ; AAA9 8D 2C 03                 .,.
        lda     MapScrollX+1                           ; AAAC AD 29 03                 .).
        sta     MapScrollXCopy+1                           ; AAAF 8D 2D 03                 .-.
        rts                                     ; AAB2 60                       `

; ----------------------------------------------------------------------------
MapSetStartingScroll:
        lda     MapScrollX+1                           ; AAB3 AD 29 03                 .).
        sta     $01                             ; AAB6 85 01                    ..
        sta     MapScrollXCopy+1                           ; AAB8 8D 2D 03                 .-.
        lda     MapScrollX                           ; AABB AD 28 03                 .(.
        sta     MapScrollXCopy                           ; AABE 8D 2C 03                 .,.
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
        jsr     DrawBGDataPage1And2                           ; AAD1 20 9A AB                  ..
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
DrawBGDataPage1And2:
        jsr DrawBGDataPage1
        jmp DrawBGDataPage2

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
DrawBGMapRight1:
        jsr     DrawBGDataPage1
        jsr     DrawBGDataPage3
        ; continue to DrawBGMapRight2
        lda     #$02
        sta     NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapRight2:
        jsr     DrawBGDataPage2
        lda     #$00
        sta     NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapLeft1:
        jsr     DrawBGDataPage2
        jsr     DrawBGDataPage3
        ; continue to DrawBGMapLeft2
        lda     #$04
        sta     NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapLeft2:
        jsr     DrawBGDataPage1
        lda     #$00
        sta     NextBGUpdate
        rts

; ----------------------------------------------------------------------------
EncounterLoadSettings:
        @TempPointer = $44
        jsr PPUDisableNMI                           ; AC82 20 EA 8B                  ..
        jsr PPUDisableRendering                           ; AC85 20 B6 8B                  ..
        lda #CHREncounterAndIntroScreen
        sta ActiveCHR                           ; AC8A 8D 07 03                 ...
        lda #$00                            ; AC8D A9 00                    ..
        sta WaterAnimationTimer                           ; AC8F 8D 1A 03                 ...
        sta WaterAnimationFrame                           ; AC92 8D 1B 03                 ...
        lda EncounterModifier                           ; AC95 AD 40 03                 .@.
        asl a                               ; AC98 0A                       .
        tax                                 ; AC99 AA                       .
        lda EncounterTypeSettings,x                         ; AC9A BD 08 CD                 ...
        sta @TempPointer                             ; AC9D 85 44                    .D
        lda EncounterTypeSettings+1,x                         ; AC9F BD 09 CD                 ...
        sta @TempPointer+1                             ; ACA2 85 45                    .E
        jsr ClearScreenAndSprites                           ; ACA4 20 12 8E                  ..
        jsr DrawStatusLine                           ; ACA7 20 8F A7                  ..
        jsr DrawStatusLine_PowerLabel                           ; ACAA 20 D3 87                  ..
        lda #$01                            ; ACAD A9 01                    ..
        sta ShowStatusBarTextLine                           ; ACAF 8D 05 03                 ...
        sta NMISpriteHandlingDisabled                           ; ACB2 8D 02 03                 ...
        ldy #$00                            ; ACB5 A0 00                    ..
        lda (@TempPointer),y                         ; ACB7 B1 44                    .D
        jsr LoadEncounterBackground                           ; ACB9 20 E6 AC                  ..
        ldy #$01                            ; ACBC A0 01                    ..
        lda (@TempPointer),y                         ; ACBE B1 44                    .D
        jsr DrawRomGraphics                           ; ACC0 20 69 8D                  i.
        ldy #$02                            ; ACC3 A0 02                    ..
        lda (@TempPointer),y                         ; ACC5 B1 44                    .D
        iny                                 ; ACC7 C8                       .
        sta WaterHeight                           ; ACC8 8D 3C 03                 .<.
        lda (@TempPointer),y                         ; ACCB B1 44                    .D
        iny                                 ; ACCD C8                       .
        sta WaterHeight+1                           ; ACCE 8D 3D 03                 .=.
        lda (@TempPointer),y                         ; ACD1 B1 44                    .D
        iny                                 ; ACD3 C8                       .
        sta EncounterMaxDepth                           ; ACD4 8D 3E 03                 .>.
        lda (@TempPointer),y                         ; ACD7 B1 44                    .D
        iny                                 ; ACD9 C8                       .
        sta EncounterMaxDepth+1                           ; ACDA 8D 3F 03                 .?.
        lda (@TempPointer),y                         ; ACDD B1 44                    .D
        jsr StoreActivePaletteAndWaitFor1Frame                           ; ACDF 20 BD 8E                  ..
        jsr PPUEnableNMI                           ; ACE2 20 DE 8B                  ..
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
; struct:
;   - u8 bounding box width
;   - u8 bounding box height
;   - one or more sprites:
;     - u8 x offset from entity location
;     - u8 y offset from entity location
;     - u8 sprite tile to render
;     - u8 sprite attributes
;   - u8 $80 end of spriteset marker
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

EnemySettings:
  .addr @EnemySettings00Data
  .addr @EnemySettings01Data
  .addr @EnemySettings02Data
  .addr @EnemySettings03Data
  .addr @EnemySettings04Data
  .addr @EnemySettings05Data
  .addr @EnemySettings06Data
  .addr @EnemySettings07Data
  .addr @EnemySettings08Data
  .addr @EnemySettings09Data
  .addr @EnemySettings0AData
  .addr @EnemySettings0BData
  .addr @EnemySettings0CData
  .addr @EnemySettings0DData
  .addr @EnemySettings0EData
  .addr @EnemySettings0FData
  .addr @EnemySettings10Data
  .addr @EnemySettings11Data
  .addr @EnemySettings12Data
  .addr @EnemySettings13Data
  .addr @EnemySettings14Data
  .addr @EnemySettings15Data
  .addr @EnemySettings16Data
  .addr @EnemySettings17Data
  .addr @EnemySettings18Data
  .addr @EnemySettings19Data
  .addr @EnemySettings1AData
  .addr @EnemySettings1BData
  .addr @EnemySettings1CData
  .addr @EnemySettings1DData
  .addr @EnemySettings1EData
  .addr @EnemySettings1FData

@EnemySettings00Data:
.byte $02, $40
.addr @EnemyPattern00Data
@EnemySettings01Data:
.byte $02, $40
.addr @EnemyPattern01Data
@EnemySettings02Data:
.byte $03, $30
.addr @EnemyPattern00Data
@EnemySettings03Data:
.byte $03, $30
.addr @EnemyPattern01Data
@EnemySettings04Data:
.byte $03, $20
.addr @EnemyPattern02Data
@EnemySettings05Data:
.byte $03, $20
.addr @EnemyPattern03Data
@EnemySettings06Data:
.byte $04, $20
.addr @EnemyPattern00Data
@EnemySettings07Data:
.byte $04, $20
.addr @EnemyPattern01Data
@EnemySettings08Data:
.byte $04, $10
.addr @EnemyPattern02Data
@EnemySettings09Data:
.byte $04, $10
.addr @EnemyPattern03Data
@EnemySettings0AData:
.byte $03, $10
.addr @EnemyPattern04Data
@EnemySettings0BData:
.byte $03, $10
.addr @EnemyPattern05Data
@EnemySettings0CData:
.byte $04, $10
.addr @EnemyPattern05Data
@EnemySettings0DData:
.byte $02, $10
.addr @EnemyPattern06Data
@EnemySettings0EData:
.byte $02, $10
.addr @EnemyPattern07Data
@EnemySettings0FData:
.byte $02, $10
.addr @EnemyPattern08Data
@EnemySettings10Data:
.byte $03, $08
.addr @EnemyPattern05Data
@EnemySettings11Data:
.byte $03, $08
.addr @EnemyPattern06Data
@EnemySettings12Data:
.byte $03, $08
.addr @EnemyPattern07Data
@EnemySettings13Data:
.byte $03, $08
.addr @EnemyPattern08Data
@EnemySettings14Data:
.byte $03, $08
.addr @EnemyPattern09Data
@EnemySettings15Data:
.byte $03, $08
.addr @EnemyPattern0AData
@EnemySettings16Data:
.byte $03, $08
.addr @EnemyPattern0BData
@EnemySettings17Data:
.byte $03, $08
.addr @EnemyPattern0CData
@EnemySettings18Data:
.byte $04, $04
.addr @EnemyPattern05Data
@EnemySettings19Data:
.byte $04, $04
.addr @EnemyPattern06Data
@EnemySettings1AData:
.byte $04, $04
.addr @EnemyPattern07Data
@EnemySettings1BData:
.byte $04, $04
.addr @EnemyPattern08Data
@EnemySettings1CData:
.byte $04, $04
.addr @EnemyPattern09Data
@EnemySettings1DData:
.byte $04, $04
.addr @EnemyPattern0AData
@EnemySettings1EData:
.byte $04, $04
.addr @EnemyPattern0BData
@EnemySettings1FData:
.byte $04, $04
.addr @EnemyPattern0CData

@EnemyPattern00Data:
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $FF
@EnemyPattern01Data:
.byte $01,$01,$00,$01
.byte $01,$00,$01,$01
.byte $00,$01,$01,$00
.byte $01,$01,$00,$01
.byte $01,$00,$01,$01
.byte $00,$01,$01,$03
.byte $FF
@EnemyPattern02Data:
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$01
.byte $00,$00,$00,$01
.byte $00,$01,$00,$01
.byte $00,$01,$00,$01
.byte $01,$01,$01,$00
.byte $01,$01,$01,$03
.byte $FF
@EnemyPattern03Data:
.byte $00,$01,$02,$00
.byte $01,$02,$00,$01
.byte $02,$03,$00,$01
.byte $02,$00,$01,$02
.byte $00,$01,$02,$03
.byte $00,$01,$02,$00
.byte $01,$02,$00,$01
.byte $02,$00,$01,$03
.byte $FF
@EnemyPattern04Data:
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
@EnemyPattern05Data:
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $FF
@EnemyPattern06Data:
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $FF
@EnemyPattern07Data:
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $02,$02,$02,$03
.byte $FF
@EnemyPattern08Data:
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $00,$01,$02,$03
.byte $FF
@EnemyPattern09Data:
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $00,$01,$00,$01
.byte $00,$01,$00,$03
.byte $FF
@EnemyPattern0AData:
.byte $00,$01,$02,$03
.byte $04,$00,$01,$02
.byte $03,$04,$00,$01
.byte $02,$03,$04,$00
.byte $01,$02,$03,$04
.byte $00,$01,$02,$03
.byte $04,$00,$01,$02
.byte $03,$04,$00,$01
.byte $FF
@EnemyPattern0BData:
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $04,$04,$04,$04
.byte $04,$04,$04,$03
.byte $FF
@EnemyPattern0CData:
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
;  - u16 water depth
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
.word $0048 ; water surface level
.word $0120 ; water depth
.byte PaletteEncounterDeep

@EncounterTypeShallow:
.byte EncounterBackgroundShallow
.byte RomGraphicsEncounterShallow
.word $0058 ; water surface level
.word $00C0 ; water depth
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
        sta     EncounterMaxDepth                           ; CFA6 8D 3E 03                 .>.
        lda     #$01                            ; CFA9 A9 01                    ..
        sta     EncounterMaxDepth+1                           ; CFAB 8D 3F 03                 .?.
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
        jsr     AdvanceWaterAnimation                           ; CFE8 20 B6 A9                  ..
        jsr     SetNextPendingBGUpdate                           ; CFEB 20 5F 8B                  _.
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
        lda     PendingBGUpdates                           ; D072 AD 04 03                 ...
        ora     #DrawVRAMBufferFlag                            ; D075 09 10                    ..
        sta     PendingBGUpdates                           ; D077 8D 04 03                 ...
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
        lda     PendingBGUpdates                           ; D0C6 AD 04 03                 ...
        ora     #DrawVRAMBufferFlag                            ; D0C9 09 10                    ..
        sta     PendingBGUpdates                           ; D0CB 8D 04 03                 ...
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
        lda     PendingBGUpdates                           ; D0E2 AD 04 03                 ...
        ora     #DrawStatusbarShellsFlag                            ; D0E5 09 08                    ..
        sta     PendingBGUpdates                           ; D0E7 8D 04 03                 ...
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
        jsr     SetNextPendingBGUpdate
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
        .addr $2166
        .byte $14
        .byte "NUMBER OF HITS     "
        .byte $2B

CopyTextBonusShellsCollected:
        .addr $21C2
        .byte $18
        .byte "BONUS SHELLS COLLECTED "
        .byte $2B

CopyTextBonusGotThemAll:
        .addr $2227
        .byte $12
        .byte "YOU GOT THEM ALL!"
        .byte $21

CopyTextBonus10000BonusPoints:
        .addr $2262
        .byte $1C
        .byte "YOU GET 10000 BONUS POINTS!!"

; ----------------------------------------------------------------------------
BonusRunPlayer:
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityHeader
        bmi @EntityActive
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        ; set starting location for plane
        lda #$C0
        sta Workset + EntityX
        lda #$0F
        sta Workset + EntityX  + 1
        lda #$30
        sta Workset + EntityY
        lda #$00
        sta Workset + EntityY + 1
        sta Workset + EntityXSubspeed
        lda #$02
        sta Workset + EntityXSpeed
        lda #AnimationEncounterPlane
        jsr WorksetAnimationPlay
        jmp WorksetSave
@EntityActive:
        jsr WorksetAnimationAdvance
        jsr WorksetMoveX
        ; we need reversed controls when heading left
        lda #EntityHeaderFacingLeft
        bit Workset + EntityHeader
        bne @BonusRunPlayerHeadingLeft
        ; player is heading right
        ldx #$F8
        ldy #$01
        bit Joy1Inputs
        bvs @LD205
        bmi @LD201
        iny
        bne @LD203
@LD201:
        ldy #$03
@LD203:
        ldx #$08
@LD205:
        txa 
        jsr ApproachXSpeed
        ; check if we're off the right edge of the screen
        lda Workset + EntityX
        cmp #$40
        lda Workset + EntityX  + 1
        sbc #$11
        ; and if so we want to turn ourselves around
        bcs @BonusTurnPlane
        jmp @KeepMoving

; ----------------------------------------------------------------------------
@BonusRunPlayerHeadingLeft:
        ldx #$08
        ldy #$FF
        bit Joy1Inputs
        bmi @LD228
        bvs @LD224
        dey
        bne @LD226
@LD224:
        ldy #$FD
@LD226:
        ldx #$F8
@LD228:
        txa
        jsr ApproachXSpeed
        ; check if we're off the left edge of the screen
        lda Workset + EntityX
        cmp #$C0
        lda Workset + EntityX  + 1
        sbc #$0F
        bcs @KeepMoving
        ; and if so we want to turn ourselves around
@BonusTurnPlane:
        ; invert x speed
        lda Workset + EntityXSpeed
        eor #$FF
        tay
        lda Workset + EntityXSubspeed
        eor #$FF
        clc
        adc #$01
        sta Workset + EntityXSubspeed
        tya
        adc #$00
        sta Workset + EntityXSpeed
        ; and invert facing direction
        lda Workset + EntityHeader
        eor #EntityHeaderFacingLeft
        sta Workset + EntityHeader
@KeepMoving:
        ; finish up if we are offscreen
        lda Workset + EntityX  + 1
        cmp #$10
        bne @Done
        ; check if player wants to fire
        lda #(JOY_A | JOY_B)
        bit Joy1Pressed
        beq @Done
        ; check projectile 1 slot
        ldx #$00
        lda PlayerProjectile1Data,x
        bpl @LD271 ; slot is free, bombs away!
        ; check projectile 2 slot
        ldx #$20
        lda PlayerProjectile1Data,x
        bpl @LD271 ; slot is free, bombs away!
        ; last chance, projectile 3?
        ldx #$40
        lda PlayerProjectile1Data,x
        bmi @Done ; no dice, we can't fire for now.
@LD271:
        ; mark the entity as a parachute bomb
        lda #EntityTypeParachuteBomb
        sta PlayerProjectile1Data + EntityType,x
        ; and activate it!
        lda #EntityHeaderActive
        sta PlayerProjectile1Data + EntityHeader,x
@Done:
        jmp WorksetSave

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
        bit Workset + EntityHeader
        bvs @AlreadyInitialized
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
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
        sta     Workset + EntityYSubspeed                            ; D3E7 85 32                    .2
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
        lda     PendingBGUpdates                           ; D420 AD 04 03                 ...
        ora     #DrawVRAMBufferFlag                            ; D423 09 10                    ..
        sta     PendingBGUpdates                           ; D425 8D 04 03                 ...
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
        jsr     WorksetMoveY                           ; D444 20 1B 98                  ..
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
        sta     Workset + EntityXSubspeed                             ; D48F 85 30                    .0
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
        sta     Workset + EntityYSubspeed                            ; D49E 85 32                    .2
        bit     $34                             ; D4A0 24 34                    $4
        bpl     LD4B7                           ; D4A2 10 13                    ..
        lda     Workset + EntityXSpeed                             ; D4A4 A5 31                    .1
        eor     #$FF                            ; D4A6 49 FF                    I.
        tay                                     ; D4A8 A8                       .
        lda     Workset + EntityXSubspeed                             ; D4A9 A5 30                    .0
        eor     #$FF                            ; D4AB 49 FF                    I.
        clc                                     ; D4AD 18                       .
        adc     #$01                            ; D4AE 69 01                    i.
        sta     Workset + EntityXSubspeed                             ; D4B0 85 30                    .0
        tya                                     ; D4B2 98                       .
        adc     #$00                            ; D4B3 69 00                    i.
        sta     Workset + EntityXSpeed                             ; D4B5 85 31                    .1
LD4B7:
        rts                                     ; D4B7 60                       `

; ----------------------------------------------------------------------------
LD4B8:
        jsr     WorksetAnimationAdvance
        jsr     WorksetMoveY
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
        sta     Workset + EntityHeader
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
        sta     EventFlags                           ; D7CC 8D 06 03                 ...
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
        bit     EventFlags                           ; D83D 2C 06 03                 ,..
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
        lda     #%10000000                            ; DA0D A9 80                    ..
        sta     EventFlags                           ; DA0F 8D 06 03                 ...
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
        bit     Workset + EntityHeader                             ; DA3A 24 20                    $ 
        bvs     LDA58                           ; DA3C 70 1A                    p.
        lda     #(EntityHeaderActive | EntityHeader7)                            ; DA3E A9 C0                    ..
        sta     Workset + EntityHeader                             ; DA40 85 20                    . 
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
        sta     Workset + EntityXSubspeed                             ; DAAF 85 30                    .0
        lda     $19                             ; DAB1 A5 19                    ..
        sta     Workset + EntityXSpeed                             ; DAB3 85 31                    .1
        lsr     $19                             ; DAB5 46 19                    F.
        ror     $18                             ; DAB7 66 18                    f.
        lda     $18                             ; DAB9 A5 18                    ..
        sta     Workset + EntityYSubspeed                            ; DABB 85 32                    .2
        lda     $19                             ; DABD A5 19                    ..
        sta     Workset + EntityYSpeed                             ; DABF 85 33                    .3
        lda     $38                             ; DAC1 A5 38                    .8
        bne     LDACE                           ; DAC3 D0 09                    ..
        lda     #$00                            ; DAC5 A9 00                    ..
        sta     Workset + EntityXSubspeed                             ; DAC7 85 30                    .0
        sta     Workset + EntityXSpeed                             ; DAC9 85 31                    .1
        jmp     LDAE5                           ; DACB 4C E5 DA                 L..

; ----------------------------------------------------------------------------
LDACE:
        cmp     #$01                            ; DACE C9 01                    ..
        beq     LDAE5                           ; DAD0 F0 13                    ..
        lda     Workset + EntityXSpeed                             ; DAD2 A5 31                    .1
        eor     #$FF                            ; DAD4 49 FF                    I.
        tay                                     ; DAD6 A8                       .
        lda     Workset + EntityXSubspeed                             ; DAD7 A5 30                    .0
        eor     #$FF                            ; DAD9 49 FF                    I.
        clc                                     ; DADB 18                       .
        adc     #$01                            ; DADC 69 01                    i.
        sta     Workset + EntityXSubspeed                             ; DADE 85 30                    .0
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
        lda     Workset + EntityXSubspeed                             ; DB0B A5 30                    .0
        sec                                     ; DB0D 38                       8
        sbc     LF580,x                         ; DB0E FD 80 F5                 ...
        sta     $16                             ; DB11 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB13 A5 31                    .1
        sbc     LF581,x                         ; DB15 FD 81 F5                 ...
        sta     $17                             ; DB18 85 17                    ..
        jmp     LDB37                           ; DB1A 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB1D:
        lda     Workset + EntityXSubspeed                             ; DB1D A5 30                    .0
        clc                                     ; DB1F 18                       .
        adc     LF580,x                         ; DB20 7D 80 F5                 }..
        sta     $16                             ; DB23 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB25 A5 31                    .1
        adc     LF581,x                         ; DB27 7D 81 F5                 }..
        sta     $17                             ; DB2A 85 17                    ..
        jmp     LDB37                           ; DB2C 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB2F:
        lda     Workset + EntityXSubspeed                             ; DB2F A5 30                    .0
        sta     $16                             ; DB31 85 16                    ..
        lda     Workset + EntityXSpeed                             ; DB33 A5 31                    .1
        sta     $17                             ; DB35 85 17                    ..
LDB37:
        lda     Workset + EntityXSubpixel                             ; DB37 A5 2C                    .,
        clc                                     ; DB39 18                       .
        adc     $16                             ; DB3A 65 16                    e.
        sta     Workset + EntityXSubpixel                             ; DB3C 85 2C                    .,
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
        jsr     WorksetMoveY                           ; DB55 20 1B 98                  ..
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
        lda     Workset + EntityHeader                             ; DB94 A5 20                    . 
        ora     #EntityHeaderFacingLeft                            ; DB96 09 10                    ..
        bne     LDB9E                           ; DB98 D0 04                    ..
LDB9A:
        .byte   $A5,$20,$29,$EF                 ; DB9A A5 20 29 EF              . ).
; ----------------------------------------------------------------------------
LDB9E:
        sta     Workset + EntityHeader                             ; DB9E 85 20                    . 
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
        lda     Workset + EntityHeader                             ; DC41 A5 20                    . 
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
        lda     PlayerData + EntityHeader                           ; DD11 AD 80 06                 ...
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
        sta     NMIRaisedFlag                           ; DD5D 8D 01 03                 ...
LDD60:
        jsr     WaitFor1Frame                           ; DD60 20 40 8C                  @.
        jsr     LDDC5                           ; DD63 20 C5 DD                  ..
        jsr     UpdateEntitySprites                           ; DD66 20 37 9A                  7.
        lda     PlayerData + EntityHeader                           ; DD69 AD 80 06                 ...
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
        jsr     SetNextPendingBGUpdate                           ; DD82 20 5F 8B                  _.
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
        bit     Workset + EntityHeader                             ; DDD0 24 20                    $ 
        bmi     LDE00                           ; DDD2 30 2C                    0,
        lda     #(EntityHeaderActive | EntityHeader7)                            ; DDD4 A9 C0                    ..
        sta     Workset + EntityHeader                             ; DDD6 85 20                    . 
        lda     #$40                            ; DDD8 A9 40                    .@
        sta     Workset + EntityX                             ; DDDA 85 22                    ."
        lda     #$01                            ; DDDC A9 01                    ..
        sta     Workset + EntityX  + 1                            ; DDDE 85 23                    .#
        lda     #$90                            ; DDE0 A9 90                    ..
        sta     Workset + EntityY                             ; DDE2 85 24                    .$
        lda     #$00                            ; DDE4 A9 00                    ..
        sta     Workset + EntityY + 1                             ; DDE6 85 25                    .%
        lda     #$00                            ; DDE8 A9 00                    ..
        sta     Workset + EntityXSubspeed                             ; DDEA 85 30                    .0
        lda     #$FC                            ; DDEC A9 FC                    ..
        sta     Workset + EntityXSpeed                             ; DDEE 85 31                    .1
        lda     #$00                            ; DDF0 A9 00                    ..
        sta     Workset + EntityYSubspeed                            ; DDF2 85 32                    .2
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
        jsr     WorksetMoveY                           ; DE07 20 1B 98                  ..
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
        sta     Workset + EntityXSubspeed                             ; DE2B 85 30                    .0
        lda     #$02                            ; DE2D A9 02                    ..
        sta     Workset + EntityXSpeed                             ; DE2F 85 31                    .1
        lda     #$10                            ; DE31 A9 10                    ..
        sta     Workset + EntityYSubspeed                            ; DE33 85 32                    .2
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
        jsr     WorksetMoveY                           ; DE5D 20 1B 98                  ..
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
        sta     Workset + EntityHeader                             ; DE8D 85 20                    . 
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
        bit     Workset + EntityHeader                             ; DEA3 24 20                    $ 
        bvs     LDEC4                           ; DEA5 70 1D                    p.
        lda     #(EntityHeaderActive | EntityHeader7)                            ; DEA7 A9 C0                    ..
        sta     Workset + EntityHeader                             ; DEA9 85 20                    . 
        lda     #$80                            ; DEAB A9 80                    ..
        sta     Workset + EntityX                             ; DEAD 85 22                    ."
        lda     #$A0                            ; DEAF A9 A0                    ..
        sta     Workset + EntityY                             ; DEB1 85 24                    .$
        lda     #$80                            ; DEB3 A9 80                    ..
        sta     Workset + EntityYSubspeed                            ; DEB5 85 32                    .2
        lda     #$10                            ; DEB7 A9 10                    ..
        sta     Workset + EntityXSubspeed                             ; DEB9 85 30                    .0
        lda     #$C0                            ; DEBB A9 C0                    ..
        sta     $34                             ; DEBD 85 34                    .4
        lda     #AnimationFinaleJawsDeath                            ; DEBF A9 0B                    ..
        jmp     WorksetAnimationPlay                           ; DEC1 4C AD 97                 L..

; ----------------------------------------------------------------------------
LDEC4:
        jsr     WorksetMoveX                           ; DEC4 20 FA 97                  ..
        jsr     WorksetMoveY                           ; DEC7 20 1B 98                  ..
        dec     $34                             ; DECA C6 34                    .4
        bne     LDED2                           ; DECC D0 04                    ..
        lda     #$00                            ; DECE A9 00                    ..
        sta     Workset + EntityHeader                             ; DED0 85 20                    . 
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

.include "sound.asm"

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
        ldx     #$00
        ldy     #$00
:       bit     PPUSTATUS
        bvc     :-
        bvs     LF611
WasteSomeTime:
        ; we kinda spin here for a few cycles, no reason.
        ldy     LF5BF,x
LF60E:
        dey
        bne     LF60E
LF611:
        lda     $401,x
        sta     PPUSCROLL
        lda     #$00
        sta     PPUSCROLL
        lda     Joy1Inputs
        and     #(JOY_LEFT|JOY_RIGHT)
        beq     LF655
        bpl     LF63E
        jmp     LF628

; ----------------------------------------------------------------------------
LF628:
        lda     $400,x
        clc
        adc     LF580,x
        sta     $400,x
        lda     $401,x
        adc     LF581,x
        sta     $401,x
        jmp     UnreasonableCode

; ----------------------------------------------------------------------------
LF63E:
        nop
        lda     BGDataPage1,x
        sec
        sbc     LF580,x
        sta     BGDataPage1,x
        lda     BGDataPage1+1,x
        sbc     LF581,x
        sta     BGDataPage1+1,x
        jmp     UnreasonableCode

; ----------------------------------------------------------------------------
LF655:
        bne     LF657
LF657:
        nop
        lda     BGDataPage1,x
        clc
        adc     LF580,x
        sta     $0460,y
        lda     BGDataPage1+1,x
        adc     LF581,x
        sta     $0460,y
        jmp     UnreasonableCode

; ----------------------------------------------------------------------------
UnreasonableCode:
        ldy LF5C0,x
        inx
        inx
        cpx #$40
        bcs UnknownCode5
        lda LF696,y
        sta $0462
        lda LF696+1,y
        sta $0463
        jmp ($0462)
UnknownCode0:
        nop
UnknownCode4:
        nop
UnknownCode1:
        nop
        cmp $00
        jmp WasteSomeTime
UnknownCode2:
        nop
UnknownCode3:
        nop
        nop
        nop
        jmp WasteSomeTime
UnknownCode5:
        rts
LF696:
        .addr UnknownCode1
        .addr UnknownCode3
        .addr UnknownCode4
        .addr UnknownCode2
        .addr UnknownCode0


CopyTextPause:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "             PAUSE              "

; unused?
.byte $00,$00,$00,$00
.byte $00,$FF,$FF,$FF,$FF,$FC,$F8,$F0 ; F6C7 00 FF FF FF FF FC F8 F0  ........
.byte $E3,$00,$00,$00,$00,$00,$00,$00 ; F6CF E3 00 00 00 00 00 00 00  ........
.byte $00,$87,$E1,$C0,$00,$00,$00,$80 ; F6D7 00 87 E1 C0 00 00 00 80  ........
.byte $00,$00,$00,$00,$00,$00,$00,$00 ; F6DF 00 00 00 00 00 00 00 00  ........
.byte $00,$EF,$8E,$88,$00,$00,$00,$00 ; F6E7 00 EF 8E 88 00 00 00 00  ........
.byte $00,$00,$00,$00,$00,$00,$00,$00 ; F6EF 00 00 00 00 00 00 00 00  ........
.byte $00,$FF,$0F,$03,$07,$03,$00,$00 ; F6F7 00 FF 0F 03 07 03 00 00  ........
.byte $00
        
        

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

MapEncounterTypeTable:
.byte $66,$66,$66,$66,$66,$66,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $66,$66,$66,$66,$66,$64,$30,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $66,$66,$66,$66,$66,$64,$00,$00,$00,$00,$00,$36,$66,$66,$30,$00
.byte $66,$66,$66,$66,$66,$63,$00,$00,$00,$00,$36,$66,$66,$66,$66,$40
.byte $66,$66,$B6,$66,$63,$00,$36,$63,$46,$63,$36,$66,$66,$66,$66,$43
.byte $66,$66,$33,$66,$66,$64,$36,$63,$46,$66,$33,$66,$66,$64,$44,$30
.byte $66,$66,$33,$66,$66,$63,$03,$30,$46,$66,$33,$66,$66,$66,$40,$00
.byte $66,$66,$30,$36,$66,$63,$00,$00,$46,$66,$30,$3A,$66,$66,$64,$00
.byte $66,$66,$30,$36,$66,$64,$00,$00,$34,$43,$03,$66,$66,$66,$64,$00
.byte $33,$66,$30,$36,$66,$43,$00,$00,$00,$00,$03,$66,$66,$66,$64,$30
.byte $03,$66,$30,$03,$34,$46,$66,$30,$00,$00,$04,$66,$66,$66,$64,$30
.byte $00,$33,$00,$00,$00,$46,$66,$66,$40,$00,$03,$46,$66,$66,$64,$00
.byte $00,$00,$00,$00,$00,$34,$46,$66,$40,$00,$00,$34,$44,$44,$43,$00
.byte $00,$46,$40,$00,$00,$00,$34,$44,$30,$00,$00,$00,$00,$00,$00,$00
.byte $00,$34,$30,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$46,$66
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$46,$66
.byte $30,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$66,$66
.byte $44,$30,$00,$00,$00,$04,$66,$40,$00,$00,$04,$66,$30,$04,$66,$66
.byte $46,$64,$40,$00,$00,$04,$66,$40,$00,$00,$44,$66,$64,$46,$66,$66
.byte $66,$64,$30,$00,$00,$03,$44,$30,$00,$04,$46,$66,$66,$66,$66,$66
.byte $66,$66,$64,$00,$00,$00,$00,$00,$00,$04,$66,$66,$66,$66,$66,$66
.byte $46,$66,$64,$00,$00,$00,$00,$00,$04,$66,$66,$66,$66,$66,$66,$66
.byte $46,$66,$64,$30,$00,$00,$00,$00,$04,$66,$66,$66,$66,$66,$66,$66
.byte $44,$46,$64,$44,$40,$00,$00,$00,$04,$44,$66,$66,$66,$66,$66,$66

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

