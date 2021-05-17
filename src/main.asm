; Disassembly of NES Jaws by threecreepio.
;

PPUCTRL                        = $2000
PPUMASK                        = $2001
PPUSTATUS                      = $2002
OAMADDR                        = $2003
OAMDATA                        = $2004
PPUSCROLL                      = $2005
PPUADDR                        = $2006
PPUDATA                        = $2007
OAMDMA                         = $4014
JOYPAD_PORT1                   = $4016
JOYPAD_PORT2                   = $4017

Sprite                         = $0200
SpritePosY                     = Sprite + 0
SpriteTile                     = Sprite + 1
SpriteAttr                     = Sprite + 2
SpritePosX                     = Sprite + 3
SPR                            = 4

; memory map
FinaleCurrentAction            = $08
FinaleBoatAnimationTimer       = $09
HitDetectYDirection            = $15
HitDetectXDistance             = $1A
HitDetectYDistance             = $1C
TempCoordX                     = $16
TempCoordY                     = $18
Workset                        = $20 ; $20 bytes of working data
WorksetPtr                     = $40
StatusbarPPULocation           = $48 ; 16 bit
MusicStatus                    = $4A
BonusEncounterPtr              = $50
BonusEncounterOffset           = $52
BonusCurrentWave               = $53
BonusEnemiesHit                = $54
BonusEnemiesHitInWave          = $55
VRAMBufferActive               = $0100
VRAMBufferOffset               = $0101
VRAMBuffer                     = $0102
PaletteLoadPending             = $0300
NMIRaisedFlag                  = $0301
NMISpriteHandlingDisabled      = $0302
NextBGUpdate                   = $0303
PendingBGUpdates               = $0304
ShowStatusBarTextLine          = $0305
EventFlags                     = $0306
ActiveCHR                      = $0307
CheatsEnabled                  = $0308
PPUCTRL_MIRROR                 = $030E
PPUMASK_MIRROR                 = $030F
WaterAnimationTimer            = $031A
WaterAnimationFrame            = $031B
SCROLL_X                       = $0320
SCROLL_Y                       = $0322
UseHighPPUNametables           = $0323
RNG0                           = $0324
RNG1                           = $0325
MapScrollX                     = $0328 ; 16 bit
MapScrollY                     = $032A ; 16 bit
MapScrollCurrentX              = $032C
Joy1Inputs                     = $0330
Joy2Inputs                     = $0331
Joy1Pressed                    = $0332
Joy2Pressed                    = $0333
SpriteUpdateDirection          = $0336
CameraX                        = $0338 ; 16 bit
CameraY                        = $033A ; 16 bit
EncounterMaxDepth              = $033E ; 16 bit
WaterHeight                    = $033C ; 16 bit
CurrentMapPositionFlags        = $0340
PlayerHasTracker               = $0341
TrackerAnimationIndex          = $0342
TrackerAnimationTimer          = $0343
TrackerDistancePrev            = $0344
TrackerTimer                   = $0345
TrackerDistanceNext            = $0346
JawsStashedX                   = $0348 ; 8 bit approximation of jaws last X coord
JawsStashedY                   = $0349 ; 8 bit approximation of jaws last Y coord
HitDetectionProjectileType     = $034A
EncounterJawsActive            = $034B
PortPowerupPrice               = $034C
PlayerNextActivePort           = $034D
MapSubmarineX                  = $034E
MapSubmarineY                  = $034F
HighScore                      = $0350
CurrentScore                   = $0380
PlayerNumberOfLives            = $0387
JawsHP                         = $0388 ; 16 bit
PlayerHasSubmarine             = $038A
BonusScreensPlayed             = $038B
PlayerStashedX                 = $038C ; 8 bit approximation of jaws last X coord
PlayerStashedY                 = $038D ; 8 bit approximation of jaws last Y coord
TotalEncountersPlayed          = $038E
BonusScreenEncounterCountdown  = $038F
PlayerShellCount               = $0390
PlayerPowerLevel               = $0391
PlayerCrabLevel                = $0392
PlayerStrobeCount              = $0393
ScoreForNextSubmarine          = $0394 ; 3 bytes
MapSubmarineVisible            = $0397
VisibleMapStripe1              = $0400
FinaleParallax1                = $0400
VisibleMapStripe2              = $0430
VisibleMapAttributes           = $0460
FinalePlayerPosition           = $0460
DrawVisibleMapDataPPUPosition  = $046D
DrawVisibleMapAttrPPUPosition  = $046E
ActivePalette                  = $046F
BGLoadedSlices                 = $0470 ; list of which slice of map is loaded into ppu
EncounterEnemiesOnScreen       = $0480
EncounterSpawnsIndex           = $0481
EncounterPatternsPtr           = $0482
EncounterSpawnTimer            = $0484
EncounterNextSpawnTimer        = $0486
EncounterNextSpawnTimer2       = $0487
EntityData                     = $0680 ; 680 - 87F

; used by EventFlags value
EventFlagsMapTouchedJaws       = %00000001
EventFlagsMapPortPurchasing    = %00000010
EventFlagsMapTriggerEncounter  = %00000100
EventFlagsPortNotEnoughShells  = %00001000
EventFlagsEncounterNoEnemies   = %00000001
EventFlagsEncounterNoSpawns    = %00000010
EventFlagsEncounterEnding      = %00000100
EventFlagsEncounterJawsDead    = %00100000
EventFlagsEncounterFinished    = %01000000
EventFlagsEncounterPlayerDead  = %10000000
EventFlagsFinaleJawsDead       = %10000000

; a lot of entity data
PlayerData                         = EntityData
FirstNonPlayerEntity               = EntityData + ( 1 * $20)
PlayerProjectile1Data              = FirstNonPlayerEntity
MapSubmarineEntityData             = FirstNonPlayerEntity
PlayerProjectile2Data              = EntityData + ( 2 * $20)
PlayerProjectile3Data              = EntityData + ( 3 * $20)
JawsData                           = EntityData + ( 4 * $20)
Enemy1Data                         = JawsData
Enemy2Data                         = EntityData + ( 5 * $20)
EntityDataSize                     = $20
MaxEnemies                         = 5
MaxProjectiles                     = 3
MaxEntities                        = 12
JawsMaxHP                          = $1400
JawsType                           = JawsData + EntityType
JawsX                              = JawsData + EntityX ; 16 bit
JawsY                              = JawsData + EntityY ; 16 bit
EntityHeader                       = $00
EntityType                         = $01
EntityX                            = $02 ; 16 bit
EntityY                            = $04 ; 16 bit
EntitySpritesetPtr                 = $06 ; 16 bit
EntityAnimPtr                      = $08 ; 16 bit
EntityAnimOffset                   = $0A
EntityAnimTimer                    = $0B
EntityBBoxW                        = $0E
EntityBBoxH                        = $0F
EntityXSubpixel                    = $0C
EntityYSubpixel                    = $0D
EntityXSubspeed                    = $10
EntityXSpeed                       = $11
EntityYSubspeed                    = $12
EntityYSpeed                       = $13
EntityAnimationIndex               = $14
EntityActiveAnimationIndex         = $15
EntityV16                          = $16
EntityIFrames                      = $1D
EntityHitDetection                 = $1F

EntityIsSinking                    = $18
EntityPickupTimer                  = $19
EntityStunTimer                    = $19
EntityBabysharkStunTimer           = $18
EntityMapJawsHeading               = $14
EntityMapPrevJawsHeading           = $15
EntityMapJawsTimer                 = $16
EntityMapJawsVisibility            = $17
EntityEncounterJawsSpawnTimer      = $14
EntityEncounterJawsIFrames         = $18
EntityStingraySpeed                = $17
EntityStingrayHP                   = $18
EntityStingrayDying                = $1A
EntityBabysharkHP                  = $17
EntityBonusJellyStartingPosition   = $14
EntityBonusJellyAnimationPathIndex = $15
EntityBonusJellyDelay              = $16
EntityBonusJellyPathPointer        = $18
EntityBonusJellyPathOffset         = $1A
EntityBonusJellyScore              = $1C
EntityBonusJellyAnimValue          = $1D
EntityOutroPlaneDelay              = $16

FinaleCurrentActionNone            = %00000000
FinaleCurrentActionJab             = %00000001
FinaleCurrentActionB7              = %10000000
FinaleCurrentActionB6              = %01000000
FinaleCurrentActionB4              = %00010000
FinaleJawsFlags2Reversing          = %00000001
FinaleJawsFlags2B7                 = %10000000

; offset into sprite memory where the finale boat sprites are located
FinaleBoatSpriteOffset          = SPR*8
; offset to the jabbing portion of the boat
FinaleBoatJabberSpriteOffset    = SPR*44
; offset into sprite memory where the finale jaws sprites are located
FinaleJawsSpriteOffset          = SPR*46
FinaleJawsFlags                 = Workset + EntityHeader
FinaleJawsFlags2                = Workset + EntityType
FinaleJawsX                     = Workset + EntityX
FinaleJawsY                     = Workset + EntityY
FinaleJawsAnimPtr1              = Workset + EntitySpritesetPtr
FinaleJawsAnimPtr               = Workset + EntityAnimPtr
FinaleJawsAnimOffset            = Workset + EntityAnimOffset
FinaleJawsAnimTimer             = Workset + EntityAnimTimer
FinaleJawsXSubpixel             = Workset + EntityXSubpixel
FinaleJawsYSubpixel             = Workset + EntityYSubpixel
FinaleJawsXSubspeed             = Workset + EntityXSubspeed
FinaleJawsXSpeed                = Workset + EntityXSpeed
FinaleJawsYSubspeed             = Workset + EntityYSubspeed
FinaleJawsYSpeed                = Workset + EntityYSpeed
FinaleJawsAnimationIndex        = Workset + EntityAnimationIndex
FinaleJawsActiveAnimationIndex  = Workset + EntityActiveAnimationIndex
FinaleJawsV16                   = Workset + EntityV16
FinaleJawsV17                   = Workset + $17
FinaleJawsXDirection            = Workset + $18
FinaleJawsSpriteAttrib          = Workset + $1E
FinaleJawsHitDetection          = Workset + EntityHitDetection

EntityHitEnabled                      = %00000001
EntityFlag1FBit2                      = %00000010
EntityHitProjectile                   = %01000000
EntityHitDetected                     = %10000000

EntityMovementStill                   = %00001000
EntityMovementNorth                   = %00000110
EntityMovementSouth                   = %00000010
EntityMovementWest                    = %00000100
EntityMovementEast                    = %00000000

EntityTypePlayerBoat                  = $00
EntityTypePlayerSubmarine             = $01
EntityTypePlayerSwim                  = $02
EntityTypeParachuteBomb               = $04

EntityTypeProjectileSubmarineBomb     = $01
EntityTypeProjectileSubmarineBullet   = $02
EntityTypeProjectileHarpoon           = $03

EncounterEntityJellyfish              = $0
EncounterEntityStingray               = $1
EncounterEntityHomingJellyfish        = $2
EncounterEntityBabyshark              = $3
EncounterEntityStingray2              = $4
EncounterEntityCrab                   = $8
EncounterEntityStar                   = $9
EncounterEntityShell                  = $A

EntityHeaderActive                    = %10000000
; all i can find using this flag is if it blocks projectiles
EntityHeader7                         = %01000000
; cant find actual usages of this
EntityHeader6                         = %00100000
EntityHeaderFacingLeft                = %00010000
EntityHeaderInvincible                = %00000010
; i think this is if jaws is on the surface on the map screen
EntityHeader1                         = %00000001

; statusbar display flags
DrawStatusbarScoreFlag                = %10000000
DrawStatusbarJawsPowerFlag            = %01000000
DrawBGEncounterWater                  = %00100000
DrawVRAMBufferFlag                    = %00010000
DrawStatusbarShellsFlag               = %00001000

; joypad buttons
JOY_A                 = %00000001
JOY_B                 = %00000010
JOY_SELECT            = %00000100
JOY_START             = %00001000
JOY_UP                = %00010000
JOY_DOWN              = %00100000
JOY_LEFT              = %01000000
JOY_RIGHT             = %10000000

; vram flag
VRAMFlagMultipleBytes = %10000000

; location used by status bar texts (like YOUVE HIT JAWS) to display in the PPU
PPUADDRStatusbarText               = $2B20

.segment "PRG"
.org $8000
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

; unused alignment padding
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

.align $100
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
        jsr SpritesetUpdateScreen
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
        SoundtestSelected = $00
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
        jsr SpritesetUpdateScreen
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
        ; stop music playback
        sta MusicStatus
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
        ; restart music
        sta MusicStatus
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
        stx EncounterJawsActive
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
        ; wait until sound channel 0 has stopped
        lda SoundChannel0
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
        jsr PrepareEncounterPatterns
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
        jsr SpritesetUpdateScreen
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
        ; stop music
        sta MusicStatus
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
        ; reactivate music
        lda #$00
        sta MusicStatus
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
        ; if sound channel 2 is still active, keep waiting
        bit SoundChannel2
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
        jsr RunFinaleScreen
        ; we failed the finale, oh no!
        ; reset jaws hp
        lda #<JawsMaxHP
        sta JawsHP
        lda #>JawsMaxHP
        sta JawsHP+1
        ; give the player back some strobes
        lda #3
        sta PlayerStrobeCount
        ; and back to the map we go
        jmp RunMapScreen
                 
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
        jsr SpritesetUpdateScreen
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
        bvs @IsActive
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$00
        sta Workset + EntityAnimationIndex
        lda #$20
        sta Workset + EntityActiveAnimationIndex
        lda #AnimationEncounterPlayerDeath1
        jsr WorksetAnimationPlay
        jmp WorksetSave
@IsActive:
        bit Workset + EntityAnimationIndex
        bmi @CheckHitDetection
        dec Workset + EntityActiveAnimationIndex
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
        cmp #8
        bcc @NextEntity
        ; play secondary death animation
        lda #$80
        sta Workset + EntityAnimationIndex
        lda #AnimationEncounterPlayerDeath2
        jsr WorksetAnimationPlay
        lda #$00
        sta Workset + EntityYSubspeed
        ; make player descend off the screen
        lda #$01
        sta Workset + EntityYSpeed
        jmp WorksetSave
@CheckHitDetection:
        lda #EntityHitEnabled
        bit Workset + EntityHitDetection
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
        sbc PortPowerupPrice
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
        jsr SpritesetUpdateScreen
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
        jsr SpritesetUpdateScreen
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
        jsr SpritesetUpdateScreen
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
        sta PlayerData+EntityX
        lda @Temp2
        adc #$00
        sta PlayerData+EntityX+1
        lda PlayerStashedY
        jsr SplitByteNybbles
        lda @Temp1
        clc
        adc #$08
        sta PlayerData+EntityY
        lda @Temp2
        adc #$00
        sta PlayerData+EntityY+1
        rts

; store an approximation of the players coordinates in PlayerStashedX and PlayerStashedY
StashPlayerLocation:
        lda PlayerData+EntityX+1
        lsr a
        lda PlayerData+EntityX
        ror a
        lsr a
        lsr a
        lsr a
        sta PlayerStashedX
        lda PlayerData+EntityY+1
        lsr a
        lda PlayerData+EntityY
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
        lda SoundStatus
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
:       bit PPUSTATUS       ; delay until spr0 hit
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
.byte   $AD,$0E,$03,$09,$04,$8D,$0E,$03
.byte   $8D,$01,$20,$60,$85,$17,$18,$A9
.byte   $00,$24,$17,$10,$03,$A9,$0F,$38
.byte   $66,$17,$6A,$66,$17,$6A,$66,$17
.byte   $6A,$66,$17,$6A,$85,$16,$60    

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
.byte   $A0,$3C,$20,$50,$8C,$CA,$D0,$F8
.byte   $60                            
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
        lda RomGraphicsFacingDirectionsPerEntityType,x
        sta @ROMPointer
        lda RomGraphicsFacingDirectionsPerEntityType+1,x
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
        jsr PPUDisableRendering
        jsr PPURenderHorizontal
        lda #$00
        sta NextBGUpdate
        sta NMISpriteHandlingDisabled
        sta PendingBGUpdates
        sta ShowStatusBarTextLine
        jsr ClearScreen
        jsr MoveAllSpritesOffscreen
        rts

; ----------------------------------------------------------------------------
PPUClear:
        ; clear out flags related to ppu
        lda #$00
        sta NextBGUpdate
        sta PendingBGUpdates
        jsr PPUDisableRendering
        jsr MoveAllSpritesOffscreen
        jsr PPURenderHorizontal
        ; set ppu to $2000
        lda #$20
        sta PPUADDR
        lda #$00
        sta PPUADDR
        tax
        ldy #$04
@Draw0:
        ; clear out a page of ppu data
        sta PPUDATA
        dex
        bne @Draw0
        dey
        bne @Draw0
        ; set ppu to $2828
        lda #$28
        sta PPUADDR
        stx PPUADDR
        txa
        ldy #$04
        ldx #$40
@Draw1:
        ; keep on clearing out ppu data
        sta PPUDATA
        dex
        bne @Draw1
        dey
        bne @Draw1
        ; set ppu to $2BC0
        lda #$2B
        sta PPUADDR
        lda #$C0
        sta PPUADDR
        ldx #$30
@Draw2:
        ; and clear out the rest of that ppu data.
        sty PPUDATA
        dex
        bne @Draw2
        ; all clear!
        rts

; ----------------------------------------------------------------------------
ClearScreen:
        ; set ppu to $2000 and clear out
        lda #$20
        sta PPUADDR
        jsr @ClearScreen1
        ; set ppu to $2800 and clear out
        lda #$28
        sta PPUADDR
@ClearScreen1:
        lda #$00
        sta PPUADDR
        ldy #$04
        tax
@WritePPUDATA:
        ; keep writing 0 bytes to ppu
        sta PPUDATA
        dex
        bne @WritePPUDATA
        dey
        bne @WritePPUDATA
        rts

; ----------------------------------------------------------------------------
MoveAllSpritesOffscreen:
        lda #$F0
        ldx #$00
@MoveNextSprite:
        ; set Y position of every sprite to $F0 (off screen)
        sta SpritePosY,x
        inx
        inx
        inx
        inx
        bne @MoveNextSprite
        ; and toggle off sprite handling until re-enabled.
        lda #$01
        sta NMISpriteHandlingDisabled
        rts

; ----------------------------------------------------------------------------
DMACopySprites:
        lda #$00
        sta OAMADDR
        sta NMISpriteHandlingDisabled
        lda #$02
        sta OAMDMA
        rts

; ----------------------------------------------------------------------------
StoreActivePaletteAndWaitFor1Frame:
        sta ActivePalette
        ; set palette load flag
        lda PaletteLoadPending
        ora #$01
        sta PaletteLoadPending
        ; store previous ppu mask + ctrl state
        lda PPUMASK_MIRROR
        pha
        jsr PPUDisableRendering
        lda PPUCTRL_MIRROR
        pha
        jsr PPUEnableNMI
        ; waiting for a frame will trigger the palette load
        jsr WaitFor1Frame
        ; try but ultimately fail to restore ppu state.
        pla
        sta PPUCTRL_MIRROR
        ; overwrite ppumask state with previous ppuctrl state. oops.
        ; oh well, it'll get fixed up later.. no worries.
        sta PPUMASK
        pla
        sta PPUMASK_MIRROR
        sta PPUMASK
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

; JumpEngine
; Reads a list of pointers after the code that JSR'ed
; into it and jumps into the pointer for the A register.
; Pretty standard jumpengine code.
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
        jsr LoadPlayerWorkset
        bit Workset + EntityHeader
        bvs @PlayerIsActive
        ; activate player
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$08
        sta Workset + EntityAnimationIndex
        lda #$FF
        sta Workset + EntityActiveAnimationIndex
        jsr MapRunPlayerAnimation
        jsr WorksetClearSpeed
        jmp SaveWorksetAndRTS
@PlayerIsActive:
        lda #$08
        bit Workset + EntityAnimationIndex
        beq @ProcessMapMovement
        jsr MapGetDPadDirection
        cmp #$08
        bcc @PlayerHoldingDPadDirection
        ; no direction was held.
        jsr MapRunPlayerAnimation
        jmp SaveWorksetAndRTS
@PlayerHoldingDPadDirection:
        sta Workset + EntityAnimationIndex
        jsr GetPassableFlagAtTargetLocation
        bcs @NonPassable
        jsr MapRunPlayerAnimation
        jsr MapUpdatePlayerSpeed
        jmp @MapMovePlayer
@NonPassable:
        ; freeze the player, we can't move in the
        ; direction they are pressing.
        lda Workset + EntityAnimationIndex
        ora #EntityMovementStill
        sta Workset + EntityAnimationIndex
        jsr MapRunPlayerAnimation
        jmp SaveWorksetAndRTS
@ProcessMapMovement:
        jsr MapGetDPadDirection
        ; branch away if no direction is held.
        cmp #$08
        bcs @KeepMoving
        tax
        adc Workset + EntityAnimationIndex
        and #$07
        cmp #$04
        bne @KeepMoving
        stx Workset + EntityAnimationIndex
        jsr MapRunPlayerAnimation
        jsr MapUpdatePlayerSpeed
@KeepMoving:
        jsr WorksetAnimationAdvance
@MapMovePlayer:
        jsr WorksetMoveX
        jsr WorksetMoveY
        ; check if we are properly lined up on the X coordinate
        lda Workset + EntityX
        and #%00001111
        cmp #%00001000
        beq @CheckYAlignment
        jmp SaveWorksetAndRTS
@CheckYAlignment:
        ; check if we are properly lined up on the Y coordinate
        lda Workset + EntityY
        and #%00001111
        cmp #%00001000
        beq @InteractWithCoordinate
        jmp SaveWorksetAndRTS
@InteractWithCoordinate:
        @PortIndex = $12
        ; if we are lined up on the coordinate,
        ; it's time to stop the movement and check for events.
        lda Workset + EntityAnimationIndex
        ora #EntityMovementStill
        sta Workset + EntityAnimationIndex
        ; stop the player and get flags for the current position.
        jsr WorksetClearSpeed
        jsr CopyWorksetCoordinatesToTempCoordinate
        jsr GetWorldMapFlagsAtTempCoords
        sec
        ; check if the tile is a port
        sbc #$0A
        bcc @CheckForSubmarinePickup
        cmp #$02
        bcs @CheckForSubmarinePickup
        ; make sure we're not returning to the last port we were at
        sta @PortIndex
        eor PlayerNextActivePort
        bne @CheckForSubmarinePickup
        ; branch to buy power level increase if we have the tracker.
        bit PlayerHasTracker
        bmi @PortCheckPowerLevel
        ; can we afford the tracker, it costs 5 shells!
        lda PlayerShellCount
        cmp #$05
        bcc @PlayerCantAffordPortPrice
        ; buy that tracker!
        lda #$05
        jmp @PurchasePortItem
@PortCheckPowerLevel:
        ; if we already maxed out power level, fall back
        ; to buying strobes.
        ldx PlayerPowerLevel
        cpx #$08
        bcs @PortBuyStrobes
        ; otherwise compare the price to our shell count.
        ; buy it if we can, otherwise bail out.
        lda PlayerShellCount
        cmp ShellPricePerPowerLevel,x
        bcc @PlayerCantAffordPortPrice
        lda ShellPricePerPowerLevel,x
        jmp @PurchasePortItem
@PortBuyStrobes:
        ; a strobe costs 10 shells, check if we can afford it.
        lda PlayerShellCount
        cmp #$0A
        bcc @PlayerCantAffordPortPrice
        lda #$0A
@PurchasePortItem:
        sta PortPowerupPrice
        ; prepare to enter the port.
        lda EventFlags
        ora #EventFlagsMapPortPurchasing
        sta EventFlags
        ; switch next port to active so player can't
        ; just keep going to the same port over and over.
        lda PlayerNextActivePort
        eor #%00000001
        sta PlayerNextActivePort
        jmp SaveWorksetAndRTS
@PlayerCantAffordPortPrice:
        lda EventFlags
        ora #EventFlagsPortNotEnoughShells
        sta EventFlags
        jmp SaveWorksetAndRTS
@CheckForSubmarinePickup:
        bit MapSubmarineVisible
        bpl @CheckForEncounter
        bvc @CheckForEncounter
        jsr CopyWorksetCoordinatesToTempCoordinate
        ; compare player x position to submarine x
        lsr TempCoordX+1
        ror TempCoordX
        lsr TempCoordX
        lsr TempCoordX
        lsr TempCoordX
        lda MapSubmarineX
        cmp TempCoordX
        ; branch away if we're not at the right x coordinate.
        bne @CheckForEncounter
        ; compare player y position to submarine y
        lsr TempCoordY+1
        ror TempCoordY
        lsr TempCoordY
        lsr TempCoordY
        lsr TempCoordY
        lda MapSubmarineY
        cmp TempCoordY
        ; branch away if we're not at the right y coordinate
        bne @CheckForEncounter
        ; give the player their submarine!
        lda #$01
        sta PlayerHasSubmarine
        ; and clear visibility flag.
        lda #$00
        sta $06A0
        sta MapSubmarineVisible
@CheckForEncounter:
        ; advance our rng!
        jsr RNGAdvance
        ; if one of the low bits are set we will not trigger.
        and #%00011111
        bne SaveWorksetAndRTS
        lda EventFlags
        ora #EventFlagsMapTriggerEncounter
        sta EventFlags
        jsr CopyWorksetCoordinatesToTempCoordinate
        jsr GetWorldMapFlagsAtTempCoords
        ; if the flags are 6 or higher, clamp down to 4.
        cmp #$06
        bcc @NoCarry
        lda #$04
@NoCarry:
        sta CurrentMapPositionFlags
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
        ; if the new animation is the same as the old
        ; there's no need to do anything.
        lda Workset + EntityAnimationIndex
        cmp Workset + EntityActiveAnimationIndex
        beq @Done
        ; otherwise update the active animation.
        sta Workset + EntityActiveAnimationIndex
        ; double the animation index.
        ; this appears to be ultimately pointless.
        asl a
        tay
        ; double the entitytype (also pointless.)
        lda Workset + EntityType
        asl a
        tax
        ; get a pointer to BoatAnimations from the Animations set.
        ; it only has the one value in it 3 times so it'll always be boat.
        lda @Animations,x
        sta @TempPointer
        lda @Animations+1,x
        sta @TempPointer+1
        ; clear out the facing direction and.. header bit 6!
        lda Workset + EntityHeader
        and #($FF ^ EntityHeader6 ^ EntityHeaderFacingLeft)
        ; and OR in the first byte from the animation set, which will
        ; set the facingleft flag if needed.
        ora (@TempPointer),y
        sta Workset + EntityHeader
        ; then get the animation index and start playing.
        iny
        lda (@TempPointer),y
        jsr WorksetAnimationPlay
@Done:
        rts

@Animations:
        .addr @BoatAnimations
        .addr @BoatAnimations
        .addr @BoatAnimations

; first byte is OR'ed with EntityHeader, used to flip the sprites.
@BoatAnimations:
        .byte $00,AnimationMapBoatEW
        .byte $00,AnimationMapBoatEW        ; boat heading east
        .byte $00,AnimationMapBoatS
        .byte $00,AnimationMapBoatS         ; boat heading south
        .byte EntityHeaderFacingLeft,AnimationMapBoatEW
        .byte EntityHeaderFacingLeft,AnimationMapBoatEW        ; boat heading west
        .byte $00,AnimationMapBoatN
        .byte $00,AnimationMapBoatN         ; boat heading north
        .byte $00,AnimationMapBoatStillEW
        .byte $00,AnimationMapBoatStillEW   ; boat facing east
        .byte $00,AnimationMapBoatStillS
        .byte $00,AnimationMapBoatStillS    ; boat facing south
        .byte EntityHeaderFacingLeft,AnimationMapBoatStillEW
        .byte EntityHeaderFacingLeft,AnimationMapBoatStillEW   ; boat facing west
        .byte $00,AnimationMapBoatStillN
        .byte $00,AnimationMapBoatStillN    ; boat facing north

; ----------------------------------------------------------------------------
MapGetDPadDirection:
        @TempPointer = $44
        ; gets player movement direction based on d-pad inputs.
        ; we can have different directions based on the players vehicle,
        ; but since there's only a boat it doesn't really matter.
        lda Workset + EntityType
        asl a
        tax
        lda FacingDirectionsPerEntityType,x
        sta @TempPointer
        lda FacingDirectionsPerEntityType+1,x
        sta @TempPointer+1
        ; get d-pad inputs
        lda Joy1Inputs
        lsr a
        lsr a
        lsr a
        lsr a
        ; and load a value based on which direction inputs
        tay
        lda (@TempPointer),y
        rts

FacingDirectionsPerEntityType:
        .addr FacingDirectionsBoat
        .addr FacingDirectionsBoat
        .addr FacingDirectionsBoat

FacingDirectionsBoat:
        .byte $08 ; no directions held
        .byte $06 ; up
        .byte $02 ; down
        .byte $08 ; up + down
        .byte $04 ; left
        .byte $04 ; left + up
        .byte $04 ; left + down
        .byte $08 ; left + up + down
        .byte $00 ; right
        .byte $00 ; right + up
        .byte $00 ; right + down
        .byte $08 ; right + up + down
        .byte $08 ; right + left
        .byte $08 ; right + left + up
        .byte $08 ; right + left + down
        .byte $08 ; right + left + up + down

; ----------------------------------------------------------------------------
MapUpdatePlayerSpeed:
        ; get offset into MapPlayerSpeeds table
        lda Workset + EntityAnimationIndex
        asl a
        asl a
        tax
        ; and copy speedsd from that table into the workset.
        lda MapPlayerSpeeds,x
        sta Workset + EntityXSubspeed
        lda MapPlayerSpeeds+1,x
        sta Workset + EntityXSpeed
        lda MapPlayerSpeeds+2,x
        sta Workset + EntityYSubspeed
        lda MapPlayerSpeeds+3,x
        sta Workset + EntityYSpeed
        ; and that's all she wrote.
        rts

; ----------------------------------------------------------------------------
MapPlayerSpeeds:
        .byte $00,$01,$00,$00
        .byte $00,$01,$00,$01
        .byte $00,$00,$00,$01
        .byte $00,$FF,$00,$01
        .byte $00,$FF,$00,$00
        .byte $00,$FF,$00,$FF
        .byte $00,$00,$00,$FF
        .byte $00,$01,$00,$FF

; ----------------------------------------------------------------------------
GetPassableFlagAtTargetLocation:
        ; get offset into movement table from playing animation
        lda Workset + EntityAnimationIndex
        asl a
        tax
        ; set Y to offset for Y movement
        ldy @NextCoordinate+1,x
        ; and set X to offset for X movement
        lda @NextCoordinate,x
        tax
        ; then get the flags for the coordinate the entity
        ; is attempting to move to.
        jsr GetWorldMapFlagsAtTargetLocation
        ; not quite sure why we change how we compare these.
        ; but if carry is set after this, the next position is not passable.
        cmp #%00001010
        bcc @Compare2
        cmp #%00001100
        rts
@Compare2:
        cmp #%00000100
        rts
@NextCoordinate:
        .byte $10,$00
        .byte $10,$10
        .byte $00,$10
        .byte $F0,$10
        .byte $F0,$00
        .byte $F0,$F0
        .byte $00,$F0
        .byte $10,$F0
; ----------------------------------------------------------------------------
MapShowSubmarine:
        bit MapSubmarineVisible
        bmi @ShowSubmarine
        rts
@ShowSubmarine:
        bvs @Done
        lda #$C0
        sta MapSubmarineVisible
        jsr RNGAdvance
        and #$06
        tax
        lda MapSubmarineSpawnLocations,x
        sta MapSubmarineX
        lda MapSubmarineSpawnLocations+1,x
        sta MapSubmarineY
        lda #$00
        sta MapSubmarineEntityData
@Done:
        bit MapSubmarineEntityData
        bvc SpawnMapSubmarineEntity
        rts

; ----------------------------------------------------------------------------
SpawnMapSubmarineEntity:
        ; load map submarine entity data
        lda #<MapSubmarineEntityData
        sta WorksetPtr
        lda #>MapSubmarineEntityData
        sta WorksetPtr+1
        jsr WorksetLoad
        ; mark the entity as activated
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        ; and clear out any old location data.
        lda #$00
        sta Workset + (EntityX + 1)
        sta Workset + (EntityY + 1)
        ; convert submarine X coordinate to pixel position.
        lda MapSubmarineX
        sec
        rol a
        rol Workset + (EntityX  + 1)
        asl a
        rol Workset + (EntityX  + 1)
        asl a
        rol Workset + (EntityX  + 1)
        asl a
        rol Workset + (EntityX  + 1)
        sta Workset + EntityX
        ; convert submarine Y coordinate to pixel position.
        lda MapSubmarineY
        sec
        rol a
        rol Workset + (EntityY + 1)
        asl a
        rol Workset + (EntityY + 1)
        asl a
        rol Workset + (EntityY + 1)
        asl a
        rol Workset + (EntityY + 1)
        sta Workset + EntityY
        ; and play the submarine animation.
        lda #AnimationMapSubmarine
        jsr WorksetAnimationPlay
        jmp WorksetSave

; ----------------------------------------------------------------------------
MapSubmarineSpawnLocations:
        ;       X,   Y
        .byte $09, $04
        .byte $1A, $11
        .byte $1E, $01
        .byte $07, $15


; ----------------------------------------------------------------------------
EncounterRunPlayer:
        jsr LoadPlayerWorkset
        lda Workset + EntityType
        jsr JumpEngine
        .addr EncounterRunPlayerBoat
        .addr EncounterRunPlayerSubmarine
        .addr EncounterRunPlayerSwim

; ----------------------------------------------------------------------------
EncounterRunPlayerBoat:
        bit Workset + EntityHeader
        bvs @BoatIsActive
        ; place boat at starting location
        lda #$80
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX  + 1
        lda WaterHeight
        sec
        sbc #$03
        sta Workset + EntityY
        lda WaterHeight+1
        sbc #$00
        sta Workset + EntityY + 1
        ; set iframes to prevent immediate boat despawn.
        lda #$20
        sta Workset + EntityIFrames
        ; and play our boat animation!
        lda #AnimationEncounterBoat
        jsr WorksetAnimationPlay
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        jmp WorksetSave
@BoatIsActive:
        lda EncounterJawsActive
        beq @JawsIsActive
        ; if jaws is not active, we want to wait until iframes
        ; run out and then despawn the boat.
        dec Workset + EntityIFrames
        beq RemovePlayerVehicle
        jmp WorksetSave
; -------------------------------------------
@JawsIsActive:
        bit Workset + EntityHitDetection
        bpl EncounterHandleBoatInputs
RemovePlayerVehicle:
        ; clear flag 7
        lda Workset + EntityHeader
        and #($FF ^ EntityHeader7)
        sta Workset + EntityHeader
        ; play splashy noise
        lda #SFXEncounterBoatDespawn
        jsr SoundPlay
        ; turn into submarine if player has collected it.
        lda PlayerHasSubmarine
        bne @ConvertToSubmarine
        ; otherwise it's time to swim
        lda #EntityTypePlayerSwim
        sta Workset + EntityType
        jmp EncounterRunPlayerSwim
@ConvertToSubmarine:
        lda #EntityTypePlayerSubmarine
        sta Workset + EntityType
        jmp EncounterRunPlayerSubmarine

; ----------------------------------------------------------------------------
EncounterHandleBoatInputs:
        bit Joy1Inputs
        bpl @CheckLeftInput
        ; move to the right
        lda Workset + EntityHeader
        and #($FF ^ EntityHeaderFacingLeft) ; clear left facing flag
        sta Workset + EntityHeader
        ; load crab level to determine speed
        lda PlayerCrabLevel
        asl a
        tax
        ; andn increment position
        lda Workset + EntityXSubpixel
        clc
        adc EncounterPlayerBoatSpeedsByCrabLevel,x
        sta Workset + EntityXSubpixel
        lda Workset + EntityX
        adc EncounterPlayerBoatSpeedsByCrabLevel+1,x
        sta Workset + EntityX
        tay
        ; add carry
        lda Workset + EntityX  + 1
        adc #$00
        sta Workset + EntityX  + 1
        ; check so we're not at the right edge of the screen
        cpy #$E0
        sbc #$10
        bcc @CheckLeftInput
        ; if so, place boat on the right edge
        lda #$00
        sta Workset + EntityXSubpixel
        lda #$E0
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX + 1
@CheckLeftInput:
        bit Joy1Inputs
        bvc @CheckFireInputs
        ; move to the left
        lda Workset + EntityHeader
        ora #EntityHeaderFacingLeft
        sta Workset + EntityHeader
        ; load crab level to determine speed
        lda PlayerCrabLevel
        asl a
        tax
        ; andn increment position
        lda Workset + EntityXSubpixel
        sec
        sbc EncounterPlayerBoatSpeedsByCrabLevel,x
        sta Workset + EntityXSubpixel
        lda Workset + EntityX
        sbc EncounterPlayerBoatSpeedsByCrabLevel+1,x
        sta Workset + EntityX
        tay
        ; add carry
        lda Workset + EntityX  + 1
        sbc #$00
        sta Workset + EntityX  + 1
        ; check so we're not at the left edge of the screen
        cpy #$1F
        sbc #$10
        bcs @CheckFireInputs
        ; if so, place boat on the left edge
        lda #$00
        sta Workset + EntityXSubpixel
        lda #$20
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX  + 1
@CheckFireInputs:
        ; check for A or B presses
        lda #%00000011
        bit Joy1Pressed
        beq @Done
        ; check for empty projectile slot
        jsr FindEmptyProjectileSlot
        bmi @Done
        ; found one, fire away!
        lda #$00
        sta PlayerProjectile1Data + EntityType,x
        ; check if we want to fire to the left
        lda #$01
        bit Joy1Pressed
        beq @FireLeft
        ; otherwise fire to the right!
        lda #EntityHeaderActive
        jmp @Fire
@FireLeft:
        lda #(EntityHeaderActive | EntityHeaderFacingLeft)
@Fire:
        sta PlayerProjectile1Data + EntityHeader,x
@Done:
        jmp WorksetSave

; ----------------------------------------------------------------------------
EncounterPlayerBoatSpeedsByCrabLevel:
        .byte $00,$01
        .byte $40,$01
        .byte $80,$01
        .byte $C0,$01
        .byte $00,$02

; ----------------------------------------------------------------------------
EncounterRunPlayerSubmarine:
        @TempAccel = $16
        @TempSpeed = $18
        bit Workset + EntityHeader
        bvs @SubmarineActive
        ; mark as active, and facing right
        lda Workset + EntityHeader
        and #(EntityHeaderActive | EntityHeaderFacingLeft)
        ; also set these flags...
        ora #(EntityHeader7 | EntityHeaderInvincible)
        sta Workset + EntityHeader
        lda #AnimationEncounterSubmarine
        jsr WorksetAnimationPlay
        lda #$00
        sta Workset + EntityHitDetection
        ; give some iframes after spawning
        lda #$B4
        sta Workset + EntityIFrames
        jmp WorksetSave
@SubmarineActive:
        lda Workset + EntityIFrames
        beq @CheckForDamage
        dec Workset + EntityIFrames
        bne @HandleSubmarineInputs
        lda Workset + EntityHeader
        and #($FF ^ EntityHeaderInvincible)
        sta Workset + EntityHeader
@CheckForDamage:
        bit Workset + EntityHitDetection
        bpl @HandleSubmarineInputs
        ; time to despawn the submarine
        lda Workset + EntityHeader
        and #($FF ^ EntityHeader7)
        sta Workset + EntityHeader
        ; remove submarine flag
        lda #$00
        sta PlayerHasSubmarine
        ; and turn player into a swimmer, with a splash sound.
        lda #EntityTypePlayerSwim
        sta Workset + EntityType
        lda #SFXEncounterBoatDespawnDupe
        jsr SoundPlay
        jmp EncounterRunPlayerSwim
@HandleSubmarineInputs:
        bit Joy1Inputs
        bpl @NotHoldingRight
        ; player is holding right
        ; set acceleration temp values
        lda #$20
        sta @TempAccel
        lda #$00
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSubmarineSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSubmarineSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityXSubspeed
        jsr ApproachSpeed2
        ; make sure the player is facing right
        lda Workset + EntityHeader
        and #($FF ^ EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        ; and check vertical movement!
        jmp @CheckDownInput
@NotHoldingRight:
        bvs @HoldingLeft
        ; set some vertical movement values
        ldy #$10
        jsr SlowdownXByY
        jmp @CheckDownInput
@HoldingLeft:
        ; player is holding left
        ; set acceleration temp values
        lda #$E0
        sta @TempAccel
        lda #$FF
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSubmarineNegativeSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSubmarineNegativeSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityXSubspeed
        jsr ApproachSpeed2
        ; make sure the player is facing left
        lda Workset + EntityHeader
        ora #EntityHeaderFacingLeft
        sta Workset + EntityHeader
@CheckDownInput:
        lda #JOY_DOWN
        bit Joy1Inputs
        beq @NotHoldingDown
        ; player is holding down
        ; set acceleration temp values
        lda #$20
        sta @TempAccel
        lda #$00
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSubmarineSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSubmarineSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityYSubspeed
        jsr ApproachSpeed2
        jmp @MoveSubmarinePlayer
@NotHoldingDown:
        lda #JOY_UP
        bit Joy1Inputs
        bne @HoldingUp
        ldy #$10
        jsr SlowdownYByY
        jmp @MoveSubmarinePlayer
@HoldingUp:
        ; player is holding up
        ; set acceleration temp values
        lda #$E0
        sta @TempAccel
        lda #$FF
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSubmarineNegativeSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSubmarineNegativeSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityYSubspeed
        jsr ApproachSpeed2
@MoveSubmarinePlayer:
        jsr WorksetMoveX
        jsr WorksetMoveY
        ldx Workset + EntityX
        lda Workset + EntityX  + 1
        ; clamp to the left edge of the screen
        cpx #$10
        sbc #$10
        bcs @CheckRightEdge
        lda #$10
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX  + 1
        bne @WithinXBounds
@CheckRightEdge:
        lda Workset + EntityX  + 1
        ; clamp to the right edge of the screen
        cpx #$F0
        sbc #$10
        bcc @WithinXBounds
        lda #$F0
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX  + 1
@WithinXBounds:
        jsr EncounterClampWorksetMinimumY
        bcs @CheckFireProjectile
        jsr EncounterClampWorksetMaximumY
@CheckFireProjectile:
        ; check for A/B inputs in order to fire.
        lda #(JOY_A | JOY_B)
        bit Joy1Pressed
        beq @Done
        ; player is trying to fire, check for empty slot.
        ; otherwise finish up.
        jsr FindEmptyProjectileSlot
        bmi @Done
        ; get bullet type based on input (bomb vs bullet)
        lda #JOY_A
        bit Joy1Pressed
        beq @FireBomb
        lda #EntityTypeProjectileSubmarineBullet
        bne @SpawnProjectile
@FireBomb:
        lda #EntityTypeProjectileSubmarineBomb
@SpawnProjectile:
        ; store projectile type
        sta PlayerProjectile1Data + EntityType,x
        ; and copy active + facing directions from player
        lda Workset + EntityHeader
        and #(EntityHeaderActive | EntityHeaderFacingLeft)
        ; and store it!
        sta PlayerProjectile1Data + EntityHeader,x
@Done:
        ; we are done, save our workset!
        jmp WorksetSave

; ----------------------------------------------------------------------------

EncounterPlayerSubmarineSpeedsByCrabLevel:
        .byte $00,$01
        .byte $40,$01
        .byte $80,$01
        .byte $C0,$01
        .byte $00,$02

EncounterPlayerSubmarineNegativeSpeedsByCrabLevel:
        .byte $00,$FF
        .byte $C0,$FE
        .byte $80,$FE
        .byte $40,$FE
        .byte $00,$FE

; ----------------------------------------------------------------------------
EncounterRunPlayerSwim:
        @TempAccel = $16
        @TempSpeed = $18
        bit Workset + EntityHeader
        bvs @SwimmerActive
        ; mark as active, and facing right
        lda Workset + EntityHeader
        and #(EntityHeaderActive | EntityHeaderFacingLeft)
        ; also set these flags...
        ora #(EntityHeader7 | EntityHeaderInvincible)
        sta Workset + EntityHeader
        lda #AnimationEncounterSwim
        jsr WorksetAnimationPlay
        lda #$00
        sta Workset + EntityHitDetection
        ; give some iframes after spawning
        lda #$B4
        sta Workset + EntityIFrames
        jmp WorksetSave
@SwimmerActive:
        lda Workset + EntityIFrames
        beq @CheckForDamage
        dec Workset + EntityIFrames
        bne @HandleSwimmerInputs
        lda Workset + EntityHeader
        and #($FF ^ EntityHeaderInvincible)
        sta Workset + EntityHeader
@CheckForDamage:
        bit Workset + EntityHitDetection
        bpl @HandleSwimmerInputs
        ; i'm afraid the player has died.
        ; play death sound and set the death event!
        lda #SFXPlayerDeath
        jsr SoundPlay
        lda #EventFlagsEncounterPlayerDead
        sta EventFlags
        rts
@HandleSwimmerInputs:
        bit Joy1Inputs
        bpl @NotHoldingRight
        ldy #$10
        lda #JOY_A
        bit Joy1Pressed
        beq @HandleRightInput
        ; holding A reduces speed
        ldy #$80
@HandleRightInput:
        ; set acceleration temp values
        sty @TempAccel
        lda #$00
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSwimSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSwimSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityXSubspeed
        jsr ApproachSpeed2
        ; make sure the player is facing right
        lda Workset + EntityHeader
        and #($FF ^ EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        ; and check vertical movement!
        jmp @CheckDownInput
@NotHoldingRight:
        bvs @HoldingLeft
        ; set some vertical movement values
        ldy #$10
        lda #JOY_A
        bit Joy1Pressed
        beq @NotHoldingARight
        ; holding A reduces speed
        ldy #$80
@NotHoldingARight:
        jsr SlowdownXByY
        jmp @CheckDownInput

@HoldingLeft:
        ; player is holding left
        ; set acceleration temp values
        ldy #$F0
        lda #JOY_A
        bit Joy1Pressed
        beq @NotHoldingALeft
        ; holding A reduces speed
        ldy #$80
@NotHoldingALeft:
        sty @TempAccel
        lda #$FF
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSwimNegativeSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSwimNegativeSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityXSubspeed
        jsr ApproachSpeed2
        ; make sure the player is facing left
        lda Workset + EntityHeader
        ora #EntityHeaderFacingLeft
        sta Workset + EntityHeader
@CheckDownInput:
        lda #JOY_DOWN
        bit Joy1Inputs
        beq @NotHoldingDown
        ; player is holding down
        ; set acceleration temp values
        ldy #$10
        lda #JOY_A
        bit Joy1Pressed
        beq @NotHoldingADown
        ; holding A reduces speed
        ldy #$80
@NotHoldingADown:
        sty @TempAccel
        lda #$00
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSwimSpeedsByCrabLevel,x
        sta @TempSpeed
        lda EncounterPlayerSwimSpeedsByCrabLevel+1,x
        sta @TempSpeed+1
        ldx #EntityYSubspeed
        jsr ApproachSpeed2
        jmp @MovementComplete
@NotHoldingDown:
        lda #JOY_UP
        bit Joy1Inputs
        bne @HoldingUp
        ldy #EntityXSubspeed
        lda #JOY_A
        bit Joy1Pressed
        beq @Slowdown
        ; holding A reduces speed
        ldy #$80
@Slowdown:
        jsr SlowdownYByY
        jmp @MovementComplete
@HoldingUp:
        ; player is holding up
        ; set acceleration temp values
        ldy #$F0
        lda #JOY_A
        bit Joy1Pressed
        beq @HoldingUp2
        ldy #$80
@HoldingUp2:
        sty @TempAccel
        lda #$FF
        sta @TempAccel+1
        ; get max speed for a given crab level
        lda PlayerCrabLevel
        asl a
        tax
        ; store speed in temp values used by ApproachSpeed2
        lda EncounterPlayerSwimNegativeSpeedsByCrabLevel,x
        sta $18
        lda EncounterPlayerSwimNegativeSpeedsByCrabLevel+1,x
        sta $19
        ldx #EntityYSubspeed
        jsr ApproachSpeed2
@MovementComplete:
        ; move player in the dpad direction
        jsr WorksetAnimationAdvance
        jsr WorksetMoveX
        jsr WorksetMoveY
        ldx Workset + EntityX
        lda Workset + EntityX  + 1
        ; clamp to the left edge of the screen
        cpx #$10
        sbc #$10
        bcs @CheckRightEdge
        lda #$10
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX + 1
        bne @WithinXBounds
; ------------------------------------------------------------
@CheckRightEdge:
        lda Workset + EntityX  + 1
        cpx #$F0
        sbc #$10
        bcc @WithinXBounds
        lda #$F0
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX  + 1
@WithinXBounds:
        jsr EncounterClampWorksetMinimumY
        bcs @CheckFireProjectile
        jsr EncounterClampWorksetMaximumY
@CheckFireProjectile:
        ; check for B input in order to fire.
        lda #JOY_B
        bit Joy1Pressed
        beq @Done
        ; player is trying to fire, check for empty slot.
        ; otherwise finish up.
        jsr FindEmptyProjectileSlot
        bmi @Done
        ; we got a slot, spawn us a harpoon!
        lda Workset + EntityHeader
        ; we want the harpoon heading the direction the player is facing.
        and #(EntityHeaderActive | EntityHeaderFacingLeft)
        sta PlayerProjectile1Data + EntityHeader,x
        lda #EntityTypeProjectileHarpoon
        sta PlayerProjectile1Data + EntityType,x
@Done:
        jmp WorksetSave

; ----------------------------------------------------------------------------
EncounterPlayerSwimSpeedsByCrabLevel:
        .byte $00,$01
        .byte $40,$01
        .byte $80,$01
        .byte $C0,$01
        .byte $00,$02

EncounterPlayerSwimNegativeSpeedsByCrabLevel:
        .byte $00,$FF
        .byte $C0,$FE
        .byte $80,$FE
        .byte $40,$FE
        .byte $00,$FE

; ----------------------------------------------------------------------------
FindEmptyProjectileSlot:
        ; check if slot 1 is open.
        ldx #$00
        lda PlayerProjectile1Data,x
        bpl @Exit
        ; nope, how about slot 2?
        ldx #$20
        lda PlayerProjectile1Data,x
        bpl @Exit
        ; okay last chance.. slot 3?
        ldx #$40
        lda PlayerProjectile1Data,x
@Exit:
        rts

; ----------------------------------------------------------------------------
CopyWorksetCoordinatesToTempCoordinate:
        lda Workset + EntityX
        sta TempCoordX
        lda Workset + EntityX  + 1
        sta TempCoordX + 1
        lda Workset + EntityY
        sta TempCoordY
        lda Workset + EntityY + 1
        sta TempCoordY + 1
        rts

; ----------------------------------------------------------------------------
GetWorldMapFlagsAtTargetLocation:
        jsr CopyWorksetCoordinatesToTempCoordinate
        clc
        txa
        bmi @NegativeX
        adc TempCoordX
        sta TempCoordX
        lda TempCoordX+1
        adc #$00
        jmp @UpdateY
@NegativeX:
        adc TempCoordX
        sta TempCoordX
        lda TempCoordX+1
        adc #$FF
@UpdateY:
        sta TempCoordX+1
        clc
        tya
        bmi @NegativeY
        adc TempCoordY
        sta TempCoordY
        lda TempCoordY+1
        adc #$00
        jmp @CheckEncounterType
@NegativeY:
        adc TempCoordY
        sta TempCoordY
        lda TempCoordY+1
        adc #$FF
@CheckEncounterType:
        sta TempCoordY+1
        jmp GetWorldMapFlagsAtTempCoords

; ----------------------------------------------------------------------------
GetWorldMapFlagsAtTempCoords:
        ; clear low nybble of Y
        lda TempCoordY
        and #$F0
        sta TempCoordY
        cmp #$80
        lda TempCoordY+1
        ; quick exit if outside of bounds, always return F
        sbc #$01
        bcs @ReturnF
        lda TempCoordX+1
        cmp #$02
        bcs @ReturnF
        ; shift the high x nybble into low
        lsr a
        lda TempCoordX
        ror a
        lsr a
        lsr a
        lsr a
        lsr a
        ; and OR in the high nybble of Y
        ora TempCoordY
        ; this way we've converted X:0123 Y:018A into $92
        clc
        ; get a pointer in the WorldMapFlags table to
        ; the approximation of our X/Y.
        adc #<WorldMapFlags
        sta TempCoordY
        lda TempCoordY+1
        adc #>WorldMapFlags
        sta TempCoordY+1
        ldy #$00
        ; and load it into X
        lda (TempCoordY),y
        tax
        ; if the low bit of the X value is 1,
        ; return high nybble (shifted down) of the byte.
        ; otherwise clear high nybble.
        lda #%00010000
        bit TempCoordX
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
        lda PlayerData+EntityX
        sec
        sbc #$80
        tax
        lda PlayerData+EntityX+1
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
        lda PlayerData+EntityY
        sec
        sbc #$60
        tax
        lda PlayerData+EntityY+1
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
        cmp #$C6
        tya
        sbc #$00
        bcc @UpdateCameraY
        ; we are too close to the bottom, clear scroll.
        ldx #$C6
        ldy #$00
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
        sta SCROLL_Y
        sty UseHighPPUNametables
        rts

; ----------------------------------------------------------------------------
EncounterRunCamera:
        ; subtract $60 from player y position, minimum scroll Y
        lda PlayerData+EntityY
        sec
        sbc #$60
        tax
        lda PlayerData+EntityY+1
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


; # ApproachSpeed
; Parameters:
;  - A is subspeed value to add.
;  - Y is the maximum fullspeed, speed will get clamped to this.
;  - X is EntityXSubspeed or EntityYSubspeed depending on which direction to add.
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
        ; if signs don't match, no need to clamp.
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


; # ApproachSpeed2
; This is a variant of ApproachSpeed, which increases speed by
; both subspeed+speed instead of just subspeed.
; Parameters:
;  $16 - subspeed to add
;  $17 - fullspeed to add
;  $18 - target subspeed
;  $19 - target fullspeed
ApproachSpeed2:
        @Subspeed  = $20
        @Fullspeed = $21
        @SubspeedToAdd = $16
        @FullspeedToAdd = $17
        @TargetSubspeed = $18
        @TargetFullspeed = $19
        ; start by adding tempsubspeed value to the subspeed
        lda @SubspeedToAdd
        clc
        adc @Subspeed,x
        sta @Subspeed,x
        ; then add tempfullspeed + subspeed carry to the fullspeed
        lda @FullspeedToAdd
        tay
        adc @Fullspeed,x
        sta @Fullspeed,x
        ; if signs don't match, no need to clamp.
        tay
        clc
        eor @TargetFullspeed
        bmi @Done
        ; branch if we are heading left
        tya
        bmi @NegativeSpeed
        ; check if we have accelerated past target speed
        lda @Subspeed,x
        cmp @TargetSubspeed
        lda @Fullspeed,x
        sbc @TargetFullspeed
        ; and branch to clamp
        bcs @Clamp
        bcc @Done
@NegativeSpeed:
        ; check if we have accelerated past target speed.
        lda @TargetSubspeed
        cmp @Subspeed,x
        lda @TargetFullspeed
        sbc @Fullspeed,x
        ; otherwise we are done!
        bcc @Done
@Clamp:
        ; we are already at target speed, make sure we don't go faster.
        lda @TargetSubspeed
        sta @Subspeed,x
        lda @TargetFullspeed
        sta @Fullspeed,x
@Done:
        rts

; ----------------------------------------------------------------------------
SlowdownXByY:
        ldx #EntityXSubspeed
        jmp SlowdownByY
SlowdownYByY:
        ldx #EntityYSubspeed
SlowdownByY:
        @Subspeed  = $20
        @Fullspeed = $21
        lda @Fullspeed,x
        bpl @PositiveValue
        tya
        clc
        adc @Subspeed,x
        sta @Subspeed,x
        lda @Fullspeed,x
        adc #$00
        sta @Fullspeed,x
        bpl @Nullify
        clc
        rts
@PositiveValue:
        tya
        eor #$FF
        sec
        adc @Subspeed,x
        sta @Subspeed,x
        lda @Fullspeed,x
        adc #$FF
        sta @Fullspeed,x
        bpl @DoneWithoutCarry
@Nullify:
        lda #$00
        sta @Subspeed,x
        sta @Fullspeed,x
        sec
        rts
@DoneWithoutCarry:
        clc
        rts

; ----------------------------------------------------------------------------
WorksetClearSpeed:
        lda #$00
        sta Workset + EntityXSubspeed
        sta Workset + EntityXSpeed
        sta Workset + EntityYSubspeed
        sta Workset + EntityYSpeed
        rts

; ----------------------------------------------------------------------------
WorksetDetectProjectileHit:
        @ProjectilePtr   = $42
        @ProjectileCount = $47
        lda #<PlayerProjectile1Data
        sta @ProjectilePtr
        lda #>PlayerProjectile1Data
        sta @ProjectilePtr+1
        ; clear workset flag
        lda Workset + EntityHitDetection
        and #($FF ^ EntityHitProjectile)
        sta Workset + EntityHitDetection
        lda #MaxProjectiles
        sta @ProjectileCount
@CheckForHit:
        ldy #EntityHeader
        ; load projectile header
        lda (@ProjectilePtr),y
        ; if projectile not active, skip.
        bpl @CheckNextProjectile
        ; if 7 flag is not set, skip.
        and #EntityHeader7
        beq @CheckNextProjectile
        ; if we aren't intersecting with the projectile, skip.
        jsr HitDetect
        bcc @CheckNextProjectile
        ldy #EntityHitDetection
        ; mark projectile as hit.
        lda (@ProjectilePtr),y
        ora #EntityHitDetected
        sta (@ProjectilePtr),y
        ; mark workset entity as hit.
        lda Workset + EntityHitDetection
        ora #EntityHitProjectile
        sta Workset + EntityHitDetection
        ; load projectile type, and store in jaws damage slot.
        ; seems like a hacky way to go about this.
        ldy #EntityType
        lda (@ProjectilePtr),y
        sta HitDetectionProjectileType
@CheckNextProjectile:
        ; advance to next projectile.
        lda @ProjectilePtr
        clc
        adc #EntityDataSize
        sta @ProjectilePtr
        lda @ProjectilePtr+1
        ; i don't know why we're doing this.
        adc #$00
        sta $43
        ; keep going if we have more projectiles to check.
        dec @ProjectileCount
        bne @CheckForHit
        ; otherwise we are finished!
        rts

; ----------------------------------------------------------------------------
CheckFlagsAndHitDetectAgainstPlayer:
        ; dont hit detect if the player is invincible
        lda #EntityHeaderInvincible
        bit PlayerData + EntityHeader
        bne @Exit
        ; dont hit detect if the enemy is dying
        lda Workset + EntityHitDetection
        and #($FF ^ EntityHitDetected)
        sta Workset + EntityHitDetection
        jsr HitDetectAgainstPlayer
        bcc @Exit
        ; mark both entities as hit
        lda Workset + EntityHitDetection
        ora #EntityHitDetected
        sta Workset + EntityHitDetection
        lda PlayerData + EntityHitDetection
        ora #EntityHitDetected
        sta PlayerData + EntityHitDetection
@Exit:
        rts

; ----------------------------------------------------------------------------
HitDetectAgainstPlayer:
        @TempPlayerPointer = $42
        lda #<PlayerData
        sta @TempPlayerPointer
        lda #>PlayerData
        sta @TempPlayerPointer+1
HitDetect:
        @TempTargetPointer = $42
        ldy #$02
        lda #$00
        sta HitDetectYDirection
        ; diff x coordinate low bytes
        lda (@TempTargetPointer),y
        sec
        sbc Workset + EntityX
        iny
        sta HitDetectXDistance
        ; diff x coordinate high bytes
        lda (@TempTargetPointer),y
        sbc Workset + EntityX  + 1
        iny
        sta HitDetectXDistance+1
        ; branch if positive distance
        bcs @CompareY
        inc HitDetectYDirection
        ; convert to positive distance
        eor #$FF
        sta HitDetectXDistance+1
        lda HitDetectXDistance
        eor #$FF
        sta HitDetectXDistance
        ; and add 1
        inc HitDetectXDistance
        bne @CompareY
        inc HitDetectXDistance+1
@CompareY:
        ; diff y coordinate low bytes
        lda (@TempTargetPointer),y
        sec
        sbc Workset + EntityY
        iny
        sta HitDetectYDistance
        ; diff y coordinate high bytes
        lda (@TempTargetPointer),y
        sbc Workset + EntityY + 1
        sta HitDetectYDistance+1
        bcs @CombineDistances
        inc HitDetectYDirection
        inc HitDetectYDirection
        ; convert to positive distance
        eor #$FF
        sta HitDetectYDistance+1
        lda HitDetectYDistance
        eor #$FF
        sta HitDetectYDistance
        ; and add 1
        inc HitDetectYDistance
        bne @CombineDistances
        inc HitDetectYDistance+1
@CombineDistances:
        clc
        lda HitDetectXDistance+1
        ora HitDetectYDistance+1
        bne @Exit
        ldy #EntityBBoxW
        lda (@TempTargetPointer),y
        ; check if within X bounding box
        adc Workset + EntityBBoxW
        cmp HitDetectXDistance
        bcc @Exit
        ; or if within Y bounding box
        iny
        lda (@TempTargetPointer),y
        clc
        adc Workset + EntityBBoxH
        cmp HitDetectYDistance
@Exit:
        rts

; ----------------------------------------------------------------------------
EncounterClampWorksetMaximumY:
        @TempMaximumY = $16
        ; we dont want to allow entities to drop closer
        ; than 10px away from the max depth.
        lda EncounterMaxDepth
        sec
        sbc #$10
        sta @TempMaximumY
        lda EncounterMaxDepth+1
        sbc #$00
        sta @TempMaximumY+1
        lda Workset + EntityY
        cmp @TempMaximumY
        lda Workset + EntityY + 1
        sbc @TempMaximumY+1
        ; we aren't too deep, so finish up.
        bcc @Done
        ; otherwise clamp to maximum level
        lda @TempMaximumY
        sta Workset + EntityY
        lda @TempMaximumY+1
        sta Workset + EntityY + 1
@Done:
        rts

; ----------------------------------------------------------------------------
EncounterClampWorksetMinimumY:
        @TempMinimumY = $16
        ; we want to take the water height + our bounding box
        ; to determine the minimum possible Y coordinate.
        lda Workset + EntityBBoxH
        clc
        adc WaterHeight
        sta @TempMinimumY
        lda #$00
        adc WaterHeight+1
        sta @TempMinimumY+1
        lda @TempMinimumY
        cmp Workset + EntityY
        lda @TempMinimumY+1
        sbc Workset + EntityY + 1
        ; we aren't at the water level, so finish up.
        bcc @Done
        ; otherwise clamp workset to water level.
        lda @TempMinimumY
        sta Workset + EntityY
        lda @TempMinimumY+1
        sta Workset + EntityY + 1
@Done:
        rts

; ----------------------------------------------------------------------------
EncounterClampWorksetMinimumYDoubled:
        @TempMinimumY = $16
        ; we want to take the water height + double our bounding box
        ; to determine the minimum possible Y coordinate.
        lda Workset + EntityBBoxH
        asl a
        clc
        adc WaterHeight
        sta @TempMinimumY
        lda #$00
        adc WaterHeight+1
        sta @TempMinimumY+1
        lda @TempMinimumY
        cmp Workset + EntityY
        lda @TempMinimumY+1
        sbc Workset + EntityY + 1
        ; we aren't at the water level, so finish up.
        bcc @Done
        ; otherwise clamp workset to minimum level
        lda @TempMinimumY
        sta Workset + EntityY
        lda @TempMinimumY+1
        sta Workset + EntityY + 1
@Done:
        rts

; ----------------------------------------------------------------------------


SpritesetUpdateScreen:
        @SpritesetDrawDirection = $0F
        @EntitySlotsRemaining   = $46
        @SpriteSlotsRemaining   = $47
        ; need to check every entity for sprites to draw
        lda #MaxEntities
        sta @EntitySlotsRemaining
        ; and draw a maximum of 63 sprites
        lda #$3F
        sta @SpriteSlotsRemaining
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        ; every other frame we draw from the top sprite slot
        ; down to the bottom. reasoning is.. unclear.
        ldx #$04
        ldy #$80
        lda SpriteUpdateDirection
        beq @InvertDirection
        ldx #$FC
        ldy #$00
@InvertDirection:
        stx @SpritesetDrawDirection
        sty SpriteUpdateDirection

@KeepDrawingSprites:
        ; clear bit 1 of the last byte of the entity
        ldy #EntityHitDetection
        lda (WorksetPtr),y
        and #($FF ^ EntityHitEnabled)
        sta (WorksetPtr),y
        ; check if entity is active, and if so, place out sprites
        ldy #EntityHeader
        lda (WorksetPtr),y
        tay
        eor #%11000000
        and #%11000001
        beq @SpritesetDrawForWorkset

@SpritesetDrawNextWorkset:
        ; advance to next workset
        lda WorksetPtr
        clc
        adc #$20
        sta WorksetPtr
        lda WorksetPtr+1
        adc #$00
        sta WorksetPtr+1
        ; keep going if we have more entities to check.
        dec @EntitySlotsRemaining
        bne @KeepDrawingSprites
        ; otherwise finish up if we're out of sprite slots.
        ldy @SpriteSlotsRemaining
        beq @Finished
        ; otherwise we're done, move the rest of the sprites off screen.
@MoveUnusedSpritesOffScreen:
        lda #$F0
        sta SpritePosY,x
        txa
        clc
        adc @SpritesetDrawDirection
        tax
        dey
        bne @MoveUnusedSpritesOffScreen
@Finished:
        ; make sure NMI doesn't remove our sprites.
        ; and we are finished!
        lda #$01
        sta NMISpriteHandlingDisabled
        rts

@SpritesetDrawForWorkset:
        @ScreenX = $02
        @ScreenY = $04
        @SpritesetPtr = $06
        tya
        asl a
        asl a
        and #$C0
        sta $00
        ; find low x screen coordinate
        ldy #EntityX
        lda (WorksetPtr),y
        iny
        sec
        sbc CameraX
        sta @ScreenX
        ; find high x screen coordinate
        lda (WorksetPtr),y
        iny
        sbc CameraX+1
        sta @ScreenX+1
        ; find low y screen coordinate
        lda (WorksetPtr),y
        iny
        sec
        sbc CameraY
        sta @ScreenY
        ; find high y screen coordinate
        lda (WorksetPtr),y
        iny
        sbc CameraY+1
        sta @ScreenY+1
        ; find sprite graphics pointer
        lda (WorksetPtr),y
        iny
        sta @SpritesetPtr
        lda (WorksetPtr),y
        sta @SpritesetPtr+1
        ; clear some flags
        ldy #$00
        sty $01
@DrawNextSprite:
        ; load sprite X offset
        lda (@SpritesetPtr),y
        iny
        ; If sprite X offset is $80, we've drawn all the sprites.
        ; So let's exit!
        cmp #$80
        beq @SpritesetDrawFinishEntity
        bit $00
        bvc @CheckXPosition
        eor #%11111111
        sec
        adc #%11111000
@CheckXPosition:
        clc
        and #%11111111
        bmi @NegativeXOffset
        ; add sprite relative X position to entity position.
        adc @ScreenX
        sta SpritePosX,x
        lda @ScreenX+1
        ; skip if sprite will be off screen, otherwise continue.
        adc #$00
        beq @DoneCheckingX
        jmp @SkipToNextSpritesetSprite
@NegativeXOffset:
        ; subtract sprite relative X position from entity position.
        adc @ScreenX
        sta SpritePosX,x
        lda @ScreenX+1
        ; skip if sprite will be off screen, otherwise continue.
        adc #$FF
        bne @SkipToNextSpritesetSprite
@DoneCheckingX:
        lda (@SpritesetPtr),y
        bit $00
        bpl @CheckYPosition
        eor #%11111111
        sec
        adc #%11111000
@CheckYPosition:
        clc
        and #%11111111
        bmi @NegativeYOffset
        ; add sprite relative Y position to entity position.
        adc @ScreenY
        sta SpritePosY,x
        lda @ScreenY+1
        ; skip if sprite will be off screen, otherwise continue.
        adc #$00
        beq @DoneCheckingY
        jmp @SkipToNextSpritesetSprite
@NegativeYOffset:
        ; subtract sprite relative Y position from entity position.
        adc @ScreenY
        sta SpritePosY,x
        lda @ScreenY+1
        ; skip if sprite will be off screen, otherwise continue.
        adc #$FF
        bne @SkipToNextSpritesetSprite
@DoneCheckingY:
        ; if the sprite we're replacing is not offscreen,
        ; we should just let it be.
        lda SpritePosY,x
        cmp #$F0
        bcs @SkipToNextSpritesetSprite
        ; update sprite tile
        iny
        lda (@SpritesetPtr),y
        iny
        sta SpriteTile,x
        ; update sprite attributes
        lda (@SpritesetPtr),y
        iny
        eor $00
        sta SpriteAttr,x
        ; mark as active.
        lda #EntityHitEnabled
        sta $01
        txa
        clc
        adc @SpritesetDrawDirection
        tax
        dec @SpriteSlotsRemaining
        bne @DrawNextSprite
        jmp @Finished
@SkipToNextSpritesetSprite:
        ; increment to next sprite
        iny
        iny
        iny
        jmp @DrawNextSprite
@SpritesetDrawFinishEntity:
        ldy #EntityHitDetection
        lda (WorksetPtr),y
        ora $01
        sta (WorksetPtr),y
        jmp @SpritesetDrawNextWorkset

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
        @TempProjectileCounter = $46
        ; set pointer to first projectile
        lda #<PlayerProjectile1Data
        sta WorksetPtr
        lda #>PlayerProjectile1Data
        sta WorksetPtr+1
        ; set max projectile count
        lda #MaxProjectiles
        sta @TempProjectileCounter
@CheckProjectile:
        ; load projectile workset
        jsr WorksetLoad
        ; skip ahead if the projectile is not active
        lda Workset + EntityHeader
        bpl @ProjectileChecked
        ; otherwise drop that plane bomb
        jsr EncounterPlaneProjectile
@ProjectileChecked:
        ; we've run this projectile, save and advance.
        jsr WorksetSave
        jsr WorksetNext
        ; decrement counter and continue if there are more
        ; projectile slots to check.
        dec @TempProjectileCounter
        bne @CheckProjectile
        rts

; ----------------------------------------------------------------------------
EncounterBoatProjectile:
        bit Workset + EntityHeader
        bvs @Main
        ; set up projectile
        jsr EncounterPrepareProjectile
        lda #SFXEncounterBoatFire
        jsr SoundPlay
        jmp @Done
@Main:
        ; disable projectile if hit flag is set
        lda Workset + EntityHitDetection
        bmi @Despawn2
        ; or if flag 1 is set..
        and #EntityHitEnabled
        beq @Despawn
        ; check if sinking flag is set
        lda Workset + EntityIsSinking
        bmi @AlreadyInitialized
        ; wait until projectile hits water
        lda Workset + EntityY
        cmp WaterHeight
        lda Workset + EntityY + 1
        sbc WaterHeight+1
        bcc @ApproachWaterLevel
        ; clear x speed
        lda #$00
        sta Workset + EntityXSubspeed
        sta Workset + EntityXSpeed
        ; mark sinking flag
        lda #%10000000
        ora Workset + EntityIsSinking
        sta Workset + EntityIsSinking
        ; set falling speed
        lsr Workset + EntityYSpeed
        ror Workset + EntityYSubspeed
        ; and start running
        jmp @AlreadyInitialized
@ApproachWaterLevel:
        ; accelerate falling speed
        lda #$40
        ldy #$04
        jsr ApproachYSpeed
        jsr WorksetMoveX
@AlreadyInitialized:
        jsr WorksetMoveY
        jsr EncounterClampWorksetMaximumY
        bcc @Done
        ; remove projectile if it's too far down
        bcs @Despawn
@Despawn2:
        lda #$00
        sta HitDetectionProjectileType
@Despawn:
        lda #$00
        sta Workset + EntityHeader
@Done:
        rts

; ----------------------------------------------------------------------------
EncounterSubmarineBulletProjectile:
        bit Workset + EntityHeader
        bvs @Main
        ; set up projectile
        jsr EncounterPrepareProjectile
        lda #SFXEncounterBoatFire
        jsr SoundPlay
        jmp @Done
@Main:
        ; disable projectile if hit flag is set
        lda Workset + EntityHitDetection
        bmi @Despawn
        ; or if flag 1 is set..
        and #EntityHitEnabled
        beq @Despawn
        ; otherwise just move along.
        jsr WorksetMoveX
        jmp @Done
@Despawn:
        lda #$00
        sta Workset + EntityHeader
@Done:
        rts

; ----------------------------------------------------------------------------
EncounterSubmarineBombProjectile:
        bit Workset + EntityHeader
        bvs @Main
        ; set up projectile
        jsr EncounterPrepareProjectile
        lda #SFXEncounterSubmarineFire
        jsr SoundPlay
        jmp @Done
@Main:
        ; disable projectile if hit flag is set
        lda Workset + EntityHitDetection
        bmi @Despawn
        ; or if flag 1 is set..
        and #EntityHitEnabled
        beq @Despawn
        ; otherwise we move the projectile
        jsr WorksetMoveX
        jsr WorksetMoveY
        ; and accelerate it toward max speed
        lda #$20
        ldy #$10
        jsr ApproachYSpeed
        ; and slow down our X to form a nice arc
        ldy #$08
        jsr SlowdownXByY
        ; then check so we're not outside level bounds
        jsr EncounterClampWorksetMaximumY
        bcc @Done
        ; and despawn if we are
        bcs @Despawn
@Despawn:
        lda #$00
        sta Workset + EntityHeader
@Done:
        rts


EncounterHarpoonProjectile:
        bit Workset + EntityHeader
        bvs @HarpoonActive
        ; set up projectile
        jsr EncounterPrepareProjectile
        lda #SFXEncounterHarpoonFire
        jsr SoundPlay
        jmp SharedRTS1
@HarpoonActive:
        ; disable projectile if hit flag is set
        lda Workset + EntityHitDetection
        bmi @Despawn
        ; or if flag 1 is set..
        and #EntityHitEnabled
        beq @Despawn
        ; otherwise just move along.
        jsr WorksetMoveX
        jmp SharedRTS1
@Despawn:
        lda #$00
        sta Workset + EntityHeader
SharedRTS1:
        rts

; ----------------------------------------------------------------------------
EncounterPlaneProjectile:
        bit Workset + EntityHeader
        bvs @Main
        ; set up projectile
        jsr EncounterPrepareProjectile
        lda #SFXBonusPlaneFire
        jsr SoundPlay
        jmp SharedRTS1
@Main:
        ; disable projectile if hit flag is set
        lda Workset + EntityHitDetection
        bmi @Despawn
        ; or if flag 1 is set..
        and #EntityHitEnabled
        beq @Despawn
        ; drop projectile toward water
        jsr WorksetMoveY
        lda Workset + EntityIsSinking
        bne @AlreadyRunning
        ; wait until projectile hits water
        lda Workset + EntityY
        cmp WaterHeight
        lda Workset + EntityY + 1
        sbc WaterHeight+1
        bcc @Done
        ; and set a flag
        inc Workset + EntityIsSinking
        ; and set drop speed
        lda #$00
        sta Workset + EntityYSubspeed
        lda #$03
        sta Workset + EntityYSpeed
        ; remove parachute after hitting water
        lda #AnimationEncounterBomb
        jsr WorksetAnimationPlay
        jmp @Done
@AlreadyRunning:
        ; make sure projectile doesn't go off screen.
        jsr EncounterClampWorksetMaximumY
        bcc @Done
        ; entirely pointless carry check.
        bcs @Despawn
@Despawn:
        lda #$00
        sta Workset + EntityHeader
@Done:
        rts

; shared code used by all projectile types
EncounterPrepareProjectile:
        lda #$00
        ; start by clearing some state off the workset
        ldx #EntityAnimationIndex
@ClearPreviousState:
        sta Workset,x
        inx
        cpx #EntityHitDetection+1
        bcc @ClearPreviousState
        ; load offset in the projectile data table for this
        ; projectile type.
        lda Workset + EntityType
        asl a
        asl a
        asl a
        tax
        ; set header flag
        lda Workset + EntityHeader
        ora #EntityHeader7
        sta Workset + EntityHeader
        ; separate handling when heading left
        and #EntityHeaderFacingLeft
        bne @SetupLeftMovement
        ; we are heading to the right!
        ; place projectile at player x + x offset from projectile settings
        lda PlayerData+EntityX
        clc
        adc EncounterProjectileSettings,x
        sta Workset+EntityX
        lda PlayerData+EntityX+1
        adc #$00
        sta Workset+EntityX  + 1
        ; and set x speed
        lda EncounterProjectileSettings+2,x
        sta Workset+EntityXSubspeed
        lda EncounterProjectileSettings+3,x
        sta Workset+EntityXSpeed
        jmp @SetupY
@SetupLeftMovement:
        ; place projectile at player x - x offset from projectile settings
        lda PlayerData+EntityX
        sec
        sbc EncounterProjectileSettings,x
        sta Workset + EntityX
        lda PlayerData+EntityX+1
        sbc #$00
        sta Workset + EntityX + 1
        ; and set x speed
        lda EncounterProjectileSettings+2,x
        eor #$FF
        sta Workset + EntityXSubspeed
        lda EncounterProjectileSettings+3,x
        eor #$FF
        sta Workset + EntityXSpeed
        inc Workset + EntityXSubspeed
        bne @SetupY
        inc Workset + EntityXSpeed
@SetupY:
        ; set y speed from projectile settings
        lda EncounterProjectileSettings+4,x
        sta Workset + EntityYSubspeed
        lda EncounterProjectileSettings+5,x
        sta Workset + EntityYSpeed
        clc
        lda EncounterProjectileSettings+1,x
        bmi @UnusedNegativeYOffset
        ; set positive y offset
        adc PlayerData+EntityY
        sta Workset + EntityY
        lda PlayerData+EntityY+1
        adc #$00
        jmp @Done
@UnusedNegativeYOffset:
        ; unused negative y offset handling
        adc PlayerData+EntityY
        sta Workset + EntityY
        lda PlayerData+EntityY + 1
        adc #$FF
@Done:
        sta Workset + EntityY + 1
        lda EncounterProjectileSettings+6,x
        jmp WorksetAnimationPlay

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
        jsr @TurnTowardPlayer
        lda #$00
        sta Workset + EntityMapJawsVisibility
        ; and set up his starting flags
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeader1)
        sta Workset + EntityHeader
        ; jaws can't interact with player right after spawning
        lda #$80
        sta Workset + EntityIFrames
        jmp WorksetSave
@JawsIsActive:
        jsr WorksetAnimationAdvance
        lda Workset + EntityIFrames
        bne @StartupTimer
        jsr CheckFlagsAndHitDetectAgainstPlayer
        lda Workset + EntityHitDetection
        bpl @UpdateJawsTrackerDistance
        jsr CopyWorksetCoordinatesToTempCoordinate
        jsr GetWorldMapFlagsAtTempCoords
        sta CurrentMapPositionFlags
        lda #EventFlagsMapTouchedJaws
        sta EventFlags
        jmp WorksetSave
@StartupTimer:
        dec Workset + EntityIFrames
        jmp @JawsMovement

; convert jaws distance from player to a single number
; and store that as the tracker distance which is used to
; ping the sonar tracker!
@UpdateJawsTrackerDistance:
        @TempPlayerXDistance  = $16
        @TempPlayerYDistance  = $18
        lda HitDetectXDistance
        sta @TempPlayerXDistance
        lda HitDetectXDistance+1
        sta @TempPlayerXDistance+1
        lda HitDetectYDistance
        sta @TempPlayerYDistance
        lda HitDetectYDistance+1
        sta @TempPlayerYDistance+1
        ldx #$04
@FindHighBitsOfDistance:
        lsr @TempPlayerXDistance+1
        ror @TempPlayerXDistance
        lsr @TempPlayerYDistance+1
        ror @TempPlayerYDistance
        dex
        bne @FindHighBitsOfDistance
        lda @TempPlayerXDistance
        cmp @TempPlayerYDistance
        bcs @StoreTrackerDistance
        lda @TempPlayerYDistance
@StoreTrackerDistance:
        sta TrackerDistancePrev
@JawsMovement:
        ; finish if we are still waiting on our timer.
        dec Workset + EntityMapJawsTimer
        bne @FinishJawsAction
        bit Workset + EntityMapJawsVisibility
        bpl @Activated
        ; mark jaws as active
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeader1)
        sta Workset + EntityHeader
        lda #$00
        sta Workset + EntityMapJawsVisibility
@Activated:
        jsr @TurnTowardPlayer
        ; check our distance to the player
        lda TrackerDistancePrev
        cmp #$03
        ; check if header1 is set
        lda #EntityHeader1
        bit Workset + EntityHeader
        bne @PlayEmergeAnimations
        bcs @PlaySubmergeAnimation
        bit Workset + EntityMapJawsVisibility
        bvs @PlaySurfaceAnimation
        ; check if our desired animation is equal to our current animation
        lda Workset + EntityMapPrevJawsHeading
        cmp Workset + EntityMapJawsHeading
        ; and if so continue moving jaws
        beq @FinishJawsAction
@PlaySurfaceAnimation:
        ; remain on surface
        lda #$00
        sta Workset + EntityMapJawsVisibility
        ldx #$08
        bne @UpdateJawsAnimation
@PlaySubmergeAnimation:
        ; play submerge animation
        lda #%10000000
        sta Workset + EntityMapJawsVisibility
        ldx #$10
        bne @UpdateJawsAnimation
@PlayEmergeAnimations:
        bcs @FinishJawsAction
        ; emerge from the depths!
        lda #%01000000
        sta Workset + EntityMapJawsVisibility
        ldx #$00
@UpdateJawsAnimation:
        jsr @ChangeJawsAnimation
@FinishJawsAction:
        jsr WorksetMoveX
        jsr WorksetMoveY
        jmp WorksetSave
@ChangeJawsAnimation:
        txa
        clc
        ; use heading to find pointer into table
        adc Workset + EntityMapJawsHeading
        asl a
        tax
        ; remove flags from the header
        lda Workset + EntityHeader
        and #($FF ^ EntityHeader6 ^ EntityHeaderFacingLeft)
        ; and set flags based on the animation to play
        ora @MapJawsAnimations,x
        sta Workset + EntityHeader
        ; then play the animation
        lda @MapJawsAnimations+1,x
        jsr WorksetAnimationPlay
        ; and remove header flag
        lda Workset + EntityHeader
        and #($FF ^ EntityHeader1)
        sta Workset + EntityHeader
        rts

; Animations to play for Jaws on the map screen.
; First byte per row is the entity flags, used to flip the sprites if heading left.
; Second byte is the animation number to play.
@MapJawsAnimations:
        ; jaws emerging from depths
        .byte $00,AnimationMapJawsEmergeEW
        .byte $00,AnimationMapJawsEmergeDS
        .byte $00,AnimationMapJawsEmergeNS
        .byte EntityHeaderFacingLeft,AnimationMapJawsEmergeDS
        .byte EntityHeaderFacingLeft,AnimationMapJawsEmergeEW
        .byte EntityHeaderFacingLeft,AnimationMapJawsEmergeDN
        .byte $00,AnimationMapJawsEmergeNS
        .byte $00,AnimationMapJawsEmergeDN
        ; jaws visible
        .byte $00,AnimationMapJawsEW
        .byte $00,AnimationMapJawsDS
        .byte $00,AnimationMapJawsS
        .byte EntityHeaderFacingLeft,AnimationMapJawsDS
        .byte EntityHeaderFacingLeft,AnimationMapJawsEW
        .byte EntityHeaderFacingLeft,AnimationMapJawsDN
        .byte $00,AnimationMapJawsN
        .byte $00,AnimationMapJawsDN
        ; jaws submerging from surface
        .byte $00,AnimationMapJawsSubmergeEW
        .byte $00,AnimationMapJawsSubmergeDS
        .byte $00,AnimationMapJawsSubmergeNS
        .byte EntityHeaderFacingLeft,AnimationMapJawsSubmergeDS
        .byte EntityHeaderFacingLeft,AnimationMapJawsSubmergeEW
        .byte EntityHeaderFacingLeft,AnimationMapJawsSubmergeDN
        .byte $00,AnimationMapJawsSubmergeNS
        .byte $00,AnimationMapJawsSubmergeDN

@GetNextLocationMapFlags:
        lda Workset + EntityMapJawsHeading
        asl a
        tax
        ldy @NextTileOffset+1,x
        lda @NextTileOffset,x
        tax
        jsr GetWorldMapFlagsAtTargetLocation
        cmp #$06
        rts

@NextTileOffset:
        .byte $10,$00
        .byte $10,$10
        .byte $00,$10
        .byte $F0,$10
        .byte $F0,$00
        .byte $F0,$F0
        .byte $00,$F0
        .byte $10,$F0

@UpdateSpeed:
        ; shift the animation we're playing to match the speed table
        lda Workset + EntityMapJawsHeading
        asl a
        asl a
        tax
        ; read out all of our speeds
        lda @JawsSpeeds,x
        sta Workset + EntityXSubspeed
        lda @JawsSpeeds+1,x
        sta Workset + EntityXSpeed
        lda @JawsSpeeds+2,x
        sta Workset + EntityYSubspeed
        lda @JawsSpeeds+3,x
        sta Workset + EntityYSpeed
        rts

; jaws directions mapped to speeds per direction
@JawsSpeeds:
        ;       x,  X,  y,  Y
        .byte $80,$00,$00,$00
        .byte $80,$00,$80,$00
        .byte $00,$00,$80,$00
        .byte $80,$FF,$80,$00
        .byte $80,$FF,$00,$00
        .byte $80,$FF,$80,$FF
        .byte $00,$00,$80,$FF
        .byte $80,$00,$80,$FF

; ----------------------------------------------------------------------------
@TurnTowardPlayer:
        lda Workset + EntityMapJawsHeading
        sta Workset + EntityMapPrevJawsHeading
        jsr @GetDirectionToPlayer
        sta Workset + EntityMapJawsHeading
        jsr @GetNextLocationMapFlags
        bcc @ContinueInCurrentDirection
        ; we can't continue in this direction, pick direction to rotate.
        jsr RNGAdvance
        and #$01
        bne @Rotate
        ; decrement rotateion if rng bit was set
        lda #$FF
@Rotate:
        pha
        clc
        ; add our rotation value, and wrap if needed
        adc Workset + EntityMapJawsHeading
        and #$07
        sta Workset + EntityMapJawsHeading
        ; check if the new rotation is okay
        jsr @GetNextLocationMapFlags
        pla
        ; otherwise keep twirling, twirling towards freedom!
        bcs @Rotate
@ContinueInCurrentDirection:
        jsr @UpdateSpeed
        lda #$20
        sta Workset + EntityMapJawsTimer
        rts

; ----------------------------------------------------------------------------
@GetDirectionToPlayer:
        @TempPlayerYDirection = $12
        ; todo.. document this mess better.
        ; copy distance to player from hit detection
        lda HitDetectXDistance
        sta @TempPlayerXDistance
        lda HitDetectXDistance+1
        sta @TempPlayerXDistance+1
        lda HitDetectYDistance
        sta @TempPlayerYDistance
        lda HitDetectYDistance+1
        sta @TempPlayerYDistance+1
        lda HitDetectYDirection
        sta @TempPlayerYDirection
        lda @TempPlayerXDistance
        cmp @TempPlayerYDistance
        lda @TempPlayerXDistance+1
        sbc @TempPlayerYDistance+1
        bcc @Skip
        lda @TempPlayerXDistance
        ldx @TempPlayerYDistance
        sta @TempPlayerYDistance
        stx @TempPlayerXDistance
        lda @TempPlayerXDistance+1
        ldx @TempPlayerYDistance+1
        sta @TempPlayerYDistance+1
        stx @TempPlayerXDistance+1
        lda @TempPlayerYDirection
        ora #$04
        sta @TempPlayerYDirection
@Skip:
        asl @TempPlayerXDistance
        rol @TempPlayerXDistance+1
        lda @TempPlayerXDistance
        cmp @TempPlayerYDistance
        lda @TempPlayerXDistance+1
        sbc @TempPlayerYDistance+1
        lda @TempPlayerYDirection
        bcc @GetDirection
        ora #$08
@GetDirection:
        tax
        lda @JawsDirectionsToPlayer,x
        rts
@JawsDirectionsToPlayer:
        .byte $02,$02,$06,$06,$00,$04,$00,$04
        .byte $01,$03,$07,$05,$01,$03,$07,$05

; ----------------------------------------------------------------------------
EncounterRunJaws:
        @IFrames = Workset + $18
        lda EncounterJawsActive
        cmp #$02
        bne @Activate
        rts
@Activate:
        lda #<JawsData
        sta WorksetPtr
        lda #>JawsData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityHeader
        bvs @Main
        ; check where jaws should spawn from
        jsr RNGAdvance
        and #%00010000
        bne @SpawnJawsFromRightSide
        ; spawn jaws at the left edge of the screen
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$C0
        sta Workset + EntityX
        lda #$0F
        sta Workset + EntityX + 1
        lda #$00
        sta Workset + EntityXSubspeed
        lda #$01
        sta Workset + EntityXSpeed
        jmp @ContinueSetup
@SpawnJawsFromRightSide:
        ; spawn jaws at the right edge of the screen
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        lda #$40
        sta Workset + EntityX
        lda #$11
        sta Workset + EntityX + 1
        lda #$00
        sta Workset + EntityXSubspeed
        lda #$FF
        sta Workset + EntityXSpeed
@ContinueSetup:
        ; spawn a little lower than the water surface
        lda WaterHeight
        clc
        adc #$30
        sta Workset + EntityY
        lda WaterHeight + 1
        adc #$00
        sta Workset + EntityY + 1
        ; set delay for jaws to spawn
        lda EncounterJawsActive
        sta Workset + EntityEncounterJawsSpawnTimer
        sta Workset + EntityEncounterJawsSpawnTimer+1
        beq @FinishSetup
        ldx TrackerDistancePrev
        inx
        stx Workset + EntityActiveAnimationIndex
        lda #$00
        sta Workset + EntityAnimationIndex
@FinishSetup:
        ; clear out some flags
        lda #$00
        sta Workset + EntityV16
        sta Workset + EntityEncounterJawsIFrames
        sta Workset + EntityStunTimer
        ; then play the jaws animation!
        lda #AnimationEncounterJaws
        jsr WorksetAnimationPlay
        jmp WorksetSave
@Main:
        lda Workset + EntityEncounterJawsSpawnTimer
        ora Workset + EntityEncounterJawsSpawnTimer+1
        beq @JawsSpawn
        ; decrement spawn timer until it's time to get in there.
        lda Workset + EntityEncounterJawsSpawnTimer
        sec
        sbc #1
        sta Workset + EntityEncounterJawsSpawnTimer
        lda Workset + EntityEncounterJawsSpawnTimer+1
        sbc #0
        sta Workset + EntityEncounterJawsSpawnTimer+1
        jmp WorksetSave
@JawsSpawn:
        lda Workset + EntityEncounterJawsIFrames
        beq @NormalSpeed
        clc
        lda Workset + EntityXSpeed
        bpl @DamageSlowdown
        sec
@DamageSlowdown:
        ror Workset + EntityXSpeed
        ror Workset + EntityXSubspeed
        jsr WorksetMoveX
        asl Workset + EntityXSubspeed
        rol Workset + EntityXSpeed
        jmp @Continue
@NormalSpeed:
        jsr WorksetMoveX
@Continue:
        lda Workset + EntityX + 1
        cmp #$10
        ; todo - this isnt well documented
        beq @JawsTurnaround
        lda Workset + EntityX
        bcs @CheckLeftEdge
        cmp #$E0
        bcs @JawsTurnaround
        sec
        jmp @CheckForTurnaround
@CheckLeftEdge:
        cmp #$20
        jmp @CheckForTurnaround
@JawsTurnaround:
        clc
@CheckForTurnaround:
        bit Workset + EntityV16
        bmi @AlternateDirection
        bcs @MaintainCourse
        ; set negative flag
        lda #%10000000
        sta Workset + EntityV16
        jmp @HitDetection
@AlternateDirection:
        ; not yet time to switch direction, go do hit detection stuff
        bcc @HitDetection
        lda #$00
        sta Workset + EntityV16
        ; turn to face opposite direction
        lda Workset + EntityHeader
        eor #EntityHeaderFacingLeft
        sta Workset + EntityHeader
        ; and invert speed values
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
@MaintainCourse:
        ; save and exit!
        jmp WorksetSave
@HitDetection:
        @TempHitDamage = $16
        jsr WorksetAnimationAdvance
        jsr WorksetDetectProjectileHit
        jsr CheckFlagsAndHitDetectAgainstPlayer
        ; if jaws is within iframes, we can ignore damage
        lda Workset + EntityEncounterJawsIFrames
        bne @StillWithinIFrames
        ; otherwise check if we hit something
        bit Workset + EntityHitDetection
        bvc @HitDetectionComplete
        ; if we did, figure out how much damage we just did
        ldx PlayerPowerLevel
        lda @JawsDamageByPowerLevel,x
        sta @TempHitDamage
        lda #$00
        sta @TempHitDamage+1
        ; if we fired a bomb, we will need to multiply the damage
        ldx HitDetectionProjectileType
        lda @JawsDamageMultipliers,x
        beq @NoMultiplier
        ; apply damage multiplier
        asl @TempHitDamage
        rol @TempHitDamage+1
@NoMultiplier:
        ; and apply damage to jaws hp
        lda JawsHP
        sec
        sbc @TempHitDamage
        sta JawsHP
        lda JawsHP+1
        sbc @TempHitDamage+1
        bpl @StoreHP
        lda #$00
        sta JawsHP
@StoreHP:
        sta JawsHP+1
        ora JawsHP
        bne @StillAlive
        ; if jaws has died, we mark the death event and exit
        lda EventFlags
        ora #EventFlagsEncounterJawsDead
        sta EventFlags
        jmp WorksetSave
@StillAlive:
        ; but if jaws is still alive we should play a satisfying hit sound
        ; this will be based on the projectile used.
        ldx HitDetectionProjectileType
        lda @JawsHitSounds,x
        jsr SoundPlay
        ; assign $18 frames worth of iframes.
        lda #$18
        sta Workset + EntityEncounterJawsIFrames
        ; and then update jaws health bar
        lda PendingBGUpdates
        ora #DrawStatusbarJawsPowerFlag
        sta PendingBGUpdates
        ; also give the player some points for doing a good job!
        lda #$01
        jsr AwardPoints
        jmp @HitDetectionComplete
@StillWithinIFrames:
        jsr WorksetAnimationAdvance
        jsr WorksetAnimationAdvance
        jsr WorksetAnimationAdvance
        dec Workset + EntityEncounterJawsIFrames
@HitDetectionComplete:
        ; clear out our y speed
        lda #$00
        sta Workset + EntityYSubspeed
        sta Workset + EntityYSpeed
        ; if jaws is in line with the player
        ; we dont need to change y speed
        lda HitDetectYDistance+1
        bne @MoveAndExit
        lda HitDetectYDistance
        cmp #$08
        bcc @MoveAndExit
        lda #$02
        ; but if player  is higher than jaws he should swim up
        bit HitDetectYDirection
        bne @Ascend
        ; and otherwise descend
        lda #$80
        sta Workset + EntityYSubspeed
        lda #$00
        sta Workset + EntityYSpeed
        jmp @MoveAndExit
@Ascend:
        lda #$80
        sta Workset + EntityYSubspeed
        lda #$FF
        sta Workset + EntityYSpeed
@MoveAndExit:
        ; move jaws y position
        jsr WorksetMoveY
        ; and make sure he's stayed within level bounds
        jsr EncounterClampWorksetMinimumYDoubled
        jsr EncounterClampWorksetMaximumY
        ; then save and exit!
        jmp WorksetSave

; sound effects to play when jaws takes damage
@JawsHitSounds:
        .byte SFXEncounterJawsHit               ; when hit with the boat
        .byte SFXEncounterJawsHarpoonHit        ; when hit with a harpoon
        .byte SFXEncounterJawsHit               ; when hit with the submarine
        .byte SFXEncounterJawsHarpoonHit        ; unused?
        .byte SFXEncounterJawsHarpoonHit        ; unused?
@JawsDamageMultipliers:
        .byte 1                                 ; extra damage with boat
        .byte 0                                 ; normal damage with harpoon
        .byte 1                                 ; extra damage with submarine bomb
        .byte 0                                 ; unused?
        .byte 0                                 ; unused?
@JawsDamageByPowerLevel:
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
        @TempPointer = $44
        @EnemiesLeftToSpawn = $46
        ; set flag indicating there were no enemies
        lda EventFlags
        ora #EventFlagsEncounterNoEnemies
        sta EventFlags
        ; if countdown is zero, spawn next enemy
        lda EncounterNextSpawnTimer
        ora EncounterNextSpawnTimer+1
        beq @RunEnemies
        ; otherwise subtract one from countdown
        lda EncounterNextSpawnTimer
        sec
        sbc #$01
        sta EncounterNextSpawnTimer
        lda EncounterNextSpawnTimer+1
        sbc #$00
        sta EncounterNextSpawnTimer+1
@RunEnemies:
        lda #<Enemy2Data
        sta WorksetPtr
        lda #>Enemy2Data
        sta WorksetPtr+1
        lda EncounterEnemiesOnScreen
        sta @EnemiesLeftToSpawn
@CheckEntitySlot:
        ldy #$00
        lda (WorksetPtr),y
        bmi @RunActiveEnemy
        ; enemy slot is available, check if its time to spawn
        lda EncounterNextSpawnTimer
        ora EncounterNextSpawnTimer+1
        bne @CheckNextEnemySlot
        ; it is time to spawn an enemy, get our encounter pointer
        lda EncounterPatternsPtr
        sta @TempPointer
        lda EncounterPatternsPtr + 1
        sta @TempPointer + 1
        ldy EncounterSpawnsIndex
        ; check so we haven't spawned an enemy already
        lda #EventFlagsEncounterNoSpawns
        bit EventFlags
        bne @CheckNextEnemySlot
        lda (@TempPointer),y
        ; check if we've spawned all the enemies
        cmp #$FF
        bne @SpawnNextEnemy
        ; if we have, mark the encounter to end and dont spawn.
        lda EventFlags
        ora #EventFlagsEncounterNoSpawns
        sta EventFlags
        jmp @CheckNextEnemySlot
@SpawnNextEnemy:
        ; increment spawn counter
        iny
        sty EncounterSpawnsIndex
        ; store enemy type from the spawn table
        ldy #EntityType
        sta (WorksetPtr),y
        dey
        ; mark the entity as active
        lda #EntityHeaderActive
        sta (WorksetPtr),y
        ; and reset timer to next spawn
        lda EncounterSpawnTimer
        sta EncounterNextSpawnTimer
        lda EncounterSpawnTimer+1
        sta EncounterNextSpawnTimer+1
@RunActiveEnemy:
        ; clear flag indicating we found no enemies.
        lda EventFlags
        and #($FF ^ EventFlagsEncounterNoEnemies)
        sta EventFlags
        ; load the enemy workset, run it, and save
        jsr WorksetLoad
        jsr RunEntity
        jsr WorksetSave
@CheckNextEnemySlot:
        ; advance to next workset
        lda WorksetPtr
        clc
        adc #$20
        sta WorksetPtr
        lda WorksetPtr+1
        adc #$00
        sta WorksetPtr+1
        ; check if we can spawn more enemies
        dec @EnemiesLeftToSpawn
        bne @CheckEntitySlot
        ; otherwise mark that the encounter is still active
        lda #EventFlagsEncounterEnding
        bit EventFlags
        beq @CheckForEncounterEnd
        lda EncounterNextSpawnTimer
        ora EncounterNextSpawnTimer+1
        bne @Exit
        ; if the ending flag was set and timer expired,
        ; terminate the encounter.
        lda EventFlags
        ora #EventFlagsEncounterFinished
        sta EventFlags
        rts
@CheckForEncounterEnd:
        ; check if it's time to start ending the encounter
        lda #(EventFlagsEncounterNoEnemies | EventFlagsEncounterNoSpawns)
        and EventFlags
        cmp #(EventFlagsEncounterNoEnemies | EventFlagsEncounterNoSpawns)
        bne @Exit
        ; set the ending flag and set a timer to the end
        lda EventFlags
        ora #EventFlagsEncounterEnding
        sta EventFlags
        lda #$40
        sta EncounterNextSpawnTimer
        lda #$00
        sta EncounterNextSpawnTimer+1
@Exit:
        rts

; ----------------------------------------------------------------------------
RunEntity:
        lda Workset + EntityType
        jsr JumpEngine
        .addr RunEntityJellyfish
        .addr RunEntityStingray
        .addr RunEntityHomingJellyfish
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
        bit Workset + EntityHeader
        bvs @Main
        ; initialize enemy settings
        lda #$00
        sta Workset + EntityHitDetection
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        jsr SetJellyfishStartingLocation
        lda #$00
        sta Workset + EntityAnimationIndex
        jmp @SetSpeedAndAnimate
@Main:
        jsr WorksetAnimationAdvance
        bit Workset + EntityAnimationIndex
        bpl @InNormalMode
        ; the jellyfish is dead, and we have played
        ; our death animation. check to spawn a star or crab.
        lda Workset + EntityAnimTimer
        beq SpawnEntityCrabOrStar
        rts
@InNormalMode:
        ; check if it's time to die.
        jsr WorksetDetectProjectileHit
        jsr CheckFlagsAndHitDetectAgainstPlayer
        bit Workset + EntityHitDetection
        bvs @HitByProjectile
        ; otherwise keep moving
        jsr WorksetMoveY
        ; until we hit the water surface, in which case we disable.
        jsr EncounterClampWorksetMinimumY
        bcs WorksetDisableEntity
        ; slowdown to simulate a pulsing jellyfish swim
        ldy #$08
        jsr SlowdownYByY
        ; if we've stopped complete it's time to animate
        bcc SharedRTS
@SetSpeedAndAnimate:
        ; set to max y speed
        lda #$00
        sta Workset + EntityYSubspeed
        lda #$FE
        sta Workset + EntityYSpeed
        ; and play jellyfish animation
        lda #AnimationEncounterJellyfish
        jmp WorksetAnimationPlay
@HitByProjectile:
        ; give some points for killing the jelly
        lda #$04
        jsr AwardPoints
        ; play a head animation
        lda #SFXEncounterEnemyDeath
        jsr SoundPlay
        ; mark the animation to end, and play death animation.
        lda #%10000000
        sta Workset + EntityAnimationIndex
        lda #AnimationEncounterJellyfishDeath
        jmp WorksetAnimationPlay

; ----------------------------------------------------------------------------
SpawnEntityCrabOrStar:
        ; advance the rng to determine powerup spawn type
        jsr RNGAdvance
        and #$07
        tax
        lda CrabOrStarRNG,x
        ; if we hit a 0 in the spawn table, skip spawning
        beq WorksetDisableEntity
        sta Workset + EntityType
        ; otherwise activate and become our powerup type!
        lda #EntityHeaderActive
        sta Workset + EntityHeader
        jmp RunEntity
WorksetDisableEntity:
        lda #$00
        sta Workset + EntityHeader
SharedRTS:
        rts

CrabOrStarRNG:
        .byte 0
        .byte 0
        .byte 0
        .byte EncounterEntityCrab
        .byte 0
        .byte 0
        .byte 0
        .byte EncounterEntityStar

; pretty near duplicate of jellyfish code, except it moves towards the player.
RunEntityHomingJellyfish:
        bit Workset + EntityHeader
        bvs @Main
        ; initialize enemy settings
        lda #$00
        sta Workset + EntityHitDetection
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        jsr SetJellyfishStartingLocation
        lda #$00
        sta Workset + EntityAnimationIndex
        jmp @SetSpeedAndAnimate
@Main:
        jsr WorksetAnimationAdvance
        bit Workset + EntityAnimationIndex
        bpl @InNormalMode
        ; the jellyfish is dead, and we have played
        ; our death animation. check to spawn a star or crab.
        lda Workset + EntityAnimTimer
        beq @SpawnEntityCrabOrStar
        rts
@InNormalMode:
        ; check if it's time to die.
        jsr WorksetDetectProjectileHit
        jsr CheckFlagsAndHitDetectAgainstPlayer
        bit Workset + EntityHitDetection
        bvs @HitByProjectile
        ; otherwise keep moving
        jsr WorksetMoveX
        jsr WorksetMoveY
        ; until we hit the water surface, in which case we disable.
        jsr EncounterClampWorksetMinimumY
        bcs @Disable
        ; slowdown to simulate a pulsing jellyfish swim
        ldy #$08
        jsr SlowdownYByY
        ; if we've stopped complete it's time to animate
        bcc @Exit
@SetSpeedAndAnimate:
        ; set to max y speed
        lda #$00
        sta Workset + EntityYSubspeed        
        lda #$FE
        sta Workset + EntityYSpeed  
        ; check direction to player      
        lda Workset + EntityX
        cmp PlayerData + EntityX
        bcs @FloatLeft
        ; float to the right if player is to the right
        lda #$80
        sta Workset + EntityXSubspeed
        lda #$00
        sta Workset + EntityXSpeed       
        jmp @PlayAnimation
@FloatLeft:
        ; float to the left if player is to the left
        lda #$80
        sta Workset + EntityXSubspeed
        lda #$FF
        sta Workset + EntityXSpeed
@PlayAnimation:
        ; play jellyfish animation
        lda #AnimationEncounterJellyfish
        jsr WorksetAnimationPlay
        rts
@HitByProjectile:
        ; give some points for killing the jelly
        lda #$04
        jsr AwardPoints
        ; play a head animation
        lda #SFXEncounterEnemyDeath
        jsr SoundPlay
        ; mark the animation to end, and play death animation.
        lda #%10000000
        sta Workset + EntityAnimationIndex
        lda #AnimationEncounterJellyfishDeath
        jmp WorksetAnimationPlay
; duplicate crab / star spawn code.
@SpawnEntityCrabOrStar:
        ; advance the rng to determine powerup spawn type
        jsr RNGAdvance
        and #$07
        tax
        lda CrabOrStarRNG,x
        ; if we hit a 0 in the spawn table, skip spawning
        beq @Disable
        sta Workset + EntityType
        lda #EntityHeaderActive
        sta Workset + EntityHeader
        jmp RunEntity
@Disable:
        lda #$00
        sta Workset + EntityHeader
@Exit:
        rts

; ----------------------------------------------------------------------------
SetJellyfishStartingLocation:
        @TempPlayerHighX = $12
        @TempRNG = $13
        ; set starting y coordinate to just under the visible game area
        lda EncounterMaxDepth
        clc
        adc #$20
        sta Workset + EntityY
        lda EncounterMaxDepth+1
        adc #$00
        sta Workset + EntityY + 1
        ; store away high bits of player location to use as a safe zone
        ; where no jellyfish can spawn
        lda PlayerData + EntityX
        and #$F0
        sta @TempPlayerHighX
@GetNewLocation:
        ; advance the rng and take high bits to use as X location
        jsr RNGAdvance
        and #$F0
        sta @TempRNG
        ; check how many encounters the player has played
        ; the safe zone decreases the more encounters the player finishes
        ldx TotalEncountersPlayed
        cpx #$08
        ; if we've done a lot of encounters, there is no safe zone
        bcs @SetEntityX
        sec
        sbc @TempPlayerHighX
        ; flip bits if negative bit was set
        bpl @ComparePosition
        eor #$FF
        clc
        adc #$01
@ComparePosition:
        lsr a
        lsr a
        lsr a
        lsr a
        cmp @SafezoneSize,x
        ; the location we wanted to spawn in was within safe zone
        ; keep trying until we find an acceptable spawn location
        bcc @GetNewLocation
@SetEntityX:
        ; set jelly spawn location to the rng value we got
        lda @TempRNG
        ora #$08
        sta Workset + EntityX
        lda #$10
        sta Workset + EntityX + 1
        ; and we are good to go!
        rts
@SafezoneSize:
        .byte $04,$04,$03,$03,$02,$02,$01,$01

; ----------------------------------------------------------------------------
RunEntityStingray:
        bit Workset + EntityHeader
        bvs @Main
        ; clear out a bunch of flags
        lda #$00
        sta Workset + EntityHitDetection
        sta Workset + EntityStunTimer
        sta Workset + EntityStingrayDying
        lda #%00000010
        sta Workset + EntityStingrayHP
        ; place ourselves a little offset from player height
        lda PlayerData+EntityY
        clc
        adc #$10
        sta Workset + EntityY
        lda PlayerData+EntityY+1
        adc #$00
        sta Workset + EntityY + 1
        jsr EncounterClampWorksetMaximumY
        ; play stingray animation
        lda #AnimationEncounterStingray
        jsr WorksetAnimationPlay
        ; set starting speed based on spawn height
        ldx #$00
        lda Workset + EntityY
        cmp #$04
        bne @ContinueSpawn
        ldx #$04
@ContinueSpawn:
        stx Workset + EntityStingraySpeed
        ; check which side of screen the player is on, we want to start
        ; on the opposite end of the screen.
        lda PlayerData+EntityX
        bmi @SpawnFromLeft
        ; if the player is on the left side, we spawn to the far right
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        ; shift x to get left facing speed
        inx
        inx
        lda #$10
        sta Workset + EntityX
        lda #$11
        bne @SetupSpeed
@SpawnFromLeft:
        ; if the player is on the right side, we spawn to the far left
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$F0
        sta Workset + EntityX
        lda #$0F
@SetupSpeed:
        sta Workset + EntityX  + 1
        lda @StingraySpeeds,x
        sta Workset + EntityXSubspeed
        lda @StingraySpeeds+1,x
        sta Workset + EntityXSpeed
        rts
@Main:
        jsr WorksetAnimationAdvance
        lda Workset + EntityStingrayDying
        beq @StillAlive
        jmp @ProcessDeath
@StillAlive:
        lda Workset + EntityStunTimer
        beq @RunStandardEnemyLogic
        dec Workset + EntityStunTimer
        rts
@RunStandardEnemyLogic:
        ; run hit detection
        jsr WorksetDetectProjectileHit
        jsr CheckFlagsAndHitDetectAgainstPlayer
        bit Workset + EntityHitDetection
        bvs @ProcessHit
        ; move enemy
        jsr WorksetMoveX
        ; check if we're offscreen and trigger re-enter
        lda #EntityHeaderFacingLeft
        bit Workset + EntityHeader
        bne @ReEnterFromLeft
        lda Workset + EntityX  + 1
        cmp #$11
        bcc @Exit2
        lda Workset + EntityX
        cmp #$10
        bcs @ReEnterFromRight
@Exit2:
        rts
@ReEnterFromRight:
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        ldx Workset + EntityStingraySpeed
        lda @StingraySpeeds+2,x
        sta Workset + EntityXSubspeed
        lda @StingraySpeeds+3,x
        sta Workset + EntityXSpeed
        bne @ReEnterFinish
@ReEnterFromLeft:
        lda Workset + EntityX  + 1
        cmp #$10
        bcs @Exit
        lda Workset + EntityX
        cmp #$EF
        bcs @Exit
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        ldx Workset + EntityStingraySpeed
        lda @StingraySpeeds,x
        sta Workset + EntityXSubspeed
        lda @StingraySpeeds+1,x
        sta Workset + EntityXSpeed
@ReEnterFinish:
        lda Workset + EntityY
        sec
        sbc #$20
        sta Workset + EntityY
        lda Workset + EntityY + 1
        sbc #$00
        sta Workset + EntityY + 1
        ; despawn if we ended up outside the map
        ; otherwise continue
        jsr EncounterClampWorksetMinimumY
        bcc @Exit
        bcs @Disable
@ProcessHit:
        dec Workset + EntityStingrayHP
        beq @RunDeathAnimation
        ; hit but still alive.
        ; set iframes and give the player some points
        lda #$00
        jsr AwardPoints
        lda #$08
        sta Workset + EntityStunTimer
        jmp @Exit
@RunDeathAnimation:
        ; we're out of hitpoints, give some more points
        lda #$06
        jsr AwardPoints
        ; play our death sound
        lda #SFXEncounterEnemyDeath
        jsr SoundPlay
        ; mark death and play death animation
        lda #$80
        sta Workset + EntityStingrayDying
        lda #AnimationEncounterStingrayDeath
        jmp WorksetAnimationPlay
@ProcessDeath:
        lda Workset + EntityAnimTimer
        bne @Exit
        ; advance rng to determine drop type
        jsr RNGAdvance
        and #$07
        tax
        ; check drop type from reward table
        lda @RewardRNG,x
        beq @Disable
        ; and if we found one, spawn it in!
        sta Workset + EntityType
        lda #EntityHeaderActive
        sta Workset + EntityHeader
        jmp RunEntity
@Disable:
        lda #$00
        sta Workset + EntityHeader
@Exit:
        rts
@RewardRNG:
        .dbyt EncounterEntityCrab
        .dbyt EncounterEntityStar
        .dbyt EncounterEntityShell
        .dbyt EncounterEntityStar
@StingraySpeeds:
        .byte $00,$01 ; slow stingray heading right
        .byte $00,$FF ; slow stingray heading left
        .byte $00,$02 ; fast stingray heading right
        .byte $00,$FE ; fast stingray heading left

; ----------------------------------------------------------------------------
RunEntityBabyshark:
        bit Workset + EntityHeader
        bvs @Main
        ; spawn at same height as player
        lda PlayerData+EntityY
        sta Workset + EntityY
        lda PlayerData+EntityY+1
        sta Workset + EntityY + 1
        ; set some initial state
        lda #$05
        sta Workset + EntityActiveAnimationIndex
        lda #$00
        sta Workset + EntityV16
        sta Workset + EntityBabysharkStunTimer
        sta Workset + EntityStunTimer
        jsr RNGAdvance
        and #$07
        adc #$07
        sta Workset + EntityBabysharkHP
        ; play animation
        lda #AnimationEncounterBabyshark
        jsr WorksetAnimationPlay
        ; spawn side based on player location
        lda PlayerData+EntityX+1
        cmp #$10
        bcc @SpawnFromLeft
        bne @SpawnFromRight
        lda PlayerData+EntityX
        bpl @SpawnFromRight
@SpawnFromLeft:
        ; spawn on the far left of the screen
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$E0
        sta Workset + EntityX
        lda #$0F
        sta Workset + EntityX+1
        lda #$00
        sta Workset + EntityXSubspeed
        lda #$01
        sta Workset + EntityXSpeed
        rts
@SpawnFromRight:
        ; spawn on the far right of the screen
        lda #(EntityHeaderActive | EntityHeader7 | EntityHeaderFacingLeft)
        sta Workset + EntityHeader
        lda #$20
        sta Workset + EntityX
        lda #$11
        sta Workset + EntityX+1
        lda #$00
        sta Workset + EntityXSubspeed
        lda #$FF
        sta Workset + EntityXSpeed
        rts
@Main:
        lda Workset + EntityStunTimer
        beq @StillAlive
        jmp @DelayUntilDeathAnimationComplete
@StillAlive:
        lda Workset + EntityBabysharkStunTimer
        beq @FastMovement
        ; if V18 is set we are taking damage.
        ; we want to slow down movement speed.
        clc
        lda Workset + EntityXSpeed
        bpl @SlowMovement
        sec
@SlowMovement:
        ror Workset + EntityXSpeed
        ror Workset + EntityXSubspeed
        jsr WorksetMoveX
        asl Workset + EntityXSubspeed
        rol Workset + EntityXSpeed
        jsr WorksetAnimationAdvance
        jsr WorksetAnimationAdvance
        jsr WorksetAnimationAdvance
        dec Workset + EntityBabysharkStunTimer
        jmp @MoveY
@FastMovement:
        jsr WorksetMoveX
@MoveY:
        ; move y and keep babyshark inside the stage
        jsr WorksetMoveY
        jsr EncounterClampWorksetMinimumY
        jsr EncounterClampWorksetMaximumY
        bit Workset + EntityV16
        bmi @KeepRunning
        lda #$01
        bit Workset + EntityHitDetection
        bne @SetV16
        rts
@SetV16:
        lda #%10000000
        sta Workset + EntityV16
        rts
@KeepRunning:
        lda #$01
        bit Workset + EntityHitDetection
        bne @RunStandardEnemyLogic
        dec Workset + EntityActiveAnimationIndex
        bne @FlipDirection
        lda #$00
        sta Workset + EntityHeader
        rts
@FlipDirection:
        lda #$00
        sta Workset + EntityV16
        lda Workset + EntityHeader
        eor #EntityHeaderFacingLeft
        sta Workset + EntityHeader
        lda Workset + EntityXSubspeed
        eor #$FF
        clc
        adc #$01
        sta Workset + EntityXSubspeed
        lda Workset + EntityXSpeed
        eor #$FF
        adc #$00
        sta Workset + EntityXSpeed
        rts
@RunStandardEnemyLogic:
        jsr WorksetAnimationAdvance
        jsr WorksetDetectProjectileHit
        jsr CheckFlagsAndHitDetectAgainstPlayer
        bit Workset + EntityHitDetection
        bvc @UpdateSpeeds
        ; we seem to have been shot, play a sound effect and lower hp
        lda #SFXEncounterEnemyDeath
        jsr SoundPlay
        dec Workset + EntityBabysharkHP
        bne @ProcessHit
        ; babyshark is dead, give points, mark for removal and play animation
        lda #$0A
        jsr AwardPoints
        lda #$80
        sta Workset + EntityStunTimer
        lda #AnimationEncounterBabysharkDeath
        jmp WorksetAnimationPlay
@ProcessHit:
        ; award points and set timer
        lda #$00
        jsr AwardPoints
        lda #$08
        sta Workset + EntityBabysharkStunTimer
@UpdateSpeeds:
        ; chase after player
        lda HitDetectYDistance+1
        bne @MoveDownward
        lda HitDetectYDistance
        cmp #$04
        bcs @MoveDownward
        ; on level with player, clear y speed
        lda #$00
        sta Workset + EntityYSubspeed
        sta Workset + EntityYSpeed
        rts
@MoveDownward:
        lda #$02
        bit HitDetectYDirection
        bne @MoveUpward
        lda #$80
        sta Workset + EntityYSubspeed
        lda #$00
        sta Workset + EntityYSpeed
        rts
@MoveUpward:
        lda #$80
        sta Workset + EntityYSubspeed        
        lda #$FF
        sta Workset + EntityYSpeed        
        rts 
@DelayUntilDeathAnimationComplete:
        jsr WorksetAnimationAdvance
        lda Workset + EntityAnimTimer
        beq @ProcessDeath
        rts
@ProcessDeath:
        lda #EntityHeaderActive
        sta Workset + EntityHeader
        lda #EncounterEntityStar ; spawn a star on death
        sta Workset + EntityType
        jmp RunEntity

; ----------------------------------------------------------------------------
RunEntityCrab:
        bit Workset + EntityHeader
        bvs @Main
        lda PlayerCrabLevel
        cmp #$03
        bcc @Initialize
        ; if the player is at max crab level, turn into a star!
        lda #$0A
        sta Workset + EntityType
        jmp RunEntityStar
@Initialize:
        ; set active flag
        lda #(EntityHeaderActive | EntityHeader7) 
        sta Workset + EntityHeader
        ; clear some settings
        jsr WorksetClearSpeed
        lda #$00
        sta Workset + EntityIsSinking
        sta Workset + EntityHitDetection
        ; and play the crab animation
        lda #AnimationEncounterCrab
        jmp WorksetAnimationPlay
@Main:
        jsr HitDetectAgainstPlayer
        bcc @CrabMovement
        ; the player is touching the flag, time to award a crab level.
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
        ; our work here is done, disable entity
        bcc @Disable
        ; make sure we don't go over 3
        lda #$03
        sta PlayerCrabLevel
@Disable:
        lda #$00
        sta Workset + EntityHeader
        rts
@CrabMovement:
        lda Workset + EntityIsSinking
        bne @OnWaterFloor
        ; accelerate toward the bottom of the map
        lda #$08
        ldy #$01
        jsr ApproachYSpeed
        jsr WorksetMoveY
        ; and exit unless we've reached the bottom.
        jsr EncounterClampWorksetMaximumY
        bcc @Exit
        ; increment V18, we've reached the bottom of the map.
        inc Workset + EntityIsSinking
        ; set crab speed to 1
        ldy #$01
        ; compare crab position to player x
        lda PlayerData + EntityX
        cmp Workset + EntityX
        lda PlayerData+EntityX+1
        sbc Workset + EntityX + 1
        bcs @StoreSpeed
        ; set crab speed to -1 if player is to the left
        ldy #$FF
@StoreSpeed:
        ; we have our new speed!
        sty Workset + EntityXSpeed
@Exit:
        rts
@OnWaterFloor:
        ; animate crab and move toward player position
        jsr WorksetAnimationAdvance
        jsr WorksetMoveX
        ; load current location
        lda Workset + EntityX + 1
        ; and immediately overwrite with 1..
        lda #$01
        ; compare against hit detection flag
        and Workset + EntityHitDetection
        bne @Exit2
        ; do pointless check
        cmp #$10
        beq @Exit2
        ; and disable entity!
        lda #$00
        sta Workset + EntityHeader
@Exit2:
        rts

; ----------------------------------------------------------------------------
RunEntityShell:
        bit Workset + EntityHeader
        bvs @Main
        ; initialize some settings
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        jsr WorksetClearSpeed
        lda #$00
        sta Workset + EntityIsSinking
        ; play shell animation
        lda #AnimationEncounterShell
        jmp WorksetAnimationPlay
@Main:
        jsr HitDetectAgainstPlayer
        bcc @KeepRunning
        ; if the player has touched the shell, award points and give shells
        lda #SFXEncounterPickup
        jsr SoundPlay
        lda #$02
        jsr AwardPoints
        inc PlayerShellCount
        lda PlayerShellCount
        cmp #$64
        bcc @UpdateUIAndDespawn
        ; max out at 99 shells
        lda #$63
        sta PlayerShellCount
@UpdateUIAndDespawn:
        ; mark the shell UI to be updated
        lda PendingBGUpdates
        ora #DrawStatusbarShellsFlag
        sta PendingBGUpdates
        ; and disable the entity
@Despawn:
        lda #$00
        sta Workset + EntityHeader
        rts
@KeepRunning:
        ; keep falling to the ground until landed
        bit Workset + EntityIsSinking
        bpl @FallingToGround
        ; despawn if timer has expired, otherwise wait
        dec Workset + EntityPickupTimer
        bne @Exit
        beq @Despawn
@FallingToGround:
        jsr WorksetAnimationAdvance
        ; accelerate toward the ground
        lda #$04
        ldy #$01
        jsr ApproachYSpeed
        jsr WorksetMoveY
        ; and check if we've hit the ground
        jsr EncounterClampWorksetMaximumY
        bcc @Exit
        ; mark that we have hit the ground
        lda #$80
        sta Workset + EntityIsSinking
        ; set timer to despawn unless picked up.
        lda #$80
        sta Workset + EntityPickupTimer
@Exit:
        rts

; ----------------------------------------------------------------------------
RunEntityStar:
        bit Workset + EntityHeader
        bvs @Main
        ; initialize some settings
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        jsr WorksetClearSpeed
        lda #$00
        sta Workset + EntityIsSinking
        sta Workset + EntityAnimationIndex
        lda #AnimationEncounterStar
        jmp WorksetAnimationPlay
@Main:
        bit Workset + EntityAnimationIndex
        bpl @CheckForPickup
        jsr WorksetMoveY
        jsr WorksetAnimationAdvance
        lda Workset + EntityAnimTimer
        beq @Despawn
        rts
@CheckForPickup:
        jsr HitDetectAgainstPlayer
        bcc @NotPickedUp
        ; player is picking up the star, play a sound
        lda #SFXEncounterPickup
        jsr SoundPlay
        ; then advance the rng and pick out some bits from it
        jsr RNGAdvance
        and #$06
        ; load animation to run and push it to the stack
        tax
        lda @StarRNGPoints+1,x
        pha
        ; load and award points based on rng
        lda @StarRNGPoints,x
        jsr AwardPoints
        ; mark flag to despawn after animation
        lda #$80
        sta Workset + EntityAnimationIndex
        lda #$00
        sta Workset + EntityYSubspeed
        lda #$FF
        sta Workset + EntityYSpeed
        ; and play the points animation we loaded earlier
        pla
        jmp WorksetAnimationPlay
@Despawn:
        lda #$00
        sta Workset + EntityHeader
        rts
@NotPickedUp:
        jsr WorksetAnimationAdvance
        ; keep falling to the ground until landed
        bit Workset + EntityIsSinking
        bpl @FallingToGround
        ; despawn if timer has expired, otherwise wait
        dec Workset + EntityPickupTimer
        bne @Exit
        beq @Despawn
@FallingToGround:
        ; accelerate toward the ground
        lda #$04
        ldy #$01
        jsr ApproachYSpeed
        jsr WorksetMoveY
        ; and check if we've hit the ground
        jsr EncounterClampWorksetMaximumY
        bcc @Exit
        ; mark that we have hit the ground
        lda #$80
        sta Workset + EntityIsSinking
        ; set timer to despawn unless picked up.
        lda #$80
        sta Workset + EntityPickupTimer
@Exit:
        rts

; table of points to award + animation to run
@StarRNGPoints:
        .byte $0A,AnimationEncounter500Points
        .byte $0A,AnimationEncounter500Points
        .byte $0C,AnimationEncounter1000Points
        .byte $0E,AnimationEncounter2000Points

; ----------------------------------------------------------------------------
InitJawsStashedLocation:
        ; jaws starting position on the map
        lda #$18
        sta JawsStashedX
        lda #$0C
        sta JawsStashedY
        rts

; ----------------------------------------------------------------------------
PrepareEncounterPatterns:
        @TempPointer = $44
        lda TotalEncountersPlayed
        asl a
        tax
        lda EncounterPatterns,x
        sta @TempPointer
        lda EncounterPatterns+1,x
        sta @TempPointer+1
        ldy #$00
        ; load how many simultaneous enemies to spawn
        lda (@TempPointer),y
        iny
        ; if we're spawning more than 3 at a time
        cmp #$03
        bcc @SetupPatterns
        ; and jaws is joining the encounter
        ldx EncounterJawsActive
        cpx #$02
        bcs @SetupPatterns
        ; then reduce down to 3
        lda #$03
@SetupPatterns:
        sta EncounterEnemiesOnScreen
        lda (@TempPointer),y
        iny
        sta EncounterSpawnTimer
        sta EncounterNextSpawnTimer
        lda (@TempPointer),y
        iny
        sta EncounterPatternsPtr
        lda (@TempPointer),y
        sta EncounterPatternsPtr + 1
        lda #$00
        sta EncounterSpawnsIndex
        lda #$00
        sta EncounterSpawnTimer+1
        sta EncounterNextSpawnTimer+1
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
        ; check if mapscrollx has been changed since last draw.
        lda MapScrollCurrentX+1
        cmp MapScrollX+1
        bne @UpdateNeeded
        lda MapScrollCurrentX
        cmp MapScrollX
        bne @UpdateNeeded
        ; camera has not moved, we don't need to do anything.
        rts
@UpdateNeeded:
        ; okay the camera has moved. we need to do some work..
        bcs @ScrollLeft
        ; next bgupdate to run, this will draw new map data to the right.
        ldy #$01
        ; get which map slice index we should load into
        lda MapScrollX
        clc
        adc #$F0
        tax
        ; skip if we are trying to load data outside of the map bounds
        lda MapScrollX+1
        adc #$00
        cmp #$02
        bcc @LoadNewMapDataIfNeeded
        rts
@ScrollLeft:
        ; next bgupdate to run, this will draw new map data to the left.
        ldy #$03
        ; get which map slice index we should load into
        lda MapScrollX
        sec
        sbc #$00
        tax
        ; skip if we are trying to load data outside of the map bounds
        lda MapScrollX+1
        sbc #$00
        bpl @LoadNewMapDataIfNeeded
        rts
@LoadNewMapDataIfNeeded:
        lsr a
        ; get map slice index
        txa
        ror a
        lsr a
        lsr a
        lsr a
        sta $00
        and #$0F
        tax
        lda $00
        ; if that slice is already loaded in where we expect,
        ; we do not need to reload it
        cmp BGLoadedSlices,x
        beq @ScrollAlreadyCorrect
        ; otherwise mark the bg to be updated
        sty NextBGUpdate
        ; and load in our new data
        jsr LoadVisibleMapStripes
        jsr LoadVisibleMapAttributeData
        ; then update the cached map scroll position
@ScrollAlreadyCorrect:
        lda MapScrollX
        sta MapScrollCurrentX
        lda MapScrollX+1
        sta MapScrollCurrentX+1
        rts

; ----------------------------------------------------------------------------
MapSetStartingScroll:   
        @StripeToLoad      = $00
        @MapRowsLeftToDraw = $01
        ; determine how many lines of map data to draw
        lda MapScrollX+1
        sta $01
        sta MapScrollCurrentX+1
        lda MapScrollX
        sta MapScrollCurrentX
        lsr $01
        ; find starting stripe to load
        ror a
        lsr a
        lsr a
        lsr a
        sta @StripeToLoad
        pha
        lda #$10
        sta @MapRowsLeftToDraw
        ; 
@DrawNextLine:
        jsr LoadVisibleMapStripes
        jsr DrawVisibleMapStripe1And2
        inc @StripeToLoad
        dec @MapRowsLeftToDraw
        bne @DrawNextLine
        pla
        sta @StripeToLoad
        ; update $08, unused?
        lda #$08
        sta $08
@LoadBGAttributes:
        jsr LoadVisibleMapAttributeData
        jsr DrawVisibleMapAttributes
        inc @StripeToLoad
        inc @StripeToLoad
        dec @MapRowsLeftToDraw
        bne @LoadBGAttributes
        rts

; ----------------------------------------------------------------------------
LoadVisibleMapStripes:
        @StripeToLoad     = $00
        @WorldMapDataPtr  = $02
        @MetatilePtr      = $04
        lda @StripeToLoad
        and #$0F
        tax
        ; update slice list so we don't reload this slice.
        lda @StripeToLoad
        sta BGLoadedSlices,x
        ; find offset into worldmapdata
        asl a
        adc @StripeToLoad
        sta @WorldMapDataPtr
        lda #$00
        asl @WorldMapDataPtr
        rol a
        asl @WorldMapDataPtr
        rol a
        asl @WorldMapDataPtr
        rol a
        adc #>WorldMapData
        sta @WorldMapDataPtr+1
        ; and copy one 
        ldx #$00
@CopyNextTile:
        txa
        tay
        ; load next metatile to load
        lda (@WorldMapDataPtr),y
        ; and find its pointer in the metatile list
        sta @MetatilePtr
        lda #<Metatiles
        tay
        asl @MetatilePtr
        rol a
        asl @MetatilePtr
        rol a
        adc #>Metatiles
        sta @MetatilePtr+1
        txa
        pha
        asl a
        tax
        ; copy the metatile data into the two
        ; background drawing stripes
        lda (@MetatilePtr),y
        iny
        sta VisibleMapStripe1,x
        lda (@MetatilePtr),y
        iny
        sta VisibleMapStripe2,x
        lda (@MetatilePtr),y
        iny
        sta VisibleMapStripe1+1,x
        lda (@MetatilePtr),y
        sta VisibleMapStripe2+1,x
        pla
        tax
        inx
        ; and keep looping until we've done the
        ; full height of the world map
        cpx #$18
        bcc @CopyNextTile
        ; find ppu offset to where the slice should be written
        lda @StripeToLoad
        asl a
        and #$1E
        adc #$80
        sta DrawVisibleMapDataPPUPosition
        rts

; ----------------------------------------------------------------------------
LoadVisibleMapAttributeData:
        @StripeToLoad       = $00
        @Slice1Ptr          = $02
        @Slice2Ptr          = $04
        @CombinedAttributes = $06
        lda @StripeToLoad
        and #$0E
        tax
        ; load pointers to two neighboring slices
        ; within the worldmap attributes table.
        lda BGLoadedSlices,x
        lsr a
        sta @Slice1Ptr
        asl a
        adc @Slice1Ptr
        asl a
        asl a
        adc @Slice1Ptr
        sta @Slice1Ptr
        lda BGLoadedSlices+1,x
        lsr a
        sta @Slice2Ptr
        asl a
        adc @Slice2Ptr
        asl a
        asl a
        adc @Slice2Ptr
        sta @Slice2Ptr
        lda #>WorldMapDataAttributes
        sta @Slice1Ptr+1
        sta @Slice2Ptr+1
        ldy #$00
@CopyNextAttributes:
        ; get left side attributes of slice 1
        lda (@Slice1Ptr),y
        and #%00110011
        sta @CombinedAttributes
        ; and right side of slice 2
        lda (@Slice2Ptr),y
        and #%11001100
        ora @CombinedAttributes
        ; then store the attributes in our working copy
        sta VisibleMapAttributes,y
        iny
        ; copy a full height of the world map attributes table
        cpy #$0D
        bcc @CopyNextAttributes
        ; find ppu offset to where the attributes should be written
        lda @StripeToLoad
        and #$0E
        lsr a
        adc #$C8
        sta DrawVisibleMapAttrPPUPosition
        rts

; ----------------------------------------------------------------------------
DrawVisibleMapStripe1And2:
        jsr DrawVisibleMapStripe1
        jmp DrawVisibleMapStripe2

; ----------------------------------------------------------------------------
DrawVisibleMapStripe1:
        lda PPUCTRL_MIRROR
        ora #%00000100                      ; set vertical rendering
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        lda #$20
        sta PPUADDR
        lda DrawVisibleMapDataPPUPosition
        sta PPUADDR
        ldx #$00
@KeepCopying1:
        lda VisibleMapStripe1,x
        sta PPUDATA
        inx
        cpx #$1A
        bcc @KeepCopying1
        lda #$28
        sta PPUADDR
        lda DrawVisibleMapDataPPUPosition
        and #$1E
        sta PPUADDR
@KeepCopying2:
        lda VisibleMapStripe1,x
        sta PPUDATA
        inx
        cpx #$30
        bcc @KeepCopying2
        rts

; ----------------------------------------------------------------------------
DrawVisibleMapStripe2:
        lda PPUCTRL_MIRROR
        ora #%00000100                      ; set vertical rendering
        sta PPUCTRL_MIRROR
        sta PPUCTRL
        lda #$20
        sta PPUADDR
        lda DrawVisibleMapDataPPUPosition
        ora #$01
        sta PPUADDR
        ldx #$00
@KeepCopying1:
        lda VisibleMapStripe2,x
        sta PPUDATA
        inx
        cpx #$1A
        bcc @KeepCopying1
        lda #$28
        sta PPUADDR
        lda DrawVisibleMapDataPPUPosition
        and #$1E
        ora #$01
        sta PPUADDR
@KeepCopying2:
        lda VisibleMapStripe2,x
        sta PPUDATA
        inx
        cpx #$30
        bcc @KeepCopying2
        rts

; ----------------------------------------------------------------------------
DrawVisibleMapAttributes:
        ldx #$00
        ldy DrawVisibleMapAttrPPUPosition
@KeepDrawing:
        ; set ppu to $23YY
        lda #$23
        sta PPUADDR
        sty PPUADDR
        lda VisibleMapAttributes,x
        sta PPUDATA
        tya
        clc
        adc #$08
        tay
        inx
        cpx #$07
        bcc @KeepDrawing
        lda DrawVisibleMapAttrPPUPosition
        and #$C7
        tay
@KeepDrawing2:
        ; set ppu to $2BYY
        lda #$2B
        sta PPUADDR
        sty PPUADDR
        lda VisibleMapAttributes,x
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
        ; when the player moves to the right we draw stripe1 then stripe2
        jsr DrawVisibleMapStripe1
        jsr DrawVisibleMapAttributes
        ; continue to DrawBGMapRight2
        lda #$02
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapRight2:
        jsr DrawVisibleMapStripe2
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapLeft1:
        ; when the player moves to the left we draw stripe2 then stripe1
        jsr DrawVisibleMapStripe2
        jsr DrawVisibleMapAttributes
        ; continue to DrawBGMapLeft2
        lda #$04
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
DrawBGMapLeft2:
        jsr DrawVisibleMapStripe1
        lda #$00
        sta NextBGUpdate
        rts

; ----------------------------------------------------------------------------
EncounterLoadSettings:
        @TempPointer = $44
        ; disable ppu while loading the encounter
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        lda #CHREncounterAndIntroScreen
        sta ActiveCHR
        lda #$00
        sta WaterAnimationTimer
        sta WaterAnimationFrame
        lda CurrentMapPositionFlags
        asl a
        tax
        lda EncounterTypeSettings,x
        sta @TempPointer
        lda EncounterTypeSettings+1,x
        sta @TempPointer+1
        jsr ClearScreenAndSprites
        jsr DrawStatusLine
        jsr DrawStatusLine_PowerLabel
        lda #$01
        sta ShowStatusBarTextLine
        sta NMISpriteHandlingDisabled
        ldy #$00
        lda (@TempPointer),y
        jsr LoadEncounterBackground
        ldy #$01
        lda (@TempPointer),y
        jsr DrawRomGraphics
        ldy #$02
        lda (@TempPointer),y
        iny
        sta WaterHeight
        lda (@TempPointer),y
        iny
        sta WaterHeight+1
        lda (@TempPointer),y
        iny
        sta EncounterMaxDepth
        lda (@TempPointer),y
        iny
        sta EncounterMaxDepth+1
        lda (@TempPointer),y
        jsr StoreActivePaletteAndWaitFor1Frame
        ; settings loaded, enable ppu and get out of here!
        jsr PPUEnableNMI
        rts

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
        ; do ctl FFFF
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
        adc #<Metatiles
        sta @TempDataPointer
        txa
        adc #>Metatiles
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
AnimationMapJawsEmergeNS             = $16
AnimationBonusJellyfish              = $17
AnimationMapJawsEmergeDN             = $18
AnimationMapJawsEmergeDS             = $19
AnimationMapJawsSubmergeEW           = $1A
AnimationMapJawsSubmergeNS           = $1B
AnimationUnused1                     = $1C
AnimationMapJawsSubmergeDN           = $1D
AnimationMapJawsSubmergeDS           = $1E
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
AnimationEncounterJellyfishDeath     = $39
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
  .addr @AnimationMapJawsEmergeNS
  .addr @AnimationBonusJellyfish
  .addr @AnimationMapJawsEmergeDN
  .addr @AnimationMapJawsEmergeDS
  .addr @AnimationMapJawsSubmergeEW
  .addr @AnimationMapJawsSubmergeNS
  .addr @AnimationUnused1
  .addr @AnimationMapJawsSubmergeDN
  .addr @AnimationMapJawsSubmergeDS
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
  .addr @AnimationEncounterJellyfishDeath
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
.addr SpritesetMapJawsEWTransition4
.byte $07
.addr SpritesetMapJawsEWTransition3
.byte $06
.addr SpritesetMapJawsEWTransition2
.byte $06
.addr SpritesetMapJawsEWTransition1
.byte $03
.addr SpritesetMapJawsEW3
.byte $00
.addr SpritesetMapJawsEW4
@AnimationMapJawsEmergeNS:
.byte $08
.addr SpritesetMapJawsNSTransition1
.byte $08
.addr SpritesetMapJawsNSTransition2
.byte $08
.addr SpritesetMapJawsNSTransition3
.byte $00
.addr SpritesetMapJawsNSTransition4
@AnimationMapJawsEmergeDN:
.byte $08
.addr SpritesetMapJawsDNTransition1
.byte $08
.addr SpritesetMapJawsDNTransition2
.byte $08
.addr SpritesetMapJawsDNTransition3
.byte $00
.addr SpritesetMapJawsDN3
@AnimationMapJawsEmergeDS:
.byte $08
.addr SpritesetMapJawsDSTransition1
.byte $08
.addr SpritesetMapJawsDSTransition2
.byte $08
.addr SpritesetMapJawsDSTransition3
.byte $00
.addr SpritesetMapJawsDS3
@AnimationMapJawsSubmergeEW:
.byte $03
.addr SpritesetMapJawsEW4
.byte $03
.addr SpritesetMapJawsEW3
.byte $06
.addr SpritesetMapJawsEWTransition1
.byte $06
.addr SpritesetMapJawsEWTransition2
.byte $07
.addr SpritesetMapJawsEWTransition3
.byte $00
.addr SpritesetMapJawsEWTransition4
@AnimationMapJawsSubmergeNS:
.byte $08
.addr SpritesetMapJawsNSTransition4
.byte $08
.addr SpritesetMapJawsNSTransition3
.byte $08
.addr SpritesetMapJawsNSTransition2
.byte $00
.addr SpritesetMapJawsNSTransition1
@AnimationMapJawsSubmergeDN:
.byte $08
.addr SpritesetMapJawsDN3
.byte $08
.addr SpritesetMapJawsDNTransition3
.byte $08
.addr SpritesetMapJawsDNTransition2
.byte $00
.addr SpritesetMapJawsDNTransition1
@AnimationMapJawsSubmergeDS:
.byte $08
.addr SpritesetMapJawsDS3
.byte $08
.addr SpritesetMapJawsDSTransition3
.byte $08
.addr SpritesetMapJawsDSTransition2
.byte $00
.addr SpritesetMapJawsDSTransition1
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
@AnimationBonusJellyfish:
.byte $08
.addr SpritesetEncounterJellyfish1
.byte $04
.addr SpritesetEncounterJellyfish2
.byte $08
.addr SpritesetEncounterJellyfish3
.byte $08
.addr SpritesetEncounterJellyfish2
.byte $ff
@AnimationEncounterJellyfishDeath:
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
;     - s8 x offset from entity location
;     - s8 y offset from entity location
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
SpritesetMapJawsEWTransition1:
.byte $04,$04
.byte $F8,$FA,$84,$02
.byte $00,$FA,$85,$02
.byte $F8,$02,$C8,$02
.byte $00,$02,$C9,$02
.byte $80
SpritesetMapJawsEWTransition2:
.byte $04,$04
.byte $F8,$FC,$84,$02
.byte $00,$FC,$85,$02
.byte $F8,$04,$D8,$02
.byte $00,$04,$D9,$02
.byte $80
SpritesetMapJawsEWTransition3:
.byte $04,$04
.byte $F8,$FA,$84,$02
.byte $00,$FA,$85,$02
.byte $F8,$02,$CA,$02
.byte $00,$02,$CB,$02
.byte $80
SpritesetMapJawsEWTransition4:
.byte $04,$04
.byte $F8,$00,$DA,$02
.byte $00,$00,$DB,$02
.byte $80
SpritesetMapJawsNSTransition1:
.byte $02,$02
.byte $FC,$00,$DE,$02
.byte $80
SpritesetMapJawsNSTransition2:
.byte $02,$02
.byte $FC,$00,$CE,$02
.byte $80
SpritesetMapJawsNSTransition3:
.byte $02,$04
.byte $FC,$F8,$CD,$02
.byte $FC,$00,$DD,$02
.byte $80
SpritesetMapJawsNSTransition4:
.byte $02,$04
.byte $FC,$F8,$CC,$02
.byte $FC,$00,$DC,$02
.byte $80
SpritesetMapJawsDNTransition1:
.byte $03,$03
.byte $FA,$00,$CF,$02
.byte $80
SpritesetMapJawsDNTransition2:
.byte $03,$03
.byte $FA,$00,$E1,$02
.byte $80
SpritesetMapJawsDNTransition3:
.byte $04,$04
.byte $F8,$F8,$E0,$02
.byte $F8,$00,$F0,$02
.byte $00,$00,$F1,$02
.byte $80
SpritesetMapJawsDSTransition1:
.byte $03,$03
.byte $FA,$00,$DF,$02
.byte $80
SpritesetMapJawsDSTransition2:
.byte $03,$03
.byte $FA,$00,$E3,$02
.byte $80
SpritesetMapJawsDSTransition3:
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

; table of encounter patterns, loaded based on how many encounters the player has finished.
EncounterPatterns:
        .addr @EncounterPatterns00Data
        .addr @EncounterPatterns01Data
        .addr @EncounterPatterns02Data
        .addr @EncounterPatterns03Data
        .addr @EncounterPatterns04Data
        .addr @EncounterPatterns05Data
        .addr @EncounterPatterns06Data
        .addr @EncounterPatterns07Data
        .addr @EncounterPatterns08Data
        .addr @EncounterPatterns09Data
        .addr @EncounterPatterns0AData
        .addr @EncounterPatterns0BData
        .addr @EncounterPatterns0CData
        .addr @EncounterPatterns0DData
        .addr @EncounterPatterns0EData
        .addr @EncounterPatterns0FData
        .addr @EncounterPatterns10Data
        .addr @EncounterPatterns11Data
        .addr @EncounterPatterns12Data
        .addr @EncounterPatterns13Data
        .addr @EncounterPatterns14Data
        .addr @EncounterPatterns15Data
        .addr @EncounterPatterns16Data
        .addr @EncounterPatterns17Data
        .addr @EncounterPatterns18Data
        .addr @EncounterPatterns19Data
        .addr @EncounterPatterns1AData
        .addr @EncounterPatterns1BData
        .addr @EncounterPatterns1CData
        .addr @EncounterPatterns1DData
        .addr @EncounterPatterns1EData
        .addr @EncounterPatterns1FData

; 3 parameters per encounter:
;  - how many enemies to have on screen at once
;  - countdown between each spawn
;  - pointer to each a table of enemies to spawn
@EncounterPatterns00Data:
.byte $02, $40
.addr @EncounterSpawns00Data

@EncounterPatterns01Data:
.byte $02, $40
.addr @EncounterSpawns01Data

@EncounterPatterns02Data:
.byte $03, $30
.addr @EncounterSpawns00Data

@EncounterPatterns03Data:
.byte $03, $30
.addr @EncounterSpawns01Data

@EncounterPatterns04Data:
.byte $03, $20
.addr @EncounterSpawns02Data

@EncounterPatterns05Data:
.byte $03, $20
.addr @EncounterSpawns03Data

@EncounterPatterns06Data:
.byte $04, $20
.addr @EncounterSpawns00Data

@EncounterPatterns07Data:
.byte $04, $20
.addr @EncounterSpawns01Data

@EncounterPatterns08Data:
.byte $04, $10
.addr @EncounterSpawns02Data

@EncounterPatterns09Data:
.byte $04, $10
.addr @EncounterSpawns03Data

@EncounterPatterns0AData:
.byte $03, $10
.addr @EncounterSpawns04Data

@EncounterPatterns0BData:
.byte $03, $10
.addr @EncounterSpawns05Data

@EncounterPatterns0CData:
.byte $04, $10
.addr @EncounterSpawns05Data

@EncounterPatterns0DData:
.byte $02, $10
.addr @EncounterSpawns06Data

@EncounterPatterns0EData:
.byte $02, $10
.addr @EncounterSpawns07Data

@EncounterPatterns0FData:
.byte $02, $10
.addr @EncounterSpawns08Data

@EncounterPatterns10Data:
.byte $03, $08
.addr @EncounterSpawns05Data

@EncounterPatterns11Data:
.byte $03, $08
.addr @EncounterSpawns06Data

@EncounterPatterns12Data:
.byte $03, $08
.addr @EncounterSpawns07Data

@EncounterPatterns13Data:
.byte $03, $08
.addr @EncounterSpawns08Data

@EncounterPatterns14Data:
.byte $03, $08
.addr @EncounterSpawns09Data

@EncounterPatterns15Data:
.byte $03, $08
.addr @EncounterSpawns0AData

@EncounterPatterns16Data:
.byte $03, $08
.addr @EncounterSpawns0BData

@EncounterPatterns17Data:
.byte $03, $08
.addr @EncounterSpawns0CData

@EncounterPatterns18Data:
.byte $04, $04
.addr @EncounterSpawns05Data

@EncounterPatterns19Data:
.byte $04, $04
.addr @EncounterSpawns06Data

@EncounterPatterns1AData:
.byte $04, $04
.addr @EncounterSpawns07Data

@EncounterPatterns1BData:
.byte $04, $04
.addr @EncounterSpawns08Data

@EncounterPatterns1CData:
.byte $04, $04
.addr @EncounterSpawns09Data

@EncounterPatterns1DData:
.byte $04, $04
.addr @EncounterSpawns0AData

@EncounterPatterns1EData:
.byte $04, $04
.addr @EncounterSpawns0BData

@EncounterPatterns1FData:
.byte $04, $04
.addr @EncounterSpawns0CData


; tables of enemies to spawn.
; each encounter is terminated by $FF.
; the numbers indicate what kind of enemy to spawn.
@EncounterSpawns00Data:
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte $FF
@EncounterSpawns01Data:
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns02Data:
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns03Data:
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns04Data:
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityStingray
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns05Data:
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte $FF
@EncounterSpawns06Data:
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns07Data:
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns08Data:
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns09Data:
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityJellyfish
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns0AData:
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityJellyfish
.byte EncounterEntityStingray
.byte $FF
@EncounterSpawns0BData:
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte $FF
@EncounterSpawns0CData:
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
.byte EncounterEntityStingray2
.byte EncounterEntityHomingJellyfish
.byte EncounterEntityStingray2
.byte EncounterEntityBabyshark
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

RomGraphicsFacingDirectionsPerEntityType:
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
.byte $00,$20,$FF
.byte $FF,$20,$10,$02,$FF
.byte $01,$D7,$20,$A5,$B5,$FF
.byte $0E,$01,$01,$FF
.byte $05,$62,$01,$61,$A2,$A0,$02,$B2,$A4,$D0,$01,$01,$D3,$FF
.byte $0D,$01,$01,$FF
.byte $05,$72,$01,$71,$B2,$01,$E0,$01,$B4,$01,$01,$E2,$E3,$22,$23,$FF
.byte $0B,$01,$01,$FF
.byte $05,$82,$01,$81,$01,$01,$F0,$01,$C4,$01,$01,$F2,$F3,$FF
.byte $0A,$60,$90,$91,$01,$01,$02,$68,$69,$6A,$6B,$92,$01,$01,$01,$01,$01,$65,$D4,$D5,$01,$01,$C5,$FF
.byte $0A,$70,$01,$A1,$01,$A3,$02,$78,$79,$7A,$7B,$02,$62,$01,$63,$64,$01,$75,$E4,$E5,$F5,$01,$01,$FF
.byte $0A,$80,$B0,$01,$01,$B3,$02,$88,$89,$8A,$8B,$02,$72,$01,$73,$74,$01,$85,$F4,$01,$01,$01,$66,$FF
.byte $0B,$C0,$C1,$C2,$C3,$02,$98,$99,$9A,$9B,$02,$93,$94,$83,$84,$94,$95,$B1,$D1,$D2,$E1,$F1,$FF
.byte $0B,$86,$87,$A6,$A7,$02,$A8,$A9,$AA,$AB,$02,$8C,$8D,$8E,$8F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $08,$96,$97,$B6,$B7,$02,$B8,$B9,$BA,$BB,$02,$9C,$9D,$9E,$9F,$FF
.byte $0D,$5C,$5D,$5D,$5F,$5C,$5D,$5E,$5F,$6C,$6D,$6E,$6F,$7C,$7D,$7E,$7F,$5C,$5D,$5E,$5F,$5C,$5D,$5E,$5F,$5C,$5D,$5E,$5F,$5C,$5D,$5E,$5F,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$14,$15,$16,$17,$FF
.byte $01,$86,$22,$40,$31,$39,$38,$37,$20,$4C,$4A,$4E,$20,$54,$4F,$59,$53,$2C,$4C,$54,$44,$2E,$FF
.byte $13,$54,$4D,$26,$40,$31,$39,$38,$37,$FF
.byte $0F,$55,$4E,$49,$56,$45,$52,$53,$41,$4C,$20,$43,$49,$54,$59,$20,$53,$54,$55,$44,$49,$4F,$53,$2C,$49,$4E,$43,$2E,$FF
.byte $08,$41,$4C,$4C,$20,$52,$49,$47,$48,$54,$53,$20,$52,$45,$53,$45,$52,$56,$45,$44,$2E,$FF
.byte $09,$4C,$49,$43,$45,$4E,$53,$45,$44,$20,$42,$59,$20,$4D,$45,$52,$43,$48,$41,$4E,$44,$49,$53,$49,$4E,$47,$FF
.byte $07,$43,$4F,$52,$50,$4F,$52,$41,$54,$49,$4F,$4E,$20,$4F,$46,$20,$41,$4D,$45,$52,$49,$43,$41,$2C,$49,$4E,$43,$2E,$FF
.byte $06,$4C,$49,$43,$45,$4E,$53,$45,$44,$20,$42,$59,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F,$20,$4F,$46,$FF
.byte $0F,$41,$4D,$45,$52,$49,$43,$41,$2C,$49,$4E,$43,$2E,$FF
.byte $01,$C0,$23,$FF
.byte $FF,$12,$01,$AA,$FF
.byte $01,$D2,$23,$6A,$9A,$AA,$AA,$AA,$AA,$AA,$0A,$46,$19,$0A,$AA,$AA,$AA,$FF
.byte $FF,$20,$01,$00,$FF
.byte $00
@RomGraphicsStatusLineText:
.byte $00,$2B,$FF
.byte $FF,$20,$06,$20,$FF
.byte $01,$F0,$2B,$FF
.byte $FF,$10,$01,$00,$FF
.byte $01,$61,$2B,$53,$43,$4F,$52,$45,$FF
.byte $03,$10,$11,$12,$13,$10,$FF
.byte $06,$4A,$41,$57,$53,$2F,$50,$4F,$57,$45,$52,$FF
.byte $00
@RomGraphicsEncounterShallow:
.byte $C8,$23,$FF
.byte $FF,$18,$01,$FF
.byte $FF,$01,$E0,$23,$55,$55,$55,$55,$55,$55,$55,$55,$6A,$AA,$AA,$9A,$AA,$AA,$AA,$AA,$A6,$AA,$A9,$A9,$AA,$AA,$A6,$A9,$FF
.byte $00
@RomGraphicsEncounterDeep:
.byte $C8,$23,$FF
.byte $FF,$10,$01,$FF
.byte $FF,$01,$D8,$23,$5F,$5F,$5F,$5F,$5F,$5F,$5F,$5F,$FF
.byte $FF,$18,$01,$55,$FF
.byte $01,$F8,$23,$05,$05,$05,$05,$05,$05,$05,$05,$FF
.byte $01,$C0,$2B,$55,$55,$55,$55,$55,$55,$55,$55,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF
.byte $FF,$08,$01,$0A,$FF
.byte $00
@RomGraphicsFinaleScreen:
.byte $00,$20,$FF
.byte $FF,$20,$1A,$02,$FF
.byte $FF,$20,$04,$00,$FF
.byte $01,$40,$20,$0E,$0F,$FF
.byte $04,$0A,$0B,$0C,$0D,$0E,$0F,$FF
.byte $10,$0A,$0B,$0C,$0D,$1E,$1F,$FF
.byte $04,$1A,$1B,$1C,$1D,$1E,$1F,$02,$24,$25,$26,$27,$02,$0A,$0B,$0C,$0D,$0E,$0F,$25,$26,$27,$02,$1A,$1B,$1C,$1D,$74,$02,$24,$25,$26,$27,$FF
.byte $05,$74,$02,$34,$35,$36,$37,$02,$1A,$1B,$1C,$1D,$1E,$1F,$35,$36,$37,$FF
.byte $04,$74,$02,$02,$34,$35,$36,$37,$74,$75,$02,$17,$18,$19,$FF
.byte $03,$17,$18,$19,$FF
.byte $03,$74,$02,$02,$74,$75,$02,$17,$18,$19,$02,$02,$74,$75,$02,$02,$74,$75,$FF
.byte $05,$74,$74,$75,$FF
.byte $04,$74,$75,$02,$02,$17,$18,$19,$FF
.byte $03,$74,$75,$FF
.byte $30,$01,$01,$01,$01,$FF
.byte $02,$01,$01,$01,$01,$01,$01,$FF
.byte $14,$04,$05,$09,$01,$FF
.byte $02,$04,$05,$06,$07,$08,$09,$FF
.byte $06,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$51,$52,$54,$54,$54,$54,$54,$54,$51,$52,$54,$54,$54,$54,$53,$50,$51,$52,$54,$54,$54,$54,$54,$54,$51,$52,$54,$54,$54,$54,$54,$54,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$16,$16,$16,$16,$16,$16,$64,$65,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$64,$65,$16,$16,$16,$16,$16,$16,$64,$65,$16,$16,$16,$16,$FF
.byte $20,$73,$73,$70,$71,$72,$73,$73,$73,$73,$73,$73,$73,$70,$71,$72,$73,$73,$73,$73,$73,$73,$73,$70,$71,$72,$73,$73,$73,$73,$73,$73,$73,$FF
.byte $01,$C0,$23,$FF
.byte $FF,$10,$01,$00,$FF
.byte $01,$D0,$23,$F0,$F0,$F0,$F8,$F2,$FA,$F2,$F0,$FF
.byte $FF,$28,$01,$FF
.byte $FF,$00
@RomGraphicsBonusScreenHitsLabel:
.byte $6F,$2B,$48,$49,$54,$53,$FF
.byte $01,$91,$2B,$30,$30,$FF
.byte $00
@RomGraphicsOutroScreen:
.byte $00,$20,$FF
.byte $FF,$20,$0A,$02,$FF
.byte $FF,$20,$14,$3C,$FF
.byte $01,$40,$20,$0E,$0F,$FF
.byte $04,$0A,$0B,$0C,$0D,$0E,$0F,$FF
.byte $10,$0A,$0B,$0C,$0D,$1E,$1F,$FF
.byte $04,$1A,$1B,$1C,$1D,$1E,$1F,$02,$24,$25,$26,$27,$02,$0A,$0B,$0C,$0D,$0E,$0F,$25,$26,$27,$02,$1A,$1B,$1C,$1D,$74,$02,$24,$25,$26,$27,$FF
.byte $05,$74,$02,$34,$35,$36,$37,$02,$1A,$1B,$1C,$1D,$1E,$1F,$35,$36,$37,$FF
.byte $04,$74,$02,$02,$34,$35,$36,$37,$74,$75,$02,$17,$18,$19,$FF
.byte $03,$17,$18,$19,$FF
.byte $03,$74,$02,$02,$74,$75,$02,$17,$18,$19,$02,$02,$74,$75,$02,$02,$74,$75,$FF
.byte $05,$74,$74,$75,$FF
.byte $04,$74,$75,$02,$02,$17,$18,$19,$FF
.byte $03,$74,$75,$FF
.byte $22,$47,$48,$49,$4A,$4B,$4C,$FF
.byte $1A,$3C,$3C,$3C,$3C,$3C,$4D,$2E,$2F,$28,$29,$2A,$2B,$FF
.byte $19,$3D,$3E,$3F,$38,$39,$3A,$3B,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$10,$11,$12,$13,$3C,$56,$57,$58,$59,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$20,$21,$22,$23,$3C,$66,$67,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$30,$31,$32,$33,$3C,$76,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$42,$43,$44,$44,$40,$41,$3C,$3C,$77,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$54,$54,$45,$46,$54,$54,$3C,$3C,$87,$54,$54,$54,$54,$54,$51,$52,$54,$54,$54,$54,$53,$50,$51,$52,$54,$54,$54,$54,$54,$54,$51,$52,$54,$54,$54,$54,$54,$54,$3C,$3C,$68,$16,$14,$15,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$14,$15,$16,$16,$16,$16,$3C,$3C,$78,$79,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$FF
.byte $03,$89,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$60,$61,$62,$63,$55,$55,$FF
.byte $03,$5A,$16,$16,$64,$65,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$64,$65,$16,$16,$16,$16,$16,$16,$64,$65,$16,$16,$16,$16,$FF
.byte $03,$6A,$69,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $05,$7A,$8B,$73,$73,$73,$73,$73,$70,$71,$72,$73,$73,$73,$73,$73,$73,$73,$70,$71,$72,$73,$73,$73,$73,$73,$73,$73,$FF
.byte $07,$5B,$FF
.byte $FF,$18,$02,$02,$7B,$8B,$02,$84,$85,$84,$85,$02,$6C,$6D,$6E,$6F,$80,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$FF
.byte $09,$5C,$5D,$92,$93,$94,$95,$02,$7C,$7D,$7E,$7F,$81,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $0E,$7B,$8B,$02,$8D,$8E,$8F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $0F,$5C,$82,$83,$5F,$02,$6C,$6D,$6E,$6F,$80,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $13,$68,$7C,$7D,$7E,$7F,$81,$16,$16,$16,$16,$16,$16,$16,$FF
.byte $13,$6A,$02,$8D,$8E,$8F,$02,$02,$02,$02,$02,$02,$02,$02,$FF
.byte $01,$E7,$22,$6B,$FF
.byte $01,$C0,$23,$FF
.byte $FF,$10,$01,$00,$FF
.byte $01,$D0,$23,$FF
.byte $FF,$08,$01,$F0,$FF
.byte $01,$D8,$23,$FF
.byte $FF,$28,$01,$FF,$FF
.byte $00
@RomGraphicsGameOverScreen:
.byte $8B,$21,$47,$41,$4D,$45,$20,$20,$4F,$56,$45,$52,$FF
.byte $01,$20,$23,$FF
.byte $FF,$20,$01,$01,$FF
.byte $00
@RomGraphicsGotTrackerScreen:
.byte $A5,$20,$59,$4F,$55,$20,$43,$41,$4E,$20,$4E,$4F,$57,$20,$54,$52,$41,$43,$4B,$20,$4A,$41,$57,$53,$FF
.byte $2D,$57,$49,$54,$48,$20,$54,$48,$45,$20,$52,$45,$43,$45,$49,$56,$45,$52,$2E,$FF
.byte $6F,$2A,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CF,$FF
.byte $12,$FF
.byte $FF,$01,$09,$3A,$DB,$FF
.byte $01,$8A,$21,$FF
.byte $FF,$0C,$09,$01,$FF
.byte $FF,$0C,$01,$76,$FF
.byte $01,$96,$21,$FF
.byte $FF,$01,$09,$67,$77,$FF
.byte $01,$B1,$21,$C7,$FF
.byte $1A,$F9,$C6,$FF
.byte $03,$D7,$D8,$D9,$DA,$FF
.byte $18,$D6,$C6,$01,$E6,$E7,$E8,$E9,$EA,$EB,$FF
.byte $18,$CC,$CD,$F6,$F7,$F8,$01,$FA,$FB,$FF
.byte $18,$DC,$DD,$C8,$C9,$CA,$01,$DE,$DF,$FF
.byte $18,$AC,$AD,$AE,$AF,$EC,$ED,$EE,$EF,$FF
.byte $18,$BC,$BD,$BE,$BF,$FC,$FD,$FE,$CB,$FF
.byte $01,$20,$23,$FF
.byte $FF,$20,$01,$01,$FF
.byte $01,$C0,$23,$FF
.byte $FF,$10,$01,$00,$FF
.byte $01,$D0,$23,$50,$50,$50,$50,$50,$50,$50,$50,$55,$55,$55,$F5,$55,$55,$55,$55,$55,$55,$55,$59,$FF
.byte $FF,$0C,$01,$55,$FF
.byte $00
@RomGraphicsBonusStartScreen:
.byte $8A,$21,$42,$4F,$4E,$55,$53,$20,$53,$43,$45,$4E,$45,$21,$FF
.byte $01,$20,$23,$FF
.byte $FF,$20,$01,$01,$FF
.byte $00
@RomGraphicsBonusEndScreen:
.byte $06,$21,$42,$4F,$4E,$55,$53,$20,$53,$43,$45,$4E,$45,$20,$52,$45,$53,$55,$4C,$54,$53,$2E,$FF
.byte $01,$20,$23,$FF
.byte $FF,$20,$01,$01,$FF
.byte $00
@RomGraphicsStatusPowerLabel:
.byte $6F,$2B,$18,$19,$1A,$FF
.byte $00
@RomGraphicsTrackerIcon:
.byte $6F,$2B,$0B,$0C,$FF
.byte $1E,$1B,$1C,$FF
.byte $00
@RomGraphicsPortScreen:
.byte $20,$20,$FF
.byte $FF,$20,$1D,$07,$FF
.byte $01,$5D,$20,$09,$0A,$0B,$FF
.byte $0A,$09,$0F,$07,$36,$38,$39,$3A,$3B,$FF
.byte $13,$09,$0A,$0F,$FF
.byte $04,$36,$37,$38,$39,$39,$3A,$3B,$0F,$FF
.byte $10,$36,$38,$39,$3A,$3B,$FF
.byte $07,$09,$0A,$0B,$0C,$0D,$0E,$0F,$FF
.byte $17,$36,$37,$38,$39,$3A,$3B,$FF
.byte $06,$36,$37,$3B,$FF
.byte $05,$09,$0F,$FF
.byte $06,$36,$37,$3B,$FF
.byte $05,$36,$37,$38,$39,$3A,$3B,$0F,$FF
.byte $1C,$36,$37,$3B,$FF
.byte $0E,$36,$37,$37,$3B,$FF
.byte $06,$09,$0A,$0E,$0F,$FF
.byte $09,$46,$47,$49,$47,$47,$48,$49,$4A,$4A,$FF
.byte $03,$46,$47,$49,$4A,$FF
.byte $0B,$46,$47,$49,$4A,$FF
.byte $08,$46,$47,$49,$4A,$FF
.byte $04,$46,$47,$48,$49,$4A,$FF
.byte $2F,$6E,$6F,$9D,$6E,$6F,$9D,$6E,$6F,$07,$9D,$6E,$6F,$FF
.byte $14,$7E,$7F,$9E,$7E,$7F,$9E,$7E,$7F,$07,$9E,$7E,$7F,$FF
.byte $03,$19,$1A,$1B,$1C,$1D,$1E,$1F,$1C,$1D,$1D,$1F,$1C,$1D,$1D,$1C,$1D,$1D,$8E,$8F,$9F,$8E,$8F,$9F,$8E,$8F,$07,$9F,$8E,$8F,$FF
.byte $03,$29,$2A,$2B,$2C,$2D,$2E,$2F,$2C,$2D,$2E,$2F,$2C,$2D,$2E,$2C,$2D,$2E,$FF
.byte $FF,$0C,$01,$3D,$FF
.byte $FF,$0C,$01,$4D,$AC,$07,$AC,$AD,$AC,$07,$AC,$AC,$07,$AD,$AC,$AD,$5E,$FF
.byte $01,$0C,$22,$3E,$FF
.byte $FF,$13,$01,$3F,$FF
.byte $01,$2C,$22,$4E,$FF
.byte $FF,$13,$01,$4F,$FF
.byte $FF,$13,$01,$5F,$FF
.byte $01,$64,$22,$AC,$07,$AD,$FF
.byte $03,$AC,$07,$AD,$07,$07,$AC,$AD,$AC,$07,$AC,$07,$07,$AC,$07,$07,$AC,$AD,$07,$07,$AC,$AD,$AD,$07,$07,$AC,$07,$BE,$07,$07,$AC,$FF
.byte $03,$AC,$07,$07,$AD,$07,$07,$AD,$AC,$07,$07,$AC,$07,$AD,$07,$AC,$07,$BE,$07,$AD,$AC,$07,$07,$BC,$BD,$07,$07,$BC,$BD,$07,$BF,$BE,$07,$07,$BC,$BD,$07,$07,$BE,$07,$BC,$BD,$07,$BE,$07,$BC,$BD,$07,$07,$BE,$BF,$07,$07,$BC,$BD,$FF
.byte $09,$BF,$FF
.byte $06,$BC,$BD,$FF
.byte $10,$AE,$AF,$07,$07,$BC,$BD,$FF
.byte $03,$AE,$AF,$FF
.byte $08,$AE,$AF,$07,$07,$BC,$BD,$FF
.byte $0D,$AE,$AF,$FF
.byte $07,$AE,$AF,$FF
.byte $04,$AE,$AF,$07,$07,$AE,$AF,$FF
.byte $01,$C0,$23,$FF
.byte $FF,$18,$01,$FF
.byte $FF,$01,$D8,$23,$FF
.byte $FF,$08,$01,$55,$FF
.byte $01,$E0,$23,$FF
.byte $FF,$20,$01,$AA,$FF
.byte $00
@RomGraphicsIntroScreen:
.byte $AB,$20,$76,$74,$15,$00,$13,$74,$70,$73,$0F,$6A,$FF
.byte $53,$89,$8A,$8B,$03,$03,$80,$81,$90,$91,$02,$03,$03,$03,$03,$03,$03,$FF
.byte $10,$03,$03,$03,$03,$82,$83,$84,$85,$86,$87,$03,$88,$89,$8A,$8B,$03,$FF
.byte $10,$03,$03,$98,$99,$92,$03,$94,$95,$96,$97,$03,$98,$99,$9A,$9B,$03,$FF
.byte $10,$03,$03,$03,$03,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$03,$03,$03,$03,$03,$FF
.byte $10,$03,$03,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$03,$03,$98,$99,$FF
.byte $10,$03,$03,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$03,$03,$03,$03,$FF
.byte $10,$DA,$DB,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DA,$DB,$FF
.byte $10,$03,$03,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$03,$03,$03,$FF
.byte $10,$03,$03,$03,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$03,$03,$03,$03,$03,$03,$FF
.byte $53,$7B,$78,$17,$74,$14,$6B,$FF
.byte $37,$77,$78,$3B,$14,$72,$06,$13,$74,$6B,$FF
.byte $01,$20,$23,$FF
.byte $FF,$20,$01,$01,$FF
.byte $01,$D2,$23,$AA,$22,$88,$AA,$FF
.byte $04,$5A,$DA,$FA,$5A,$FF
.byte $04,$05,$0D,$0F,$05,$FF
.byte $00

; settings for each type of encounter.
; a little overkill since there's only two, but OK.
;
; struct:
;  -  u8 which background to draw
;  -  u8 graphics to render for the encounter
;  - u16 water level
;  - u16 water depth
;  -  u8 palette

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
;  - FFxx - FF followed by any other number skips the ppu ahead that many Metatiles (2x2 tiles)
;
; any data outside of these sections are metatile identifiers, drawn at the ppu position

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
        @DelayFrames = $12
        ; clear out state
        jsr PPUDisableNMI
        lda #SFXSTOP
        jsr SoundPlay
        jsr ClearEntityMemory
        jsr ClearScreenAndSprites
        jsr DrawStatusLine
        ; and draw the bonus start screen background
        lda #PaletteBlackScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #RomGraphicsBonusStartScreen
        jsr DrawRomGraphics
        ; clear some more state
        lda #$00
        sta SCROLL_X
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta ActiveCHR
        lda #$01
        sta NMISpriteHandlingDisabled
        sta ShowStatusBarTextLine
        ; play bonus screen music
        lda #MusicBonusScreenStart
        jsr SoundPlay
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        ; set frames to delay at the bonus starting screen
        lda #$B4
        sta @DelayFrames
@WaitOnBonusTitleScreen:
        jsr WaitFor1Frame
        ldy #$02
        jsr WaitForYSpins
        jsr RefreshPPUState
        dec @DelayFrames
        bne @WaitOnBonusTitleScreen
        ; setup the actual bonus game section
        jsr PPUDisableNMI
        jsr ClearScreenAndSprites
        jsr DrawStatusLine
        lda #RomGraphicsBonusScreenHitsLabel
        jsr DrawRomGraphics
        ; load in graphics for a deep encounter
        lda #EncounterBackgroundDeep
        jsr LoadEncounterBackground
        lda #RomGraphicsEncounterDeep
        jsr DrawRomGraphics
        lda #PaletteEncounterDeep
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #CHREncounterAndIntroScreen
        sta ActiveCHR
        lda #$00
        sta SCROLL_X
        sta UseHighPPUNametables
        ; hardcode in sizes for the deep encounter
        sta CameraX
        sta CameraY
        sta CameraY+1
        lda #$10
        sta CameraX+1
        lda #$20
        sta SCROLL_Y
        lda #$48
        sta WaterHeight
        lda #$00
        sta WaterHeight+1
        lda #$20
        sta EncounterMaxDepth
        lda #$01
        sta EncounterMaxDepth+1
        lda #$01
        sta NMISpriteHandlingDisabled
        sta ShowStatusBarTextLine
        ; get offset into bonus screen encounter table.
        lda BonusScreensPlayed
        asl a
        adc BonusScreensPlayed
        asl a
        adc #<BonusScreenEncounterSettings
        sta BonusEncounterPtr
        lda #$00
        adc #>BonusScreenEncounterSettings
        sta BonusEncounterPtr+1
        lda #$00
        sta BonusEncounterOffset
        sta BonusCurrentWave
        sta BonusEnemiesHit
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
@RunBonusScreen:
        jsr WaitFor1Frame
        jsr ReadJoypads
        jsr BonusRunPlayer
        jsr BonusRunProjectiles
        jsr BonusRunJellyfish
        jsr SpritesetUpdateScreen
        jsr AdvanceWaterAnimation
        jsr SetNextPendingBGUpdate
        jsr RefreshPPUState
        bit BonusCurrentWave
        bpl @RunBonusScreen
        bvs @RunBonusScreenEnding
        lda #$78
        sta BonusEncounterOffset
        lda #$C0
        sta BonusCurrentWave
        jmp @RunBonusScreen
@RunBonusScreenEnding:
        ; check if we have more waves to spawn
        dec BonusEncounterOffset
        bne @RunBonusScreen
        ; otherwise it's time to show the ending screen
        ; so clear out ppu
        jsr PPUDisableNMI
        jsr PPUEnableAndWaitFor1Frame
        jsr PPUClear
        ; load end screen graphics
        lda #RomGraphicsBonusEndScreen
        jsr DrawRomGraphics
        lda #$00
        sta SCROLL_X
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta ActiveCHR
        lda #$01
        sta NMISpriteHandlingDisabled
        sta ShowStatusBarTextLine
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        ; play our ending music
        lda #MusicBonusScreenEnd
        jsr SoundPlay
        ; and delay for a bit
        lda #$78
        jsr WaitForAFramesAndRefreshPPU

        ; copy "number of hits" text to vram
        jsr CopyToVRAMBuffer
        .addr CopyTextBonusNumberOfHits
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; prepare to render 2 bytes at ppu $217B
        lda #$21 | VRAMFlagMultipleBytes
        sta VRAMBuffer,x
        inx
        lda #$7B
        sta VRAMBuffer,x
        inx
        lda #$02
        sta VRAMBuffer,x
        inx
        ; get number of enemies that were hit.
        lda BonusEnemiesHit
        ; convert number to BCD, then Ascii, then draw.
        jsr ConvertAToBCD
        jsr MoveAAndYToAsciiTable
        sta VRAMBuffer+1,x
        tya
        sta VRAMBuffer,x
        inx
        inx
        ; set the vram buffer to be displayed
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
        ; then delay for a while again..
        lda #$78
        jsr WaitForAFramesAndRefreshPPU

        ; copy "bonus shells collected" text to vram
        jsr CopyToVRAMBuffer
        .addr CopyTextBonusShellsCollected
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; prepare to render 2 bytes at ppu $21DB
        lda #$21 | VRAMFlagMultipleBytes
        sta VRAMBuffer,x
        inx
        lda #$DB
        sta VRAMBuffer,x
        inx
        lda #$02
        sta VRAMBuffer,x
        inx
        ; award 1 shell for every 3rd enemy killed
        lda BonusEnemiesHit
        ldy #$00
@CountShellsToAward:
        cmp #$03
        bcc @DeterminedShellCount
        sbc #$03
        iny
        jmp @CountShellsToAward
@DeterminedShellCount:
        tya
        sta $00
        ; convert number to BCD, then Ascii, then draw.
        jsr ConvertAToBCD
        jsr MoveAAndYToAsciiTable
        sta VRAMBuffer+1,x
        tya
        sta VRAMBuffer,x
        inx
        inx
        ; set the vram buffer to be displayed
        stx VRAMBufferOffset
        lda #$80
        sta VRAMBufferActive
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
        ; then delay for a while again..
        lda #$3C
        jsr WaitForAFramesAndRefreshPPU
        lda $00
        clc
        ; give player their shells.
        adc PlayerShellCount
        cmp #$64
        bcc @AwardShells
        ; maxout at 99 shells.
        lda #$63
@AwardShells:
        sta PlayerShellCount
        ; mark shell count to be redrawn in the UI
        lda PendingBGUpdates
        ora #DrawStatusbarShellsFlag
        sta PendingBGUpdates
        ; check if player hit all of the enemies.
        lda BonusEnemiesHit
        cmp #$1E
        bcs @PlayerHitAllBonusEnemies
        ; if they did not, play a happy little sound, then exit after delaying for a bit.
        lda #SFXEncounterJawsHit
        jsr SoundPlay
        lda #$78
        jsr WaitForAFramesAndRefreshPPU
        rts
@PlayerHitAllBonusEnemies:
        ; wait for a bit, then show the "got them all" text
        lda #$3C
        jsr WaitForAFramesAndRefreshPPU
        jsr CopyToVRAMBuffer
        .addr CopyTextBonusGotThemAll
        ; wait for a bit, then show the point award text
        lda     #$3C
        jsr     WaitForAFramesAndRefreshPPU
        jsr     CopyToVRAMBuffer
        .addr   CopyTextBonus10000BonusPoints
        ; and award $10k points!
        lda #$11
        jsr AwardPoints
        ; now play an extra happy sound, delay for a bit and exit.
        lda #SFXEncounterPickup
        jsr SoundPlay
        lda #$78
        jsr WaitForAFramesAndRefreshPPU
        rts

; ----------------------------------------------------------------------------
WaitForAFramesAndRefreshPPU:
        @TempDelayCounter = $12
        sta @TempDelayCounter
@KeepWaiting:
        jsr WaitFor1Frame
        ldy #$02
        jsr WaitForYSpins
        jsr SetNextPendingBGUpdate
        lda #$01
        sta NMISpriteHandlingDisabled
        jsr RefreshPPUState
        dec @TempDelayCounter
        bne @KeepWaiting
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
        ; set default values to slow down toward a low speed (holding left)
        ldx #$F8
        ldy #$01
        bit Joy1Inputs
        bvs @ApproachSpeed
        bmi @HoldingRight
        ; when not holding either direction, go a little faster.
        iny
        bne @NotHoldingDirection
@HoldingRight:
        ; when the player is holding right, go to max speed.
        ldy #$03
@NotHoldingDirection:
        ; change to speed up instead of slow down.
        ldx #$08
@ApproachSpeed:
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
        ; player is heading left
        ; set default values to slow down toward a low speed (holding right)
        ldx #$08
        ldy #$FF
        bit Joy1Inputs
        bmi @ApproachSpeed2
        bvs @HoldingLeft2
        ; when not holding either direction, go a little faster.
        dey
        bne @NotHoldingDirection2
@HoldingLeft2:
        ; when the player is holding left, go to max speed.
        ldy #$FD
@NotHoldingDirection2:
        ldx #$F8
@ApproachSpeed2:
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
        bpl @SpawnProjectile ; slot is free, bombs away!
        ; check projectile 2 slot
        ldx #$20
        lda PlayerProjectile1Data,x
        bpl @SpawnProjectile ; slot is free, bombs away!
        ; last chance, projectile 3?
        ldx #$40
        lda PlayerProjectile1Data,x
        bmi @Done ; no dice, we can't fire for now.
@SpawnProjectile:
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
        lda #<Enemy1Data
        sta WorksetPtr
        lda #>Enemy1Data
        sta WorksetPtr+1
        ; count down for every enemy in a wave
        lda #5
        sta @TempCounter
        lda #$00
        sta @TempLivingEnemiesFound
@CheckNextEnemy:
        ; skip enemy if it is dead
        ldy #$00
        lda (WorksetPtr),y
        bpl @Continue
        ; otherwise load the enemy and continue animating
        inc @TempLivingEnemiesFound
        jsr WorksetLoad
        jsr BonusRunSingleJellyfish
        jsr WorksetSave
@Continue:
        jsr WorksetNext
        dec @TempCounter
        bne @CheckNextEnemy
        ; if we found no living enemies, we need to prepare the next wave
        lda @TempLivingEnemiesFound
        beq @AllEnemiesDead
        rts
@AllEnemiesDead:
        lda BonusCurrentWave
        ; if high bit is set, we're done with the waves, exit.
        bmi @DoneWithBonusScreen
        ; if we are below 6 there are still more waves to go!
        cmp #$06
        bcc @StartNextWave
        ; otherwise we are at the end. mark bonus stage as complete.
        lda #$80
        sta BonusCurrentWave
@DoneWithBonusScreen:
        rts

@StartNextWave:
        @StartingDelay  = $00
        @StartingIndex  = $12
        @NextWavePtr    = $44
        @EnemiesToSpawn = $46
        ; get next wave from BonusScreenEncounterSettings
        ldy BonusEncounterOffset
        lda (BonusEncounterPtr),y
        iny
        sty BonusEncounterOffset
        ; find offset into BonusEncounterWaveSpawn for the wave
        sta @NextWavePtr
        asl a
        adc @NextWavePtr
        asl a
        adc #<BonusEncounterWaveSpawn
        sta @NextWavePtr
        lda #$00
        adc #>BonusEncounterWaveSpawn
        sta @NextWavePtr+1
        ldy #$00
        ; first byte of wave data
        lda (@NextWavePtr),y
        iny
        sta @StartingIndex
        ; set up starting timing offsets
        ldx #$00
        lda #$40
        sta @StartingDelay
        lda #$00
        sta @StartingDelay+1
        lda #$05
        sta @EnemiesToSpawn
@SpawnNextEnemy:
        ; activate enemy
        lda #EntityHeaderActive
        sta Enemy1Data + EntityHeader,x
        ; load starting position data
        lda (@NextWavePtr),y
        sta Enemy1Data + EntityBonusJellyStartingPosition,x
        ; load wave animation path
        iny
        lda @StartingIndex
        sta Enemy1Data + EntityBonusJellyAnimationPathIndex,x
        ; increment starting delay to space out the wave
        lda #$10
        clc
        adc @StartingDelay
        sta @StartingDelay
        sta Enemy1Data + EntityBonusJellyDelay,x
        lda @StartingDelay+1
        adc @StartingDelay+1
        sta @StartingDelay+1
        sta Enemy1Data + EntityBonusJellyDelay+1,x
        ; advance to next enemy data set
        txa
        clc
        adc #$20
        tax
        dec @EnemiesToSpawn
        bne @SpawnNextEnemy
        ; increment wave number and clear hit counter
        inc BonusCurrentWave
        lda #$00
        sta BonusEnemiesHitInWave
        rts

; ----------------------------------------------------------------------------
BonusRunSingleJellyfish:
        bit Workset + EntityHeader
        bvs @Initialized
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        ; get jellyfish offset into starting position table.
        lda Workset + EntityBonusJellyStartingPosition
        and #$1F
        asl a
        asl a
        tax
        ; and load our starting position
        lda BonusJellyfishStartingPositions,x
        sta Workset + EntityX
        lda BonusJellyfishStartingPositions+1,x
        sta Workset + EntityX + 1
        lda BonusJellyfishStartingPositions+2,x
        sta Workset + EntityY
        lda BonusJellyfishStartingPositions+3,x
        sta Workset + EntityY + 1
        ; load our starting position in the animation path table
        lda Workset + EntityBonusJellyAnimationPathIndex
        asl a
        tax
        lda BonusJellyPathPointers,x
        sta Workset + EntityBonusJellyPathPointer
        lda BonusJellyPathPointers+1,x
        sta Workset + EntityBonusJellyPathPointer+1
        ; clear out some settings
        lda #$00
        sta Workset + EntityBonusJellyAnimationPathIndex
        sta Workset + EntityBonusJellyPathOffset
        sta Workset + EntityBonusJellyAnimValue
        ; and play our animation
        lda #AnimationBonusJellyfish
        jmp WorksetAnimationPlay
@Initialized:
        bit Workset + EntityBonusJellyAnimValue
        bpl @DelayUntilNextAnimation
        jmp @MoveJellyfish
@DelayUntilNextAnimation:
        ; finish up if there are no more segments to play
        bit Workset + EntityBonusJellyAnimationPathIndex
        bmi @SetupHitDetection
        ; decrement delay time
        lda Workset + EntityBonusJellyDelay
        sec
        sbc #$01
        sta Workset + EntityBonusJellyDelay
        lda Workset + EntityBonusJellyDelay+1
        sbc #$00
        sta Workset + EntityBonusJellyDelay+1
        ; and leave if we're still delaying.
        bpl @Exit
        ; otherwise attempt to continue the next animation.
        lda #%10000000
        sta Workset + EntityBonusJellyAnimationPathIndex
        jmp @SetupNextAnimation
@Exit:
        rts

; ----------------------------------------------------------------------------
@SetupHitDetection:
        @TestingProjectileIndex = $47
        ldx #$00
        lda #MaxProjectiles
        sta @TestingProjectileIndex
@ProjectileXDistanceCheck:
        ; make sure the projectile is active
        lda PlayerProjectile1Data + EntityHeader,x
        bpl @DoneWithHitDetection
        ; and header 7 bit is set
        asl a
        bpl @DoneWithHitDetection
        ; get x distance
        lda PlayerProjectile1Data + EntityX,x
        sec
        sbc Workset + EntityX
        tay
        lda PlayerProjectile1Data + EntityX+1,x
        sbc Workset + EntityX  + 1
        bcs @GotAbsoluteXDistance
        ; get absolute distance instead of negative value
        eor #$FF
        pha
        tya
        eor #$FF
        adc #$01
        tay
        pla
        adc #$00
@GotAbsoluteXDistance:
        bne @DoneWithHitDetection
        ; check y distance if we are close enough to hit
        cpy #$08
        bcc @ProjectileYDistanceCheck
@DoneWithHitDetection:
        jmp @HitDetectNext

; ----------------------------------------------------------------------------
@ProjectileYDistanceCheck:
        ; get y distance
        lda PlayerProjectile1Data + EntityY,x
        sec
        sbc Workset + EntityY
        tay
        lda PlayerProjectile1Data + EntityY + 1,x
        sbc Workset + EntityY + 1
        bcs @GotAbsoluteYDistance
        ; get absolute distance instead of negative value
        eor #$FF
        pha
        tya
        eor #$FF
        adc #$01
        tay
        pla
        adc #$00
@GotAbsoluteYDistance:
        bne @HitDetectNext
        cpy #$08
        bcs @HitDetectNext
        ; a projectile has hit this jelly, mark it as hit!
        lda PlayerProjectile1Data + EntityHitDetection,x
        ora #EntityHitDetected
        sta PlayerProjectile1Data + EntityHitDetection,x
        ; increment the bonus stage hit counter
        inc BonusEnemiesHit
        ; increment wave hit counter
        ldx BonusEnemiesHitInWave
        inc BonusEnemiesHitInWave
        ; get animation for points to award
        lda @PointAnimations,x
        sta Workset + EntityBonusJellyScore
        ; and award points to the player
        lda @PointAmounts,x
        jsr AwardPoints
        ; clear some settings
        lda #$80
        sta Workset + EntityBonusJellyAnimValue
        lda #$00
        sta Workset + EntityYSubspeed
        ; move upward during death sequence
        lda #$FF
        sta Workset + EntityYSpeed
        ; update ui with new hit counter
        ; disable vram buffer
        lda #$00
        sta VRAMBufferActive
        ldx VRAMBufferOffset
        ; set vram to render at 2B91
        lda #$2B | VRAMFlagMultipleBytes
        sta VRAMBuffer,x
        inx
        lda #$91
        sta VRAMBuffer,x
        inx
        lda #$02
        sta VRAMBuffer,x
        inx
        ; load bonus enemies hit, convert it to BCD, then to Ascii
        lda BonusEnemiesHit
        jsr ConvertAToBCD
        jsr MoveAAndYToAsciiTable
        ; and write out number
        sta VRAMBuffer+1,x
        tya
        sta VRAMBuffer,x
        inx
        inx
        stx VRAMBufferOffset
        ; activate vram buffer
        lda #$80
        sta VRAMBufferActive
        ; mark vram buffer date
        lda PendingBGUpdates
        ora #DrawVRAMBufferFlag
        sta PendingBGUpdates
        ; and play death animations
        lda #SFXEncounterEnemyDeath
        jsr SoundPlay
        lda #AnimationEncounterJellyfishDeath
        jmp WorksetAnimationPlay
@HitDetectNext:
        txa
        clc
        adc #$20
        tax
        dec @TestingProjectileIndex
        beq @DoneCheckingProjectiles
        jmp @ProjectileXDistanceCheck
@DoneCheckingProjectiles:
        jsr WorksetAnimationAdvance
        jsr WorksetMoveX
        jsr WorksetMoveY
        bit Workset + EntityActiveAnimationIndex
        bvs @CheckForHit
        lda #$01
        bit Workset + EntityHitDetection
        beq @DecrementDelay
        lda #$C0
        sta Workset + EntityActiveAnimationIndex
        jmp @DecrementDelay
@CheckForHit:
        lda #$01
        bit Workset + EntityHitDetection
        bne @DecrementDelay
        lda #$00
        sta Workset + EntityHeader
        rts
@DecrementDelay:
        dec Workset + EntityBonusJellyDelay
        beq @SetupNextAnimation
        rts

; ----------------------------------------------------------------------------
@SetupNextAnimation:
        ; clear out some values
        lda #$00
        sta Workset + EntityXSpeed
        sta Workset + EntityYSpeed
        ldy Workset + EntityBonusJellyPathOffset
        ; load timer for current point
        lda (Workset + EntityBonusJellyPathPointer),y
        bne @LoadPathPoint
        ; if the next point is 0, we've reached the end of the path.
        lda #$00
        sta Workset + EntityHeader
        rts
@LoadPathPoint:
        iny
        sta Workset + EntityBonusJellyDelay
        ; load speeds for current point in the path
        lda (Workset + EntityBonusJellyPathPointer),y
        ; set offset to next point
        iny
        sty Workset + EntityBonusJellyPathOffset
        ; get x speed from speed byte
        asl a
        bcc @CheckedNegativeX
        dec Workset + EntityXSpeed
@CheckedNegativeX:
        asl a
        rol Workset + EntityXSpeed
        asl a
        rol Workset + EntityXSpeed
        tay
        and #$80
        sta Workset + EntityXSubspeed
        ; get y speed from speed byte
        tya
        asl a
        asl a
        bcc @CheckedNegativeY
        dec Workset + EntityYSpeed
@CheckedNegativeY:
        asl a
        rol Workset + EntityYSpeed
        asl a
        rol Workset + EntityYSpeed
        sta Workset + EntityYSubspeed
        ; check if high bit was set on the starting position.
        ; if it was, we invert the speeds (jelly started on the right)
        bit Workset + EntityBonusJellyStartingPosition
        bpl @JellySpeedDone
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
@JellySpeedDone:
        rts
@MoveJellyfish:
        ; play the animations and move entity
        jsr WorksetAnimationAdvance
        jsr WorksetMoveY
        bit Workset + EntityBonusJellyAnimValue
        bvs @Done1
        lda Workset + EntityAnimTimer
        bne @Done2
        lda #$C0
        sta Workset + EntityBonusJellyAnimValue
        lda Workset + EntityBonusJellyScore
        jmp WorksetAnimationPlay
@Done1:
        lda Workset + EntityAnimTimer
        bne @Done2
        lda #$00
        sta Workset + EntityHeader
@Done2:
        rts

; ----------------------------------------------------------------------------
@PointAnimations:
        .byte AnimationEncounter50Points
        .byte AnimationEncounter50Points
        .byte AnimationEncounter100Points
        .byte AnimationEncounter200Points
        .byte AnimationEncounter500Points
@PointAmounts:
        .byte $04,$04,$06,$08,$0A

; one row for every bonus screen (8 total bonus screens in game)
; every bonus screen has 6 waves with 5 enemies.
; the values correspond to a row in the "BonusEncounterWaveSpawn" table.
BonusScreenEncounterSettings:
        .byte $00,$01,$00,$01,$02,$03
        .byte $04,$05,$04,$05,$06,$07
        .byte $08,$09,$08,$09,$0A,$0B
        .byte $0C,$0D,$0C,$0D,$0E,$0F
        .byte $10,$11,$10,$11,$12,$13
        .byte $14,$15,$14,$15,$16,$17
        .byte $18,$19,$18,$19,$1A,$1B
        .byte $1C,$1D,$1C,$1D,$1E,$1F

; spawn indexes from BonusJellyfishStartingPositions.
; every wave has one row.
; first byte of each row is the animation path from BonusJellyPathPointers.
; the rest are offsets into BonusJellyfishStartingPositions for each enemy,
; with the high bit set to spawn the enemy on the right side of the screen.
BonusEncounterWaveSpawn:
        .byte $00,@L|$00,@L|$00,@L|$00,@L|$00,@L|$00
        .byte $00,@R|$01,@R|$01,@R|$01,@R|$01,@R|$01
        .byte $01,@L|$00,@L|$00,@L|$00,@L|$00,@L|$00
        .byte $01,@R|$01,@R|$01,@R|$01,@R|$01,@R|$01
        .byte $02,@L|$02,@L|$02,@L|$02,@L|$02,@L|$02
        .byte $02,@R|$03,@R|$03,@R|$03,@R|$03,@R|$03
        .byte $03,@L|$04,@L|$04,@L|$04,@L|$04,@L|$04
        .byte $03,@R|$05,@R|$05,@R|$05,@R|$05,@R|$05
        .byte $04,@L|$0C,@L|$0D,@L|$0E,@L|$0F,@L|$10
        .byte $04,@R|$10,@R|$0F,@R|$0E,@R|$0D,@R|$0C
        .byte $05,@L|$00,@L|$00,@L|$00,@L|$00,@L|$00
        .byte $05,@R|$01,@R|$01,@R|$01,@R|$01,@R|$01
        .byte $06,@L|$0E,@R|$0E,@L|$0E,@R|$0E,@L|$0E
        .byte $06,@R|$0E,@L|$0E,@R|$0E,@L|$0E,@R|$0E
        .byte $07,@L|$02,@L|$02,@L|$02,@L|$02,@L|$02
        .byte $07,@R|$03,@R|$03,@R|$03,@R|$03,@R|$03
        .byte $08,@L|$06,@L|$06,@L|$06,@L|$06,@L|$06
        .byte $08,@R|$07,@R|$07,@R|$07,@R|$07,@R|$07
        .byte $09,@L|$08,@L|$08,@L|$08,@L|$08,@L|$08
        .byte $09,@R|$09,@R|$09,@R|$09,@R|$09,@R|$09
        .byte $0A,@L|$0C,@L|$0D,@L|$0E,@L|$0F,@L|$10
        .byte $0A,@R|$10,@R|$0F,@R|$0E,@R|$0D,@R|$0C
        .byte $0B,@L|$0A,@L|$0A,@L|$0A,@L|$0A,@L|$0A
        .byte $0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B
        .byte $0C,@L|$0A,@L|$0A,@L|$0A,@L|$0A,@L|$0A
        .byte $0C,@R|$0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B
        .byte $0D,@L|$0A,@L|$0A,@L|$0A,@L|$0A,@L|$0A
        .byte $0D,@R|$0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B
        .byte $0E,@L|$0A,@L|$0A,@L|$0A,@L|$0A,@L|$0A
        .byte $0E,@R|$0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B
        .byte $0F,@L|$0A,@L|$0A,@L|$0A,@L|$0A,@L|$0A
        .byte $0F,@R|$0B,@R|$0B,@R|$0B,@R|$0B,@R|$0B

; left spawn
@L = %00000000
; right spawn
@R = %10000000

; Used for setting starting positions of the bonus stage jellyfish
; Each spawn position has 2 16-bit values, X then Y coordinates.
BonusJellyfishStartingPositions:
        .word $1020, $00D8 ; 00
        .word $10E0, $00D8 ; 01
        .word $0FE0, $00D8 ; 02
        .word $1120, $00D8 ; 03
        .word $1020, $00E8 ; 04
        .word $10E0, $00E8 ; 05
        .word $1000, $00D8 ; 06
        .word $1100, $00D8 ; 07
        .word $0FF0, $00E8 ; 08
        .word $1110, $00E8 ; 09
        .word $0FF0, $0058 ; 0A
        .word $1110, $0058 ; 0B
        .word $1030, $00D8 ; 0C
        .word $1058, $00D8 ; 0D
        .word $1080, $00D8 ; 0E
        .word $10A8, $00D8 ; 0F
        .word $10D0, $00D8 ; 10


; probably bonus stage jellyfish animations
BonusJellyPathPointers:
        .addr BonusJellyPath00
        .addr BonusJellyPath01
        .addr BonusJellyPath02
        .addr BonusJellyPath03
        .addr BonusJellyPath04
        .addr BonusJellyPath05
        .addr BonusJellyPath06
        .addr BonusJellyPath07
        .addr BonusJellyPath08
        .addr BonusJellyPath09
        .addr BonusJellyPath0A
        .addr BonusJellyPath0B
        .addr BonusJellyPath0C
        .addr BonusJellyPath0D
        .addr BonusJellyPath0E
        .addr BonusJellyPath0F

; each path has a series of two byte animation points.
; first byte is how many frames this point will run for.
; high nybble is X speed, low nybble is Y speed.
BonusJellyPath00:
        .byte $40,$0C
        .byte $C0,$21
        .byte $80,$C0
        .byte $00
BonusJellyPath01:
        .byte $30,$0E
        .byte $20,$1E
        .byte $20,$2E
        .byte $18,$4F
        .byte $08,$41
        .byte $08,$33
        .byte $08,$14
        .byte $08,$F4
        .byte $08,$D3
        .byte $08,$C1
        .byte $08,$CF
        .byte $08,$DD
        .byte $08,$FC
        .byte $08,$1C
        .byte $08,$3D
        .byte $08,$4F
        .byte $18,$41
        .byte $20,$22
        .byte $20,$12
        .byte $30,$02
        .byte $00
BonusJellyPath02:
        .byte $80,$4E
        .byte $60,$C0
        .byte $80,$42
        .byte $00
BonusJellyPath03:
        .byte $40,$0C
        .byte $08,$4C
        .byte $10,$40
        .byte $08,$44
        .byte $20,$04
        .byte $08,$44
        .byte $10,$40
        .byte $08,$4C
        .byte $20,$0C
        .byte $08,$4C
        .byte $10,$40
        .byte $08,$44
        .byte $40,$04
        .byte $00
BonusJellyPath04:
        .byte $30,$0C
        .byte $04,$C0
        .byte $04,$CC
        .byte $08,$0C
        .byte $04,$4C
        .byte $08,$40
        .byte $04,$44
        .byte $08,$04
        .byte $04,$C4
        .byte $04,$C0
        .byte $60,$02
        .byte $00
BonusJellyPath05:
        .byte $40,$0C
        .byte $60,$41
        .byte $60,$C0
        .byte $60,$41
        .byte $80,$C0
        .byte $00
BonusJellyPath06:
        .byte $60,$0E
        .byte $10,$1E
        .byte $08,$2E
        .byte $10,$2F
        .byte $10,$20
        .byte $10,$21
        .byte $08,$22
        .byte $10,$12
        .byte $60,$02
        .byte $00
BonusJellyPath07:
        .byte $80,$4E
        .byte $30,$04
        .byte $60,$CE
        .byte $40,$04
        .byte $00
BonusJellyPath08:
        .byte $40,$4C
        .byte $30,$C0
        .byte $30,$44
        .byte $30,$4C
        .byte $30,$C0
        .byte $40,$44
        .byte $00
BonusJellyPath09:
        .byte $30,$2A
        .byte $20,$26
        .byte $20,$2A
        .byte $20,$26
        .byte $20,$2A
        .byte $20,$26
        .byte $20,$2A
        .byte $30,$26
        .byte $00
BonusJellyPath0A:
        .byte $40,$0C
        .byte $10,$20
        .byte $20,$E0
        .byte $10,$20
        .byte $80,$02
        .byte $00
BonusJellyPath0B:
        .byte $70,$40
        .byte $08,$44
        .byte $08,$C4
        .byte $50,$C0
        .byte $08,$C4
        .byte $08,$44
        .byte $50,$40
        .byte $08,$44
        .byte $08,$C4
        .byte $70,$C0
        .byte $00
BonusJellyPath0C:
        .byte $48,$40
        .byte $10,$41
        .byte $08,$44
        .byte $10,$14
        .byte $10,$F4
        .byte $08,$C4
        .byte $10,$C1
        .byte $10,$CF
        .byte $08,$CC
        .byte $10,$FC
        .byte $10,$1C
        .byte $08,$4C
        .byte $10,$4F
        .byte $48,$40
        .byte $00
BonusJellyPath0D:
        .byte $18,$40
        .byte $20,$31
        .byte $20,$22
        .byte $20,$13
        .byte $20,$1D
        .byte $20,$2E
        .byte $20,$3F
        .byte $18,$40
        .byte $00
BonusJellyPath0E:
        .byte $10,$40
        .byte $20,$06
        .byte $10,$40
        .byte $20,$0A
        .byte $10,$40
        .byte $20,$06
        .byte $10,$40
        .byte $20,$0A
        .byte $10,$40
        .byte $20,$06
        .byte $10,$40
        .byte $20,$0A
        .byte $10,$40
        .byte $20,$06
        .byte $10,$40
        .byte $20,$0A
        .byte $10,$40
        .byte $00
BonusJellyPath0F:
        .byte $18,$40
        .byte $30,$04
        .byte $30,$4C
        .byte $30,$44
        .byte $30,$0C
        .byte $18,$40
        .byte $00

RunFinaleScreen:
        ; this is where we give up and just hardcode the crap out of everything.
        ; clear screen and sound
        lda #SFXSTOP
        jsr SoundPlay
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        jsr ClearScreenAndSprites
        ; set up our background state
        lda #PaletteFinaleScreen
        jsr StoreActivePaletteAndWaitFor1Frame 
        lda #CHRFinaleAndOutroScreen
        sta ActiveCHR
        lda #RomGraphicsFinaleScreen
        jsr DrawRomGraphics
        ; clear some more settings
        lda #$00
        sta SCROLL_X
        sta SCROLL_Y
        sta UseHighPPUNametables
        ldx #$00
@UpdateSpriteY:
        ; set all sprite positions for the finale screen
        lda FinaleStrobeTextSprites,x
        sta Sprite,x
        inx
        cpx #$20
        bcc @UpdateSpriteY
        ; clear out memory
        ldx #$1F
        lda #$00
@InactivateAllEntities:
        sta Workset,x
        dex
        bpl @InactivateAllEntities
        ; update sprite positions
        ldx #$00
        ldy #$00
@PlaceStartingSprites:
        lda FinaleBoatSprites,y
        iny
        sta SpriteTile + FinaleBoatSpriteOffset,x
        lda FinaleBoatSprites,y
        iny
        sta SpriteAttr + FinaleBoatSpriteOffset,x
        lda FinaleBoatSprites,y
        iny
        sta SpritePosX + FinaleBoatSpriteOffset,x
        inx
        inx
        inx
        inx
        ; loop until the end of the sprite data to write
        cpx #(FinaleBoatSpritesEnd-FinaleBoatSprites)/3*4
        bcc @PlaceStartingSprites
        ; clear some flags
        ldy #(FinaleBoatNotJabbingAnimation - FinaleBoatAnimations)
        jsr FinaleAnimateBoat
        lda #FinaleCurrentActionNone
        sta FinaleCurrentAction
        sta FinaleBoatAnimationTimer
        sta EventFlags
        ; clear out background..
        ldx #$5F
        lda #$00
        sta FinalePlayerPosition
@ClearBGData:
        sta VisibleMapStripe1,x
        dex
        bpl @ClearBGData
        ; play music sound and enable rendering!
        lda #$01
        sta NMISpriteHandlingDisabled
        lda #MusicFinaleScreen
        jsr SoundPlay
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
@MainLoop:
        jsr WaitFor1Frame
        ldy #$01
        jsr WaitForYSpins
        jsr FinaleUpdateJawsPosition
        jsr FinaleUpdateJawsSprites
        jsr FinaleProcessStrobeAndJab
        jsr FinaleUpdateParallax
        jsr ReadJoypads
        lda Joy1Inputs
        and #(JOY_LEFT | JOY_RIGHT)
        beq @DrawStrobeCount
        bpl @MoveLeft
        ; player is holding right
        lda FinalePlayerPosition
        clc
        adc #$04
        sta FinalePlayerPosition
        lda SCROLL_X
        adc #$00
        sta SCROLL_X
        jmp @DrawStrobeCount
@MoveLeft:
        ; player is holding left
        lda FinalePlayerPosition
        sec
        sbc #$08
        sta FinalePlayerPosition
        lda SCROLL_X
        sbc #$00
        sta SCROLL_X
@DrawStrobeCount:
        ; update the sprite showing player strobe count.
        lda PlayerStrobeCount
        clc
        adc #$06
        sta SpriteTile + (SPR*7)
        jsr FinaleDrawJawsOffscreenPointer
        ; if event bit 8 set, jaws is dead.
        bit EventFlags
        bmi @ProcessJawsDeath
        lda PlayerStrobeCount
        bne @MainLoop
        ; if we're out of strobes, but jaws is not dead,
        ; exit back to the map
        bit FinaleJawsFlags2
        bmi @MainLoop
        rts
@ProcessJawsDeath:
        @TempDelayTimer = $12
        lda #$40
        sta @TempDelayTimer
@DelayForJawsDeathAnimation:
        jsr WaitFor1Frame
        ldy #$02
        jsr WaitForYSpins
        jsr FinaleUpdateParallax
        dec @TempDelayTimer
        bne @DelayForJawsDeathAnimation
        jmp RunOutroScreen

FinaleDrawJawsOffscreenPointer:
        lda FinaleJawsX + 1
        bne @JawsIsOffscreen
        ; jaws is visible, move arrow offscreen
        lda #$F0
        sta SpritePosY + (SPR*44)
        rts
@JawsIsOffscreen:
        ; move arrow onscreen
        lda #$D8
        sta SpritePosY + (SPR*44)
        ; set arrow sprite
        lda #$29
        sta SpriteTile + (SPR*44)
        ; check if jaws is off the the right
        bit FinaleJawsX + 1
        bpl @PlaceArrowRight
        ; jaws is to the left, flip sprite
        lda #$40
        sta SpriteAttr + (SPR*44)
        ; place arrow on left side of screen
        lda #$20
        sta SpritePosX + (SPR*44)
        rts
@PlaceArrowRight:
        ; jaws is to the right, dont flip sprite
        lda #$00
        sta SpriteAttr + (SPR*44)
        ; place arrow on right side of screen
        lda #$D8
        sta SpritePosX + (SPR*44)
        rts                      

; This is the "STROBE" text shown on the Finale,
; presumably uses sprites to avoid interaction with Parallax scroll.
FinaleStrobeTextSprites:
        ;       Y,  T,  A,  X
        .byte $47,$FF,$20,$C4 ; SPR0
        .byte $D8,$30,$00,$60 ; "S" in Strobe
        .byte $D8,$31,$00,$68 ; "T" in Strobe
        .byte $D8,$32,$00,$70 ; "R" in Strobe
        .byte $D8,$40,$00,$78 ; "O" in Strobe
        .byte $D8,$41,$00,$80 ; "B" in Strobe
        .byte $D8,$42,$00,$88 ; "E" in Strobe
        .byte $D8,$09,$00,$98 ; Strobe number

; Boat sprites for the finale screen.
; has Tile, Attribute and X values.
; Y values are changed by player
FinaleBoatSprites:
        ;       T,  A,  X
        .byte $03,$02,$78 ; row 1
        .byte $03,$40,$80 ; row 1
        .byte $13,$02,$78 ; row 2
        .byte $13,$40,$80 ; row 2
        .byte $01,$00,$70 ; row 3
        .byte $02,$02,$78 ; row 3
        .byte $02,$40,$80 ; row 3
        .byte $01,$40,$88 ; row 3
        .byte $10,$00,$68 ; row 4
        .byte $11,$01,$70 ; row 4
        .byte $12,$01,$78 ; row 4
        .byte $12,$41,$80 ; row 4
        .byte $11,$41,$88 ; row 4
        .byte $10,$40,$90 ; row 4
        .byte $20,$01,$68 ; row 5
        .byte $21,$01,$70 ; row 5
        .byte $22,$00,$78 ; row 5
        .byte $22,$40,$80 ; row 5
        .byte $21,$41,$88 ; row 5
        .byte $20,$41,$90 ; row 5
        .byte $DB,$01,$60 ; row 6
        .byte $DC,$01,$68 ; row 6
        .byte $DD,$00,$70 ; row 6
        .byte $DE,$00,$78 ; row 6
        .byte $DE,$40,$80 ; row 6
        .byte $DD,$40,$88 ; row 6
        .byte $DC,$41,$90 ; row 6
        .byte $DB,$41,$98 ; row 6
        .byte $EB,$01,$60 ; row 7
        .byte $EC,$01,$68 ; row 7
        .byte $ED,$00,$70 ; row 7
        .byte $EE,$00,$78 ; row 7
        .byte $EE,$40,$80 ; row 7
        .byte $ED,$40,$88 ; row 7
        .byte $EC,$41,$90 ; row 7
        .byte $EB,$41,$98 ; row 7
FinaleBoatSpritesEnd:

; Animation data for the finale boat when player is jabbing.
; Table is made up of a list of 2-byte values, terminated by $00
;  - First byte is the number of sprites to move.
;  - Second byte is the Y position to place each sprite at.
FinaleBoatAnimations:
FinaleBoatNotJabbingAnimation:
        .byte $02,$A7
        .byte $02,$AF
        .byte $04,$B7
        .byte $06,$BF
        .byte $06,$C7
        .byte $10,$F0 ; remove remaining sprites offscreen
        .byte $00
FinaleBoatJab1Animation:
        .byte $02,$9F
        .byte $02,$A7
        .byte $04,$AF
        .byte $06,$B7
        .byte $06,$BF
        .byte $08,$C7
        .byte $08,$F0 ; remove remaining sprites offscreen
        .byte $00
FinaleBoatJab2Animation:
        .byte $02,$97
        .byte $02,$9F
        .byte $04,$A7
        .byte $06,$AF
        .byte $06,$B7
        .byte $08,$BF
        .byte $08,$C7
        .byte $00

FinaleAnimateBoat:
        @TempRemainingSprites = $12
        ldx #$00
@NextSpriteRow:
        lda FinaleBoatAnimations,y
        bne @MoveRowOfSprites
        ; if sprite y position was 0,
        ; it's time to bail.
        rts
@MoveRowOfSprites:
        sta @TempRemainingSprites
        iny
        lda FinaleBoatAnimations,y
        iny
@MoveNextSprite:
        sta SpritePosY + FinaleBoatSpriteOffset,x
        inx
        inx
        inx
        inx
        dec @TempRemainingSprites
        bne @MoveNextSprite
        beq @NextSpriteRow

FinaleProcessStrobeAndJab:
        ; if the strobe is active, run strobe code!
        lda FinaleJawsFlags2
        bmi @StrobeIsUsed
        ; make sure we have a strobe
        lda PlayerStrobeCount
        beq @RunBoatJabIfActive
        ; check if player is trying to strobe
        lda #JOY_A
        bit Joy1Pressed
        beq @RunBoatJabIfActive
        ; okay time to use a strobe!
        dec PlayerStrobeCount
        ; update state to trigger strobe
        lda FinaleJawsFlags2
        and #FinaleJawsFlags2Reversing
        ora #FinaleJawsFlags2B7
        sta FinaleJawsFlags2
        lda FinaleCurrentAction
        ora #FinaleCurrentActionB4
        sta FinaleCurrentAction
        lda #SFXFinaleStrobe
        jsr SoundPlay
        jmp @RunBoatJabIfActive
@StrobeIsUsed:
        ; the strobe has been used, jaws is out of the water.
        ; if we're currently jabbing, run boat jab code
        bit FinaleCurrentAction
        bmi @RunBoatJab
        ; bail if we can't currently jab
        lda #FinaleCurrentActionB4
        bit FinaleCurrentAction
        beq @Done
        ; start jabbing if the player presses B
        lda #JOY_B
        bit Joy1Pressed
        bne @JabBoat
@Done:
        rts

@JabBoat:
        ; set jabbing state
        lda #FinaleCurrentActionB7
        sta FinaleCurrentAction
        ; set animation state
        lda #$02
        sta FinaleBoatAnimationTimer
        ; and start animation
        ldy #(FinaleBoatJab1Animation - FinaleBoatAnimations)
        jmp FinaleAnimateBoat

@RunBoatJabIfActive:
        bit FinaleCurrentAction
        bmi @RunBoatJab
        rts
@RunBoatJab:
        bvs @RunBoatJab2
        ; keep running until the animation has finished
        dec FinaleBoatAnimationTimer
        bne @Exit
        ; attempt to strike jaws
        jsr AttemptToStrikeJawsWithBoat
        lda #FinaleCurrentActionB7|FinaleCurrentActionB6
        sta FinaleCurrentAction
        ; play second part of jabbing animation
        lda #$08
        sta FinaleBoatAnimationTimer
        ldy #(FinaleBoatJab2Animation - FinaleBoatAnimations)
        jmp FinaleAnimateBoat
@RunBoatJab2:
        lda FinaleCurrentAction
        and #FinaleCurrentActionJab
        bne @ReturnToNormalState
        dec FinaleBoatAnimationTimer
        bne @Exit
        lda #FinaleCurrentActionB7|FinaleCurrentActionB6|FinaleCurrentActionJab
        sta FinaleCurrentAction
        lda #$02
        sta FinaleBoatAnimationTimer
        ldy #(FinaleBoatJab1Animation - FinaleBoatAnimations)
        jmp FinaleAnimateBoat
@ReturnToNormalState:
        ; keep running until the animation has finished
        dec FinaleBoatAnimationTimer
        bne @Exit
        ; restore back to normal boat state
        lda #FinaleCurrentActionNone
        sta FinaleCurrentAction
        ldy #(FinaleBoatNotJabbingAnimation - FinaleBoatAnimations)
        jmp FinaleAnimateBoat
@Exit:
        rts

; ----------------------------------------------------------------------------
AttemptToStrikeJawsWithBoat:
        ; check so jaws is in the correct position range to get hit
        lda FinaleJawsX  + 1
        bne @Exit
        lda FinaleJawsX
        cmp #$7C
        bcc @Exit
        cmp #$84
        bcs @Exit
        lda FinaleJawsY + 1
        bne @Exit
        lda FinaleJawsY
        cmp #$A8
        bcc @Exit
        cmp #$B0
        bcs @Exit
        lda #$20
        bit FinaleJawsSpriteAttrib
        beq @Exit
        ; jaws has been struck dead.
        ; time to place out our strike sprites and delay until the outro.
        lda #EventFlagsFinaleJawsDead
        sta EventFlags
        lda #SFXFinaleHit
        jsr SoundPlay
        ldx #$00
        ldy #$00
@PlaceJawsHitSprites:
        lda @JawsStruckSprites,y
        sta SpriteTile + (SPR*8),x
        lda @JawsStruckSprites+1,y
        sta SpriteAttr + (SPR*8),x
        ; advance to next sprite.
        inx
        inx
        inx
        inx
        iny
        iny
        ; loop until we've drawn all 4 sprites.
        cpy #$08
        bcc @PlaceJawsHitSprites
@Exit:
        rts

; table of sprites to show when jaws was hit.
; replaces the front sprites of the boat.
; byte 0 is the sprite tile index.
; byte 1 is the attributes to set on the sprite.
@JawsStruckSprites:
        .byte $1C,$03
        .byte $1D,$03
        .byte $2C,$03
        .byte $2D,$03
; ----------------------------------------------------------------------------


FinaleUpdateJawsPosition:
        ; check if jaws is initialized
        bit FinaleJawsFlags
        bvs @Initialized1
        ; mark as initialized
        lda #(EntityHeaderActive | EntityHeader7)
        sta FinaleJawsFlags
        lda #$00
        sta FinaleJawsFlags2
        sta FinaleJawsXDirection
        ; set jaws starting position
        lda #$80
        sta FinaleJawsX
        lda #$00
        sta FinaleJawsX + 1
        lda #$50
        sta FinaleJawsY
        lda #$00
        sta FinaleJawsY + 1
@Initialized1:
        bit FinaleJawsFlags2
        bpl @Initialized2
        jmp @KeepMoving
@Initialized2:
        jsr @GetJawsRoughDistance
        bit FinaleJawsFlags2
        bvs @CheckForDirectionUpdate
        lda FinaleJawsFlags2
        ora #%01000000
        sta FinaleJawsFlags2
        lda #$FF
        sta FinaleJawsActiveAnimationIndex
        lda FinaleJawsV16
        jmp @ChangeJawsDirection
@CheckForDirectionUpdate:
        lda FinaleJawsV16
        cmp FinaleJawsV17
        beq @AdjustSpeedForParallax
@ChangeJawsDirection:
        @Temp = $12
        sta FinaleJawsV17
        asl a
        sta @Temp
        lda FinaleJawsFlags2
        and #FinaleJawsFlags2Reversing
        clc
        adc @Temp
        adc #$04
        jsr @UpdateJawsMovementPattern
        jsr RNGAdvance
        and #%00000011
        beq @UpdateMovementDirection
        cmp #%00000011
        bcs @AdjustSpeedForParallax
@UpdateMovementDirection:
        sta FinaleJawsXDirection
@AdjustSpeedForParallax:
        @TempSpeed = $18
        lda FinaleJawsAnimationIndex
        cmp FinaleJawsActiveAnimationIndex
        beq @CheckInputs
        sta FinaleJawsActiveAnimationIndex
        asl a
        tax
        lda ParallaxBackgroundOffset,x
        sta @TempSpeed
        lda ParallaxBackgroundOffset+1,x
        sta @TempSpeed+1
        lda @TempSpeed
        sta FinaleJawsXSubspeed
        lda @TempSpeed+1
        sta FinaleJawsXSpeed
        lsr @TempSpeed+1
        ror @TempSpeed
        lda @TempSpeed
        sta FinaleJawsYSubspeed
        lda @TempSpeed+1
        sta FinaleJawsYSpeed
        lda FinaleJawsXDirection
        bne @SetMovementSpeed
        ; direction is 0, clear speed
        lda #$00
        sta FinaleJawsXSubspeed
        sta FinaleJawsXSpeed
        jmp @UpdateYSpeed
@SetMovementSpeed:
        cmp #$01
        beq @UpdateYSpeed
        lda FinaleJawsXSpeed
        eor #$FF
        tay
        lda FinaleJawsXSubspeed
        eor #$FF
        clc
        adc #$01
        sta FinaleJawsXSubspeed
        tya
        adc #$00
        sta FinaleJawsXSpeed
@UpdateYSpeed:
        lda #FinaleJawsFlags2Reversing
        bit FinaleJawsFlags2
        beq @CheckInputs
        lda FinaleJawsYSpeed
        eor #$FF
        tay
        lda FinaleJawsYSubspeed
        eor #$FF
        clc
        adc #$01
        sta FinaleJawsYSubspeed
        tya
        adc #$00
        sta FinaleJawsYSpeed
@CheckInputs:
        @TempJawsXSpeed = $16
        lda FinaleJawsAnimationIndex
        asl a
        tax
        lda #(JOY_LEFT | JOY_RIGHT)
        and Joy1Inputs
        beq @PlayerNoMovement
        bpl @PlayerMovingLeft
        ; player is moving to the right.
        ; adjust jaws movement speed to match direction.
        lda FinaleJawsXSubspeed
        sec
        sbc ParallaxBackgroundOffset,x
        sta @TempJawsXSpeed
        lda FinaleJawsXSpeed
        sbc ParallaxBackgroundOffset+1,x
        sta @TempJawsXSpeed+1
        jmp @PlayerMovementComplete
@PlayerMovingLeft:
        ; player is moving to the left
        ; adjust jaws movement speed to match direction.
        lda FinaleJawsXSubspeed
        clc
        adc ParallaxBackgroundOffset,x
        sta @TempJawsXSpeed
        lda FinaleJawsXSpeed
        adc ParallaxBackgroundOffset+1,x
        sta @TempJawsXSpeed+1
        jmp @PlayerMovementComplete
@PlayerNoMovement:
        ; player is moving straight ahead
        lda FinaleJawsXSubspeed
        sta @TempJawsXSpeed
        lda FinaleJawsXSpeed
        sta @TempJawsXSpeed+1
@PlayerMovementComplete:
        lda FinaleJawsXSubpixel
        clc
        adc @TempJawsXSpeed
        sta FinaleJawsXSubpixel
        lda FinaleJawsX
        adc @TempJawsXSpeed+1
        sta FinaleJawsX
        lda @TempJawsXSpeed+1
        bmi @HandleOverflow
        lda FinaleJawsX + 1
        adc #$00
        jmp @UpdatePosition
@HandleOverflow:
        lda FinaleJawsX + 1
        adc #$FF
@UpdatePosition:
        sta FinaleJawsX + 1
        jsr WorksetMoveY
        lda #FinaleJawsFlags2Reversing
        bit FinaleJawsFlags2
        bne @CheckIfJawsShouldAdvance
        lda FinaleJawsY
        ; check if jaws is too close to the player
        cmp #$B8
        bcc @ContinueInCurrentDirection
        ; in that case turn around and move 
        lda #$B8
        sta FinaleJawsY
        lda #FinaleJawsFlags2Reversing
        sta FinaleJawsFlags2
@ContinueInCurrentDirection:
        jmp @Exit
@CheckIfJawsShouldAdvance:
        ; if jaws is currently moving backwards, check if
        ; it's time to start advancing again!
        lda FinaleJawsY
        cmp #$50
        bcs @ContinueInCurrentDirection
        lda #$50
        sta FinaleJawsY
        lda #$00
        sta FinaleJawsFlags2
        jmp @Exit
@KeepMoving:
        bit FinaleJawsFlags2
        bvs @ReverseIfNeeded
        lda FinaleJawsFlags2
        ora #%01000000
        sta FinaleJawsFlags2
        lda FinaleJawsX + 1
        bmi @TurnLeft
        bne @TurnRight
        lda FinaleJawsX
        bmi @TurnRight
@TurnLeft:
        lda FinaleJawsFlags
        ora #EntityHeaderFacingLeft
        bne @CarryOn
@TurnRight:
        lda FinaleJawsFlags
        and #($FF ^ EntityHeaderFacingLeft)
@CarryOn:
        sta FinaleJawsFlags
        lda FinaleJawsV16
        jmp @UpdateJawsMovementPattern
@ReverseIfNeeded:
        lda #$02
        bit FinaleJawsHitDetection
        beq @Exit
        lda FinaleJawsFlags2
        and #FinaleJawsFlags2Reversing
        sta FinaleJawsFlags2
@Exit:
        rts

@GetJawsRoughDistance:
        ldy #$00
        lda FinaleJawsY
        sec
        sbc #$50
        bcs @Distance1
        lda #$00
@Distance1:
        cmp #$10
        bcc @Done
        iny
        sbc #$10
        lsr a
        cmp #$08
        bcs @Distance2
        adc #$10
        jmp @Done
@Distance2:
        iny
        sbc #$08
        lsr a
        cmp #$08
        bcc @Distance3
        lda #$07
@Distance3:
        clc
        adc #$18
        cmp #$1E
        bcc @Done
        iny
@Done:
        sta FinaleJawsAnimationIndex
        sty FinaleJawsV16
        rts

@UpdateJawsMovementPattern:
        asl a
        tax
        lda FinaleJawsAnimationPointers,x
        sta FinaleJawsAnimPtr
        lda FinaleJawsAnimationPointers+1,x
        sta FinaleJawsAnimPtr+1
        lda #$00
        sta FinaleJawsAnimPtr+2
        lda #$01
        sta FinaleJawsAnimTimer
        rts



FinaleUpdateJawsSprites:
        lda FinaleJawsAnimTimer
        beq @UpdateJawsSprites
        dec FinaleJawsAnimTimer
        bne @UpdateJawsSprites
        ldy FinaleJawsAnimOffset
@CheckSpriteOffset:
        lda (FinaleJawsAnimPtr),y
        bne @AdvanceOffset
        lda FinaleJawsHitDetection
        ora #%00000010
        sta FinaleJawsHitDetection
        jmp @UpdateJawsSprites
@AdvanceOffset:
        iny
        cmp #$FF
        bne @Continue
        ; reset sprite offset
        ldy #$00
        beq @CheckSpriteOffset
@Continue:
        sta FinaleJawsAnimTimer
        tax
        lda FinaleJawsHitDetection
        and #($FF ^ %00000010)
        sta FinaleJawsHitDetection
        lda (FinaleJawsAnimPtr),y
        iny
        sta FinaleJawsAnimPtr1
        lda (FinaleJawsAnimPtr),y
        iny
        sta FinaleJawsAnimPtr1+1
        txa
        ; low 5 bits are the number of frames to show this animation
        and #%00011111
        sta FinaleJawsAnimTimer
        sty FinaleJawsAnimOffset
        ; bits 6+7 are sprite attribute modifiers
        txa
        and #%01100000
        sta FinaleJawsSpriteAttrib
@UpdateJawsSprites:
        @RemainingSprites = $00
        @SpriteAttributes = $01
        ldy #$00
        ldx #$00
        lda #$12
        sta @RemainingSprites
        lda FinaleJawsFlags
        asl a
        asl a
        eor FinaleJawsSpriteAttrib
        and #%01000000
        ora #%00000001
        sta @SpriteAttributes
@UpdateNextSprite:
        lda (FinaleJawsAnimPtr1),y
        ; 80 marks the end of this spriteset
        cmp #$80
        beq @MoveSpritesOffScreen
        iny
        bit @SpriteAttributes
        bvc @UpdateNextSprite2
        ; invert
        eor #$FF
        clc
        adc #$F8
@UpdateNextSprite2:
        clc
        and #%11111111 ; sure..
        bmi @NegativeOffset
        adc FinaleJawsX
        sta SpritePosX + FinaleJawsSpriteOffset,x
        lda FinaleJawsX  + 1
        adc #$00
        beq @UpdateSpriteY
        bne @SkipSprite
@NegativeOffset:
        adc FinaleJawsX
        sta SpritePosX + FinaleJawsSpriteOffset,x
        lda FinaleJawsX + 1
        adc #$FF
        bne @SkipSprite
@UpdateSpriteY:
        lda (FinaleJawsAnimPtr1),y
        clc
        bmi @UpdateSpriteY2
        ; handle positive sprite y offset
        adc FinaleJawsY
        sta SpritePosY + FinaleJawsSpriteOffset,x
        lda #$00
@UpdateSpriteY2:
        adc FinaleJawsY
        sta SpritePosY + FinaleJawsSpriteOffset,x
        lda #$FF
        adc FinaleJawsY + 1
        bne @SkipSprite
        iny
        lda (FinaleJawsAnimPtr1),y
        iny
        sta SpriteTile + FinaleJawsSpriteOffset,x
        lda @SpriteAttributes
        sta SpriteAttr + FinaleJawsSpriteOffset,x
        inx
        inx
        inx
        inx
        dec @RemainingSprites
        jmp @UpdateNextSprite
@SkipSprite:
        iny
        iny
        jmp @UpdateNextSprite
@MoveSpritesOffScreen:
        ldy @RemainingSprites
        beq @Done
        lda #$F0
@MoveSpriteOffScreen:
        sta SpritePosY + FinaleJawsSpriteOffset,x
        inx
        inx
        inx
        inx
        dey
        bne @MoveSpriteOffScreen
@Done:
        lda #$01
        sta NMISpriteHandlingDisabled
        rts


; ----------------------------------------------------------------------------
RunOutroScreen:
        jsr PPUDisableNMI
        jsr ClearScreenAndSprites
        jsr DrawStatusLine
        lda #RomGraphicsBonusScreenHitsLabel
        jsr DrawRomGraphics
        lda #EncounterBackgroundDeep
        jsr LoadEncounterBackground
        lda #RomGraphicsEncounterDeep
        jsr DrawRomGraphics
        lda #PaletteEncounterDeep
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #CHREncounterAndIntroScreen
        sta ActiveCHR
        lda #$00
        sta SCROLL_X
        sta UseHighPPUNametables
        sta CameraX
        sta CameraX+1
        sta CameraY+1
        lda #$20
        sta SCROLL_Y
        sta CameraY
        jsr ClearEntityMemory
        sta NMISpriteHandlingDisabled
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
@WaitUntilJawsDisabled:
        jsr WaitFor1Frame
        jsr OutroRunJawsDeath
        jsr SpritesetUpdateScreen
        lda PlayerData + EntityHeader
        bne @WaitUntilJawsDisabled
        jsr PPUDisableNMI
        jsr PPUDisableRendering
        lda PPUCTRL_MIRROR
        ora #$18
        sta PPUCTRL_MIRROR
        jsr ClearScreenAndSprites
        lda #PaletteOutroScreen
        jsr StoreActivePaletteAndWaitFor1Frame
        lda #CHRFinaleAndOutroScreen
        sta ActiveCHR
        lda #RomGraphicsOutroScreen
        jsr DrawRomGraphics
        lda #$00
        sta SCROLL_X
        sta SCROLL_Y
        sta UseHighPPUNametables
        sta CameraX
        sta CameraX+1
        sta CameraY
        sta CameraY+1
        jsr ClearEntityMemory
        lda #$01
        sta NMISpriteHandlingDisabled
        jsr PPUEnableNMI
        jsr PPUEnableAndWaitFor1Frame
        lda #$00
        sta NMIRaisedFlag
@WaitUntilAnimationFinish:
        jsr WaitFor1Frame
        jsr OutroRunPlaneAnimation
        jsr SpritesetUpdateScreen
        lda PlayerData + EntityHeader
        bne @WaitUntilAnimationFinish
        ldy #$3C
        jsr WaitForYFrames
        ; show THE END text in the bottom right corner.
        jsr CopyToVRAMBuffer
        .addr @OutroTextRow1
        jsr CopyToVRAMBuffer
        .addr @OutroTextRow2
        jsr CopyToVRAMBuffer
        .addr @OutroTextRowAttributes
        jsr SetNextPendingBGUpdate
        ; and play some outro music.
        lda #MusicOutroScreen
        jsr SoundPlay
@KeepEnjoyingTheOutro:
        ; loop until sound stops.
        jsr WaitFor1Frame
        lda $0574
        bmi @KeepEnjoyingTheOutro
        ; check for start inputs to restart the game after the outro music finishes.
        ; one problem - the outro music repeats, so we never get here. :)
        ; so we can enjoy the ending tune forever!
        jsr ReadJoypads
        lda #(JOY_START)
        bit Joy1Pressed
        beq @KeepEnjoyingTheOutro
        lda PPUCTRL_MIRROR
        ; clear sprite and background nametables,
        ; and set sprite nametable to $1000
        and #%11100111         
        ora #%00001000
        sta PPUCTRL_MIRROR
        ; then head back to startup.
        jmp GameStartup        


@OutroTextRow1:
        ; draw top half of "THE END" text
        .addr $2356
        .byte $08
        .byte $E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF
@OutroTextRow2:
        ; draw bottom half of "THE END" text
        .addr $2376
        .byte $08
        .byte $F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF
@OutroTextRowAttributes:
        ; set ppu attributes for "THE END" text
        .addr $23F5
        .byte $03
        .byte $7F,$5F,$DF


OutroRunPlaneAnimation:
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        bit Workset + EntityHeader
        bmi @KeepAnimatingPlane
        ; initialize outro plane position
        lda #(EntityHeaderActive | EntityHeader7)
        sta Workset + EntityHeader
        lda #$40
        sta Workset + EntityX
        lda #$01
        sta Workset + EntityX  + 1
        lda #$90
        sta Workset + EntityY
        lda #$00
        sta Workset + EntityY + 1
        ; init movement speed
        lda #$00
        sta Workset + EntityXSubspeed
        lda #$FC
        sta Workset + EntityXSpeed
        lda #$00
        sta Workset + EntityYSubspeed
        lda #$FF
        sta Workset + EntityYSpeed
        ; and play our animation
        lda #AnimationOutroPlane1
        jsr WorksetAnimationPlay
        jmp WorksetSave
@KeepAnimatingPlane:
        lda Workset + EntityAnimationIndex
        bne @RunningAnimation2
        jsr WorksetMoveX
        jsr WorksetMoveY
        bit Workset + EntityActiveAnimationIndex
        bmi @StartAnimation2
        lda #EntityHitEnabled
        bit Workset + EntityHitDetection
        beq @Save
        ; mark running animation as negative to trigger next animation.
        lda #$80
        sta Workset + EntityActiveAnimationIndex
@Save:
        jmp WorksetSave
@StartAnimation2:
        ; exit if running flag is set
        lda #EntityHitEnabled
        bit Workset + EntityHitDetection
        bne @Save
        ; put animation entity in the correct place for the animation.
        lda #$38
        sta Workset + EntityY
        lda #$00
        sta Workset + EntityY + 1
        lda #$80
        sta Workset + EntityXSubspeed
        lda #$02
        sta Workset + EntityXSpeed
        lda #$10
        sta Workset + EntityYSubspeed
        lda #$00
        sta Workset + EntityYSpeed
        ; and clear out the animation state
        lda #$01
        sta Workset + EntityAnimationIndex
        lda #$00
        sta Workset + EntityActiveAnimationIndex
        lda #$10
        sta Workset + EntityOutroPlaneDelay
        ; then start the second animation
        lda #AnimationOutroPlane2
        jsr WorksetAnimationPlay
        jmp WorksetSave
@RunningAnimation2:
        cmp #$01
        bne @DelayUntilAnimationEnd
        lda Workset + EntityOutroPlaneDelay
        beq @PrepNextAnimation
        dec Workset + EntityOutroPlaneDelay
        jmp WorksetSave
@PrepNextAnimation:
        jsr WorksetMoveX
        jsr WorksetMoveY
        bit Workset + EntityActiveAnimationIndex
        bmi @WaitForAnimation3
        lda #$01
        bit Workset + EntityHitDetection
        beq @Exit1
        lda #$80
        sta Workset + EntityActiveAnimationIndex
@Exit1:
        jmp WorksetSave
@WaitForAnimation3:
        ldy #$04
        jsr SlowdownXByY
        bcc @Exit1
        ; oaky, start final animation!
        lda #$02
        sta Workset + EntityAnimationIndex
        lda #AnimationOutroPlane3
        jsr WorksetAnimationPlay
        jmp WorksetSave
@DelayUntilAnimationEnd:
        ; run animation frame
        jsr WorksetAnimationAdvance
        ; if our animation is still running, we have nothing to do.
        lda Workset + EntityAnimTimer
        bne @Done
        ; animation is complete.. time to disable the outro plane!
        ; this will trigger the next stage of the outro.
        lda #$00
        sta Workset + EntityHeader
@Done:
        jmp WorksetSave

OutroRunJawsDeath:
        lda #<PlayerData
        sta WorksetPtr
        lda #>PlayerData
        sta WorksetPtr+1
        jsr WorksetLoad
        jsr @OutroAnimateJawsDeath
        jmp WorksetSave
@OutroAnimateJawsDeath:
        bit Workset + EntityHeader
        bvs @JawsDeathStarted
        lda #(EntityHeaderActive | EntityHeader7)
        ; place out jaws animation in the right spot
        sta Workset + EntityHeader
        lda #$80
        sta Workset + EntityX
        lda #$A0
        sta Workset + EntityY
        ; and set the movement speed
        lda #$80
        sta Workset + EntityYSubspeed
        lda #$10
        sta Workset + EntityXSubspeed
        ; use animationindex as a counter,
        ; there's only one frame of the actual animation.
        lda #$C0
        sta Workset + EntityAnimationIndex
        lda #AnimationFinaleJawsDeath
        jmp WorksetAnimationPlay
@JawsDeathStarted:
        jsr WorksetMoveX
        jsr WorksetMoveY
        ; decrement timer until it reaches 0.
        dec Workset + EntityAnimationIndex
        bne @Done
        ; and deactivate the workset.
        ; this will trigger the next stage of the outro.
        lda #$00
        sta Workset + EntityHeader
@Done:
        rts

; ----------------------------------------------------------------------------
; these are sprite animations specific for jaws in the finale
;
; AnimationExample1:
;   .byte %0AATTTTT               ; bits 6+7 are sprite attribute modifiers, 1-5 are frame duration
;   .addr SpritesetExample1       ; pointer to a set of sprites to show
;
FinaleJawsAnimationPointers:
        .addr @AnimJawsStrobeSize0
        .addr @AnimJawsStrobeSize1
        .addr @AnimJawsStrobeSize2
        .addr @AnimJawsStrobeSize3
        .addr @AnimJawsAdvanceSize0
        .addr @AnimJawsRetreatSize0
        .addr @AnimJawsAdvanceSize1
        .addr @AnimJawsRetreatSize1
        .addr @AnimJawsAdvanceSize2
        .addr @AnimJawsRetreatSize2
        .addr @AnimJawsAdvanceSize3
        .addr @AnimJawsRetreatSize3

@AnimJawsStrobeSize0:
        .byte $08
        .addr @SprJawsStrobeSize0Frame0
        .byte $08
        .addr @SprJawsStrobeSize0Frame1
        .byte $08
        .addr @SprJawsStrobeSize0Frame2
        .byte $0C
        .addr @SprJawsStrobeSize0Frame3
        .byte $0C
        .addr @SprJawsStrobeSize0Frame4
        .byte $0C
        .addr @SprJawsStrobeSize0Frame5
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize0Frame4
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize0Frame3
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize0Frame2
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize0Frame1
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize0Frame0
        .byte $00
        
@AnimJawsStrobeSize1:
        .byte $08
        .addr @SprJawsStrobeSize1Frame0
        .byte $08
        .addr @SprJawsStrobeSize1Frame1
        .byte $08
        .addr @SprJawsStrobeSize1Frame2
        .byte $0C
        .addr @SprJawsStrobeSize1Frame3
        .byte $0C
        .addr @SprJawsStrobeSize1Frame4
        .byte $0C
        .addr @SprJawsStrobeSize1Frame5
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize1Frame4
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize1Frame3
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize1Frame2
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize1Frame1
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize1Frame0
        .byte $00

@AnimJawsStrobeSize2:
        .byte $08
        .addr @SprJawsStrobeSize2Frame0
        .byte $08
        .addr @SprJawsStrobeSize2Frame1
        .byte $08
        .addr @SprJawsStrobeSize2Frame2
        .byte $0C
        .addr @SprJawsStrobeSize2Frame3
        .byte $0C
        .addr @SprJawsStrobeSize2Frame4
        .byte $0C
        .addr @SprJawsStrobeSize2Frame5
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize2Frame4
        .byte $0C | %01000000
        .addr @SprJawsStrobeSize2Frame3
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize2Frame2
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize2Frame1
        .byte $08 | %01000000
        .addr @SprJawsStrobeSize2Frame0
        .byte $00

@AnimJawsStrobeSize3:
        .byte $06
        .addr @SprJawsStrobeSize3Frame0
        .byte $06
        .addr @SprJawsStrobeSize3Frame1
        .byte $06
        .addr @SprJawsStrobeSize3Frame2
        .byte $06
        .addr @SprJawsStrobeSize3Frame3
        .byte $0A
        .addr @SprJawsStrobeSize3Frame4
        .byte $0A | %00100000
        .addr @SprJawsStrobeSize3Frame5
        .byte $0A | %00100000
        .addr @SprJawsStrobeSize3Frame6
        .byte $0A | %01100000
        .addr @SprJawsStrobeSize3Frame5
        .byte $0A | %01000000
        .addr @SprJawsStrobeSize3Frame4
        .byte $06 | %01000000
        .addr @SprJawsStrobeSize3Frame3
        .byte $06 | %01000000
        .addr @SprJawsStrobeSize3Frame2
        .byte $06 | %01000000
        .addr @SprJawsStrobeSize3Frame1
        .byte $06 | %01000000
        .addr @SprJawsStrobeSize3Frame0
        .byte $00

@AnimJawsAdvanceSize0:
        .byte $08
        .addr @SprJawsAdvanceSize0Frame0
        .byte $08
        .addr @SprJawsAdvanceSize0Frame1
        .byte $FF

@AnimJawsRetreatSize0:
        .byte $01
        .addr @SprJawsRetreatSize0Frame0
        .byte $00

@AnimJawsAdvanceSize1:
        .byte $08
        .addr @SprJawsAdvanceSize1Frame0
        .byte $08
        .addr @SprJawsAdvanceSize1Frame1
        .byte $FF

@AnimJawsRetreatSize1:
        .byte $01
        .addr @SprJawsRetreatSize1Frame0
        .byte $00

@AnimJawsAdvanceSize2:
        .byte $06
        .addr @SprJawsAdvanceSize2Frame0
        .byte $06
        .addr @SprJawsAdvanceSize2Frame1
        .byte $06
        .addr @SprJawsAdvanceSize2Frame2
        .byte $FF

@AnimJawsRetreatSize2:
        .byte $01
        .addr @SprJawsRetreatSize2Frame0
        .byte $00

@AnimJawsAdvanceSize3:
        .byte $06
        .addr @SprJawsAdvanceSize3Frame0
        .byte $06
        .addr @SprJawsAdvanceSize3Frame1
        .byte $06
        .addr @SprJawsAdvanceSize3Frame2
        .byte $FF

@AnimJawsRetreatSize3:
        .byte $01
        .addr @SprJawsRetreatSize3Frame0
        .byte $00


; Sprite sets used for finale animations
;
; struct:
;   - one or more sprites:
;     - s8 x offset from entity location
;     - s8 y offset from entity location
;     - u8 sprite tile to render
;   - u8 $80 end of spriteset marker
@SprJawsStrobeSize0Frame0:
        .byte $F8,$F8,$AF
        .byte $00,$F8,$9F
        .byte $80
@SprJawsStrobeSize0Frame1:
        .byte $F8,$F8,$AD
        .byte $00,$F8,$AE
        .byte $80
@SprJawsStrobeSize0Frame2:
        .byte $F8,$F0,$AB
        .byte $00,$F0,$AC
        .byte $F8,$F8,$BB
        .byte $00,$F8,$BC
        .byte $80
@SprJawsStrobeSize0Frame3:
        .byte $F8,$F0,$A5
        .byte $00,$F0,$A6
        .byte $F8,$F8,$B5
        .byte $00,$F8,$B6
        .byte $80
@SprJawsStrobeSize0Frame4:
        .byte $F8,$F0,$A9
        .byte $00,$F0,$AA
        .byte $F8,$F8,$B9
        .byte $00,$F8,$BA
        .byte $80
@SprJawsStrobeSize0Frame5:
        .byte $F8,$F0,$A7
        .byte $00,$F0,$A8
        .byte $F8,$F8,$B7
        .byte $00,$F8,$B8
        .byte $80


@SprJawsStrobeSize1Frame0:
        .byte $F0,$F8,$E3
        .byte $F8,$F8,$E4
        .byte $00,$F8,$F4
        .byte $80
@SprJawsStrobeSize1Frame1:
        .byte $F0,$F8,$C3
        .byte $F8,$F8,$C4
        .byte $00,$F8,$D3
        .byte $08,$F8,$D4
        .byte $80
@SprJawsStrobeSize1Frame2:
        .byte $F8,$F0,$91
        .byte $00,$F0,$92
        .byte $F0,$F8,$F0
        .byte $F8,$F8,$F1
        .byte $00,$F8,$F2
        .byte $08,$F8,$F3
        .byte $80
@SprJawsStrobeSize1Frame3:
        .byte $F8,$E8,$91
        .byte $00,$E8,$92
        .byte $F0,$F0,$A0
        .byte $F8,$F0,$A1
        .byte $00,$F0,$A2
        .byte $F0,$F8,$B0
        .byte $F8,$F8,$B1
        .byte $00,$F8,$B2
        .byte $08,$F8,$9E
        .byte $80
@SprJawsStrobeSize1Frame4:
        .byte $F8,$E8,$93
        .byte $00,$E8,$94
        .byte $F8,$F0,$A3
        .byte $00,$F0,$A4
        .byte $F0,$F8,$90
        .byte $F8,$F8,$B3
        .byte $00,$F8,$B4
        .byte $08,$F8,$C0
        .byte $80
@SprJawsStrobeSize1Frame5:
        .byte $F8,$E8,$C1
        .byte $00,$E8,$C2
        .byte $F8,$F0,$D1
        .byte $00,$F0,$D2
        .byte $F0,$F8,$E0
        .byte $F8,$F8,$E1
        .byte $00,$F8,$E2
        .byte $08,$F8,$D0
        .byte $80


@SprJawsStrobeSize2Frame3:
        .byte $F9,$E0,$04
        .byte $01,$E0,$05
        .byte $F9,$E8,$14
        .byte $01,$E8,$15
        .byte $F1,$F0,$23
        .byte $F9,$F0,$24
        .byte $01,$F0,$25
        .byte $F1,$F8,$33
        .byte $F9,$F8,$34
        .byte $01,$F8,$35
        .byte $09,$F8,$36
        .byte $80

@SprJawsStrobeSize2Frame5:
        .byte $F7,$E0,$16
        .byte $FF,$E0,$50
        .byte $F7,$E8,$26
        .byte $FF,$E8,$60
        .byte $F7,$F0,$17
        .byte $FF,$F0,$70
        .byte $E7,$F8,$19
        .byte $EF,$F8,$28
        .byte $F7,$F8,$27
        .byte $FF,$F8,$80
        .byte $07,$F8,$81
        .byte $0F,$F8,$82
        .byte $EF,$F0,$18
        .byte $07,$F0,$71
        .byte $80

@SprJawsStrobeSize2Frame4:
        .byte $F8,$E0,$53
        .byte $00,$E0,$54
        .byte $F8,$E8,$63
        .byte $00,$E8,$64
        .byte $F0,$F0,$51
        .byte $F8,$F0,$73
        .byte $00,$F0,$74
        .byte $F0,$F8,$61
        .byte $F8,$F8,$83
        .byte $00,$F8,$84
        .byte $08,$F8,$52
        .byte $80

@SprJawsStrobeSize2Frame2:
        .byte $F8,$E8,$04
        .byte $00,$E8,$05
        .byte $F0,$F0,$37
        .byte $F8,$F0,$14
        .byte $00,$F0,$47
        .byte $F0,$F8,$43
        .byte $F8,$F8,$44
        .byte $00,$F8,$45
        .byte $08,$F8,$46
        .byte $80

@SprJawsStrobeSize2Frame1:
        .byte $F7,$F0,$04
        .byte $FF,$F0,$05
        .byte $EF,$F8,$38
        .byte $F7,$F8,$39
        .byte $FF,$F8,$3A
        .byte $07,$F8,$3B
        .byte $80

@SprJawsStrobeSize2Frame0:
        .byte $EE,$F8,$48
        .byte $F6,$F8,$49
        .byte $FE,$F8,$4A
        .byte $80


@SprJawsStrobeSize3Frame4:
        .byte $F4,$D8,$55
        .byte $FC,$D8,$56
        .byte $F4,$E0,$65
        .byte $FC,$E0,$66
        .byte $04,$E0,$67
        .byte $F4,$E8,$75
        .byte $FC,$E8,$76
        .byte $04,$E8,$77
        .byte $F4,$F0,$85
        .byte $FC,$F0,$86
        .byte $04,$F0,$87
        .byte $EC,$F8,$57
        .byte $F4,$F8,$95
        .byte $FC,$F8,$96
        .byte $04,$F8,$97
        .byte $80
@SprJawsStrobeSize3Frame5:
        .byte $F4,$D8,$58
        .byte $FC,$D8,$59
        .byte $04,$D8,$5A
        .byte $F4,$E0,$68
        .byte $FC,$E0,$69
        .byte $04,$E0,$6A
        .byte $F4,$E8,$78
        .byte $FC,$E8,$79
        .byte $04,$E8,$7A
        .byte $F4,$F0,$88
        .byte $FC,$F0,$89
        .byte $04,$F0,$8A
        .byte $EC,$F8,$4B
        .byte $F4,$F8,$98
        .byte $FC,$F8,$99
        .byte $04,$F8,$9A
        .byte $80
@SprJawsStrobeSize3Frame6:
        .byte $F4,$D8,$5B
        .byte $FC,$D8,$5C
        .byte $04,$D8,$5D
        .byte $F4,$E0,$6B
        .byte $FC,$E0,$6C
        .byte $04,$E0,$6D
        .byte $F4,$E8,$7B
        .byte $FC,$E8,$7C
        .byte $04,$E8,$7D
        .byte $F4,$F0,$8B
        .byte $FC,$F0,$8C
        .byte $04,$F0,$8D
        .byte $EC,$F8,$3C
        .byte $F4,$F8,$9B
        .byte $FC,$F8,$9C
        .byte $04,$F8,$9D
        .byte $0C,$F8,$4C
        .byte $80
@SprJawsStrobeSize3Frame3:
        .byte $F4,$E0,$55
        .byte $FC,$E0,$56
        .byte $F4,$E8,$65
        .byte $FC,$E8,$66
        .byte $04,$E8,$67
        .byte $F4,$F0,$2E
        .byte $FC,$F0,$76
        .byte $04,$F0,$77
        .byte $0C,$F0,$2F
        .byte $EC,$F8,$3D
        .byte $F4,$F8,$3E
        .byte $FC,$F8,$3F
        .byte $04,$F8,$1E
        .byte $0C,$F8,$1F
        .byte $80
@SprJawsStrobeSize3Frame2:
        .byte $F4,$E8,$55
        .byte $FC,$E8,$56
        .byte $F4,$F0,$65
        .byte $FC,$F0,$66
        .byte $04,$F0,$67
        .byte $F4,$F8,$4D
        .byte $FC,$F8,$4E
        .byte $04,$F8,$4F
        .byte $0C,$F8,$5E
        .byte $80
@SprJawsStrobeSize3Frame1:
        .byte $F4,$F0,$55
        .byte $FC,$F0,$56
        .byte $F4,$F8,$6E
        .byte $FC,$F8,$6F
        .byte $04,$F8,$7E
        .byte $0C,$F8,$7F
        .byte $80
@SprJawsStrobeSize3Frame0:
        .byte $F4,$F8,$8E
        .byte $FC,$F8,$8F
        .byte $04,$F8,$5F
        .byte $80


@SprJawsAdvanceSize0Frame0:
        .byte $FC,$F8,$C7
        .byte $80
@SprJawsAdvanceSize0Frame1:
        .byte $FC,$F8,$D7
        .byte $80
        

@SprJawsRetreatSize0Frame0:
        .byte $FC,$F8,$CF
        .byte $80


@SprJawsAdvanceSize1Frame0:
        .byte $FC,$F0,$D5
        .byte $F4,$F8,$C8
        .byte $FC,$F8,$C9
        .byte $04,$F8,$CA
        .byte $80

@SprJawsAdvanceSize1Frame1:
        .byte $FC,$F0,$D5
        .byte $F4,$F8,$D8
        .byte $FC,$F8,$D9
        .byte $04,$F8,$DA
        .byte $80


@SprJawsRetreatSize1Frame0:
        .byte $FC,$F0,$D5
        .byte $FC,$F8,$DF
        .byte $80


@SprJawsAdvanceSize2Frame0:
        .byte $FC,$F0,$CB
        .byte $F4,$F8,$E8
        .byte $FC,$F8,$E9
        .byte $04,$F8,$EA
        .byte $80
@SprJawsAdvanceSize2Frame1:
        .byte $FC,$F0,$CB
        .byte $F4,$F8,$F8
        .byte $FC,$F8,$F9
        .byte $04,$F8,$FA
        .byte $80
@SprJawsAdvanceSize2Frame2:
        .byte $FC,$F0,$CB
        .byte $F4,$F8,$CC
        .byte $FC,$F8,$CD
        .byte $04,$F8,$CE
        .byte $80


@SprJawsRetreatSize2Frame0:
        .byte $FC,$F0,$CB
        .byte $FC,$F8,$EF
        .byte $80


@SprJawsAdvanceSize3Frame0:
        .byte $FC,$E8,$C6
        .byte $FC,$F0,$D6
        .byte $F4,$F8,$F5
        .byte $FC,$F8,$F6
        .byte $04,$F8,$F7
        .byte $80
@SprJawsAdvanceSize3Frame1:
        .byte $FC,$E8,$C6
        .byte $FC,$F0,$D6
        .byte $F4,$F8,$BD
        .byte $FC,$F8,$BE
        .byte $04,$F8,$BF
        .byte $80
@SprJawsAdvanceSize3Frame2:
        .byte $FC,$E8,$C6
        .byte $FC,$F0,$D6
        .byte $F4,$F8,$E5
        .byte $FC,$F8,$E6
        .byte $04,$F8,$E7
        .byte $80


@SprJawsRetreatSize3Frame0:
        .byte $FC,$E8,$C6
        .byte $FC,$F0,$D6
        .byte $FC,$F8,$C5
        .byte $80

.include "sound.asm"

; unused alignment padding
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$01,$00,$00,$00,$00,$00,$3F
.byte $1F,$1F,$0F,$0F,$07

.align $80
ParallaxBackgroundOffset:
        .byte $08,$00
        .byte $10,$00
        .byte $18,$00
        .byte $20,$00
        .byte $28,$00
        .byte $30,$00
        .byte $38,$00
        .byte $40,$00
        .byte $48,$00
        .byte $50,$00
        .byte $58,$00
        .byte $60,$00
        .byte $68,$00
        .byte $70,$00
        .byte $78,$00
        .byte $80,$00
        .byte $88,$00
        .byte $90,$00
        .byte $98,$00
        .byte $A0,$00
        .byte $A8,$00
        .byte $B0,$00
        .byte $B8,$00
        .byte $C0,$00
        .byte $C8,$00
        .byte $D0,$00
        .byte $D8,$00
        .byte $E0,$00
        .byte $E8,$00
        .byte $F0,$00
        .byte $F8,$00
        .byte $00

; table of cycle counts that need to be burned in order to position the ppu where
; we need it for the parallax scrolling background.
; first value per row is the microadjustment, we will delay that number of cycles + 5.
; second value per row is the macroadjustment, we will delay the number of cycles * 4.
; end result should be that the ppu is just before HBLANK and we can adjust PPUSCROLL.
FinaleParallaxNextSectionDelay:
        .byte     $01
        .byte $00,$02
        .byte $02,$02
        .byte $02,$02
        .byte $00,$02
        .byte $02,$02
        .byte $02,$02
        .byte $00,$02
        .byte $02,$02
        .byte $02,$02
        .byte $00,$02
        .byte $02,$02
        .byte $02,$02
        .byte $00,$02
        .byte $02,$02
        .byte $02,$02
        .byte $00,$02
        .byte $00,$19
        .byte $08,$18
        .byte $08,$18
        .byte $08,$18
        .byte $00,$19
        .byte $08,$18
        .byte $08,$18
        .byte $08,$18
        .byte $04,$46
        .byte $02,$46
        .byte $04,$46
        .byte $04,$46
        .byte $02,$46
        .byte $04,$46
        .byte $04,$46
        .byte $02,$46
FinaleParallaxNextSectionDelayEnd:

; ----------------------------------------------------------------------------
FinaleUpdateParallax:
        ldx #$00
        ldy #$00
        ; delay until spr0 hit
:       bit PPUSTATUS
        bvc :-
        ; we're in position for the first parallax point.
        ; time to update scroll position
        bvs @UpdatePPUSCROLL
@NextParallaxSection:
        ; find proper delay until next section
        ldy FinaleParallaxNextSectionDelay,x
@Spin4CyclesForEachY:
        ; this will decrement Y to 0, using 4 cpu cycles per loop.
        ; used to align the ppu!
        dey
        bne @Spin4CyclesForEachY
@UpdatePPUSCROLL:
        ; we are in position for the next parallax segment.
        ; load memory value for current sections scroll position.
        lda FinaleParallax1+1,x
        sta PPUSCROLL
        lda #$00
        sta PPUSCROLL
        lda Joy1Inputs
        and #(JOY_LEFT|JOY_RIGHT)
        beq @PlayerNoDirection
        bpl @PlayerLeftDirection
        jmp @PlayerRightDirection

@PlayerRightDirection:
        ; if we're holding right, get the offset for our current section
        ; and add it onto the current ppuscroll position for this parallax section.
        lda FinaleParallax1,x
        clc
        adc ParallaxBackgroundOffset,x
        sta FinaleParallax1,x
        lda FinaleParallax1+1,x
        adc ParallaxBackgroundOffset+1,x
        sta FinaleParallax1+1,x
        jmp @FinaleParallaxDelayForExactCycles

@PlayerLeftDirection:
        ; delay 2 cycles to keep cycle count the same between all directions.
        nop
        ; if we're holding left, get the offset for our current section
        ; and subtract it from the current ppuscroll position for this parallax section.
        lda FinaleParallax1,x
        sec
        sbc ParallaxBackgroundOffset,x
        sta FinaleParallax1,x
        lda FinaleParallax1+1,x
        sbc ParallaxBackgroundOffset+1,x
        sta FinaleParallax1+1,x
        jmp @FinaleParallaxDelayForExactCycles

@PlayerNoDirection:
        ; delay 4 cycles to keep cycle count the same between all directions.
        bne :+
:       nop
        ; if we're not holding any direction, we still want to take up the same amount of cycles.
        ; so we just save the result in an unused memory location.
        lda FinaleParallax1,x
        clc
        adc ParallaxBackgroundOffset,x
        sta FinalePlayerPosition,y
        lda FinaleParallax1+1,x
        adc ParallaxBackgroundOffset+1,x
        sta FinalePlayerPosition,y
        jmp @FinaleParallaxDelayForExactCycles

; ----------------------------------------------------------------------------
@FinaleParallaxDelayForExactCycles:
        @CycleDelayPtr = $0462
        ; get microadjustment value for next parallax section.
        ldy FinaleParallaxNextSectionDelay+1,x
        inx
        inx
        ; if we've reached the last parallax section, we can end.
        cpx #(FinaleParallaxNextSectionDelayEnd - FinaleParallaxNextSectionDelay - 1)
        bcs @Exit
        ; otherwise we delay for a specific amount of cycles to start aligning the PPU.
        lda @SpecificCycleDelays,y
        sta @CycleDelayPtr
        lda @SpecificCycleDelays+1,y
        sta @CycleDelayPtr+1
        jmp (@CycleDelayPtr)
@Delay9Cycles:
        nop
@Delay7Cycles:
        nop
@Delay5Cycles:
        nop
        cmp $00
        ; now go run the large scale alignment.
        jmp @NextParallaxSection
@Delay8Cycles:
        nop
@Delay6Cycles:
        nop
        nop
        nop
        ; now go run the large scale alignment.
        jmp @NextParallaxSection
@Exit:
        rts
@SpecificCycleDelays:
        .addr @Delay5Cycles
        .addr @Delay6Cycles
        .addr @Delay7Cycles
        .addr @Delay8Cycles
        .addr @Delay9Cycles

CopyTextPause:
        .addr PPUADDRStatusbarText
        .byte $20 ; length
        .byte "             PAUSE              "

; unused alignment padding
.byte $00,$00,$00,$00,$00,$FF,$FF,$FF
.byte $FF,$FC,$F8,$F0,$E3,$00,$00,$00
.byte $00,$00,$00,$00,$00,$87,$E1,$C0
.byte $00,$00,$00,$80,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$EF,$8E,$88
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$FF,$0F,$03
.byte $07,$03,$00,$00,$00

; first byte is top left of the map, descends in Y order, each line is full height of the map.
.align $100
WorldMapData:
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
.align $100
WorldMapDataAttributes:
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

; unused alignment padding
.byte $03,$03,$07,$07,$03,$00,$00,$00
.byte $03,$03,$07,$07,$03,$00,$00,$00
.byte $80,$80,$C0,$C0,$80,$00,$00,$00
.byte $80,$80,$C0,$C0,$80,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00

; im sure not all of these are the actual metatiles.. but whatever.
; a metatile is a block of 4 tiles that are drawn in a 2x2 square.
.align $100
Metatiles:
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
; these are used in encounters
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

; unused alignment padding
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

.align $100
WorldMapFlags:
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

.align $80
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

; unused alignment padding
.byte   $70,$FF,$FF,$FF,$3C,$3C
.byte   $3C,$FC,$FC,$FC,$F8,$E0
.byte   $DF,$DF

.segment "VECTORS"
.word VNMI
.word VBOOT
.word VIRQ
