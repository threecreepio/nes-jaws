.segment "INES"
.byte "NES",$1A
.byte 2   ; PRG SIZE
.byte 4   ; CHR SIZE
.byte $30
.byte $8
.byte $20
.byte $00
.byte $0A
.byte $09

.segment "PRG"
.include "main.asm"

.segment "CHR"
.incbin "./jaws.chr"
