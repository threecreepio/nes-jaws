.segment "INES"
    .byte "NES",$1A
    .byte 2  ; PRG SIZE
    .byte 4  ; CHR SIZE
    .byte $30 ; flags 6

.segment "PRG"
.include "main.asm"

.segment "CHR"
.incbin "jaws.chr"
