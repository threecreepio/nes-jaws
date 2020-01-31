; da65 V2.16 - Git 6de78c5
; Created:    2020-01-31 15:45:01
; Input file: TMP.prg.bin
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
L0000           := $0000
L0001           := $0001
L0003           := $0003
L0004           := $0004
L0006           := $0006
L000F           := $000F
L00F4           := $00F4
L0101           := $0101
L020A           := $020A
L0210           := $0210
L0212           := $0212
L021A           := $021A
L025B           := $025B
L0280           := $0280
L0301           := $0301
L0462           := $0462
L04FF           := $04FF
L060F           := $060F
L0616           := $0616
L0717           := $0717
L071D           := $071D
L0804           := $0804
L0A09           := $0A09
L0C20           := $0C20
L0E4D           := $0E4D
L0F0E           := $0F0E
L0F0F           := $0F0F
L0F10           := $0F10
L0F17           := $0F17
L0F26           := $0F26
L1006           := $1006
L100A           := $100A
L1016           := $1016
L1021           := $1021
L10E0           := $10E0
L1121           := $1121
L1210           := $1210
L1221           := $1221
L131C           := $131C
L1320           := $1320
L1626           := $1626
L183F           := $183F
L191B           := $191B
L1A08           := $1A08
L1A1A           := $1A1A
L1A1B           := $1A1B
L1AFF           := $1AFF
L1B12           := $1B12
L1B84           := $1B84
L1C16           := $1C16
L2006           := $2006
L2013           := $2013
L201B           := $201B
L201E           := $201E
L2020           := $2020
L2022           := $2022
L2026           := $2026
L202A           := $202A
L2031           := $2031
L2053           := $2053
L2121           := $2121
L2212           := $2212
L2220           := $2220
L2221           := $2221
L230C           := $230C
L260F           := $260F
L2612           := $2612
L270F           := $270F
L2715           := $2715
L2716           := $2716
L2724           := $2724
L272B           := $272B
L2800           := $2800
L2B20           := $2B20
L3012           := $3012
L3021           := $3021
L3031           := $3031
L3C14           := $3C14
L3E3D           := $3E3D
L3F10           := $3F10
L4008           := $4008
L4010           := $4010
L4013           := $4013
L4030           := $4030
L4143           := $4143
L414A           := $414A
L4349           := $4349
L4353           := $4353
L4454           := $4454
L4547           := $4547
L454C           := $454C
L454D           := $454D
L4552           := $4552
L464F           := $464F
L4853           := $4853
L4854           := $4854
L4943           := $4943
L4948           := $4948
L494E           := $494E
L4A4C           := $4A4C
L4C41           := $4C41
L4CE0           := $4CE0
L4F10           := $4F10
L4F47           := $4F47
L4F50           := $4F50
L5020           := $5020
L5220           := $5220
L5254           := $5254
L564F           := $564F
L5942           := $5942
L5B84           := $5B84
L6AE1           := $6AE1
L6E6D           := $6E6D
L717A           := $717A
L7373           := $7373
L7476           := $7476
L7C6D           := $7C6D
L8013           := $8013
L8148           := $8148
L8424           := $8424
L861B           := $861B
L8B5F           := $8B5F
L8B83           := $8B83
L8BB6           := $8BB6
L8BC2           := $8BC2
L8BDE           := $8BDE
L8BEA           := $8BEA
L8C40           := $8C40
L8C50           := $8C50
L8C60           := $8C60
L8C69           := $8C69
L8C87           := $8C87
L8CD0           := $8CD0
L8D69           := $8D69
L8E12           := $8E12
L8E2D           := $8E2D
L8EBD           := $8EBD
L8FCF           := $8FCF
L9041           := $9041
L9754           := $9754
L9761           := $9761
L976E           := $976E
L977C           := $977C
L97AD           := $97AD
L97BE           := $97BE
L97FA           := $97FA
L981B           := $981B
L983C           := $983C
L98B8           := $98B8
L9A37           := $9A37
L9B8D           := $9B8D
LA78F           := $A78F
LA8A1           := $A8A1
LA9B6           := $A9B6
LAA01           := $AA01
LACE6           := $ACE6
LB5A5           := $B5A5
; ----------------------------------------------------------------------------

.segment        "game": absolute

        .byte   $04                             ; C000 04                       .
        .byte   $04                             ; C001 04                       .
        .byte   $5B                             ; C002 5B                       [
        cmp     (L0004,x)                       ; C003 C1 04                    ..
        .byte   $04                             ; C005 04                       .
        .byte   $7C                             ; C006 7C                       |
        cmp     (L0000,x)                       ; C007 C1 00                    ..
        ora     (L0000,x)                       ; C009 01 00                    ..
        ora     (L0000,x)                       ; C00B 01 00                    ..
        ora     (L0000,x)                       ; C00D 01 00                    ..
        ora     (L0000,x)                       ; C00F 01 00                    ..
        ora     (L0000,x)                       ; C011 01 00                    ..
        ora     (L0000,x)                       ; C013 01 00                    ..
        ora     (L0000,x)                       ; C015 01 00                    ..
        ora     (L0000,x)                       ; C017 01 00                    ..
        ora     (L0000,x)                       ; C019 01 00                    ..
        ora     (L0000,x)                       ; C01B 01 00                    ..
        ora     (L0000,x)                       ; C01D 01 00                    ..
        ora     ($FF,x)                         ; C01F 01 FF                    ..
        ora     (L0001,x)                       ; C021 01 01                    ..
        brk                                     ; C023 00                       .
        ora     (L0001,x)                       ; C024 01 01                    ..
        brk                                     ; C026 00                       .
        ora     (L0001,x)                       ; C027 01 01                    ..
        brk                                     ; C029 00                       .
        ora     (L0001,x)                       ; C02A 01 01                    ..
        brk                                     ; C02C 00                       .
        ora     (L0001,x)                       ; C02D 01 01                    ..
        brk                                     ; C02F 00                       .
LC030:  ora     (L0001,x)                       ; C030 01 01                    ..
        brk                                     ; C032 00                       .
        ora     (L0001,x)                       ; C033 01 01                    ..
        brk                                     ; C035 00                       .
        ora     (L0001,x)                       ; C036 01 01                    ..
        .byte   $03                             ; C038 03                       .
        .byte   $FF                             ; C039 FF                       .
        brk                                     ; C03A 00                       .
        brk                                     ; C03B 00                       .
        brk                                     ; C03C 00                       .
        brk                                     ; C03D 00                       .
        brk                                     ; C03E 00                       .
        brk                                     ; C03F 00                       .
        brk                                     ; C040 00                       .
        brk                                     ; C041 00                       .
        brk                                     ; C042 00                       .
        brk                                     ; C043 00                       .
        brk                                     ; C044 00                       .
        ora     (L0000,x)                       ; C045 01 00                    ..
        brk                                     ; C047 00                       .
        brk                                     ; C048 00                       .
        ora     (L0000,x)                       ; C049 01 00                    ..
        ora     (L0000,x)                       ; C04B 01 00                    ..
        ora     (L0000,x)                       ; C04D 01 00                    ..
        ora     (L0000,x)                       ; C04F 01 00                    ..
        ora     (L0001,x)                       ; C051 01 01                    ..
        ora     (L0001,x)                       ; C053 01 01                    ..
        brk                                     ; C055 00                       .
        ora     (L0001,x)                       ; C056 01 01                    ..
        ora     (L0003,x)                       ; C058 01 03                    ..
        .byte   $FF                             ; C05A FF                       .
        brk                                     ; C05B 00                       .
        ora     ($02,x)                         ; C05C 01 02                    ..
        brk                                     ; C05E 00                       .
        .byte   $01                             ; C05F 01                       .
LC060:  .byte   $02                             ; C060 02                       .
        brk                                     ; C061 00                       .
        ora     ($02,x)                         ; C062 01 02                    ..
        .byte   $03                             ; C064 03                       .
        brk                                     ; C065 00                       .
        ora     ($02,x)                         ; C066 01 02                    ..
        brk                                     ; C068 00                       .
        ora     ($02,x)                         ; C069 01 02                    ..
        brk                                     ; C06B 00                       .
        ora     ($02,x)                         ; C06C 01 02                    ..
        .byte   $03                             ; C06E 03                       .
        brk                                     ; C06F 00                       .
        ora     ($02,x)                         ; C070 01 02                    ..
        brk                                     ; C072 00                       .
        ora     ($02,x)                         ; C073 01 02                    ..
        brk                                     ; C075 00                       .
        ora     ($02,x)                         ; C076 01 02                    ..
        brk                                     ; C078 00                       .
        ora     (L0003,x)                       ; C079 01 03                    ..
        .byte   $FF                             ; C07B FF                       .
        ora     (L0001,x)                       ; C07C 01 01                    ..
        ora     (L0001,x)                       ; C07E 01 01                    ..
        ora     (L0001,x)                       ; C080 01 01                    ..
        ora     (L0001,x)                       ; C082 01 01                    ..
        ora     (L0001,x)                       ; C084 01 01                    ..
        ora     (L0003,x)                       ; C086 01 03                    ..
        ora     (L0001,x)                       ; C088 01 01                    ..
        ora     (L0001,x)                       ; C08A 01 01                    ..
        ora     (L0001,x)                       ; C08C 01 01                    ..
        ora     (L0003,x)                       ; C08E 01 03                    ..
        ora     (L0001,x)                       ; C090 01 01                    ..
        ora     (L0001,x)                       ; C092 01 01                    ..
        ora     (L0003,x)                       ; C094 01 03                    ..
        ora     (L0001,x)                       ; C096 01 01                    ..
        ora     (L0001,x)                       ; C098 01 01                    ..
        ora     (L0003,x)                       ; C09A 01 03                    ..
        ora     (L0001,x)                       ; C09C 01 01                    ..
        ora     (L0003,x)                       ; C09E 01 03                    ..
        ora     (L0001,x)                       ; C0A0 01 01                    ..
        ora     (L0003,x)                       ; C0A2 01 03                    ..
        .byte   $FF                             ; C0A4 FF                       .
        .byte   $02                             ; C0A5 02                       .
        .byte   $02                             ; C0A6 02                       .
        .byte   $02                             ; C0A7 02                       .
        .byte   $02                             ; C0A8 02                       .
LC0A9:  .byte   $02                             ; C0A9 02                       .
        .byte   $02                             ; C0AA 02                       .
        .byte   $02                             ; C0AB 02                       .
        .byte   $02                             ; C0AC 02                       .
        .byte   $02                             ; C0AD 02                       .
        .byte   $02                             ; C0AE 02                       .
        .byte   $02                             ; C0AF 02                       .
        .byte   $02                             ; C0B0 02                       .
        .byte   $02                             ; C0B1 02                       .
        .byte   $02                             ; C0B2 02                       .
        .byte   $02                             ; C0B3 02                       .
        .byte   $02                             ; C0B4 02                       .
        .byte   $02                             ; C0B5 02                       .
        .byte   $02                             ; C0B6 02                       .
        .byte   $02                             ; C0B7 02                       .
        .byte   $02                             ; C0B8 02                       .
        .byte   $02                             ; C0B9 02                       .
        .byte   $02                             ; C0BA 02                       .
        .byte   $02                             ; C0BB 02                       .
        .byte   $02                             ; C0BC 02                       .
        .byte   $02                             ; C0BD 02                       .
        .byte   $02                             ; C0BE 02                       .
        .byte   $02                             ; C0BF 02                       .
        .byte   $02                             ; C0C0 02                       .
        .byte   $02                             ; C0C1 02                       .
        .byte   $02                             ; C0C2 02                       .
        .byte   $02                             ; C0C3 02                       .
        .byte   $02                             ; C0C4 02                       .
        .byte   $FF                             ; C0C5 FF                       .
        .byte   $03                             ; C0C6 03                       .
        .byte   $03                             ; C0C7 03                       .
        .byte   $03                             ; C0C8 03                       .
        .byte   $03                             ; C0C9 03                       .
        .byte   $03                             ; C0CA 03                       .
        .byte   $03                             ; C0CB 03                       .
        .byte   $03                             ; C0CC 03                       .
        .byte   $03                             ; C0CD 03                       .
        .byte   $03                             ; C0CE 03                       .
        .byte   $03                             ; C0CF 03                       .
        .byte   $03                             ; C0D0 03                       .
        .byte   $03                             ; C0D1 03                       .
        .byte   $03                             ; C0D2 03                       .
        .byte   $03                             ; C0D3 03                       .
        .byte   $03                             ; C0D4 03                       .
        .byte   $03                             ; C0D5 03                       .
        .byte   $FF                             ; C0D6 FF                       .
        .byte   $02                             ; C0D7 02                       .
        .byte   $02                             ; C0D8 02                       .
        .byte   $02                             ; C0D9 02                       .
        .byte   $03                             ; C0DA 03                       .
        .byte   $02                             ; C0DB 02                       .
        .byte   $02                             ; C0DC 02                       .
        .byte   $02                             ; C0DD 02                       .
        .byte   $03                             ; C0DE 03                       .
        .byte   $02                             ; C0DF 02                       .
        .byte   $02                             ; C0E0 02                       .
        .byte   $02                             ; C0E1 02                       .
        .byte   $03                             ; C0E2 03                       .
        .byte   $02                             ; C0E3 02                       .
        .byte   $02                             ; C0E4 02                       .
        .byte   $02                             ; C0E5 02                       .
        .byte   $03                             ; C0E6 03                       .
        .byte   $02                             ; C0E7 02                       .
        .byte   $02                             ; C0E8 02                       .
        .byte   $02                             ; C0E9 02                       .
        .byte   $03                             ; C0EA 03                       .
        .byte   $02                             ; C0EB 02                       .
        .byte   $02                             ; C0EC 02                       .
        .byte   $02                             ; C0ED 02                       .
        .byte   $03                             ; C0EE 03                       .
        .byte   $02                             ; C0EF 02                       .
        .byte   $02                             ; C0F0 02                       .
        .byte   $02                             ; C0F1 02                       .
        .byte   $03                             ; C0F2 03                       .
        .byte   $02                             ; C0F3 02                       .
        .byte   $02                             ; C0F4 02                       .
        .byte   $02                             ; C0F5 02                       .
        .byte   $03                             ; C0F6 03                       .
        .byte   $FF                             ; C0F7 FF                       .
        brk                                     ; C0F8 00                       .
        ora     ($02,x)                         ; C0F9 01 02                    ..
        .byte   $03                             ; C0FB 03                       .
        brk                                     ; C0FC 00                       .
        ora     ($02,x)                         ; C0FD 01 02                    ..
        .byte   $03                             ; C0FF 03                       .
        brk                                     ; C100 00                       .
        ora     ($02,x)                         ; C101 01 02                    ..
        .byte   $03                             ; C103 03                       .
        brk                                     ; C104 00                       .
        ora     ($02,x)                         ; C105 01 02                    ..
        .byte   $03                             ; C107 03                       .
        brk                                     ; C108 00                       .
        ora     ($02,x)                         ; C109 01 02                    ..
        .byte   $03                             ; C10B 03                       .
        brk                                     ; C10C 00                       .
        ora     ($02,x)                         ; C10D 01 02                    ..
        .byte   $03                             ; C10F 03                       .
        brk                                     ; C110 00                       .
        ora     ($02,x)                         ; C111 01 02                    ..
        .byte   $03                             ; C113 03                       .
        brk                                     ; C114 00                       .
        ora     ($02,x)                         ; C115 01 02                    ..
        .byte   $03                             ; C117 03                       .
        .byte   $FF                             ; C118 FF                       .
        brk                                     ; C119 00                       .
        ora     (L0000,x)                       ; C11A 01 00                    ..
        ora     (L0000,x)                       ; C11C 01 00                    ..
        ora     (L0000,x)                       ; C11E 01 00                    ..
        .byte   $03                             ; C120 03                       .
        brk                                     ; C121 00                       .
        ora     (L0000,x)                       ; C122 01 00                    ..
        ora     (L0000,x)                       ; C124 01 00                    ..
        ora     (L0000,x)                       ; C126 01 00                    ..
        .byte   $03                             ; C128 03                       .
        brk                                     ; C129 00                       .
        ora     (L0000,x)                       ; C12A 01 00                    ..
        ora     (L0000,x)                       ; C12C 01 00                    ..
        ora     (L0000,x)                       ; C12E 01 00                    ..
        .byte   $03                             ; C130 03                       .
        brk                                     ; C131 00                       .
        ora     (L0000,x)                       ; C132 01 00                    ..
        ora     (L0000,x)                       ; C134 01 00                    ..
        ora     (L0000,x)                       ; C136 01 00                    ..
        .byte   $03                             ; C138 03                       .
        .byte   $FF                             ; C139 FF                       .
        brk                                     ; C13A 00                       .
        ora     ($02,x)                         ; C13B 01 02                    ..
        .byte   $03                             ; C13D 03                       .
        .byte   $04                             ; C13E 04                       .
        brk                                     ; C13F 00                       .
        ora     ($02,x)                         ; C140 01 02                    ..
        .byte   $03                             ; C142 03                       .
        .byte   $04                             ; C143 04                       .
        brk                                     ; C144 00                       .
        ora     ($02,x)                         ; C145 01 02                    ..
        .byte   $03                             ; C147 03                       .
        .byte   $04                             ; C148 04                       .
        brk                                     ; C149 00                       .
        ora     ($02,x)                         ; C14A 01 02                    ..
        .byte   $03                             ; C14C 03                       .
        .byte   $04                             ; C14D 04                       .
        brk                                     ; C14E 00                       .
        ora     ($02,x)                         ; C14F 01 02                    ..
        .byte   $03                             ; C151 03                       .
        .byte   $04                             ; C152 04                       .
        brk                                     ; C153 00                       .
        ora     ($02,x)                         ; C154 01 02                    ..
        .byte   $03                             ; C156 03                       .
        .byte   $04                             ; C157 04                       .
        brk                                     ; C158 00                       .
        ora     ($FF,x)                         ; C159 01 FF                    ..
        .byte   $04                             ; C15B 04                       .
        .byte   $04                             ; C15C 04                       .
        .byte   $04                             ; C15D 04                       .
        .byte   $04                             ; C15E 04                       .
        .byte   $04                             ; C15F 04                       .
        .byte   $04                             ; C160 04                       .
        .byte   $04                             ; C161 04                       .
        .byte   $03                             ; C162 03                       .
        .byte   $04                             ; C163 04                       .
        .byte   $04                             ; C164 04                       .
        .byte   $04                             ; C165 04                       .
        .byte   $04                             ; C166 04                       .
        .byte   $04                             ; C167 04                       .
        .byte   $04                             ; C168 04                       .
        .byte   $04                             ; C169 04                       .
        .byte   $03                             ; C16A 03                       .
        .byte   $04                             ; C16B 04                       .
        .byte   $04                             ; C16C 04                       .
        .byte   $04                             ; C16D 04                       .
        .byte   $04                             ; C16E 04                       .
        .byte   $04                             ; C16F 04                       .
        .byte   $04                             ; C170 04                       .
        .byte   $04                             ; C171 04                       .
        .byte   $03                             ; C172 03                       .
        .byte   $04                             ; C173 04                       .
        .byte   $04                             ; C174 04                       .
        .byte   $04                             ; C175 04                       .
        .byte   $04                             ; C176 04                       .
        .byte   $04                             ; C177 04                       .
        .byte   $04                             ; C178 04                       .
        .byte   $04                             ; C179 04                       .
        .byte   $03                             ; C17A 03                       .
        .byte   $FF                             ; C17B FF                       .
        .byte   $04                             ; C17C 04                       .
        .byte   $02                             ; C17D 02                       .
        .byte   $04                             ; C17E 04                       .
        .byte   $03                             ; C17F 03                       .
        .byte   $04                             ; C180 04                       .
        .byte   $02                             ; C181 02                       .
        .byte   $04                             ; C182 04                       .
        .byte   $03                             ; C183 03                       .
        .byte   $04                             ; C184 04                       .
        .byte   $02                             ; C185 02                       .
        .byte   $04                             ; C186 04                       .
        .byte   $03                             ; C187 03                       .
        .byte   $04                             ; C188 04                       .
        .byte   $02                             ; C189 02                       .
        .byte   $04                             ; C18A 04                       .
        .byte   $03                             ; C18B 03                       .
        .byte   $04                             ; C18C 04                       .
        .byte   $02                             ; C18D 02                       .
        .byte   $04                             ; C18E 04                       .
        .byte   $03                             ; C18F 03                       .
        .byte   $04                             ; C190 04                       .
        .byte   $02                             ; C191 02                       .
        .byte   $04                             ; C192 04                       .
        .byte   $03                             ; C193 03                       .
        .byte   $04                             ; C194 04                       .
        .byte   $02                             ; C195 02                       .
LC196:  .byte   $04                             ; C196 04                       .
        .byte   $03                             ; C197 03                       .
        .byte   $04                             ; C198 04                       .
        .byte   $02                             ; C199 02                       .
        .byte   $04                             ; C19A 04                       .
        .byte   $03                             ; C19B 03                       .
        .byte   $FF                             ; C19C FF                       .
        .byte   $BB                             ; C19D BB                       .
        cmp     ($C0,x)                         ; C19E C1 C0                    ..
        .byte   $C3                             ; C1A0 C3                       .
        inc     $13C3                           ; C1A1 EE C3 13                 ...
        cpy     $52                             ; C1A4 C4 52                    .R
        cpy     $7D                             ; C1A6 C4 7D                    .}
        dec     $8B                             ; C1A8 C6 8B                    ..
        dec     $47                             ; C1AA C6 47                    .G
        cmp     #$5E                            ; C1AC C9 5E                    .^
        cmp     #$2D                            ; C1AE C9 2D                    .-
        dex                                     ; C1B0 CA                       .
        lsr     $CA                             ; C1B1 46 CA                    F.
        .byte   $67                             ; C1B3 67                       g
        dex                                     ; C1B4 CA                       .
        ror     $78CA                           ; C1B5 6E CA 78                 n.x
        dex                                     ; C1B8 CA                       .
        plp                                     ; C1B9 28                       (
        cpy     $2000                           ; C1BA CC 00 20                 .. 
        .byte   $FF                             ; C1BD FF                       .
        .byte   $FF                             ; C1BE FF                       .
        jsr     L0210                           ; C1BF 20 10 02                  ..
        .byte   $FF                             ; C1C2 FF                       .
        ora     ($D7,x)                         ; C1C3 01 D7                    ..
        jsr     LB5A5                           ; C1C5 20 A5 B5                  ..
        .byte   $FF                             ; C1C8 FF                       .
        asl     L0101                           ; C1C9 0E 01 01                 ...
        .byte   $FF                             ; C1CC FF                       .
        ora     $62                             ; C1CD 05 62                    .b
        ora     ($61,x)                         ; C1CF 01 61                    .a
        ldx     #$A0                            ; C1D1 A2 A0                    ..
        .byte   $02                             ; C1D3 02                       .
        .byte   $B2                             ; C1D4 B2                       .
        ldy     $D0                             ; C1D5 A4 D0                    ..
        ora     (L0001,x)                       ; C1D7 01 01                    ..
        .byte   $D3                             ; C1D9 D3                       .
        .byte   $FF                             ; C1DA FF                       .
        ora     L0101                           ; C1DB 0D 01 01                 ...
        .byte   $FF                             ; C1DE FF                       .
        ora     $72                             ; C1DF 05 72                    .r
        ora     ($71,x)                         ; C1E1 01 71                    .q
        .byte   $B2                             ; C1E3 B2                       .
        ora     ($E0,x)                         ; C1E4 01 E0                    ..
        ora     ($B4,x)                         ; C1E6 01 B4                    ..
        ora     (L0001,x)                       ; C1E8 01 01                    ..
        .byte   $E2                             ; C1EA E2                       .
        .byte   $E3                             ; C1EB E3                       .
        .byte   $22                             ; C1EC 22                       "
        .byte   $23                             ; C1ED 23                       #
        .byte   $FF                             ; C1EE FF                       .
        .byte   $0B                             ; C1EF 0B                       .
        ora     (L0001,x)                       ; C1F0 01 01                    ..
        .byte   $FF                             ; C1F2 FF                       .
        ora     $82                             ; C1F3 05 82                    ..
        ora     ($81,x)                         ; C1F5 01 81                    ..
        .byte   $01                             ; C1F7 01                       .
LC1F8:  ora     ($F0,x)                         ; C1F8 01 F0                    ..
        ora     ($C4,x)                         ; C1FA 01 C4                    ..
LC1FC:  ora     (L0001,x)                       ; C1FC 01 01                    ..
        .byte   $F2                             ; C1FE F2                       .
        .byte   $F3                             ; C1FF F3                       .
        .byte   $FF                             ; C200 FF                       .
        asl     a                               ; C201 0A                       .
        rts                                     ; C202 60                       `

; ----------------------------------------------------------------------------
        bcc     LC196                           ; C203 90 91                    ..
        ora     (L0001,x)                       ; C205 01 01                    ..
        .byte   $02                             ; C207 02                       .
        pla                                     ; C208 68                       h
        adc     #$6A                            ; C209 69 6A                    ij
        .byte   $6B                             ; C20B 6B                       k
        .byte   $92                             ; C20C 92                       .
        ora     (L0001,x)                       ; C20D 01 01                    ..
        ora     (L0001,x)                       ; C20F 01 01                    ..
        ora     ($65,x)                         ; C211 01 65                    .e
        .byte   $D4                             ; C213 D4                       .
        cmp     L0001,x                         ; C214 D5 01                    ..
        ora     ($C5,x)                         ; C216 01 C5                    ..
        .byte   $FF                             ; C218 FF                       .
        asl     a                               ; C219 0A                       .
        bvs     LC21D                           ; C21A 70 01                    p.
        .byte   $A1                             ; C21C A1                       .
LC21D:  ora     ($A3,x)                         ; C21D 01 A3                    ..
        .byte   $02                             ; C21F 02                       .
        sei                                     ; C220 78                       x
        adc     $7B7A,y                         ; C221 79 7A 7B                 yz{
        .byte   $02                             ; C224 02                       .
        .byte   $62                             ; C225 62                       b
        ora     ($63,x)                         ; C226 01 63                    .c
        .byte   $64                             ; C228 64                       d
        ora     ($75,x)                         ; C229 01 75                    .u
        cpx     $E5                             ; C22B E4 E5                    ..
        sbc     L0001,x                         ; C22D F5 01                    ..
        ora     ($FF,x)                         ; C22F 01 FF                    ..
        asl     a                               ; C231 0A                       .
        .byte   $80                             ; C232 80                       .
        bcs     LC236                           ; C233 B0 01                    ..
        .byte   $01                             ; C235 01                       .
LC236:  .byte   $B3                             ; C236 B3                       .
        .byte   $02                             ; C237 02                       .
        dey                                     ; C238 88                       .
        .byte   $89                             ; C239 89                       .
        txa                                     ; C23A 8A                       .
        .byte   $8B                             ; C23B 8B                       .
        .byte   $02                             ; C23C 02                       .
        .byte   $72                             ; C23D 72                       r
        ora     ($73,x)                         ; C23E 01 73                    .s
        .byte   $74                             ; C240 74                       t
        ora     ($85,x)                         ; C241 01 85                    ..
        .byte   $F4                             ; C243 F4                       .
        ora     (L0001,x)                       ; C244 01 01                    ..
        ora     ($66,x)                         ; C246 01 66                    .f
        .byte   $FF                             ; C248 FF                       .
        .byte   $0B                             ; C249 0B                       .
        cpy     #$C1                            ; C24A C0 C1                    ..
        .byte   $C2                             ; C24C C2                       .
        .byte   $C3                             ; C24D C3                       .
        .byte   $02                             ; C24E 02                       .
        tya                                     ; C24F 98                       .
        sta     $9B9A,y                         ; C250 99 9A 9B                 ...
        .byte   $02                             ; C253 02                       .
        .byte   $93                             ; C254 93                       .
        sty     $83,x                           ; C255 94 83                    ..
        sty     $94                             ; C257 84 94                    ..
        sta     $B1,x                           ; C259 95 B1                    ..
        cmp     ($D2),y                         ; C25B D1 D2                    ..
        sbc     ($F1,x)                         ; C25D E1 F1                    ..
        .byte   $FF                             ; C25F FF                       .
        .byte   $0B                             ; C260 0B                       .
        stx     $87                             ; C261 86 87                    ..
        ldx     $A7                             ; C263 A6 A7                    ..
        .byte   $02                             ; C265 02                       .
        tay                                     ; C266 A8                       .
        lda     #$AA                            ; C267 A9 AA                    ..
        .byte   $AB                             ; C269 AB                       .
        .byte   $02                             ; C26A 02                       .
        sty     $8E8D                           ; C26B 8C 8D 8E                 ...
        .byte   $8F                             ; C26E 8F                       .
        .byte   $02                             ; C26F 02                       .
        .byte   $02                             ; C270 02                       .
        .byte   $02                             ; C271 02                       .
        .byte   $02                             ; C272 02                       .
        .byte   $02                             ; C273 02                       .
        .byte   $02                             ; C274 02                       .
        .byte   $02                             ; C275 02                       .
        .byte   $02                             ; C276 02                       .
        .byte   $02                             ; C277 02                       .
        .byte   $02                             ; C278 02                       .
        .byte   $FF                             ; C279 FF                       .
        php                                     ; C27A 08                       .
        stx     $97,y                           ; C27B 96 97                    ..
        ldx     $B7,y                           ; C27D B6 B7                    ..
        .byte   $02                             ; C27F 02                       .
        clv                                     ; C280 B8                       .
        lda     $BBBA,y                         ; C281 B9 BA BB                 ...
        .byte   $02                             ; C284 02                       .
        .byte   $9C                             ; C285 9C                       .
        sta     $9F9E,x                         ; C286 9D 9E 9F                 ...
        .byte   $FF                             ; C289 FF                       .
        ora     $5D5C                           ; C28A 0D 5C 5D                 .\]
        eor     $5C5F,x                         ; C28D 5D 5F 5C                 ]_\
        eor     $5F5E,x                         ; C290 5D 5E 5F                 ]^_
        jmp     (L6E6D)                         ; C293 6C 6D 6E                 lmn

; ----------------------------------------------------------------------------
        .byte   $6F                             ; C296 6F                       o
        .byte   $7C                             ; C297 7C                       |
        adc     $7F7E,x                         ; C298 7D 7E 7F                 }~.
        .byte   $5C                             ; C29B 5C                       \
        eor     $5F5E,x                         ; C29C 5D 5E 5F                 ]^_
        .byte   $5C                             ; C29F 5C                       \
        eor     $5F5E,x                         ; C2A0 5D 5E 5F                 ]^_
        .byte   $5C                             ; C2A3 5C                       \
        eor     $5F5E,x                         ; C2A4 5D 5E 5F                 ]^_
        .byte   $5C                             ; C2A7 5C                       \
        eor     $5F5E,x                         ; C2A8 5D 5E 5F                 ]^_
        .byte   $04                             ; C2AB 04                       .
        ora     L0006                           ; C2AC 05 06                    ..
        .byte   $07                             ; C2AE 07                       .
        .byte   $04                             ; C2AF 04                       .
        ora     L0006                           ; C2B0 05 06                    ..
        .byte   $07                             ; C2B2 07                       .
        .byte   $04                             ; C2B3 04                       .
        ora     L0006                           ; C2B4 05 06                    ..
        .byte   $07                             ; C2B6 07                       .
        .byte   $04                             ; C2B7 04                       .
        ora     L0006                           ; C2B8 05 06                    ..
        .byte   $07                             ; C2BA 07                       .
        .byte   $04                             ; C2BB 04                       .
        ora     L0006                           ; C2BC 05 06                    ..
        .byte   $07                             ; C2BE 07                       .
        .byte   $04                             ; C2BF 04                       .
        ora     L0006                           ; C2C0 05 06                    ..
        .byte   $07                             ; C2C2 07                       .
        .byte   $04                             ; C2C3 04                       .
        ora     L0006                           ; C2C4 05 06                    ..
        .byte   $07                             ; C2C6 07                       .
        .byte   $04                             ; C2C7 04                       .
        ora     L0006                           ; C2C8 05 06                    ..
        .byte   $07                             ; C2CA 07                       .
        .byte   $14                             ; C2CB 14                       .
        ora     $16,x                           ; C2CC 15 16                    ..
        .byte   $17                             ; C2CE 17                       .
        .byte   $14                             ; C2CF 14                       .
        ora     $16,x                           ; C2D0 15 16                    ..
        .byte   $17                             ; C2D2 17                       .
        .byte   $14                             ; C2D3 14                       .
        ora     $16,x                           ; C2D4 15 16                    ..
        .byte   $17                             ; C2D6 17                       .
        .byte   $14                             ; C2D7 14                       .
        ora     $16,x                           ; C2D8 15 16                    ..
        .byte   $17                             ; C2DA 17                       .
        .byte   $14                             ; C2DB 14                       .
        ora     $16,x                           ; C2DC 15 16                    ..
        .byte   $17                             ; C2DE 17                       .
        .byte   $14                             ; C2DF 14                       .
        ora     $16,x                           ; C2E0 15 16                    ..
        .byte   $17                             ; C2E2 17                       .
        .byte   $14                             ; C2E3 14                       .
        ora     $16,x                           ; C2E4 15 16                    ..
        .byte   $17                             ; C2E6 17                       .
        .byte   $14                             ; C2E7 14                       .
        ora     $16,x                           ; C2E8 15 16                    ..
        .byte   $17                             ; C2EA 17                       .
        .byte   $FF                             ; C2EB FF                       .
        ora     ($86,x)                         ; C2EC 01 86                    ..
        .byte   $22                             ; C2EE 22                       "
        rti                                     ; C2EF 40                       @

; ----------------------------------------------------------------------------
        and     ($39),y                         ; C2F0 31 39                    19
        sec                                     ; C2F2 38                       8
        .byte   $37                             ; C2F3 37                       7
        jsr     L4A4C                           ; C2F4 20 4C 4A                  LJ
        lsr     $5420                           ; C2F7 4E 20 54                 N T
        .byte   $4F                             ; C2FA 4F                       O
        eor     $2C53,y                         ; C2FB 59 53 2C                 YS,
        .byte   $4C                             ; C2FE 4C                       L
        .byte   $54                             ; C2FF 54                       T
LC300:  .byte   $44                             ; C300 44                       D
        rol     $13FF                           ; C301 2E FF 13                 ...
        .byte   $54                             ; C304 54                       T
        eor     $4026                           ; C305 4D 26 40                 M&@
        and     ($39),y                         ; C308 31 39                    19
        sec                                     ; C30A 38                       8
        .byte   $37                             ; C30B 37                       7
        .byte   $FF                             ; C30C FF                       .
        .byte   $0F                             ; C30D 0F                       .
        eor     $4E,x                           ; C30E 55 4E                    UN
        eor     #$56                            ; C310 49 56                    IV
        eor     $52                             ; C312 45 52                    ER
        .byte   $53                             ; C314 53                       S
        eor     ($4C,x)                         ; C315 41 4C                    AL
        jsr     L4943                           ; C317 20 43 49                  CI
        .byte   $54                             ; C31A 54                       T
        eor     $5320,y                         ; C31B 59 20 53                 Y S
        .byte   $54                             ; C31E 54                       T
        eor     $44,x                           ; C31F 55 44                    UD
        eor     #$4F                            ; C321 49 4F                    IO
        .byte   $53                             ; C323 53                       S
        bit     $4E49                           ; C324 2C 49 4E                 ,IN
        .byte   $43                             ; C327 43                       C
        rol     $08FF                           ; C328 2E FF 08                 ...
        eor     ($4C,x)                         ; C32B 41 4C                    AL
        jmp     L5220                           ; C32D 4C 20 52                 L R

; ----------------------------------------------------------------------------
        eor     #$47                            ; C330 49 47                    IG
        pha                                     ; C332 48                       H
        .byte   $54                             ; C333 54                       T
        .byte   $53                             ; C334 53                       S
        jsr     L4552                           ; C335 20 52 45                  RE
        .byte   $53                             ; C338 53                       S
        eor     $52                             ; C339 45 52                    ER
        lsr     $45,x                           ; C33B 56 45                    VE
        .byte   $44                             ; C33D 44                       D
        rol     $09FF                           ; C33E 2E FF 09                 ...
        jmp     L4349                           ; C341 4C 49 43                 LIC

; ----------------------------------------------------------------------------
        eor     $4E                             ; C344 45 4E                    EN
        .byte   $53                             ; C346 53                       S
        eor     $44                             ; C347 45 44                    ED
        jsr     L5942                           ; C349 20 42 59                  BY
        jsr     L454D                           ; C34C 20 4D 45                  ME
        .byte   $52                             ; C34F 52                       R
        .byte   $43                             ; C350 43                       C
        pha                                     ; C351 48                       H
        eor     ($4E,x)                         ; C352 41 4E                    AN
        .byte   $44                             ; C354 44                       D
        eor     #$53                            ; C355 49 53                    IS
        eor     #$4E                            ; C357 49 4E                    IN
        .byte   $47                             ; C359 47                       G
        .byte   $FF                             ; C35A FF                       .
        .byte   $07                             ; C35B 07                       .
        .byte   $43                             ; C35C 43                       C
        .byte   $4F                             ; C35D 4F                       O
        .byte   $52                             ; C35E 52                       R
        bvc     LC3B0                           ; C35F 50 4F                    PO
        .byte   $52                             ; C361 52                       R
        eor     ($54,x)                         ; C362 41 54                    AT
        eor     #$4F                            ; C364 49 4F                    IO
        lsr     $4F20                           ; C366 4E 20 4F                 N O
        lsr     $20                             ; C369 46 20                    F 
        eor     ($4D,x)                         ; C36B 41 4D                    AM
        eor     $52                             ; C36D 45 52                    ER
        eor     #$43                            ; C36F 49 43                    IC
        eor     ($2C,x)                         ; C371 41 2C                    A,
        eor     #$4E                            ; C373 49 4E                    IN
        .byte   $43                             ; C375 43                       C
        rol     $06FF                           ; C376 2E FF 06                 ...
        jmp     L4349                           ; C379 4C 49 43                 LIC

; ----------------------------------------------------------------------------
        eor     $4E                             ; C37C 45 4E                    EN
        .byte   $53                             ; C37E 53                       S
        eor     $44                             ; C37F 45 44                    ED
        jsr     L5942                           ; C381 20 42 59                  BY
        jsr     L494E                           ; C384 20 4E 49                  NI
        lsr     $4554                           ; C387 4E 54 45                 NTE
        lsr     $4F44                           ; C38A 4E 44 4F                 NDO
        jsr     L464F                           ; C38D 20 4F 46                  OF
        .byte   $FF                             ; C390 FF                       .
        .byte   $0F                             ; C391 0F                       .
        eor     ($4D,x)                         ; C392 41 4D                    AM
        eor     $52                             ; C394 45 52                    ER
        eor     #$43                            ; C396 49 43                    IC
        eor     ($2C,x)                         ; C398 41 2C                    A,
        eor     #$4E                            ; C39A 49 4E                    IN
        .byte   $43                             ; C39C 43                       C
        rol     $01FF                           ; C39D 2E FF 01                 ...
        cpy     #$23                            ; C3A0 C0 23                    .#
        .byte   $FF                             ; C3A2 FF                       .
        .byte   $FF                             ; C3A3 FF                       .
        .byte   $12                             ; C3A4 12                       .
        ora     ($AA,x)                         ; C3A5 01 AA                    ..
        .byte   $FF                             ; C3A7 FF                       .
        ora     ($D2,x)                         ; C3A8 01 D2                    ..
        .byte   $23                             ; C3AA 23                       #
        ror     a                               ; C3AB 6A                       j
        txs                                     ; C3AC 9A                       .
        tax                                     ; C3AD AA                       .
        tax                                     ; C3AE AA                       .
        tax                                     ; C3AF AA                       .
LC3B0:  tax                                     ; C3B0 AA                       .
        tax                                     ; C3B1 AA                       .
        asl     a                               ; C3B2 0A                       .
        lsr     $19                             ; C3B3 46 19                    F.
        asl     a                               ; C3B5 0A                       .
        tax                                     ; C3B6 AA                       .
        tax                                     ; C3B7 AA                       .
        tax                                     ; C3B8 AA                       .
        .byte   $FF                             ; C3B9 FF                       .
        .byte   $FF                             ; C3BA FF                       .
        jsr     L0001                           ; C3BB 20 01 00                  ..
        .byte   $FF                             ; C3BE FF                       .
        brk                                     ; C3BF 00                       .
        brk                                     ; C3C0 00                       .
        .byte   $2B                             ; C3C1 2B                       +
        .byte   $FF                             ; C3C2 FF                       .
        .byte   $FF                             ; C3C3 FF                       .
        jsr     L2006                           ; C3C4 20 06 20                  . 
        .byte   $FF                             ; C3C7 FF                       .
        ora     ($F0,x)                         ; C3C8 01 F0                    ..
        .byte   $2B                             ; C3CA 2B                       +
        .byte   $FF                             ; C3CB FF                       .
        .byte   $FF                             ; C3CC FF                       .
        bpl     LC3D0                           ; C3CD 10 01                    ..
        brk                                     ; C3CF 00                       .
LC3D0:  .byte   $FF                             ; C3D0 FF                       .
        ora     ($61,x)                         ; C3D1 01 61                    .a
        .byte   $2B                             ; C3D3 2B                       +
        .byte   $53                             ; C3D4 53                       S
        .byte   $43                             ; C3D5 43                       C
        .byte   $4F                             ; C3D6 4F                       O
        .byte   $52                             ; C3D7 52                       R
        eor     $FF                             ; C3D8 45 FF                    E.
        .byte   $03                             ; C3DA 03                       .
        bpl     LC3EE                           ; C3DB 10 11                    ..
        .byte   $12                             ; C3DD 12                       .
        .byte   $13                             ; C3DE 13                       .
        .byte   $10                             ; C3DF 10                       .
LC3E0:  .byte   $FF                             ; C3E0 FF                       .
        asl     $4A                             ; C3E1 06 4A                    .J
        eor     ($57,x)                         ; C3E3 41 57                    AW
        .byte   $53                             ; C3E5 53                       S
        .byte   $2F                             ; C3E6 2F                       /
        bvc     LC438                           ; C3E7 50 4F                    PO
        .byte   $57                             ; C3E9 57                       W
        eor     $52                             ; C3EA 45 52                    ER
        .byte   $FF                             ; C3EC FF                       .
        brk                                     ; C3ED 00                       .
LC3EE:  iny                                     ; C3EE C8                       .
        .byte   $23                             ; C3EF 23                       #
        .byte   $FF                             ; C3F0 FF                       .
        .byte   $FF                             ; C3F1 FF                       .
        clc                                     ; C3F2 18                       .
        ora     ($FF,x)                         ; C3F3 01 FF                    ..
        .byte   $FF                             ; C3F5 FF                       .
        ora     ($E0,x)                         ; C3F6 01 E0                    ..
        .byte   $23                             ; C3F8 23                       #
        eor     $55,x                           ; C3F9 55 55                    UU
        eor     $55,x                           ; C3FB 55 55                    UU
        eor     $55,x                           ; C3FD 55 55                    UU
        eor     $55,x                           ; C3FF 55 55                    UU
        ror     a                               ; C401 6A                       j
        tax                                     ; C402 AA                       .
        tax                                     ; C403 AA                       .
        txs                                     ; C404 9A                       .
        tax                                     ; C405 AA                       .
        tax                                     ; C406 AA                       .
        tax                                     ; C407 AA                       .
        tax                                     ; C408 AA                       .
        ldx     $AA                             ; C409 A6 AA                    ..
        lda     #$A9                            ; C40B A9 A9                    ..
        tax                                     ; C40D AA                       .
        tax                                     ; C40E AA                       .
        ldx     $A9                             ; C40F A6 A9                    ..
        .byte   $FF                             ; C411 FF                       .
        brk                                     ; C412 00                       .
        iny                                     ; C413 C8                       .
        .byte   $23                             ; C414 23                       #
        .byte   $FF                             ; C415 FF                       .
        .byte   $FF                             ; C416 FF                       .
        bpl     LC41A                           ; C417 10 01                    ..
        .byte   $FF                             ; C419 FF                       .
LC41A:  .byte   $FF                             ; C41A FF                       .
        ora     ($D8,x)                         ; C41B 01 D8                    ..
        .byte   $23                             ; C41D 23                       #
        .byte   $5F                             ; C41E 5F                       _
        .byte   $5F                             ; C41F 5F                       _
        .byte   $5F                             ; C420 5F                       _
        .byte   $5F                             ; C421 5F                       _
        .byte   $5F                             ; C422 5F                       _
        .byte   $5F                             ; C423 5F                       _
        .byte   $5F                             ; C424 5F                       _
        .byte   $5F                             ; C425 5F                       _
        .byte   $FF                             ; C426 FF                       .
        .byte   $FF                             ; C427 FF                       .
        clc                                     ; C428 18                       .
        ora     ($55,x)                         ; C429 01 55                    .U
        .byte   $FF                             ; C42B FF                       .
        ora     ($F8,x)                         ; C42C 01 F8                    ..
        .byte   $23                             ; C42E 23                       #
        ora     $05                             ; C42F 05 05                    ..
        ora     $05                             ; C431 05 05                    ..
        ora     $05                             ; C433 05 05                    ..
        ora     $05                             ; C435 05 05                    ..
        .byte   $FF                             ; C437 FF                       .
LC438:  ora     ($C0,x)                         ; C438 01 C0                    ..
        .byte   $2B                             ; C43A 2B                       +
        eor     $55,x                           ; C43B 55 55                    UU
        eor     $55,x                           ; C43D 55 55                    UU
        eor     $55,x                           ; C43F 55 55                    UU
        eor     $55,x                           ; C441 55 55                    UU
        tax                                     ; C443 AA                       .
        tax                                     ; C444 AA                       .
        tax                                     ; C445 AA                       .
        tax                                     ; C446 AA                       .
        tax                                     ; C447 AA                       .
        tax                                     ; C448 AA                       .
        tax                                     ; C449 AA                       .
        tax                                     ; C44A AA                       .
        .byte   $FF                             ; C44B FF                       .
        .byte   $FF                             ; C44C FF                       .
        php                                     ; C44D 08                       .
        ora     ($0A,x)                         ; C44E 01 0A                    ..
        .byte   $FF                             ; C450 FF                       .
        brk                                     ; C451 00                       .
        brk                                     ; C452 00                       .
        jsr     LFFFF                           ; C453 20 FF FF                  ..
        jsr     L021A                           ; C456 20 1A 02                  ..
        .byte   $FF                             ; C459 FF                       .
        .byte   $FF                             ; C45A FF                       .
        jsr     L0004                           ; C45B 20 04 00                  ..
        .byte   $FF                             ; C45E FF                       .
        ora     ($40,x)                         ; C45F 01 40                    .@
        jsr     L0F0E                           ; C461 20 0E 0F                  ..
        .byte   $FF                             ; C464 FF                       .
        .byte   $04                             ; C465 04                       .
        asl     a                               ; C466 0A                       .
        .byte   $0B                             ; C467 0B                       .
        .byte   $0C                             ; C468 0C                       .
        ora     L0F0E                           ; C469 0D 0E 0F                 ...
        .byte   $FF                             ; C46C FF                       .
        bpl     LC479                           ; C46D 10 0A                    ..
        .byte   $0B                             ; C46F 0B                       .
        .byte   $0C                             ; C470 0C                       .
        ora     $1F1E                           ; C471 0D 1E 1F                 ...
        .byte   $FF                             ; C474 FF                       .
        .byte   $04                             ; C475 04                       .
        .byte   $1A                             ; C476 1A                       .
        .byte   $1B                             ; C477 1B                       .
        .byte   $1C                             ; C478 1C                       .
LC479:  ora     $1F1E,x                         ; C479 1D 1E 1F                 ...
        .byte   $02                             ; C47C 02                       .
        bit     $25                             ; C47D 24 25                    $%
        rol     $27                             ; C47F 26 27                    &'
        .byte   $02                             ; C481 02                       .
        asl     a                               ; C482 0A                       .
        .byte   $0B                             ; C483 0B                       .
        .byte   $0C                             ; C484 0C                       .
        ora     L0F0E                           ; C485 0D 0E 0F                 ...
        and     $26                             ; C488 25 26                    %&
        .byte   $27                             ; C48A 27                       '
        .byte   $02                             ; C48B 02                       .
        .byte   $1A                             ; C48C 1A                       .
        .byte   $1B                             ; C48D 1B                       .
LC48E:  .byte   $1C                             ; C48E 1C                       .
        ora     $0274,x                         ; C48F 1D 74 02                 .t.
        bit     $25                             ; C492 24 25                    $%
        rol     $27                             ; C494 26 27                    &'
        .byte   $FF                             ; C496 FF                       .
        ora     $74                             ; C497 05 74                    .t
        .byte   $02                             ; C499 02                       .
        .byte   $34                             ; C49A 34                       4
        and     $36,x                           ; C49B 35 36                    56
        .byte   $37                             ; C49D 37                       7
        .byte   $02                             ; C49E 02                       .
        .byte   $1A                             ; C49F 1A                       .
        .byte   $1B                             ; C4A0 1B                       .
        .byte   $1C                             ; C4A1 1C                       .
        ora     $1F1E,x                         ; C4A2 1D 1E 1F                 ...
        and     $36,x                           ; C4A5 35 36                    56
        .byte   $37                             ; C4A7 37                       7
        .byte   $FF                             ; C4A8 FF                       .
        .byte   $04                             ; C4A9 04                       .
        .byte   $74                             ; C4AA 74                       t
        .byte   $02                             ; C4AB 02                       .
        .byte   $02                             ; C4AC 02                       .
        .byte   $34                             ; C4AD 34                       4
        and     $36,x                           ; C4AE 35 36                    56
        .byte   $37                             ; C4B0 37                       7
        .byte   $74                             ; C4B1 74                       t
        adc     $02,x                           ; C4B2 75 02                    u.
        .byte   $17                             ; C4B4 17                       .
        clc                                     ; C4B5 18                       .
        ora     $03FF,y                         ; C4B6 19 FF 03                 ...
        .byte   $17                             ; C4B9 17                       .
        clc                                     ; C4BA 18                       .
        ora     $03FF,y                         ; C4BB 19 FF 03                 ...
        .byte   $74                             ; C4BE 74                       t
        .byte   $02                             ; C4BF 02                       .
        .byte   $02                             ; C4C0 02                       .
        .byte   $74                             ; C4C1 74                       t
        adc     $02,x                           ; C4C2 75 02                    u.
        .byte   $17                             ; C4C4 17                       .
        clc                                     ; C4C5 18                       .
        ora     $0202,y                         ; C4C6 19 02 02                 ...
        .byte   $74                             ; C4C9 74                       t
        adc     $02,x                           ; C4CA 75 02                    u.
        .byte   $02                             ; C4CC 02                       .
        .byte   $74                             ; C4CD 74                       t
        adc     $FF,x                           ; C4CE 75 FF                    u.
        ora     $74                             ; C4D0 05 74                    .t
        .byte   $74                             ; C4D2 74                       t
        adc     $FF,x                           ; C4D3 75 FF                    u.
        .byte   $04                             ; C4D5 04                       .
        .byte   $74                             ; C4D6 74                       t
        adc     $02,x                           ; C4D7 75 02                    u.
        .byte   $02                             ; C4D9 02                       .
        .byte   $17                             ; C4DA 17                       .
        clc                                     ; C4DB 18                       .
        ora     $03FF,y                         ; C4DC 19 FF 03                 ...
        .byte   $74                             ; C4DF 74                       t
        adc     $FF,x                           ; C4E0 75 FF                    u.
        bmi     LC4E5                           ; C4E2 30 01                    0.
        .byte   $01                             ; C4E4 01                       .
LC4E5:  ora     (L0001,x)                       ; C4E5 01 01                    ..
        .byte   $FF                             ; C4E7 FF                       .
        .byte   $02                             ; C4E8 02                       .
        ora     (L0001,x)                       ; C4E9 01 01                    ..
        ora     (L0001,x)                       ; C4EB 01 01                    ..
        ora     (L0001,x)                       ; C4ED 01 01                    ..
        .byte   $FF                             ; C4EF FF                       .
        .byte   $14                             ; C4F0 14                       .
        .byte   $04                             ; C4F1 04                       .
        ora     $09                             ; C4F2 05 09                    ..
        ora     ($FF,x)                         ; C4F4 01 FF                    ..
        .byte   $02                             ; C4F6 02                       .
        .byte   $04                             ; C4F7 04                       .
        ora     L0006                           ; C4F8 05 06                    ..
        .byte   $07                             ; C4FA 07                       .
        php                                     ; C4FB 08                       .
        ora     #$FF                            ; C4FC 09 FF                    ..
        asl     $10                             ; C4FE 06 10                    ..
        ora     ($12),y                         ; C500 11 12                    ..
        .byte   $13                             ; C502 13                       .
        bpl     LC516                           ; C503 10 11                    ..
        .byte   $12                             ; C505 12                       .
        .byte   $13                             ; C506 13                       .
        bpl     LC51A                           ; C507 10 11                    ..
        .byte   $12                             ; C509 12                       .
        .byte   $13                             ; C50A 13                       .
        bpl     LC51E                           ; C50B 10 11                    ..
        .byte   $12                             ; C50D 12                       .
        .byte   $13                             ; C50E 13                       .
        bpl     LC522                           ; C50F 10 11                    ..
        .byte   $12                             ; C511 12                       .
        .byte   $13                             ; C512 13                       .
        bpl     LC526                           ; C513 10 11                    ..
        .byte   $12                             ; C515 12                       .
LC516:  .byte   $13                             ; C516 13                       .
        bpl     LC52A                           ; C517 10 11                    ..
        .byte   $12                             ; C519 12                       .
LC51A:  .byte   $13                             ; C51A 13                       .
        bpl     LC52E                           ; C51B 10 11                    ..
        .byte   $12                             ; C51D 12                       .
LC51E:  .byte   $13                             ; C51E 13                       .
        jsr     L2221                           ; C51F 20 21 22                  !"
LC522:  .byte   $23                             ; C522 23                       #
        jsr     L2221                           ; C523 20 21 22                  !"
LC526:  .byte   $23                             ; C526 23                       #
        jsr     L2221                           ; C527 20 21 22                  !"
LC52A:  .byte   $23                             ; C52A 23                       #
        jsr     L2221                           ; C52B 20 21 22                  !"
LC52E:  .byte   $23                             ; C52E 23                       #
        jsr     L2221                           ; C52F 20 21 22                  !"
        .byte   $23                             ; C532 23                       #
        jsr     L2221                           ; C533 20 21 22                  !"
        .byte   $23                             ; C536 23                       #
        jsr     L2221                           ; C537 20 21 22                  !"
        .byte   $23                             ; C53A 23                       #
        jsr     L2221                           ; C53B 20 21 22                  !"
        .byte   $23                             ; C53E 23                       #
        bmi     LC572                           ; C53F 30 31                    01
        .byte   $32                             ; C541 32                       2
        .byte   $33                             ; C542 33                       3
        bmi     LC576                           ; C543 30 31                    01
        .byte   $32                             ; C545 32                       2
        .byte   $33                             ; C546 33                       3
        bmi     LC57A                           ; C547 30 31                    01
        .byte   $32                             ; C549 32                       2
        .byte   $33                             ; C54A 33                       3
        bmi     LC57E                           ; C54B 30 31                    01
        .byte   $32                             ; C54D 32                       2
        .byte   $33                             ; C54E 33                       3
        bmi     LC582                           ; C54F 30 31                    01
        .byte   $32                             ; C551 32                       2
        .byte   $33                             ; C552 33                       3
        bmi     LC586                           ; C553 30 31                    01
        .byte   $32                             ; C555 32                       2
        .byte   $33                             ; C556 33                       3
        bmi     LC58A                           ; C557 30 31                    01
        .byte   $32                             ; C559 32                       2
        .byte   $33                             ; C55A 33                       3
        bmi     LC58E                           ; C55B 30 31                    01
        .byte   $32                             ; C55D 32                       2
        .byte   $33                             ; C55E 33                       3
        rti                                     ; C55F 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C560 41 42                    AB
        .byte   $43                             ; C562 43                       C
        .byte   $44                             ; C563 44                       D
        .byte   $44                             ; C564 44                       D
        rti                                     ; C565 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C566 41 42                    AB
        .byte   $43                             ; C568 43                       C
        .byte   $44                             ; C569 44                       D
        .byte   $44                             ; C56A 44                       D
        rti                                     ; C56B 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C56C 41 42                    AB
        .byte   $43                             ; C56E 43                       C
        .byte   $44                             ; C56F 44                       D
        .byte   $44                             ; C570 44                       D
        rti                                     ; C571 40                       @

; ----------------------------------------------------------------------------
LC572:  eor     ($42,x)                         ; C572 41 42                    AB
        .byte   $43                             ; C574 43                       C
        .byte   $44                             ; C575 44                       D
LC576:  .byte   $44                             ; C576 44                       D
        rti                                     ; C577 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C578 41 42                    AB
LC57A:  .byte   $43                             ; C57A 43                       C
        .byte   $44                             ; C57B 44                       D
        .byte   $44                             ; C57C 44                       D
        rti                                     ; C57D 40                       @

; ----------------------------------------------------------------------------
LC57E:  eor     ($54,x)                         ; C57E 41 54                    AT
        .byte   $54                             ; C580 54                       T
        .byte   $54                             ; C581 54                       T
LC582:  .byte   $54                             ; C582 54                       T
        eor     $46                             ; C583 45 46                    EF
        .byte   $54                             ; C585 54                       T
LC586:  .byte   $54                             ; C586 54                       T
        .byte   $54                             ; C587 54                       T
        .byte   $54                             ; C588 54                       T
        .byte   $45                             ; C589 45                       E
LC58A:  lsr     $54                             ; C58A 46 54                    FT
        .byte   $54                             ; C58C 54                       T
        .byte   $54                             ; C58D 54                       T
LC58E:  .byte   $54                             ; C58E 54                       T
        eor     $46                             ; C58F 45 46                    EF
        .byte   $54                             ; C591 54                       T
        .byte   $54                             ; C592 54                       T
        .byte   $54                             ; C593 54                       T
        .byte   $54                             ; C594 54                       T
        eor     $46                             ; C595 45 46                    EF
        .byte   $54                             ; C597 54                       T
        .byte   $54                             ; C598 54                       T
        .byte   $54                             ; C599 54                       T
        .byte   $54                             ; C59A 54                       T
        eor     $46                             ; C59B 45 46                    EF
        .byte   $54                             ; C59D 54                       T
        .byte   $54                             ; C59E 54                       T
        eor     ($52),y                         ; C59F 51 52                    QR
        .byte   $54                             ; C5A1 54                       T
        .byte   $54                             ; C5A2 54                       T
        .byte   $54                             ; C5A3 54                       T
        .byte   $54                             ; C5A4 54                       T
        .byte   $54                             ; C5A5 54                       T
        .byte   $54                             ; C5A6 54                       T
        eor     ($52),y                         ; C5A7 51 52                    QR
        .byte   $54                             ; C5A9 54                       T
        .byte   $54                             ; C5AA 54                       T
        .byte   $54                             ; C5AB 54                       T
        .byte   $54                             ; C5AC 54                       T
        .byte   $53                             ; C5AD 53                       S
        bvc     LC601                           ; C5AE 50 51                    PQ
        .byte   $52                             ; C5B0 52                       R
        .byte   $54                             ; C5B1 54                       T
        .byte   $54                             ; C5B2 54                       T
        .byte   $54                             ; C5B3 54                       T
        .byte   $54                             ; C5B4 54                       T
        .byte   $54                             ; C5B5 54                       T
        .byte   $54                             ; C5B6 54                       T
        eor     ($52),y                         ; C5B7 51 52                    QR
        .byte   $54                             ; C5B9 54                       T
        .byte   $54                             ; C5BA 54                       T
        .byte   $54                             ; C5BB 54                       T
        .byte   $54                             ; C5BC 54                       T
        .byte   $54                             ; C5BD 54                       T
        .byte   $54                             ; C5BE 54                       T
        asl     $16,x                           ; C5BF 16 16                    ..
        asl     $16,x                           ; C5C1 16 16                    ..
        .byte   $14                             ; C5C3 14                       .
        ora     $16,x                           ; C5C4 15 16                    ..
        asl     $16,x                           ; C5C6 16 16                    ..
        asl     $14,x                           ; C5C8 16 14                    ..
        ora     $16,x                           ; C5CA 15 16                    ..
        asl     $16,x                           ; C5CC 16 16                    ..
        asl     $16,x                           ; C5CE 16 16                    ..
        asl     $16,x                           ; C5D0 16 16                    ..
        asl     $14,x                           ; C5D2 16 14                    ..
        ora     $16,x                           ; C5D4 15 16                    ..
        asl     $16,x                           ; C5D6 16 16                    ..
        asl     $14,x                           ; C5D8 16 14                    ..
        ora     $16,x                           ; C5DA 15 16                    ..
        asl     $16,x                           ; C5DC 16 16                    ..
        asl     $55,x                           ; C5DE 16 55                    .U
        eor     $55,x                           ; C5E0 55 55                    UU
        eor     $55,x                           ; C5E2 55 55                    UU
        eor     $60,x                           ; C5E4 55 60                    U`
        adc     ($62,x)                         ; C5E6 61 62                    ab
        .byte   $63                             ; C5E8 63                       c
        eor     $55,x                           ; C5E9 55 55                    UU
        eor     $55,x                           ; C5EB 55 55                    UU
        eor     $55,x                           ; C5ED 55 55                    UU
        eor     $55,x                           ; C5EF 55 55                    UU
        eor     $55,x                           ; C5F1 55 55                    UU
        eor     $55,x                           ; C5F3 55 55                    UU
        rts                                     ; C5F5 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C5F6 61 62                    ab
        .byte   $63                             ; C5F8 63                       c
        eor     $55,x                           ; C5F9 55 55                    UU
        eor     $55,x                           ; C5FB 55 55                    UU
        eor     $55,x                           ; C5FD 55 55                    UU
        rts                                     ; C5FF 60                       `

; ----------------------------------------------------------------------------
        .byte   $61                             ; C600 61                       a
LC601:  .byte   $62                             ; C601 62                       b
        .byte   $63                             ; C602 63                       c
        eor     $55,x                           ; C603 55 55                    UU
        eor     $55,x                           ; C605 55 55                    UU
        eor     $55,x                           ; C607 55 55                    UU
        eor     $55,x                           ; C609 55 55                    UU
        rts                                     ; C60B 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C60C 61 62                    ab
        .byte   $63                             ; C60E 63                       c
        eor     $55,x                           ; C60F 55 55                    UU
        eor     $55,x                           ; C611 55 55                    UU
        eor     $55,x                           ; C613 55 55                    UU
        eor     $55,x                           ; C615 55 55                    UU
        eor     $55,x                           ; C617 55 55                    UU
        rts                                     ; C619 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C61A 61 62                    ab
        .byte   $63                             ; C61C 63                       c
        eor     $55,x                           ; C61D 55 55                    UU
        asl     $16,x                           ; C61F 16 16                    ..
        asl     $16,x                           ; C621 16 16                    ..
        asl     $16,x                           ; C623 16 16                    ..
        .byte   $64                             ; C625 64                       d
        adc     $16                             ; C626 65 16                    e.
        asl     $16,x                           ; C628 16 16                    ..
        asl     $16,x                           ; C62A 16 16                    ..
        asl     $16,x                           ; C62C 16 16                    ..
        asl     $16,x                           ; C62E 16 16                    ..
        asl     $64,x                           ; C630 16 64                    .d
        adc     $16                             ; C632 65 16                    e.
        asl     $16,x                           ; C634 16 16                    ..
        asl     $16,x                           ; C636 16 16                    ..
        asl     $64,x                           ; C638 16 64                    .d
        adc     $16                             ; C63A 65 16                    e.
        asl     $16,x                           ; C63C 16 16                    ..
        asl     $FF,x                           ; C63E 16 FF                    ..
        jsr     L7373                           ; C640 20 73 73                  ss
        bvs     LC6B6                           ; C643 70 71                    pq
        .byte   $72                             ; C645 72                       r
        .byte   $73                             ; C646 73                       s
        .byte   $73                             ; C647 73                       s
        .byte   $73                             ; C648 73                       s
        .byte   $73                             ; C649 73                       s
        .byte   $73                             ; C64A 73                       s
        .byte   $73                             ; C64B 73                       s
        .byte   $73                             ; C64C 73                       s
        bvs     LC6C0                           ; C64D 70 71                    pq
        .byte   $72                             ; C64F 72                       r
        .byte   $73                             ; C650 73                       s
        .byte   $73                             ; C651 73                       s
        .byte   $73                             ; C652 73                       s
        .byte   $73                             ; C653 73                       s
        .byte   $73                             ; C654 73                       s
        .byte   $73                             ; C655 73                       s
        .byte   $73                             ; C656 73                       s
        bvs     LC6CA                           ; C657 70 71                    pq
        .byte   $72                             ; C659 72                       r
        .byte   $73                             ; C65A 73                       s
        .byte   $73                             ; C65B 73                       s
        .byte   $73                             ; C65C 73                       s
        .byte   $73                             ; C65D 73                       s
        .byte   $73                             ; C65E 73                       s
        .byte   $73                             ; C65F 73                       s
LC660:  .byte   $73                             ; C660 73                       s
        .byte   $FF                             ; C661 FF                       .
        ora     ($C0,x)                         ; C662 01 C0                    ..
        .byte   $23                             ; C664 23                       #
        .byte   $FF                             ; C665 FF                       .
        .byte   $FF                             ; C666 FF                       .
        bpl     LC66A                           ; C667 10 01                    ..
        brk                                     ; C669 00                       .
LC66A:  .byte   $FF                             ; C66A FF                       .
        ora     ($D0,x)                         ; C66B 01 D0                    ..
        .byte   $23                             ; C66D 23                       #
        beq     LC660                           ; C66E F0 F0                    ..
        beq     LC66A                           ; C670 F0 F8                    ..
        .byte   $F2                             ; C672 F2                       .
        .byte   $FA                             ; C673 FA                       .
        .byte   $F2                             ; C674 F2                       .
        .byte   $F0                             ; C675 F0                       .
LC676:  .byte   $FF                             ; C676 FF                       .
        .byte   $FF                             ; C677 FF                       .
        plp                                     ; C678 28                       (
        ora     ($FF,x)                         ; C679 01 FF                    ..
        .byte   $FF                             ; C67B FF                       .
        brk                                     ; C67C 00                       .
        .byte   $6F                             ; C67D 6F                       o
        .byte   $2B                             ; C67E 2B                       +
        pha                                     ; C67F 48                       H
        eor     #$54                            ; C680 49 54                    IT
        .byte   $53                             ; C682 53                       S
        .byte   $FF                             ; C683 FF                       .
        ora     ($91,x)                         ; C684 01 91                    ..
        .byte   $2B                             ; C686 2B                       +
        bmi     LC6B9                           ; C687 30 30                    00
        .byte   $FF                             ; C689 FF                       .
        brk                                     ; C68A 00                       .
        brk                                     ; C68B 00                       .
        jsr     LFFFF                           ; C68C 20 FF FF                  ..
        jsr     L020A                           ; C68F 20 0A 02                  ..
        .byte   $FF                             ; C692 FF                       .
        .byte   $FF                             ; C693 FF                       .
        jsr     L3C14                           ; C694 20 14 3C                  .<
        .byte   $FF                             ; C697 FF                       .
        ora     ($40,x)                         ; C698 01 40                    .@
        jsr     L0F0E                           ; C69A 20 0E 0F                  ..
        .byte   $FF                             ; C69D FF                       .
        .byte   $04                             ; C69E 04                       .
        asl     a                               ; C69F 0A                       .
        .byte   $0B                             ; C6A0 0B                       .
        .byte   $0C                             ; C6A1 0C                       .
        ora     L0F0E                           ; C6A2 0D 0E 0F                 ...
        .byte   $FF                             ; C6A5 FF                       .
        bpl     LC6B2                           ; C6A6 10 0A                    ..
        .byte   $0B                             ; C6A8 0B                       .
        .byte   $0C                             ; C6A9 0C                       .
        ora     $1F1E                           ; C6AA 0D 1E 1F                 ...
        .byte   $FF                             ; C6AD FF                       .
        .byte   $04                             ; C6AE 04                       .
        .byte   $1A                             ; C6AF 1A                       .
        .byte   $1B                             ; C6B0 1B                       .
        .byte   $1C                             ; C6B1 1C                       .
LC6B2:  ora     $1F1E,x                         ; C6B2 1D 1E 1F                 ...
        .byte   $02                             ; C6B5 02                       .
LC6B6:  bit     $25                             ; C6B6 24 25                    $%
        .byte   $26                             ; C6B8 26                       &
LC6B9:  .byte   $27                             ; C6B9 27                       '
        .byte   $02                             ; C6BA 02                       .
        asl     a                               ; C6BB 0A                       .
        .byte   $0B                             ; C6BC 0B                       .
        .byte   $0C                             ; C6BD 0C                       .
        .byte   $0D                             ; C6BE 0D                       .
        .byte   $0E                             ; C6BF 0E                       .
LC6C0:  .byte   $0F                             ; C6C0 0F                       .
        and     $26                             ; C6C1 25 26                    %&
        .byte   $27                             ; C6C3 27                       '
        .byte   $02                             ; C6C4 02                       .
        .byte   $1A                             ; C6C5 1A                       .
        .byte   $1B                             ; C6C6 1B                       .
        .byte   $1C                             ; C6C7 1C                       .
        .byte   $1D                             ; C6C8 1D                       .
        .byte   $74                             ; C6C9 74                       t
LC6CA:  .byte   $02                             ; C6CA 02                       .
        bit     $25                             ; C6CB 24 25                    $%
        rol     $27                             ; C6CD 26 27                    &'
        .byte   $FF                             ; C6CF FF                       .
        ora     $74                             ; C6D0 05 74                    .t
        .byte   $02                             ; C6D2 02                       .
        .byte   $34                             ; C6D3 34                       4
        and     $36,x                           ; C6D4 35 36                    56
LC6D6:  .byte   $37                             ; C6D6 37                       7
        .byte   $02                             ; C6D7 02                       .
        .byte   $1A                             ; C6D8 1A                       .
        .byte   $1B                             ; C6D9 1B                       .
        .byte   $1C                             ; C6DA 1C                       .
        ora     $1F1E,x                         ; C6DB 1D 1E 1F                 ...
        and     $36,x                           ; C6DE 35 36                    56
        .byte   $37                             ; C6E0 37                       7
        .byte   $FF                             ; C6E1 FF                       .
        .byte   $04                             ; C6E2 04                       .
        .byte   $74                             ; C6E3 74                       t
        .byte   $02                             ; C6E4 02                       .
        .byte   $02                             ; C6E5 02                       .
        .byte   $34                             ; C6E6 34                       4
        and     $36,x                           ; C6E7 35 36                    56
        .byte   $37                             ; C6E9 37                       7
        .byte   $74                             ; C6EA 74                       t
        adc     $02,x                           ; C6EB 75 02                    u.
        .byte   $17                             ; C6ED 17                       .
        clc                                     ; C6EE 18                       .
        ora     $03FF,y                         ; C6EF 19 FF 03                 ...
        .byte   $17                             ; C6F2 17                       .
        clc                                     ; C6F3 18                       .
        ora     $03FF,y                         ; C6F4 19 FF 03                 ...
        .byte   $74                             ; C6F7 74                       t
        .byte   $02                             ; C6F8 02                       .
        .byte   $02                             ; C6F9 02                       .
        .byte   $74                             ; C6FA 74                       t
        adc     $02,x                           ; C6FB 75 02                    u.
        .byte   $17                             ; C6FD 17                       .
        clc                                     ; C6FE 18                       .
        ora     $0202,y                         ; C6FF 19 02 02                 ...
        .byte   $74                             ; C702 74                       t
        adc     $02,x                           ; C703 75 02                    u.
        .byte   $02                             ; C705 02                       .
        .byte   $74                             ; C706 74                       t
        adc     $FF,x                           ; C707 75 FF                    u.
        ora     $74                             ; C709 05 74                    .t
        .byte   $74                             ; C70B 74                       t
        adc     $FF,x                           ; C70C 75 FF                    u.
        .byte   $04                             ; C70E 04                       .
        .byte   $74                             ; C70F 74                       t
        adc     $02,x                           ; C710 75 02                    u.
        .byte   $02                             ; C712 02                       .
        .byte   $17                             ; C713 17                       .
        clc                                     ; C714 18                       .
        ora     $03FF,y                         ; C715 19 FF 03                 ...
        .byte   $74                             ; C718 74                       t
        adc     $FF,x                           ; C719 75 FF                    u.
        .byte   $22                             ; C71B 22                       "
        .byte   $47                             ; C71C 47                       G
        pha                                     ; C71D 48                       H
        eor     #$4A                            ; C71E 49 4A                    IJ
        .byte   $4B                             ; C720 4B                       K
        jmp     L1AFF                           ; C721 4C FF 1A                 L..

; ----------------------------------------------------------------------------
        .byte   $3C                             ; C724 3C                       <
        .byte   $3C                             ; C725 3C                       <
        .byte   $3C                             ; C726 3C                       <
        .byte   $3C                             ; C727 3C                       <
        .byte   $3C                             ; C728 3C                       <
        eor     $2F2E                           ; C729 4D 2E 2F                 M./
        plp                                     ; C72C 28                       (
        and     #$2A                            ; C72D 29 2A                    )*
        .byte   $2B                             ; C72F 2B                       +
        .byte   $FF                             ; C730 FF                       .
        ora     L3E3D,y                         ; C731 19 3D 3E                 .=>
        .byte   $3F                             ; C734 3F                       ?
        sec                                     ; C735 38                       8
        and     $3B3A,y                         ; C736 39 3A 3B                 9:;
        bpl     LC74C                           ; C739 10 11                    ..
        .byte   $12                             ; C73B 12                       .
        .byte   $13                             ; C73C 13                       .
        bpl     LC750                           ; C73D 10 11                    ..
        .byte   $12                             ; C73F 12                       .
        .byte   $13                             ; C740 13                       .
        bpl     LC754                           ; C741 10 11                    ..
        .byte   $12                             ; C743 12                       .
        .byte   $13                             ; C744 13                       .
        bpl     LC758                           ; C745 10 11                    ..
        .byte   $12                             ; C747 12                       .
        .byte   $13                             ; C748 13                       .
        bpl     LC75C                           ; C749 10 11                    ..
        .byte   $12                             ; C74B 12                       .
LC74C:  .byte   $13                             ; C74C 13                       .
        .byte   $3C                             ; C74D 3C                       <
        lsr     $57,x                           ; C74E 56 57                    VW
LC750:  cli                                     ; C750 58                       X
        eor     L2221,y                         ; C751 59 21 22                 Y!"
LC754:  .byte   $23                             ; C754 23                       #
        jsr     L2221                           ; C755 20 21 22                  !"
LC758:  .byte   $23                             ; C758 23                       #
        jsr     L2221                           ; C759 20 21 22                  !"
LC75C:  .byte   $23                             ; C75C 23                       #
        jsr     L2221                           ; C75D 20 21 22                  !"
        .byte   $23                             ; C760 23                       #
        jsr     L2221                           ; C761 20 21 22                  !"
        .byte   $23                             ; C764 23                       #
        jsr     L2221                           ; C765 20 21 22                  !"
        .byte   $23                             ; C768 23                       #
        jsr     L2221                           ; C769 20 21 22                  !"
        .byte   $23                             ; C76C 23                       #
        .byte   $3C                             ; C76D 3C                       <
        ror     $67                             ; C76E 66 67                    fg
        .byte   $33                             ; C770 33                       3
        bmi     LC7A4                           ; C771 30 31                    01
        .byte   $32                             ; C773 32                       2
        .byte   $33                             ; C774 33                       3
        bmi     LC7A8                           ; C775 30 31                    01
        .byte   $32                             ; C777 32                       2
        .byte   $33                             ; C778 33                       3
        bmi     LC7AC                           ; C779 30 31                    01
        .byte   $32                             ; C77B 32                       2
        .byte   $33                             ; C77C 33                       3
        bmi     LC7B0                           ; C77D 30 31                    01
        .byte   $32                             ; C77F 32                       2
        .byte   $33                             ; C780 33                       3
        bmi     LC7B4                           ; C781 30 31                    01
        .byte   $32                             ; C783 32                       2
        .byte   $33                             ; C784 33                       3
        bmi     LC7B8                           ; C785 30 31                    01
        .byte   $32                             ; C787 32                       2
        .byte   $33                             ; C788 33                       3
        bmi     LC7BC                           ; C789 30 31                    01
        .byte   $32                             ; C78B 32                       2
        .byte   $33                             ; C78C 33                       3
        .byte   $3C                             ; C78D 3C                       <
        ror     $42,x                           ; C78E 76 42                    vB
        .byte   $43                             ; C790 43                       C
        .byte   $44                             ; C791 44                       D
        .byte   $44                             ; C792 44                       D
        rti                                     ; C793 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C794 41 42                    AB
        .byte   $43                             ; C796 43                       C
        .byte   $44                             ; C797 44                       D
        .byte   $44                             ; C798 44                       D
        rti                                     ; C799 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C79A 41 42                    AB
        .byte   $43                             ; C79C 43                       C
        .byte   $44                             ; C79D 44                       D
        .byte   $44                             ; C79E 44                       D
        rti                                     ; C79F 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C7A0 41 42                    AB
        .byte   $43                             ; C7A2 43                       C
        .byte   $44                             ; C7A3 44                       D
LC7A4:  .byte   $44                             ; C7A4 44                       D
        rti                                     ; C7A5 40                       @

; ----------------------------------------------------------------------------
        eor     ($42,x)                         ; C7A6 41 42                    AB
LC7A8:  .byte   $43                             ; C7A8 43                       C
        .byte   $44                             ; C7A9 44                       D
        .byte   $44                             ; C7AA 44                       D
        rti                                     ; C7AB 40                       @

; ----------------------------------------------------------------------------
LC7AC:  eor     ($3C,x)                         ; C7AC 41 3C                    A<
        .byte   $3C                             ; C7AE 3C                       <
        .byte   $77                             ; C7AF 77                       w
LC7B0:  .byte   $54                             ; C7B0 54                       T
        eor     $46                             ; C7B1 45 46                    EF
        .byte   $54                             ; C7B3 54                       T
LC7B4:  .byte   $54                             ; C7B4 54                       T
        .byte   $54                             ; C7B5 54                       T
        .byte   $54                             ; C7B6 54                       T
        .byte   $45                             ; C7B7 45                       E
LC7B8:  lsr     $54                             ; C7B8 46 54                    FT
        .byte   $54                             ; C7BA 54                       T
        .byte   $54                             ; C7BB 54                       T
LC7BC:  .byte   $54                             ; C7BC 54                       T
        eor     $46                             ; C7BD 45 46                    EF
        .byte   $54                             ; C7BF 54                       T
        .byte   $54                             ; C7C0 54                       T
        .byte   $54                             ; C7C1 54                       T
        .byte   $54                             ; C7C2 54                       T
        eor     $46                             ; C7C3 45 46                    EF
        .byte   $54                             ; C7C5 54                       T
        .byte   $54                             ; C7C6 54                       T
        .byte   $54                             ; C7C7 54                       T
        .byte   $54                             ; C7C8 54                       T
        eor     $46                             ; C7C9 45 46                    EF
        .byte   $54                             ; C7CB 54                       T
        .byte   $54                             ; C7CC 54                       T
        .byte   $3C                             ; C7CD 3C                       <
        .byte   $3C                             ; C7CE 3C                       <
        .byte   $87                             ; C7CF 87                       .
        .byte   $54                             ; C7D0 54                       T
        .byte   $54                             ; C7D1 54                       T
        .byte   $54                             ; C7D2 54                       T
        .byte   $54                             ; C7D3 54                       T
        .byte   $54                             ; C7D4 54                       T
        eor     ($52),y                         ; C7D5 51 52                    QR
        .byte   $54                             ; C7D7 54                       T
        .byte   $54                             ; C7D8 54                       T
        .byte   $54                             ; C7D9 54                       T
        .byte   $54                             ; C7DA 54                       T
        .byte   $53                             ; C7DB 53                       S
        bvc     LC82F                           ; C7DC 50 51                    PQ
        .byte   $52                             ; C7DE 52                       R
        .byte   $54                             ; C7DF 54                       T
        .byte   $54                             ; C7E0 54                       T
        .byte   $54                             ; C7E1 54                       T
        .byte   $54                             ; C7E2 54                       T
        .byte   $54                             ; C7E3 54                       T
        .byte   $54                             ; C7E4 54                       T
        eor     ($52),y                         ; C7E5 51 52                    QR
        .byte   $54                             ; C7E7 54                       T
        .byte   $54                             ; C7E8 54                       T
        .byte   $54                             ; C7E9 54                       T
        .byte   $54                             ; C7EA 54                       T
        .byte   $54                             ; C7EB 54                       T
        .byte   $54                             ; C7EC 54                       T
        .byte   $3C                             ; C7ED 3C                       <
        .byte   $3C                             ; C7EE 3C                       <
        pla                                     ; C7EF 68                       h
        asl     $14,x                           ; C7F0 16 14                    ..
        ora     $16,x                           ; C7F2 15 16                    ..
        asl     $16,x                           ; C7F4 16 16                    ..
        asl     $14,x                           ; C7F6 16 14                    ..
        ora     $16,x                           ; C7F8 15 16                    ..
        asl     $16,x                           ; C7FA 16 16                    ..
        asl     $16,x                           ; C7FC 16 16                    ..
        asl     $16,x                           ; C7FE 16 16                    ..
        asl     $14,x                           ; C800 16 14                    ..
        ora     $16,x                           ; C802 15 16                    ..
        asl     $16,x                           ; C804 16 16                    ..
        asl     $14,x                           ; C806 16 14                    ..
        ora     $16,x                           ; C808 15 16                    ..
        asl     $16,x                           ; C80A 16 16                    ..
        asl     $3C,x                           ; C80C 16 3C                    .<
        .byte   $3C                             ; C80E 3C                       <
        sei                                     ; C80F 78                       x
        adc     $5555,y                         ; C810 79 55 55                 yUU
        rts                                     ; C813 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C814 61 62                    ab
        .byte   $63                             ; C816 63                       c
        eor     $55,x                           ; C817 55 55                    UU
        eor     $55,x                           ; C819 55 55                    UU
        eor     $55,x                           ; C81B 55 55                    UU
        eor     $55,x                           ; C81D 55 55                    UU
        eor     $55,x                           ; C81F 55 55                    UU
        eor     $55,x                           ; C821 55 55                    UU
        eor     $60,x                           ; C823 55 60                    U`
        adc     ($62,x)                         ; C825 61 62                    ab
        .byte   $63                             ; C827 63                       c
        eor     $55,x                           ; C828 55 55                    UU
        eor     $55,x                           ; C82A 55 55                    UU
        eor     $FF,x                           ; C82C 55 FF                    U.
        .byte   $03                             ; C82E 03                       .
LC82F:  .byte   $89                             ; C82F 89                       .
        eor     $55,x                           ; C830 55 55                    UU
        eor     $55,x                           ; C832 55 55                    UU
        eor     $55,x                           ; C834 55 55                    UU
        eor     $55,x                           ; C836 55 55                    UU
        rts                                     ; C838 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C839 61 62                    ab
        .byte   $63                             ; C83B 63                       c
        eor     $55,x                           ; C83C 55 55                    UU
        eor     $55,x                           ; C83E 55 55                    UU
        eor     $55,x                           ; C840 55 55                    UU
        eor     $55,x                           ; C842 55 55                    UU
        eor     $55,x                           ; C844 55 55                    UU
        rts                                     ; C846 60                       `

; ----------------------------------------------------------------------------
        adc     ($62,x)                         ; C847 61 62                    ab
        .byte   $63                             ; C849 63                       c
        eor     $55,x                           ; C84A 55 55                    UU
        .byte   $FF                             ; C84C FF                       .
        .byte   $03                             ; C84D 03                       .
        .byte   $5A                             ; C84E 5A                       Z
        asl     $16,x                           ; C84F 16 16                    ..
        .byte   $64                             ; C851 64                       d
        adc     $16                             ; C852 65 16                    e.
        asl     $16,x                           ; C854 16 16                    ..
        asl     $16,x                           ; C856 16 16                    ..
        asl     $16,x                           ; C858 16 16                    ..
        asl     $16,x                           ; C85A 16 16                    ..
        asl     $64,x                           ; C85C 16 64                    .d
        adc     $16                             ; C85E 65 16                    e.
        asl     $16,x                           ; C860 16 16                    ..
        asl     $16,x                           ; C862 16 16                    ..
        asl     $64,x                           ; C864 16 64                    .d
        adc     $16                             ; C866 65 16                    e.
        asl     $16,x                           ; C868 16 16                    ..
        asl     $FF,x                           ; C86A 16 FF                    ..
        .byte   $03                             ; C86C 03                       .
        ror     a                               ; C86D 6A                       j
        adc     #$02                            ; C86E 69 02                    i.
        .byte   $02                             ; C870 02                       .
        .byte   $02                             ; C871 02                       .
        .byte   $02                             ; C872 02                       .
        .byte   $02                             ; C873 02                       .
        .byte   $02                             ; C874 02                       .
        .byte   $02                             ; C875 02                       .
        .byte   $02                             ; C876 02                       .
        .byte   $02                             ; C877 02                       .
        .byte   $02                             ; C878 02                       .
        .byte   $02                             ; C879 02                       .
        .byte   $02                             ; C87A 02                       .
        .byte   $02                             ; C87B 02                       .
        .byte   $02                             ; C87C 02                       .
        .byte   $02                             ; C87D 02                       .
        .byte   $02                             ; C87E 02                       .
        .byte   $02                             ; C87F 02                       .
        .byte   $02                             ; C880 02                       .
        .byte   $02                             ; C881 02                       .
        .byte   $02                             ; C882 02                       .
        .byte   $02                             ; C883 02                       .
        .byte   $02                             ; C884 02                       .
        .byte   $02                             ; C885 02                       .
        .byte   $02                             ; C886 02                       .
        .byte   $02                             ; C887 02                       .
        .byte   $02                             ; C888 02                       .
        .byte   $02                             ; C889 02                       .
        .byte   $FF                             ; C88A FF                       .
        ora     $7A                             ; C88B 05 7A                    .z
        .byte   $8B                             ; C88D 8B                       .
        .byte   $73                             ; C88E 73                       s
LC88F:  .byte   $73                             ; C88F 73                       s
        .byte   $73                             ; C890 73                       s
        .byte   $73                             ; C891 73                       s
        .byte   $73                             ; C892 73                       s
        bvs     LC906                           ; C893 70 71                    pq
        .byte   $72                             ; C895 72                       r
        .byte   $73                             ; C896 73                       s
        .byte   $73                             ; C897 73                       s
        .byte   $73                             ; C898 73                       s
        .byte   $73                             ; C899 73                       s
        .byte   $73                             ; C89A 73                       s
        .byte   $73                             ; C89B 73                       s
        .byte   $73                             ; C89C 73                       s
        bvs     LC910                           ; C89D 70 71                    pq
        .byte   $72                             ; C89F 72                       r
        .byte   $73                             ; C8A0 73                       s
        .byte   $73                             ; C8A1 73                       s
        .byte   $73                             ; C8A2 73                       s
        .byte   $73                             ; C8A3 73                       s
        .byte   $73                             ; C8A4 73                       s
        .byte   $73                             ; C8A5 73                       s
        .byte   $73                             ; C8A6 73                       s
        .byte   $FF                             ; C8A7 FF                       .
        .byte   $07                             ; C8A8 07                       .
        .byte   $5B                             ; C8A9 5B                       [
        .byte   $FF                             ; C8AA FF                       .
        .byte   $FF                             ; C8AB FF                       .
        clc                                     ; C8AC 18                       .
        .byte   $02                             ; C8AD 02                       .
        .byte   $02                             ; C8AE 02                       .
        .byte   $7B                             ; C8AF 7B                       {
        .byte   $8B                             ; C8B0 8B                       .
        .byte   $02                             ; C8B1 02                       .
        sty     $85                             ; C8B2 84 85                    ..
        sty     $85                             ; C8B4 84 85                    ..
        .byte   $02                             ; C8B6 02                       .
        jmp     (L6E6D)                         ; C8B7 6C 6D 6E                 lmn

; ----------------------------------------------------------------------------
        .byte   $6F                             ; C8BA 6F                       o
        .byte   $80                             ; C8BB 80                       .
        eor     $55,x                           ; C8BC 55 55                    UU
        eor     $55,x                           ; C8BE 55 55                    UU
        eor     $55,x                           ; C8C0 55 55                    UU
        eor     $55,x                           ; C8C2 55 55                    UU
        eor     $55,x                           ; C8C4 55 55                    UU
        eor     $FF,x                           ; C8C6 55 FF                    U.
        ora     #$5C                            ; C8C8 09 5C                    .\
        eor     $9392,x                         ; C8CA 5D 92 93                 ]..
        sty     $95,x                           ; C8CD 94 95                    ..
        .byte   $02                             ; C8CF 02                       .
        .byte   $7C                             ; C8D0 7C                       |
        adc     $7F7E,x                         ; C8D1 7D 7E 7F                 }~.
        sta     ($02,x)                         ; C8D4 81 02                    ..
        .byte   $02                             ; C8D6 02                       .
        .byte   $02                             ; C8D7 02                       .
        .byte   $02                             ; C8D8 02                       .
        .byte   $02                             ; C8D9 02                       .
        .byte   $02                             ; C8DA 02                       .
        .byte   $02                             ; C8DB 02                       .
        .byte   $02                             ; C8DC 02                       .
        .byte   $02                             ; C8DD 02                       .
        .byte   $02                             ; C8DE 02                       .
        .byte   $02                             ; C8DF 02                       .
        .byte   $FF                             ; C8E0 FF                       .
        asl     $8B7B                           ; C8E1 0E 7B 8B                 .{.
        .byte   $02                             ; C8E4 02                       .
        sta     $8F8E                           ; C8E5 8D 8E 8F                 ...
        .byte   $02                             ; C8E8 02                       .
        .byte   $02                             ; C8E9 02                       .
        .byte   $02                             ; C8EA 02                       .
        .byte   $02                             ; C8EB 02                       .
        .byte   $02                             ; C8EC 02                       .
        .byte   $02                             ; C8ED 02                       .
        .byte   $02                             ; C8EE 02                       .
        .byte   $02                             ; C8EF 02                       .
        .byte   $02                             ; C8F0 02                       .
        .byte   $02                             ; C8F1 02                       .
        .byte   $02                             ; C8F2 02                       .
        .byte   $02                             ; C8F3 02                       .
        .byte   $FF                             ; C8F4 FF                       .
        .byte   $0F                             ; C8F5 0F                       .
        .byte   $5C                             ; C8F6 5C                       \
        .byte   $82                             ; C8F7 82                       .
        .byte   $83                             ; C8F8 83                       .
        .byte   $5F                             ; C8F9 5F                       _
        .byte   $02                             ; C8FA 02                       .
        jmp     (L6E6D)                         ; C8FB 6C 6D 6E                 lmn

; ----------------------------------------------------------------------------
        .byte   $6F                             ; C8FE 6F                       o
        .byte   $80                             ; C8FF 80                       .
        .byte   $02                             ; C900 02                       .
        .byte   $02                             ; C901 02                       .
        .byte   $02                             ; C902 02                       .
        .byte   $02                             ; C903 02                       .
        .byte   $02                             ; C904 02                       .
        .byte   $02                             ; C905 02                       .
LC906:  .byte   $02                             ; C906 02                       .
        .byte   $FF                             ; C907 FF                       .
        .byte   $13                             ; C908 13                       .
        pla                                     ; C909 68                       h
        .byte   $7C                             ; C90A 7C                       |
        adc     $7F7E,x                         ; C90B 7D 7E 7F                 }~.
        sta     ($16,x)                         ; C90E 81 16                    ..
LC910:  asl     $16,x                           ; C910 16 16                    ..
        asl     $16,x                           ; C912 16 16                    ..
        asl     $16,x                           ; C914 16 16                    ..
        .byte   $FF                             ; C916 FF                       .
        .byte   $13                             ; C917 13                       .
        ror     a                               ; C918 6A                       j
        .byte   $02                             ; C919 02                       .
        sta     $8F8E                           ; C91A 8D 8E 8F                 ...
        .byte   $02                             ; C91D 02                       .
        .byte   $02                             ; C91E 02                       .
        .byte   $02                             ; C91F 02                       .
        .byte   $02                             ; C920 02                       .
        .byte   $02                             ; C921 02                       .
        .byte   $02                             ; C922 02                       .
        .byte   $02                             ; C923 02                       .
        .byte   $02                             ; C924 02                       .
        .byte   $FF                             ; C925 FF                       .
        ora     ($E7,x)                         ; C926 01 E7                    ..
        .byte   $22                             ; C928 22                       "
        .byte   $6B                             ; C929 6B                       k
        .byte   $FF                             ; C92A FF                       .
        ora     ($C0,x)                         ; C92B 01 C0                    ..
        .byte   $23                             ; C92D 23                       #
        .byte   $FF                             ; C92E FF                       .
        .byte   $FF                             ; C92F FF                       .
        bpl     LC933                           ; C930 10 01                    ..
        brk                                     ; C932 00                       .
LC933:  .byte   $FF                             ; C933 FF                       .
        ora     ($D0,x)                         ; C934 01 D0                    ..
        .byte   $23                             ; C936 23                       #
        .byte   $FF                             ; C937 FF                       .
        .byte   $FF                             ; C938 FF                       .
        php                                     ; C939 08                       .
        ora     ($F0,x)                         ; C93A 01 F0                    ..
        .byte   $FF                             ; C93C FF                       .
        ora     ($D8,x)                         ; C93D 01 D8                    ..
        .byte   $23                             ; C93F 23                       #
        .byte   $FF                             ; C940 FF                       .
        .byte   $FF                             ; C941 FF                       .
        plp                                     ; C942 28                       (
        ora     ($FF,x)                         ; C943 01 FF                    ..
        .byte   $FF                             ; C945 FF                       .
        brk                                     ; C946 00                       .
        .byte   $8B                             ; C947 8B                       .
        and     ($47,x)                         ; C948 21 47                    !G
        eor     ($4D,x)                         ; C94A 41 4D                    AM
        eor     $20                             ; C94C 45 20                    E 
        jsr     L564F                           ; C94E 20 4F 56                  OV
        eor     $52                             ; C951 45 52                    ER
        .byte   $FF                             ; C953 FF                       .
        ora     ($20,x)                         ; C954 01 20                    . 
        .byte   $23                             ; C956 23                       #
        .byte   $FF                             ; C957 FF                       .
        .byte   $FF                             ; C958 FF                       .
        jsr     L0101                           ; C959 20 01 01                  ..
        .byte   $FF                             ; C95C FF                       .
        brk                                     ; C95D 00                       .
        lda     $20                             ; C95E A5 20                    . 
        eor     $554F,y                         ; C960 59 4F 55                 YOU
        jsr     L4143                           ; C963 20 43 41                  CA
        lsr     $4E20                           ; C966 4E 20 4E                 N N
        .byte   $4F                             ; C969 4F                       O
        .byte   $57                             ; C96A 57                       W
        jsr     L5254                           ; C96B 20 54 52                  TR
        eor     ($43,x)                         ; C96E 41 43                    AC
        .byte   $4B                             ; C970 4B                       K
        jsr     L414A                           ; C971 20 4A 41                  JA
        .byte   $57                             ; C974 57                       W
        .byte   $53                             ; C975 53                       S
        .byte   $FF                             ; C976 FF                       .
        and     $4957                           ; C977 2D 57 49                 -WI
        .byte   $54                             ; C97A 54                       T
        pha                                     ; C97B 48                       H
        jsr     L4854                           ; C97C 20 54 48                  TH
        eor     $20                             ; C97F 45 20                    E 
        .byte   $52                             ; C981 52                       R
        eor     $43                             ; C982 45 43                    EC
        eor     $49                             ; C984 45 49                    EI
        lsr     $45,x                           ; C986 56 45                    VE
        .byte   $52                             ; C988 52                       R
        rol     $6FFF                           ; C989 2E FF 6F                 ..o
        rol     a                               ; C98C 2A                       *
        dec     LCECE                           ; C98D CE CE CE                 ...
        dec     LCECE                           ; C990 CE CE CE                 ...
        dec     LCECE                           ; C993 CE CE CE                 ...
        dec     LCECE                           ; C996 CE CE CE                 ...
        .byte   $CF                             ; C999 CF                       .
        .byte   $FF                             ; C99A FF                       .
        .byte   $12                             ; C99B 12                       .
        .byte   $FF                             ; C99C FF                       .
        .byte   $FF                             ; C99D FF                       .
        ora     ($09,x)                         ; C99E 01 09                    ..
        .byte   $3A                             ; C9A0 3A                       :
        .byte   $DB                             ; C9A1 DB                       .
        .byte   $FF                             ; C9A2 FF                       .
        ora     ($8A,x)                         ; C9A3 01 8A                    ..
        and     ($FF,x)                         ; C9A5 21 FF                    !.
        .byte   $FF                             ; C9A7 FF                       .
        .byte   $0C                             ; C9A8 0C                       .
        ora     #$01                            ; C9A9 09 01                    ..
        .byte   $FF                             ; C9AB FF                       .
        .byte   $FF                             ; C9AC FF                       .
        .byte   $0C                             ; C9AD 0C                       .
        ora     ($76,x)                         ; C9AE 01 76                    .v
        .byte   $FF                             ; C9B0 FF                       .
        ora     ($96,x)                         ; C9B1 01 96                    ..
        and     ($FF,x)                         ; C9B3 21 FF                    !.
        .byte   $FF                             ; C9B5 FF                       .
        ora     ($09,x)                         ; C9B6 01 09                    ..
        .byte   $67                             ; C9B8 67                       g
        .byte   $77                             ; C9B9 77                       w
        .byte   $FF                             ; C9BA FF                       .
        ora     ($B1,x)                         ; C9BB 01 B1                    ..
        and     ($C7,x)                         ; C9BD 21 C7                    !.
        .byte   $FF                             ; C9BF FF                       .
        .byte   $1A                             ; C9C0 1A                       .
        sbc     LFFC6,y                         ; C9C1 F9 C6 FF                 ...
        .byte   $03                             ; C9C4 03                       .
        .byte   $D7                             ; C9C5 D7                       .
        cld                                     ; C9C6 D8                       .
        .byte   $D9                             ; C9C7 D9                       .
LC9C8:  .byte   $DA                             ; C9C8 DA                       .
        .byte   $FF                             ; C9C9 FF                       .
        clc                                     ; C9CA 18                       .
        dec     $C6,x                           ; C9CB D6 C6                    ..
        ora     ($E6,x)                         ; C9CD 01 E6                    ..
        .byte   $E7                             ; C9CF E7                       .
        inx                                     ; C9D0 E8                       .
        sbc     #$EA                            ; C9D1 E9 EA                    ..
        .byte   $EB                             ; C9D3 EB                       .
        .byte   $FF                             ; C9D4 FF                       .
        clc                                     ; C9D5 18                       .
        cpy     LF6CD                           ; C9D6 CC CD F6                 ...
        .byte   $F7                             ; C9D9 F7                       .
        sed                                     ; C9DA F8                       .
        ora     ($FA,x)                         ; C9DB 01 FA                    ..
        .byte   $FB                             ; C9DD FB                       .
        .byte   $FF                             ; C9DE FF                       .
        clc                                     ; C9DF 18                       .
        .byte   $DC                             ; C9E0 DC                       .
        cmp     LC9C8,x                         ; C9E1 DD C8 C9                 ...
        dex                                     ; C9E4 CA                       .
        ora     ($DE,x)                         ; C9E5 01 DE                    ..
        .byte   $DF                             ; C9E7 DF                       .
        .byte   $FF                             ; C9E8 FF                       .
        clc                                     ; C9E9 18                       .
        ldy     $AEAD                           ; C9EA AC AD AE                 ...
        .byte   $AF                             ; C9ED AF                       .
        cpx     LEEED                           ; C9EE EC ED EE                 ...
        .byte   $EF                             ; C9F1 EF                       .
        .byte   $FF                             ; C9F2 FF                       .
        clc                                     ; C9F3 18                       .
        ldy     $BEBD,x                         ; C9F4 BC BD BE                 ...
        .byte   $BF                             ; C9F7 BF                       .
        .byte   $FC                             ; C9F8 FC                       .
        sbc     LCBFE,x                         ; C9F9 FD FE CB                 ...
        .byte   $FF                             ; C9FC FF                       .
        ora     ($20,x)                         ; C9FD 01 20                    . 
        .byte   $23                             ; C9FF 23                       #
        .byte   $FF                             ; CA00 FF                       .
        .byte   $FF                             ; CA01 FF                       .
        jsr     L0101                           ; CA02 20 01 01                  ..
        .byte   $FF                             ; CA05 FF                       .
        ora     ($C0,x)                         ; CA06 01 C0                    ..
        .byte   $23                             ; CA08 23                       #
        .byte   $FF                             ; CA09 FF                       .
        .byte   $FF                             ; CA0A FF                       .
        bpl     LCA0E                           ; CA0B 10 01                    ..
        brk                                     ; CA0D 00                       .
LCA0E:  .byte   $FF                             ; CA0E FF                       .
        ora     ($D0,x)                         ; CA0F 01 D0                    ..
        .byte   $23                             ; CA11 23                       #
        bvc     LCA64                           ; CA12 50 50                    PP
        bvc     LCA66                           ; CA14 50 50                    PP
        bvc     LCA68                           ; CA16 50 50                    PP
        bvc     LCA6A                           ; CA18 50 50                    PP
        eor     $55,x                           ; CA1A 55 55                    UU
        eor     $F5,x                           ; CA1C 55 F5                    U.
        eor     $55,x                           ; CA1E 55 55                    UU
        eor     $55,x                           ; CA20 55 55                    UU
        eor     $55,x                           ; CA22 55 55                    UU
        eor     $59,x                           ; CA24 55 59                    UY
        .byte   $FF                             ; CA26 FF                       .
        .byte   $FF                             ; CA27 FF                       .
        .byte   $0C                             ; CA28 0C                       .
        ora     ($55,x)                         ; CA29 01 55                    .U
        .byte   $FF                             ; CA2B FF                       .
        brk                                     ; CA2C 00                       .
        txa                                     ; CA2D 8A                       .
        and     ($42,x)                         ; CA2E 21 42                    !B
        .byte   $4F                             ; CA30 4F                       O
        lsr     $5355                           ; CA31 4E 55 53                 NUS
        jsr     L4353                           ; CA34 20 53 43                  SC
        eor     $4E                             ; CA37 45 4E                    EN
        eor     $21                             ; CA39 45 21                    E!
        .byte   $FF                             ; CA3B FF                       .
        ora     ($20,x)                         ; CA3C 01 20                    . 
        .byte   $23                             ; CA3E 23                       #
        .byte   $FF                             ; CA3F FF                       .
        .byte   $FF                             ; CA40 FF                       .
        jsr     L0101                           ; CA41 20 01 01                  ..
        .byte   $FF                             ; CA44 FF                       .
        brk                                     ; CA45 00                       .
        asl     $21                             ; CA46 06 21                    .!
        .byte   $42                             ; CA48 42                       B
        .byte   $4F                             ; CA49 4F                       O
        lsr     $5355                           ; CA4A 4E 55 53                 NUS
        jsr     L4353                           ; CA4D 20 53 43                  SC
        eor     $4E                             ; CA50 45 4E                    EN
        eor     $20                             ; CA52 45 20                    E 
        .byte   $52                             ; CA54 52                       R
        eor     $53                             ; CA55 45 53                    ES
        eor     $4C,x                           ; CA57 55 4C                    UL
        .byte   $54                             ; CA59 54                       T
        .byte   $53                             ; CA5A 53                       S
        rol     $01FF                           ; CA5B 2E FF 01                 ...
        jsr     LFF23                           ; CA5E 20 23 FF                  #.
        .byte   $FF                             ; CA61 FF                       .
        .byte   $20                             ; CA62 20                        
        .byte   $01                             ; CA63 01                       .
LCA64:  ora     ($FF,x)                         ; CA64 01 FF                    ..
LCA66:  brk                                     ; CA66 00                       .
        .byte   $6F                             ; CA67 6F                       o
LCA68:  .byte   $2B                             ; CA68 2B                       +
        clc                                     ; CA69 18                       .
LCA6A:  ora     LFF1A,y                         ; CA6A 19 1A FF                 ...
        brk                                     ; CA6D 00                       .
        .byte   $6F                             ; CA6E 6F                       o
        .byte   $2B                             ; CA6F 2B                       +
        .byte   $0B                             ; CA70 0B                       .
        .byte   $0C                             ; CA71 0C                       .
        .byte   $FF                             ; CA72 FF                       .
        asl     $1C1B,x                         ; CA73 1E 1B 1C                 ...
        .byte   $FF                             ; CA76 FF                       .
        brk                                     ; CA77 00                       .
        jsr     LFF20                           ; CA78 20 20 FF                   .
        .byte   $FF                             ; CA7B FF                       .
        jsr     L071D                           ; CA7C 20 1D 07                  ..
        .byte   $FF                             ; CA7F FF                       .
        ora     ($5D,x)                         ; CA80 01 5D                    .]
        jsr     L0A09                           ; CA82 20 09 0A                  ..
        .byte   $0B                             ; CA85 0B                       .
        .byte   $FF                             ; CA86 FF                       .
        asl     a                               ; CA87 0A                       .
        ora     #$0F                            ; CA88 09 0F                    ..
        .byte   $07                             ; CA8A 07                       .
        rol     $38,x                           ; CA8B 36 38                    68
        and     $3B3A,y                         ; CA8D 39 3A 3B                 9:;
        .byte   $FF                             ; CA90 FF                       .
        .byte   $13                             ; CA91 13                       .
        ora     #$0A                            ; CA92 09 0A                    ..
        .byte   $0F                             ; CA94 0F                       .
        .byte   $FF                             ; CA95 FF                       .
        .byte   $04                             ; CA96 04                       .
        rol     $37,x                           ; CA97 36 37                    67
        sec                                     ; CA99 38                       8
        and     $3A39,y                         ; CA9A 39 39 3A                 99:
        .byte   $3B                             ; CA9D 3B                       ;
        .byte   $0F                             ; CA9E 0F                       .
        .byte   $FF                             ; CA9F FF                       .
        bpl     LCAD8                           ; CAA0 10 36                    .6
        sec                                     ; CAA2 38                       8
        and     $3B3A,y                         ; CAA3 39 3A 3B                 9:;
        .byte   $FF                             ; CAA6 FF                       .
        .byte   $07                             ; CAA7 07                       .
        ora     #$0A                            ; CAA8 09 0A                    ..
        .byte   $0B                             ; CAAA 0B                       .
        .byte   $0C                             ; CAAB 0C                       .
        ora     L0F0E                           ; CAAC 0D 0E 0F                 ...
        .byte   $FF                             ; CAAF FF                       .
        .byte   $17                             ; CAB0 17                       .
        rol     $37,x                           ; CAB1 36 37                    67
        sec                                     ; CAB3 38                       8
        and     $3B3A,y                         ; CAB4 39 3A 3B                 9:;
        .byte   $FF                             ; CAB7 FF                       .
        asl     $36                             ; CAB8 06 36                    .6
        .byte   $37                             ; CABA 37                       7
        .byte   $3B                             ; CABB 3B                       ;
        .byte   $FF                             ; CABC FF                       .
        ora     $09                             ; CABD 05 09                    ..
        .byte   $0F                             ; CABF 0F                       .
        .byte   $FF                             ; CAC0 FF                       .
        asl     $36                             ; CAC1 06 36                    .6
        .byte   $37                             ; CAC3 37                       7
        .byte   $3B                             ; CAC4 3B                       ;
        .byte   $FF                             ; CAC5 FF                       .
        ora     $36                             ; CAC6 05 36                    .6
        .byte   $37                             ; CAC8 37                       7
        sec                                     ; CAC9 38                       8
        and     $3B3A,y                         ; CACA 39 3A 3B                 9:;
        .byte   $0F                             ; CACD 0F                       .
        .byte   $FF                             ; CACE FF                       .
        .byte   $1C                             ; CACF 1C                       .
        rol     $37,x                           ; CAD0 36 37                    67
        .byte   $3B                             ; CAD2 3B                       ;
        .byte   $FF                             ; CAD3 FF                       .
        asl     $3736                           ; CAD4 0E 36 37                 .67
        .byte   $37                             ; CAD7 37                       7
LCAD8:  .byte   $3B                             ; CAD8 3B                       ;
        .byte   $FF                             ; CAD9 FF                       .
        asl     $09                             ; CADA 06 09                    ..
        asl     a                               ; CADC 0A                       .
        asl     LFF0F                           ; CADD 0E 0F FF                 ...
        ora     #$46                            ; CAE0 09 46                    .F
        .byte   $47                             ; CAE2 47                       G
        eor     #$47                            ; CAE3 49 47                    IG
        .byte   $47                             ; CAE5 47                       G
        pha                                     ; CAE6 48                       H
        eor     #$4A                            ; CAE7 49 4A                    IJ
        lsr     a                               ; CAE9 4A                       J
        .byte   $FF                             ; CAEA FF                       .
        .byte   $03                             ; CAEB 03                       .
        lsr     $47                             ; CAEC 46 47                    FG
        eor     #$4A                            ; CAEE 49 4A                    IJ
        .byte   $FF                             ; CAF0 FF                       .
        .byte   $0B                             ; CAF1 0B                       .
        lsr     $47                             ; CAF2 46 47                    FG
        eor     #$4A                            ; CAF4 49 4A                    IJ
        .byte   $FF                             ; CAF6 FF                       .
        php                                     ; CAF7 08                       .
        lsr     $47                             ; CAF8 46 47                    FG
        eor     #$4A                            ; CAFA 49 4A                    IJ
        .byte   $FF                             ; CAFC FF                       .
        .byte   $04                             ; CAFD 04                       .
        lsr     $47                             ; CAFE 46 47                    FG
        pha                                     ; CB00 48                       H
        eor     #$4A                            ; CB01 49 4A                    IJ
        .byte   $FF                             ; CB03 FF                       .
        .byte   $2F                             ; CB04 2F                       /
        ror     $9D6F                           ; CB05 6E 6F 9D                 no.
        ror     $9D6F                           ; CB08 6E 6F 9D                 no.
        ror     $076F                           ; CB0B 6E 6F 07                 no.
        sta     $6F6E,x                         ; CB0E 9D 6E 6F                 .no
        .byte   $FF                             ; CB11 FF                       .
        .byte   $14                             ; CB12 14                       .
        ror     $9E7F,x                         ; CB13 7E 7F 9E                 ~..
        ror     $9E7F,x                         ; CB16 7E 7F 9E                 ~..
        ror     $077F,x                         ; CB19 7E 7F 07                 ~..
        .byte   $9E                             ; CB1C 9E                       .
        ror     LFF7F,x                         ; CB1D 7E 7F FF                 ~..
        .byte   $03                             ; CB20 03                       .
        ora     $1B1A,y                         ; CB21 19 1A 1B                 ...
        .byte   $1C                             ; CB24 1C                       .
        ora     $1F1E,x                         ; CB25 1D 1E 1F                 ...
        .byte   $1C                             ; CB28 1C                       .
        ora     $1F1D,x                         ; CB29 1D 1D 1F                 ...
        .byte   $1C                             ; CB2C 1C                       .
        ora     $1C1D,x                         ; CB2D 1D 1D 1C                 ...
        ora     $8E1D,x                         ; CB30 1D 1D 8E                 ...
        .byte   $8F                             ; CB33 8F                       .
        .byte   $9F                             ; CB34 9F                       .
        stx     $9F8F                           ; CB35 8E 8F 9F                 ...
        stx     $078F                           ; CB38 8E 8F 07                 ...
        .byte   $9F                             ; CB3B 9F                       .
        stx     LFF8F                           ; CB3C 8E 8F FF                 ...
        .byte   $03                             ; CB3F 03                       .
        and     #$2A                            ; CB40 29 2A                    )*
        .byte   $2B                             ; CB42 2B                       +
        bit     $2E2D                           ; CB43 2C 2D 2E                 ,-.
        .byte   $2F                             ; CB46 2F                       /
        bit     $2E2D                           ; CB47 2C 2D 2E                 ,-.
        .byte   $2F                             ; CB4A 2F                       /
        bit     $2E2D                           ; CB4B 2C 2D 2E                 ,-.
        bit     $2E2D                           ; CB4E 2C 2D 2E                 ,-.
        .byte   $FF                             ; CB51 FF                       .
        .byte   $FF                             ; CB52 FF                       .
        .byte   $0C                             ; CB53 0C                       .
        ora     ($3D,x)                         ; CB54 01 3D                    .=
        .byte   $FF                             ; CB56 FF                       .
        .byte   $FF                             ; CB57 FF                       .
        .byte   $0C                             ; CB58 0C                       .
        ora     ($4D,x)                         ; CB59 01 4D                    .M
        ldy     $AC07                           ; CB5B AC 07 AC                 ...
        lda     $07AC                           ; CB5E AD AC 07                 ...
        ldy     $07AC                           ; CB61 AC AC 07                 ...
        lda     $ADAC                           ; CB64 AD AC AD                 ...
        lsr     $01FF,x                         ; CB67 5E FF 01                 ^..
        .byte   $0C                             ; CB6A 0C                       .
        .byte   $22                             ; CB6B 22                       "
        rol     LFFFF,x                         ; CB6C 3E FF FF                 >..
        .byte   $13                             ; CB6F 13                       .
        ora     ($3F,x)                         ; CB70 01 3F                    .?
        .byte   $FF                             ; CB72 FF                       .
        ora     ($2C,x)                         ; CB73 01 2C                    .,
        .byte   $22                             ; CB75 22                       "
        lsr     LFFFF                           ; CB76 4E FF FF                 N..
        .byte   $13                             ; CB79 13                       .
        ora     ($4F,x)                         ; CB7A 01 4F                    .O
        .byte   $FF                             ; CB7C FF                       .
        .byte   $FF                             ; CB7D FF                       .
        .byte   $13                             ; CB7E 13                       .
        ora     ($5F,x)                         ; CB7F 01 5F                    ._
        .byte   $FF                             ; CB81 FF                       .
        ora     ($64,x)                         ; CB82 01 64                    .d
        .byte   $22                             ; CB84 22                       "
        ldy     $AD07                           ; CB85 AC 07 AD                 ...
        .byte   $FF                             ; CB88 FF                       .
        .byte   $03                             ; CB89 03                       .
        ldy     $AD07                           ; CB8A AC 07 AD                 ...
        .byte   $07                             ; CB8D 07                       .
        .byte   $07                             ; CB8E 07                       .
        ldy     $ACAD                           ; CB8F AC AD AC                 ...
        .byte   $07                             ; CB92 07                       .
        ldy     $0707                           ; CB93 AC 07 07                 ...
        ldy     $0707                           ; CB96 AC 07 07                 ...
        ldy     $07AD                           ; CB99 AC AD 07                 ...
        .byte   $07                             ; CB9C 07                       .
        ldy     $ADAD                           ; CB9D AC AD AD                 ...
        .byte   $07                             ; CBA0 07                       .
        .byte   $07                             ; CBA1 07                       .
        ldy     $BE07                           ; CBA2 AC 07 BE                 ...
        .byte   $07                             ; CBA5 07                       .
        .byte   $07                             ; CBA6 07                       .
        ldy     $03FF                           ; CBA7 AC FF 03                 ...
        ldy     $0707                           ; CBAA AC 07 07                 ...
        lda     $0707                           ; CBAD AD 07 07                 ...
        lda     $07AC                           ; CBB0 AD AC 07                 ...
        .byte   $07                             ; CBB3 07                       .
        ldy     $AD07                           ; CBB4 AC 07 AD                 ...
        .byte   $07                             ; CBB7 07                       .
        ldy     $BE07                           ; CBB8 AC 07 BE                 ...
        .byte   $07                             ; CBBB 07                       .
        lda     $07AC                           ; CBBC AD AC 07                 ...
        .byte   $07                             ; CBBF 07                       .
        ldy     $07BD,x                         ; CBC0 BC BD 07                 ...
        .byte   $07                             ; CBC3 07                       .
        ldy     $07BD,x                         ; CBC4 BC BD 07                 ...
        .byte   $BF                             ; CBC7 BF                       .
        .byte   $BE                             ; CBC8 BE                       .
        .byte   $07                             ; CBC9 07                       .
LCBCA:  .byte   $07                             ; CBCA 07                       .
        ldy     $07BD,x                         ; CBCB BC BD 07                 ...
        .byte   $07                             ; CBCE 07                       .
        ldx     $BC07,y                         ; CBCF BE 07 BC                 ...
        lda     $BE07,x                         ; CBD2 BD 07 BE                 ...
        .byte   $07                             ; CBD5 07                       .
        ldy     $07BD,x                         ; CBD6 BC BD 07                 ...
        .byte   $07                             ; CBD9 07                       .
        ldx     $07BF,y                         ; CBDA BE BF 07                 ...
        .byte   $07                             ; CBDD 07                       .
        ldy     LFFBD,x                         ; CBDE BC BD FF                 ...
        ora     #$BF                            ; CBE1 09 BF                    ..
        .byte   $FF                             ; CBE3 FF                       .
        asl     $BC                             ; CBE4 06 BC                    ..
        lda     $10FF,x                         ; CBE6 BD FF 10                 ...
        ldx     $07AF                           ; CBE9 AE AF 07                 ...
        .byte   $07                             ; CBEC 07                       .
        ldy     LFFBD,x                         ; CBED BC BD FF                 ...
        .byte   $03                             ; CBF0 03                       .
        ldx     LFFAF                           ; CBF1 AE AF FF                 ...
        php                                     ; CBF4 08                       .
        ldx     $07AF                           ; CBF5 AE AF 07                 ...
        .byte   $07                             ; CBF8 07                       .
        ldy     LFFBD,x                         ; CBF9 BC BD FF                 ...
        .byte   $0D                             ; CBFC 0D                       .
        .byte   $AE                             ; CBFD AE                       .
LCBFE:  .byte   $AF                             ; CBFE AF                       .
        .byte   $FF                             ; CBFF FF                       .
        .byte   $07                             ; CC00 07                       .
        ldx     LFFAF                           ; CC01 AE AF FF                 ...
        .byte   $04                             ; CC04 04                       .
        ldx     $07AF                           ; CC05 AE AF 07                 ...
        .byte   $07                             ; CC08 07                       .
        ldx     LFFAF                           ; CC09 AE AF FF                 ...
        ora     ($C0,x)                         ; CC0C 01 C0                    ..
        .byte   $23                             ; CC0E 23                       #
        .byte   $FF                             ; CC0F FF                       .
        .byte   $FF                             ; CC10 FF                       .
        clc                                     ; CC11 18                       .
        ora     ($FF,x)                         ; CC12 01 FF                    ..
        .byte   $FF                             ; CC14 FF                       .
        ora     ($D8,x)                         ; CC15 01 D8                    ..
        .byte   $23                             ; CC17 23                       #
        .byte   $FF                             ; CC18 FF                       .
        .byte   $FF                             ; CC19 FF                       .
        php                                     ; CC1A 08                       .
        ora     ($55,x)                         ; CC1B 01 55                    .U
        .byte   $FF                             ; CC1D FF                       .
        ora     ($E0,x)                         ; CC1E 01 E0                    ..
        .byte   $23                             ; CC20 23                       #
        .byte   $FF                             ; CC21 FF                       .
        .byte   $FF                             ; CC22 FF                       .
        jsr     LAA01                           ; CC23 20 01 AA                  ..
        .byte   $FF                             ; CC26 FF                       .
        brk                                     ; CC27 00                       .
        .byte   $AB                             ; CC28 AB                       .
        jsr     L7476                           ; CC29 20 76 74                  vt
        ora     L0000,x                         ; CC2C 15 00                    ..
        .byte   $13                             ; CC2E 13                       .
        .byte   $74                             ; CC2F 74                       t
        bvs     LCCA5                           ; CC30 70 73                    ps
        .byte   $0F                             ; CC32 0F                       .
LCC33:  ror     a                               ; CC33 6A                       j
        .byte   $FF                             ; CC34 FF                       .
        .byte   $53                             ; CC35 53                       S
        .byte   $89                             ; CC36 89                       .
        txa                                     ; CC37 8A                       .
        .byte   $8B                             ; CC38 8B                       .
        .byte   $03                             ; CC39 03                       .
        .byte   $03                             ; CC3A 03                       .
        .byte   $80                             ; CC3B 80                       .
        sta     ($90,x)                         ; CC3C 81 90                    ..
        sta     ($02),y                         ; CC3E 91 02                    ..
        .byte   $03                             ; CC40 03                       .
        .byte   $03                             ; CC41 03                       .
        .byte   $03                             ; CC42 03                       .
        .byte   $03                             ; CC43 03                       .
        .byte   $03                             ; CC44 03                       .
        .byte   $03                             ; CC45 03                       .
        .byte   $FF                             ; CC46 FF                       .
        bpl     LCC4C                           ; CC47 10 03                    ..
        .byte   $03                             ; CC49 03                       .
        .byte   $03                             ; CC4A 03                       .
        .byte   $03                             ; CC4B 03                       .
LCC4C:  .byte   $82                             ; CC4C 82                       .
        .byte   $83                             ; CC4D 83                       .
        sty     $85                             ; CC4E 84 85                    ..
        stx     $87                             ; CC50 86 87                    ..
        .byte   $03                             ; CC52 03                       .
        dey                                     ; CC53 88                       .
        .byte   $89                             ; CC54 89                       .
        txa                                     ; CC55 8A                       .
        .byte   $8B                             ; CC56 8B                       .
        .byte   $03                             ; CC57 03                       .
        .byte   $FF                             ; CC58 FF                       .
        bpl     LCC5E                           ; CC59 10 03                    ..
        .byte   $03                             ; CC5B 03                       .
        tya                                     ; CC5C 98                       .
        .byte   $99                             ; CC5D 99                       .
LCC5E:  .byte   $92                             ; CC5E 92                       .
        .byte   $03                             ; CC5F 03                       .
        sty     $95,x                           ; CC60 94 95                    ..
        stx     $97,y                           ; CC62 96 97                    ..
        .byte   $03                             ; CC64 03                       .
        tya                                     ; CC65 98                       .
        sta     $9B9A,y                         ; CC66 99 9A 9B                 ...
        .byte   $03                             ; CC69 03                       .
        .byte   $FF                             ; CC6A FF                       .
        bpl     LCC70                           ; CC6B 10 03                    ..
        .byte   $03                             ; CC6D 03                       .
        .byte   $03                             ; CC6E 03                       .
        .byte   $03                             ; CC6F 03                       .
LCC70:  ldx     #$A3                            ; CC70 A2 A3                    ..
        ldy     $A5                             ; CC72 A4 A5                    ..
        ldx     $A7                             ; CC74 A6 A7                    ..
        tay                                     ; CC76 A8                       .
        .byte   $03                             ; CC77 03                       .
        .byte   $03                             ; CC78 03                       .
        .byte   $03                             ; CC79 03                       .
        .byte   $03                             ; CC7A 03                       .
        .byte   $03                             ; CC7B 03                       .
        .byte   $FF                             ; CC7C FF                       .
LCC7D:  bpl     LCC82                           ; CC7D 10 03                    ..
        .byte   $03                             ; CC7F 03                       .
        bcs     LCC33                           ; CC80 B0 B1                    ..
LCC82:  .byte   $B2                             ; CC82 B2                       .
        .byte   $B3                             ; CC83 B3                       .
        ldy     $B5,x                           ; CC84 B4 B5                    ..
        ldx     $B7,y                           ; CC86 B6 B7                    ..
        clv                                     ; CC88 B8                       .
        lda     $0303,y                         ; CC89 B9 03 03                 ...
        tya                                     ; CC8C 98                       .
        sta     $10FF,y                         ; CC8D 99 FF 10                 ...
        .byte   $03                             ; CC90 03                       .
        .byte   $03                             ; CC91 03                       .
        cpy     #$C1                            ; CC92 C0 C1                    ..
        .byte   $C2                             ; CC94 C2                       .
        .byte   $C3                             ; CC95 C3                       .
        cpy     $C5                             ; CC96 C4 C5                    ..
        dec     $C7                             ; CC98 C6 C7                    ..
        iny                                     ; CC9A C8                       .
        cmp     #$03                            ; CC9B C9 03                    ..
        .byte   $03                             ; CC9D 03                       .
        .byte   $03                             ; CC9E 03                       .
        .byte   $03                             ; CC9F 03                       .
        .byte   $FF                             ; CCA0 FF                       .
        bpl     LCC7D                           ; CCA1 10 DA                    ..
        .byte   $DB                             ; CCA3 DB                       .
        .byte   $D0                             ; CCA4 D0                       .
LCCA5:  cmp     ($D2),y                         ; CCA5 D1 D2                    ..
        .byte   $D3                             ; CCA7 D3                       .
        .byte   $D4                             ; CCA8 D4                       .
        cmp     $D6,x                           ; CCA9 D5 D6                    ..
        .byte   $D7                             ; CCAB D7                       .
        cld                                     ; CCAC D8                       .
        cmp     LDBDA,y                         ; CCAD D9 DA DB                 ...
        .byte   $DA                             ; CCB0 DA                       .
        .byte   $DB                             ; CCB1 DB                       .
        .byte   $FF                             ; CCB2 FF                       .
        bpl     LCCB8                           ; CCB3 10 03                    ..
        .byte   $03                             ; CCB5 03                       .
        cpx     #$E1                            ; CCB6 E0 E1                    ..
LCCB8:  .byte   $E2                             ; CCB8 E2                       .
        .byte   $E3                             ; CCB9 E3                       .
        cpx     $E5                             ; CCBA E4 E5                    ..
        inc     $E7                             ; CCBC E6 E7                    ..
        inx                                     ; CCBE E8                       .
        sbc     #$EA                            ; CCBF E9 EA                    ..
        .byte   $03                             ; CCC1 03                       .
        .byte   $03                             ; CCC2 03                       .
        .byte   $03                             ; CCC3 03                       .
        .byte   $FF                             ; CCC4 FF                       .
        bpl     LCCCA                           ; CCC5 10 03                    ..
        .byte   $03                             ; CCC7 03                       .
        .byte   $03                             ; CCC8 03                       .
        .byte   $F1                             ; CCC9 F1                       .
LCCCA:  .byte   $F2                             ; CCCA F2                       .
        .byte   $F3                             ; CCCB F3                       .
        .byte   $F4                             ; CCCC F4                       .
        sbc     $F6,x                           ; CCCD F5 F6                    ..
        .byte   $F7                             ; CCCF F7                       .
        .byte   $03                             ; CCD0 03                       .
        .byte   $03                             ; CCD1 03                       .
        .byte   $03                             ; CCD2 03                       .
        .byte   $03                             ; CCD3 03                       .
        .byte   $03                             ; CCD4 03                       .
        .byte   $03                             ; CCD5 03                       .
        .byte   $FF                             ; CCD6 FF                       .
        .byte   $53                             ; CCD7 53                       S
        .byte   $7B                             ; CCD8 7B                       {
        sei                                     ; CCD9 78                       x
        .byte   $17                             ; CCDA 17                       .
        .byte   $74                             ; CCDB 74                       t
        .byte   $14                             ; CCDC 14                       .
        .byte   $6B                             ; CCDD 6B                       k
        .byte   $FF                             ; CCDE FF                       .
        .byte   $37                             ; CCDF 37                       7
        .byte   $77                             ; CCE0 77                       w
        sei                                     ; CCE1 78                       x
        .byte   $3B                             ; CCE2 3B                       ;
        .byte   $14                             ; CCE3 14                       .
        .byte   $72                             ; CCE4 72                       r
        asl     $13                             ; CCE5 06 13                    ..
        .byte   $74                             ; CCE7 74                       t
LCCE8:  .byte   $6B                             ; CCE8 6B                       k
        .byte   $FF                             ; CCE9 FF                       .
        .byte   $01                             ; CCEA 01                       .
LCCEB:  jsr     LFF23                           ; CCEB 20 23 FF                  #.
        .byte   $FF                             ; CCEE FF                       .
        jsr     L0101                           ; CCEF 20 01 01                  ..
        .byte   $FF                             ; CCF2 FF                       .
        ora     ($D2,x)                         ; CCF3 01 D2                    ..
        .byte   $23                             ; CCF5 23                       #
        tax                                     ; CCF6 AA                       .
        .byte   $22                             ; CCF7 22                       "
        dey                                     ; CCF8 88                       .
        tax                                     ; CCF9 AA                       .
        .byte   $FF                             ; CCFA FF                       .
        .byte   $04                             ; CCFB 04                       .
        .byte   $5A                             ; CCFC 5A                       Z
        .byte   $DA                             ; CCFD DA                       .
        .byte   $FA                             ; CCFE FA                       .
        .byte   $5A                             ; CCFF 5A                       Z
        .byte   $FF                             ; CD00 FF                       .
        .byte   $04                             ; CD01 04                       .
        ora     $0D                             ; CD02 05 0D                    ..
        .byte   $0F                             ; CD04 0F                       .
        ora     $FF                             ; CD05 05 FF                    ..
        brk                                     ; CD07 00                       .
        .byte   $12                             ; CD08 12                       .
        cmp     LCD12                           ; CD09 CD 12 CD                 ...
        .byte   $12                             ; CD0C 12                       .
        cmp     LCD19                           ; CD0D CD 19 CD                 ...
        .byte   $19                             ; CD10 19                       .
        .byte   $CD                             ; CD11 CD                       .
LCD12:  ora     (L0003,x)                       ; CD12 01 03                    ..
        pha                                     ; CD14 48                       H
        brk                                     ; CD15 00                       .
        jsr     L0301                           ; CD16 20 01 03                  ..
LCD19:  brk                                     ; CD19 00                       .
        .byte   $02                             ; CD1A 02                       .
        cli                                     ; CD1B 58                       X
        brk                                     ; CD1C 00                       .
        cpy     #$00                            ; CD1D C0 00                    ..
        .byte   $02                             ; CD1F 02                       .
        bit     $CD                             ; CD20 24 CD                    $.
        .byte   $73                             ; CD22 73                       s
        cmp     $2080                           ; CD23 CD 80 20                 .. 
        .byte   $FF                             ; CD26 FF                       .
        .byte   $FF                             ; CD27 FF                       .
        bpl     LCD2F                           ; CD28 10 05                    ..
        sta     ($FF,x)                         ; CD2A 81 FF                    ..
        sbc     $8E08,x                         ; CD2C FD 08 8E                 ...
LCD2F:  .byte   $8F                             ; CD2F 8F                       .
        .byte   $FF                             ; CD30 FF                       .
        inc     LFDFF,x                         ; CD31 FE FF FD                 ...
        php                                     ; CD34 08                       .
        .byte   $83                             ; CD35 83                       .
        sty     $FF                             ; CD36 84 FF                    ..
        inc     LFDFF,x                         ; CD38 FE FF FD                 ...
        php                                     ; CD3B 08                       .
        sty     LFF8D                           ; CD3C 8C 8D FF                 ...
        inc     LFFFF,x                         ; CD3F FE FF FF                 ...
        bpl     LCD46                           ; CD42 10 02                    ..
        .byte   $80                             ; CD44 80                       .
        .byte   $80                             ; CD45 80                       .
LCD46:  .byte   $8B                             ; CD46 8B                       .
        .byte   $93                             ; CD47 93                       .
        .byte   $80                             ; CD48 80                       .
        .byte   $89                             ; CD49 89                       .
        .byte   $80                             ; CD4A 80                       .
        .byte   $8B                             ; CD4B 8B                       .
        .byte   $80                             ; CD4C 80                       .
        .byte   $93                             ; CD4D 93                       .
        txs                                     ; CD4E 9A                       .
        .byte   $9B                             ; CD4F 9B                       .
        .byte   $9E                             ; CD50 9E                       .
        .byte   $9F                             ; CD51 9F                       .
        .byte   $87                             ; CD52 87                       .
        .byte   $89                             ; CD53 89                       .
        .byte   $93                             ; CD54 93                       .
        bcc     LCCE8                           ; CD55 90 91                    ..
        .byte   $92                             ; CD57 92                       .
        bcc     LCCEB                           ; CD58 90 91                    ..
        sty     $95,x                           ; CD5A 94 95                    ..
        sta     ($92),y                         ; CD5C 91 92                    ..
        stx     $97,y                           ; CD5E 96 97                    ..
        tya                                     ; CD60 98                       .
        sta     $9190,y                         ; CD61 99 90 91                 ...
        .byte   $92                             ; CD64 92                       .
        .byte   $FF                             ; CD65 FF                       .
        ora     ($C2,x)                         ; CD66 01 C2                    ..
        .byte   $22                             ; CD68 22                       "
        txa                                     ; CD69 8A                       .
        .byte   $FF                             ; CD6A FF                       .
        .byte   $04                             ; CD6B 04                       .
        txa                                     ; CD6C 8A                       .
        .byte   $FF                             ; CD6D FF                       .
        .byte   $03                             ; CD6E 03                       .
        .byte   $9C                             ; CD6F 9C                       .
        sta     a:$FF,x                         ; CD70 9D FF 00                 ...
        .byte   $80                             ; CD73 80                       .
        jsr     LFFFF                           ; CD74 20 FF FF                  ..
        bpl     LCD7D                           ; CD77 10 04                    ..
        sta     ($FF,x)                         ; CD79 81 FF                    ..
        .byte   $FD                             ; CD7B FD                       .
        php                                     ; CD7C 08                       .
LCD7D:  stx     LFF8F                           ; CD7D 8E 8F FF                 ...
        inc     LFDFF,x                         ; CD80 FE FF FD                 ...
        php                                     ; CD83 08                       .
        .byte   $83                             ; CD84 83                       .
LCD85:  sty     $FF                             ; CD85 84 FF                    ..
        inc     LFDFF,x                         ; CD87 FE FF FD                 ...
        php                                     ; CD8A 08                       .
        sta     $86                             ; CD8B 85 86                    ..
        .byte   $FF                             ; CD8D FF                       .
        inc     LFDFF,x                         ; CD8E FE FF FD                 ...
        php                                     ; CD91 08                       .
        sty     LFF8D                           ; CD92 8C 8D FF                 ...
        inc     LFFFF,x                         ; CD95 FE FF FF                 ...
        bpl     LCD9F                           ; CD98 10 05                    ..
        .byte   $80                             ; CD9A 80                       .
        .byte   $FF                             ; CD9B FF                       .
        ora     ($80,x)                         ; CD9C 01 80                    ..
        .byte   $23                             ; CD9E 23                       #
LCD9F:  .byte   $A3                             ; CD9F A3                       .
        .byte   $FF                             ; CDA0 FF                       .
        .byte   $0B                             ; CDA1 0B                       .
        .byte   $B2                             ; CDA2 B2                       .
        ldy     $B5,x                           ; CDA3 B4 B5                    ..
        ldx     $FF,y                           ; CDA5 B6 FF                    ..
        ora     (L0000,x)                       ; CDA7 01 00                    ..
        plp                                     ; CDA9 28                       (
        .byte   $FF                             ; CDAA FF                       .
        .byte   $FF                             ; CDAB FF                       .
        bpl     LCDB0                           ; CDAC 10 02                    ..
        sta     ($FF,x)                         ; CDAE 81 FF                    ..
LCDB0:  .byte   $FF                             ; CDB0 FF                       .
        bpl     LCDB5                           ; CDB1 10 02                    ..
        .byte   $80                             ; CDB3 80                       .
        .byte   $90                             ; CDB4 90                       .
LCDB5:  sta     ($92),y                         ; CDB5 91 92                    ..
        ldy     #$96                            ; CDB7 A0 96                    ..
        tya                                     ; CDB9 98                       .
        tya                                     ; CDBA 98                       .
        tya                                     ; CDBB 98                       .
        tya                                     ; CDBC 98                       .
        sty     $94,x                           ; CDBD 94 94                    ..
        ldx     #$A1                            ; CDBF A2 A1                    ..
        sta     ($92),y                         ; CDC1 91 92                    ..
        stx     $FF,y                           ; CDC3 96 FF                    ..
        ora     ($02,x)                         ; CDC5 01 02                    ..
        plp                                     ; CDC7 28                       (
        ldy     $A5                             ; CDC8 A4 A5                    ..
        ldx     $A7                             ; CDCA A6 A7                    ..
        tay                                     ; CDCC A8                       .
        tax                                     ; CDCD AA                       .
        .byte   $87                             ; CDCE 87                       .
        .byte   $80                             ; CDCF 80                       .
        .byte   $80                             ; CDD0 80                       .
        .byte   $80                             ; CDD1 80                       .
        bcs     LCD85                           ; CDD2 B0 B1                    ..
        .byte   $B3                             ; CDD4 B3                       .
        .byte   $FF                             ; CDD5 FF                       .
        .byte   $07                             ; CDD6 07                       .
        lda     #$81                            ; CDD7 A9 81                    ..
        .byte   $AB                             ; CDD9 AB                       .
        ldy     $AEAD                           ; CDDA AC AD AE                 ...
        .byte   $AF                             ; CDDD AF                       .
        .byte   $FF                             ; CDDE FF                       .
        ora     #$9C                            ; CDDF 09 9C                    ..
        sta     $0CFF,x                         ; CDE1 9D FF 0C                 ...
        .byte   $93                             ; CDE4 93                       .
        txs                                     ; CDE5 9A                       .
        .byte   $9B                             ; CDE6 9B                       .
        .byte   $9E                             ; CDE7 9E                       .
        .byte   $9F                             ; CDE8 9F                       .
        .byte   $FF                             ; CDE9 FF                       .
        asl     $93                             ; CDEA 06 93                    ..
        .byte   $FF                             ; CDEC FF                       .
        brk                                     ; CDED 00                       .
        .byte   $02                             ; CDEE 02                       .
        jsr     L1221                           ; CDEF 20 21 12                  !.
        .byte   $02                             ; CDF2 02                       .
        .byte   $3C                             ; CDF3 3C                       <
        .byte   $0C                             ; CDF4 0C                       .
        .byte   $1C                             ; CDF5 1C                       .
        .byte   $02                             ; CDF6 02                       .
        asl     $21,x                           ; CDF7 16 21                    .!
        asl     $02                             ; CDF9 06 02                    ..
        bmi     LCE0C                           ; CDFB 30 0F                    0.
        .byte   $0F                             ; CDFD 0F                       .
        .byte   $02                             ; CDFE 02                       .
        jsr     L0F10                           ; CDFF 20 10 0F                  ..
        .byte   $02                             ; CE02 02                       .
        .byte   $3C                             ; CE03 3C                       <
        .byte   $0C                             ; CE04 0C                       .
        .byte   $1C                             ; CE05 1C                       .
        .byte   $02                             ; CE06 02                       .
        jsr     L0616                           ; CE07 20 16 06                  ..
        .byte   $02                             ; CE0A 02                       .
        .byte   $20                             ; CE0B 20                        
LCE0C:  and     ($12,x)                         ; CE0C 21 12                    !.
        .byte   $0F                             ; CE0E 0F                       .
        jsr     L2715                           ; CE0F 20 15 27                  .'
        .byte   $0F                             ; CE12 0F                       .
        jsr     L0717                           ; CE13 20 17 07                  ..
        .byte   $0F                             ; CE16 0F                       .
        .byte   $12                             ; CE17 12                       .
        and     ($20,x)                         ; CE18 21 20                    ! 
        .byte   $0F                             ; CE1A 0F                       .
        jsr     L1A08                           ; CE1B 20 08 1A                  ..
        .byte   $0F                             ; CE1E 0F                       .
        jsr     L1016                           ; CE1F 20 16 10                  ..
        .byte   $0F                             ; CE22 0F                       .
        jsr     L270F                           ; CE23 20 0F 27                  .'
        .byte   $0F                             ; CE26 0F                       .
        jsr     L0003                           ; CE27 20 03 00                  ..
        .byte   $0F                             ; CE2A 0F                       .
        .byte   $0F                             ; CE2B 0F                       .
        .byte   $27                             ; CE2C 27                       '
        .byte   $17                             ; CE2D 17                       .
        .byte   $0F                             ; CE2E 0F                       .
        jsr     L2716                           ; CE2F 20 16 27                  .'
        .byte   $0F                             ; CE32 0F                       .
        ora     ($02),y                         ; CE33 11 02                    ..
        bit     $110F                           ; CE35 2C 0F 11                 ,..
        clc                                     ; CE38 18                       .
        plp                                     ; CE39 28                       (
        .byte   $0F                             ; CE3A 0F                       .
        jsr     L1121                           ; CE3B 20 21 11                  !.
        .byte   $0F                             ; CE3E 0F                       .
        jsr     L1016                           ; CE3F 20 16 10                  ..
        .byte   $0F                             ; CE42 0F                       .
        jsr     L270F                           ; CE43 20 0F 27                  .'
        .byte   $0F                             ; CE46 0F                       .
        jsr     L0003                           ; CE47 20 03 00                  ..
        .byte   $0F                             ; CE4A 0F                       .
        .byte   $0F                             ; CE4B 0F                       .
        .byte   $27                             ; CE4C 27                       '
        .byte   $17                             ; CE4D 17                       .
        .byte   $0F                             ; CE4E 0F                       .
        jsr     L2716                           ; CE4F 20 16 27                  .'
        .byte   $0F                             ; CE52 0F                       .
        .byte   $12                             ; CE53 12                       .
        .byte   $0C                             ; CE54 0C                       .
        and     (L000F,x)                       ; CE55 21 0F                    !.
        .byte   $0C                             ; CE57 0C                       .
        .byte   $07                             ; CE58 07                       .
        .byte   $17                             ; CE59 17                       .
        .byte   $0F                             ; CE5A 0F                       .
        jsr     L1221                           ; CE5B 20 21 12                  !.
        .byte   $0F                             ; CE5E 0F                       .
        jsr     L1016                           ; CE5F 20 16 10                  ..
        .byte   $0F                             ; CE62 0F                       .
        jsr     L270F                           ; CE63 20 0F 27                  .'
        .byte   $0F                             ; CE66 0F                       .
        jsr     L0003                           ; CE67 20 03 00                  ..
        .byte   $0F                             ; CE6A 0F                       .
        .byte   $0F                             ; CE6B 0F                       .
        .byte   $27                             ; CE6C 27                       '
        .byte   $17                             ; CE6D 17                       .
        .byte   $0F                             ; CE6E 0F                       .
        jsr     L1021                           ; CE6F 20 21 10                  !.
        .byte   $0F                             ; CE72 0F                       .
        brk                                     ; CE73 00                       .
        brk                                     ; CE74 00                       .
        brk                                     ; CE75 00                       .
        .byte   $0F                             ; CE76 0F                       .
        and     ($17,x)                         ; CE77 21 17                    !.
        .byte   $1A                             ; CE79 1A                       .
        .byte   $0F                             ; CE7A 0F                       .
        jsr     L0212                           ; CE7B 20 12 02                  ..
        .byte   $0F                             ; CE7E 0F                       .
        jsr     L0F17                           ; CE7F 20 17 0F                  ..
        .byte   $0F                             ; CE82 0F                       .
        jsr     L000F                           ; CE83 20 0F 00                  ..
        .byte   $0F                             ; CE86 0F                       .
        jsr     L0F26                           ; CE87 20 26 0F                  &.
        .byte   $0F                             ; CE8A 0F                       .
        asl     $26,x                           ; CE8B 16 26                    .&
        .byte   $0F                             ; CE8D 0F                       .
        .byte   $0F                             ; CE8E 0F                       .
        jsr     L1626                           ; CE8F 20 26 16                  &.
        .byte   $0F                             ; CE92 0F                       .
        jsr     L230C                           ; CE93 20 0C 23                  .#
        .byte   $0F                             ; CE96 0F                       .
        brk                                     ; CE97 00                       .
        brk                                     ; CE98 00                       .
        brk                                     ; CE99 00                       .
        .byte   $0F                             ; CE9A 0F                       .
        rol     $0C                             ; CE9B 26 0C                    &.
        .byte   $1C                             ; CE9D 1C                       .
        .byte   $0F                             ; CE9E 0F                       .
        and     $20                             ; CE9F 25 20                    % 
        ora     L000F                           ; CEA1 05 0F                    ..
        .byte   $13                             ; CEA3 13                       .
        .byte   $23                             ; CEA4 23                       #
        .byte   $33                             ; CEA5 33                       3
        .byte   $0F                             ; CEA6 0F                       .
        asl     $26,x                           ; CEA7 16 26                    .&
        rol     L000F,x                         ; CEA9 36 0F                    6.
        ora     $3929,y                         ; CEAB 19 29 39                 .)9
        .byte   $0F                             ; CEAE 0F                       .
        jsr     L2612                           ; CEAF 20 12 26                  .&
        .byte   $0F                             ; CEB2 0F                       .
        asl     a                               ; CEB3 0A                       .
        .byte   $12                             ; CEB4 12                       .
        .byte   $17                             ; CEB5 17                       .
        .byte   $0F                             ; CEB6 0F                       .
        jsr     L131C                           ; CEB7 20 1C 13                  ..
        .byte   $0F                             ; CEBA 0F                       .
        jsr     L2212                           ; CEBB 20 12 22                  ."
        .byte   $0F                             ; CEBE 0F                       .
        jsr     L060F                           ; CEBF 20 0F 06                  ..
        .byte   $0F                             ; CEC2 0F                       .
        jsr     L260F                           ; CEC3 20 0F 26                  .&
        .byte   $0F                             ; CEC6 0F                       .
        jsr     L000F                           ; CEC7 20 0F 00                  ..
        .byte   $0F                             ; CECA 0F                       .
        jsr     L0F0F                           ; CECB 20 0F 0F                  ..
LCECE:  .byte   $0F                             ; CECE 0F                       .
        jsr     L2715                           ; CECF 20 15 27                  .'
        .byte   $0F                             ; CED2 0F                       .
        .byte   $12                             ; CED3 12                       .
        bpl     LCED6                           ; CED4 10 00                    ..
LCED6:  .byte   $0F                             ; CED6 0F                       .
        clc                                     ; CED7 18                       .
        php                                     ; CED8 08                       .
        plp                                     ; CED9 28                       (
        .byte   $0F                             ; CEDA 0F                       .
        .byte   $12                             ; CEDB 12                       .
        php                                     ; CEDC 08                       .
        plp                                     ; CEDD 28                       (
        .byte   $0F                             ; CEDE 0F                       .
        jsr     L0006                           ; CEDF 20 06 00                  ..
        .byte   $0F                             ; CEE2 0F                       .
        and     $16                             ; CEE3 25 16                    %.
        .byte   $12                             ; CEE5 12                       .
        .byte   $0F                             ; CEE6 0F                       .
        brk                                     ; CEE7 00                       .
        brk                                     ; CEE8 00                       .
        brk                                     ; CEE9 00                       .
        .byte   $0F                             ; CEEA 0F                       .
        brk                                     ; CEEB 00                       .
        brk                                     ; CEEC 00                       .
        brk                                     ; CEED 00                       .
        .byte   $0F                             ; CEEE 0F                       .
        jsr     L2612                           ; CEEF 20 12 26                  .&
        .byte   $0F                             ; CEF2 0F                       .
        jsr     L1C16                           ; CEF3 20 16 1C                  ..
        .byte   $0F                             ; CEF6 0F                       .
        jsr     L1210                           ; CEF7 20 10 12                  ..
        .byte   $0F                             ; CEFA 0F                       .
        asl     $10                             ; CEFB 06 10                    ..
        .byte   $1C                             ; CEFD 1C                       .
        .byte   $0F                             ; CEFE 0F                       .
        jsr     L0006                           ; CEFF 20 06 00                  ..
        .byte   $0F                             ; CF02 0F                       .
        and     $16                             ; CF03 25 16                    %.
        .byte   $12                             ; CF05 12                       .
        .byte   $0F                             ; CF06 0F                       .
        brk                                     ; CF07 00                       .
        brk                                     ; CF08 00                       .
        brk                                     ; CF09 00                       .
        .byte   $0F                             ; CF0A 0F                       .
        brk                                     ; CF0B 00                       .
        brk                                     ; CF0C 00                       .
        brk                                     ; CF0D 00                       .
        jsr     L8BEA                           ; CF0E 20 EA 8B                  ..
        lda     #$FF                            ; CF11 A9 FF                    ..
        jsr     LE2CD                           ; CF13 20 CD E2                  ..
        jsr     L977C                           ; CF16 20 7C 97                  |.
        jsr     L8E12                           ; CF19 20 12 8E                  ..
        jsr     LA78F                           ; CF1C 20 8F A7                  ..
        lda     #$07                            ; CF1F A9 07                    ..
        jsr     L8EBD                           ; CF21 20 BD 8E                  ..
        lda     #$09                            ; CF24 A9 09                    ..
        jsr     L8D69                           ; CF26 20 69 8D                  i.
        lda     #$00                            ; CF29 A9 00                    ..
        sta     $0320                           ; CF2B 8D 20 03                 . .
        sta     $0322                           ; CF2E 8D 22 03                 .".
        sta     $0323                           ; CF31 8D 23 03                 .#.
        sta     $0307                           ; CF34 8D 07 03                 ...
        lda     #$01                            ; CF37 A9 01                    ..
        sta     $0302                           ; CF39 8D 02 03                 ...
        sta     $0305                           ; CF3C 8D 05 03                 ...
        lda     #$03                            ; CF3F A9 03                    ..
        jsr     LE2CD                           ; CF41 20 CD E2                  ..
        jsr     L8BDE                           ; CF44 20 DE 8B                  ..
        jsr     L8BC2                           ; CF47 20 C2 8B                  ..
        lda     #$B4                            ; CF4A A9 B4                    ..
        sta     $12                             ; CF4C 85 12                    ..
LCF4E:  jsr     L8C40                           ; CF4E 20 40 8C                  @.
        ldy     #$02                            ; CF51 A0 02                    ..
        jsr     L8C60                           ; CF53 20 60 8C                  `.
        jsr     L8B83                           ; CF56 20 83 8B                  ..
        dec     $12                             ; CF59 C6 12                    ..
        bne     LCF4E                           ; CF5B D0 F1                    ..
        jsr     L8BEA                           ; CF5D 20 EA 8B                  ..
        jsr     L8E12                           ; CF60 20 12 8E                  ..
        jsr     LA78F                           ; CF63 20 8F A7                  ..
        lda     #$05                            ; CF66 A9 05                    ..
        jsr     L8D69                           ; CF68 20 69 8D                  i.
        lda     #$01                            ; CF6B A9 01                    ..
        jsr     LACE6                           ; CF6D 20 E6 AC                  ..
        lda     #$03                            ; CF70 A9 03                    ..
        jsr     L8D69                           ; CF72 20 69 8D                  i.
        lda     #$03                            ; CF75 A9 03                    ..
        jsr     L8EBD                           ; CF77 20 BD 8E                  ..
        lda     #$02                            ; CF7A A9 02                    ..
        sta     $0307                           ; CF7C 8D 07 03                 ...
        lda     #$00                            ; CF7F A9 00                    ..
        sta     $0320                           ; CF81 8D 20 03                 . .
        sta     $0323                           ; CF84 8D 23 03                 .#.
        sta     $0338                           ; CF87 8D 38 03                 .8.
        sta     $033A                           ; CF8A 8D 3A 03                 .:.
        sta     $033B                           ; CF8D 8D 3B 03                 .;.
        lda     #$10                            ; CF90 A9 10                    ..
        sta     $0339                           ; CF92 8D 39 03                 .9.
        lda     #$20                            ; CF95 A9 20                    . 
        sta     $0322                           ; CF97 8D 22 03                 .".
        lda     #$48                            ; CF9A A9 48                    .H
        sta     $033C                           ; CF9C 8D 3C 03                 .<.
        lda     #$00                            ; CF9F A9 00                    ..
        sta     $033D                           ; CFA1 8D 3D 03                 .=.
        lda     #$20                            ; CFA4 A9 20                    . 
        sta     $033E                           ; CFA6 8D 3E 03                 .>.
        lda     #$01                            ; CFA9 A9 01                    ..
        sta     $033F                           ; CFAB 8D 3F 03                 .?.
        lda     #$01                            ; CFAE A9 01                    ..
        sta     $0302                           ; CFB0 8D 02 03                 ...
        sta     $0305                           ; CFB3 8D 05 03                 ...
        lda     $038B                           ; CFB6 AD 8B 03                 ...
        asl     a                               ; CFB9 0A                       .
        adc     $038B                           ; CFBA 6D 8B 03                 m..
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
        jsr     L8BDE                           ; CFD0 20 DE 8B                  ..
        jsr     L8BC2                           ; CFD3 20 C2 8B                  ..
LCFD6:  jsr     L8C40                           ; CFD6 20 40 8C                  @.
        jsr     L8C87                           ; CFD9 20 87 8C                  ..
        jsr     LD1B6                           ; CFDC 20 B6 D1                  ..
        jsr     L9B8D                           ; CFDF 20 8D 9B                  ..
        jsr     LD27E                           ; CFE2 20 7E D2                  ~.
        jsr     L9A37                           ; CFE5 20 37 9A                  7.
        jsr     LA9B6                           ; CFE8 20 B6 A9                  ..
        jsr     L8B5F                           ; CFEB 20 5F 8B                  _.
        jsr     L8B83                           ; CFEE 20 83 8B                  ..
        bit     $53                             ; CFF1 24 53                    $S
        bpl     LCFD6                           ; CFF3 10 E1                    ..
        bvs     LD002                           ; CFF5 70 0B                    p.
        lda     #$78                            ; CFF7 A9 78                    .x
        sta     $52                             ; CFF9 85 52                    .R
        lda     #$C0                            ; CFFB A9 C0                    ..
        sta     $53                             ; CFFD 85 53                    .S
        jmp     LCFD6                           ; CFFF 4C D6 CF                 L..

; ----------------------------------------------------------------------------
LD002:  dec     $52                             ; D002 C6 52                    .R
        bne     LCFD6                           ; D004 D0 D0                    ..
        jsr     L8BEA                           ; D006 20 EA 8B                  ..
        jsr     L8BC2                           ; D009 20 C2 8B                  ..
        jsr     L8E2D                           ; D00C 20 2D 8E                  -.
        .byte   $A9                             ; D00F A9                       .
LD010:  asl     a                               ; D010 0A                       .
        jsr     L8D69                           ; D011 20 69 8D                  i.
        lda     #$00                            ; D014 A9 00                    ..
        sta     $0320                           ; D016 8D 20 03                 . .
        sta     $0322                           ; D019 8D 22 03                 .".
        sta     $0323                           ; D01C 8D 23 03                 .#.
        sta     $0307                           ; D01F 8D 07 03                 ...
        lda     #$01                            ; D022 A9 01                    ..
        sta     $0302                           ; D024 8D 02 03                 ...
        sta     $0305                           ; D027 8D 05 03                 ...
        jsr     L8BDE                           ; D02A 20 DE 8B                  ..
        jsr     L8BC2                           ; D02D 20 C2 8B                  ..
        lda     #$1A                            ; D030 A9 1A                    ..
        jsr     LE2CD                           ; D032 20 CD E2                  ..
        lda     #$78                            ; D035 A9 78                    .x
        jsr     LD11F                           ; D037 20 1F D1                  ..
        jsr     LA8A1                           ; D03A 20 A1 A8                  ..
        bvc     LD010                           ; D03D 50 D1                    P.
        lda     #$00                            ; D03F A9 00                    ..
        sta     $0100                           ; D041 8D 00 01                 ...
        ldx     L0101                           ; D044 AE 01 01                 ...
        lda     #$A1                            ; D047 A9 A1                    ..
        sta     $0102,x                         ; D049 9D 02 01                 ...
        inx                                     ; D04C E8                       .
        lda     #$7B                            ; D04D A9 7B                    .{
        sta     $0102,x                         ; D04F 9D 02 01                 ...
        inx                                     ; D052 E8                       .
        lda     #$02                            ; D053 A9 02                    ..
        sta     $0102,x                         ; D055 9D 02 01                 ...
        inx                                     ; D058 E8                       .
        lda     $54                             ; D059 A5 54                    .T
        jsr     LD139                           ; D05B 20 39 D1                  9.
        jsr     LD146                           ; D05E 20 46 D1                  F.
        sta     $0103,x                         ; D061 9D 03 01                 ...
        tya                                     ; D064 98                       .
        sta     $0102,x                         ; D065 9D 02 01                 ...
        inx                                     ; D068 E8                       .
        inx                                     ; D069 E8                       .
        stx     L0101                           ; D06A 8E 01 01                 ...
        lda     #$80                            ; D06D A9 80                    ..
        sta     $0100                           ; D06F 8D 00 01                 ...
        lda     $0304                           ; D072 AD 04 03                 ...
        ora     #$10                            ; D075 09 10                    ..
        sta     $0304                           ; D077 8D 04 03                 ...
        lda     #$78                            ; D07A A9 78                    .x
        jsr     LD11F                           ; D07C 20 1F D1                  ..
        jsr     LA8A1                           ; D07F 20 A1 A8                  ..
        .byte   $67                             ; D082 67                       g
        cmp     ($A9),y                         ; D083 D1 A9                    ..
        brk                                     ; D085 00                       .
        sta     $0100                           ; D086 8D 00 01                 ...
        ldx     L0101                           ; D089 AE 01 01                 ...
        lda     #$A1                            ; D08C A9 A1                    ..
        sta     $0102,x                         ; D08E 9D 02 01                 ...
        inx                                     ; D091 E8                       .
        lda     #$DB                            ; D092 A9 DB                    ..
        sta     $0102,x                         ; D094 9D 02 01                 ...
        inx                                     ; D097 E8                       .
        lda     #$02                            ; D098 A9 02                    ..
        sta     $0102,x                         ; D09A 9D 02 01                 ...
        inx                                     ; D09D E8                       .
        lda     $54                             ; D09E A5 54                    .T
LD0A0:  ldy     #$00                            ; D0A0 A0 00                    ..
LD0A2:  cmp     #$03                            ; D0A2 C9 03                    ..
        bcc     LD0AC                           ; D0A4 90 06                    ..
        sbc     #$03                            ; D0A6 E9 03                    ..
        iny                                     ; D0A8 C8                       .
        jmp     LD0A2                           ; D0A9 4C A2 D0                 L..

; ----------------------------------------------------------------------------
LD0AC:  tya                                     ; D0AC 98                       .
        sta     L0000                           ; D0AD 85 00                    ..
        jsr     LD139                           ; D0AF 20 39 D1                  9.
        jsr     LD146                           ; D0B2 20 46 D1                  F.
        sta     $0103,x                         ; D0B5 9D 03 01                 ...
        tya                                     ; D0B8 98                       .
        sta     $0102,x                         ; D0B9 9D 02 01                 ...
        inx                                     ; D0BC E8                       .
        inx                                     ; D0BD E8                       .
        stx     L0101                           ; D0BE 8E 01 01                 ...
        lda     #$80                            ; D0C1 A9 80                    ..
        sta     $0100                           ; D0C3 8D 00 01                 ...
        lda     $0304                           ; D0C6 AD 04 03                 ...
        ora     #$10                            ; D0C9 09 10                    ..
        sta     $0304                           ; D0CB 8D 04 03                 ...
        lda     #$3C                            ; D0CE A9 3C                    .<
        jsr     LD11F                           ; D0D0 20 1F D1                  ..
        lda     L0000                           ; D0D3 A5 00                    ..
        clc                                     ; D0D5 18                       .
        adc     $0390                           ; D0D6 6D 90 03                 m..
        cmp     #$64                            ; D0D9 C9 64                    .d
        bcc     LD0DF                           ; D0DB 90 02                    ..
        lda     #$63                            ; D0DD A9 63                    .c
LD0DF:  sta     $0390                           ; D0DF 8D 90 03                 ...
        lda     $0304                           ; D0E2 AD 04 03                 ...
        ora     #$08                            ; D0E5 09 08                    ..
        sta     $0304                           ; D0E7 8D 04 03                 ...
        lda     $54                             ; D0EA A5 54                    .T
        cmp     #$1E                            ; D0EC C9 1E                    ..
        bcs     LD0FB                           ; D0EE B0 0B                    ..
        lda     #$0C                            ; D0F0 A9 0C                    ..
        jsr     LE2CD                           ; D0F2 20 CD E2                  ..
        lda     #$78                            ; D0F5 A9 78                    .x
        jsr     LD11F                           ; D0F7 20 1F D1                  ..
        rts                                     ; D0FA 60                       `

; ----------------------------------------------------------------------------
LD0FB:  lda     #$3C                            ; D0FB A9 3C                    .<
        jsr     LD11F                           ; D0FD 20 1F D1                  ..
        jsr     LA8A1                           ; D100 20 A1 A8                  ..
        .byte   $82                             ; D103 82                       .
        cmp     ($A9),y                         ; D104 D1 A9                    ..
        .byte   $3C                             ; D106 3C                       <
        jsr     LD11F                           ; D107 20 1F D1                  ..
        jsr     LA8A1                           ; D10A 20 A1 A8                  ..
        .byte   $97                             ; D10D 97                       .
        cmp     ($A9),y                         ; D10E D1 A9                    ..
        ora     ($20),y                         ; D110 11 20                    . 
        bne     LD0A0                           ; D112 D0 8C                    ..
        lda     #$15                            ; D114 A9 15                    ..
        jsr     LE2CD                           ; D116 20 CD E2                  ..
        lda     #$78                            ; D119 A9 78                    .x
        jsr     LD11F                           ; D11B 20 1F D1                  ..
        rts                                     ; D11E 60                       `

; ----------------------------------------------------------------------------
LD11F:  sta     $12                             ; D11F 85 12                    ..
LD121:  jsr     L8C40                           ; D121 20 40 8C                  @.
        ldy     #$02                            ; D124 A0 02                    ..
        jsr     L8C60                           ; D126 20 60 8C                  `.
        jsr     L8B5F                           ; D129 20 5F 8B                  _.
        lda     #$01                            ; D12C A9 01                    ..
        sta     $0302                           ; D12E 8D 02 03                 ...
        jsr     L8B83                           ; D131 20 83 8B                  ..
        dec     $12                             ; D134 C6 12                    ..
        bne     LD121                           ; D136 D0 E9                    ..
        rts                                     ; D138 60                       `

; ----------------------------------------------------------------------------
LD139:  ldy     #$00                            ; D139 A0 00                    ..
LD13B:  cmp     #$0A                            ; D13B C9 0A                    ..
        bcc     LD145                           ; D13D 90 06                    ..
        sbc     #$0A                            ; D13F E9 0A                    ..
        iny                                     ; D141 C8                       .
        jmp     LD13B                           ; D142 4C 3B D1                 L;.

; ----------------------------------------------------------------------------
LD145:  rts                                     ; D145 60                       `

; ----------------------------------------------------------------------------
LD146:  clc                                     ; D146 18                       .
        adc     #$30                            ; D147 69 30                    i0
        pha                                     ; D149 48                       H
        tya                                     ; D14A 98                       .
        adc     #$30                            ; D14B 69 30                    i0
        tay                                     ; D14D A8                       .
        pla                                     ; D14E 68                       h
        rts                                     ; D14F 60                       `

; ----------------------------------------------------------------------------
        ror     $21                             ; D150 66 21                    f!
        .byte   $14                             ; D152 14                       .
        lsr     $4D55                           ; D153 4E 55 4D                 NUM
        .byte   $42                             ; D156 42                       B
        eor     $52                             ; D157 45 52                    ER
        jsr     L464F                           ; D159 20 4F 46                  OF
        jsr     L4948                           ; D15C 20 48 49                  HI
        .byte   $54                             ; D15F 54                       T
        .byte   $53                             ; D160 53                       S
        jsr     L2020                           ; D161 20 20 20                    
        jsr     L2B20                           ; D164 20 20 2B                   +
        .byte   $C2                             ; D167 C2                       .
        and     ($18,x)                         ; D168 21 18                    !.
        .byte   $42                             ; D16A 42                       B
        .byte   $4F                             ; D16B 4F                       O
        lsr     $5355                           ; D16C 4E 55 53                 NUS
        jsr     L4853                           ; D16F 20 53 48                  SH
        eor     $4C                             ; D172 45 4C                    EL
        jmp     L2053                           ; D174 4C 53 20                 LS 

; ----------------------------------------------------------------------------
        .byte   $43                             ; D177 43                       C
        .byte   $4F                             ; D178 4F                       O
        jmp     L454C                           ; D179 4C 4C 45                 LLE

; ----------------------------------------------------------------------------
        .byte   $43                             ; D17C 43                       C
        .byte   $54                             ; D17D 54                       T
        eor     $44                             ; D17E 45 44                    ED
        jsr     L272B                           ; D180 20 2B 27                  +'
        .byte   $22                             ; D183 22                       "
        .byte   $12                             ; D184 12                       .
        eor     $554F,y                         ; D185 59 4F 55                 YOU
        jsr     L4F47                           ; D188 20 47 4F                  GO
        .byte   $54                             ; D18B 54                       T
        jsr     L4854                           ; D18C 20 54 48                  TH
        eor     $4D                             ; D18F 45 4D                    EM
        jsr     L4C41                           ; D191 20 41 4C                  AL
        jmp     L2121                           ; D194 4C 21 21                 L!!

; ----------------------------------------------------------------------------
        .byte   $62                             ; D197 62                       b
        .byte   $22                             ; D198 22                       "
        .byte   $1C                             ; D199 1C                       .
        eor     $554F,y                         ; D19A 59 4F 55                 YOU
        jsr     L4547                           ; D19D 20 47 45                  GE
        .byte   $54                             ; D1A0 54                       T
        jsr     L3031                           ; D1A1 20 31 30                  10
        bmi     LD1D6                           ; D1A4 30 30                    00
        bmi     LD1C8                           ; D1A6 30 20                    0 
        .byte   $42                             ; D1A8 42                       B
        .byte   $4F                             ; D1A9 4F                       O
        lsr     $5355                           ; D1AA 4E 55 53                 NUS
        jsr     L4F50                           ; D1AD 20 50 4F                  PO
        eor     #$4E                            ; D1B0 49 4E                    IN
        .byte   $54                             ; D1B2 54                       T
        .byte   $53                             ; D1B3 53                       S
        and     ($21,x)                         ; D1B4 21 21                    !!
LD1B6:  lda     #$80                            ; D1B6 A9 80                    ..
        sta     $40                             ; D1B8 85 40                    .@
        lda     #$06                            ; D1BA A9 06                    ..
        sta     $41                             ; D1BC 85 41                    .A
        jsr     L9754                           ; D1BE 20 54 97                  T.
        bit     $20                             ; D1C1 24 20                    $ 
        bmi     LD1E7                           ; D1C3 30 22                    0"
        lda     #$C0                            ; D1C5 A9 C0                    ..
        .byte   $85                             ; D1C7 85                       .
LD1C8:  jsr     LC0A9                           ; D1C8 20 A9 C0                  ..
        sta     $22                             ; D1CB 85 22                    ."
        lda     #$0F                            ; D1CD A9 0F                    ..
        sta     $23                             ; D1CF 85 23                    .#
        lda     #$30                            ; D1D1 A9 30                    .0
        sta     $24                             ; D1D3 85 24                    .$
        .byte   $A9                             ; D1D5 A9                       .
LD1D6:  brk                                     ; D1D6 00                       .
        sta     $25                             ; D1D7 85 25                    .%
        sta     $30                             ; D1D9 85 30                    .0
        lda     #$02                            ; D1DB A9 02                    ..
        sta     $31                             ; D1DD 85 31                    .1
        lda     #$22                            ; D1DF A9 22                    ."
        jsr     L97AD                           ; D1E1 20 AD 97                  ..
        jmp     L9761                           ; D1E4 4C 61 97                 La.

; ----------------------------------------------------------------------------
LD1E7:  jsr     L97BE                           ; D1E7 20 BE 97                  ..
        jsr     L97FA                           ; D1EA 20 FA 97                  ..
        lda     #$10                            ; D1ED A9 10                    ..
        bit     $20                             ; D1EF 24 20                    $ 
        bne     LD216                           ; D1F1 D0 23                    .#
        ldx     #$F8                            ; D1F3 A2 F8                    ..
        ldy     #$01                            ; D1F5 A0 01                    ..
        bit     $0330                           ; D1F7 2C 30 03                 ,0.
        bvs     LD205                           ; D1FA 70 09                    p.
        bmi     LD201                           ; D1FC 30 03                    0.
        iny                                     ; D1FE C8                       .
        bne     LD203                           ; D1FF D0 02                    ..
LD201:  ldy     #$03                            ; D201 A0 03                    ..
LD203:  ldx     #$08                            ; D203 A2 08                    ..
LD205:  txa                                     ; D205 8A                       .
        jsr     L983C                           ; D206 20 3C 98                  <.
        lda     $22                             ; D209 A5 22                    ."
        cmp     #$40                            ; D20B C9 40                    .@
        lda     $23                             ; D20D A5 23                    .#
        sbc     #$11                            ; D20F E9 11                    ..
        bcs     LD236                           ; D211 B0 23                    .#
        jmp     LD24F                           ; D213 4C 4F D2                 LO.

; ----------------------------------------------------------------------------
LD216:  ldx     #$08                            ; D216 A2 08                    ..
        ldy     #$FF                            ; D218 A0 FF                    ..
        bit     $0330                           ; D21A 2C 30 03                 ,0.
        bmi     LD228                           ; D21D 30 09                    0.
        bvs     LD224                           ; D21F 70 03                    p.
        dey                                     ; D221 88                       .
        bne     LD226                           ; D222 D0 02                    ..
LD224:  ldy     #$FD                            ; D224 A0 FD                    ..
LD226:  ldx     #$F8                            ; D226 A2 F8                    ..
LD228:  txa                                     ; D228 8A                       .
        jsr     L983C                           ; D229 20 3C 98                  <.
        lda     $22                             ; D22C A5 22                    ."
        cmp     #$C0                            ; D22E C9 C0                    ..
        lda     $23                             ; D230 A5 23                    .#
        sbc     #$0F                            ; D232 E9 0F                    ..
        bcs     LD24F                           ; D234 B0 19                    ..
LD236:  lda     $31                             ; D236 A5 31                    .1
        eor     #$FF                            ; D238 49 FF                    I.
        tay                                     ; D23A A8                       .
        lda     $30                             ; D23B A5 30                    .0
        eor     #$FF                            ; D23D 49 FF                    I.
        clc                                     ; D23F 18                       .
        adc     #$01                            ; D240 69 01                    i.
        sta     $30                             ; D242 85 30                    .0
        tya                                     ; D244 98                       .
        adc     #$00                            ; D245 69 00                    i.
        sta     $31                             ; D247 85 31                    .1
        lda     $20                             ; D249 A5 20                    . 
        eor     #$10                            ; D24B 49 10                    I.
        sta     $20                             ; D24D 85 20                    . 
LD24F:  lda     $23                             ; D24F A5 23                    .#
        cmp     #$10                            ; D251 C9 10                    ..
        bne     LD27B                           ; D253 D0 26                    .&
        lda     #$03                            ; D255 A9 03                    ..
        bit     $0332                           ; D257 2C 32 03                 ,2.
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
LD271:  lda     #$04                            ; D271 A9 04                    ..
        sta     $06A1,x                         ; D273 9D A1 06                 ...
        lda     #$80                            ; D276 A9 80                    ..
        sta     $06A0,x                         ; D278 9D A0 06                 ...
LD27B:  jmp     L9761                           ; D27B 4C 61 97                 La.

; ----------------------------------------------------------------------------
LD27E:  lda     #$00                            ; D27E A9 00                    ..
        sta     $40                             ; D280 85 40                    .@
        lda     #$07                            ; D282 A9 07                    ..
        sta     $41                             ; D284 85 41                    .A
        lda     #$05                            ; D286 A9 05                    ..
        sta     $46                             ; D288 85 46                    .F
        lda     #$00                            ; D28A A9 00                    ..
        sta     L0000                           ; D28C 85 00                    ..
LD28E:  ldy     #$00                            ; D28E A0 00                    ..
        lda     ($40),y                         ; D290 B1 40                    .@
        bpl     LD29F                           ; D292 10 0B                    ..
        inc     L0000                           ; D294 E6 00                    ..
        jsr     L9754                           ; D296 20 54 97                  T.
        jsr     LD317                           ; D299 20 17 D3                  ..
        jsr     L9761                           ; D29C 20 61 97                  a.
LD29F:  jsr     L976E                           ; D29F 20 6E 97                  n.
        dec     $46                             ; D2A2 C6 46                    .F
        bne     LD28E                           ; D2A4 D0 E8                    ..
        lda     L0000                           ; D2A6 A5 00                    ..
        beq     LD2AB                           ; D2A8 F0 01                    ..
        rts                                     ; D2AA 60                       `

; ----------------------------------------------------------------------------
LD2AB:  lda     $53                             ; D2AB A5 53                    .S
        bmi     LD2B7                           ; D2AD 30 08                    0.
        cmp     #$06                            ; D2AF C9 06                    ..
        bcc     LD2B8                           ; D2B1 90 05                    ..
        lda     #$80                            ; D2B3 A9 80                    ..
        sta     $53                             ; D2B5 85 53                    .S
LD2B7:  rts                                     ; D2B7 60                       `

; ----------------------------------------------------------------------------
LD2B8:  ldy     $52                             ; D2B8 A4 52                    .R
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
        sta     L0000                           ; D2DA 85 00                    ..
        lda     #$00                            ; D2DC A9 00                    ..
        sta     L0001                           ; D2DE 85 01                    ..
        lda     #$05                            ; D2E0 A9 05                    ..
        sta     $46                             ; D2E2 85 46                    .F
LD2E4:  lda     #$80                            ; D2E4 A9 80                    ..
        sta     $0700,x                         ; D2E6 9D 00 07                 ...
        lda     ($44),y                         ; D2E9 B1 44                    .D
        sta     $0714,x                         ; D2EB 9D 14 07                 ...
        iny                                     ; D2EE C8                       .
        lda     $12                             ; D2EF A5 12                    ..
        sta     $0715,x                         ; D2F1 9D 15 07                 ...
        lda     #$10                            ; D2F4 A9 10                    ..
        clc                                     ; D2F6 18                       .
        adc     L0000                           ; D2F7 65 00                    e.
        sta     L0000                           ; D2F9 85 00                    ..
        sta     $0716,x                         ; D2FB 9D 16 07                 ...
        lda     L0001                           ; D2FE A5 01                    ..
        adc     L0001                           ; D300 65 01                    e.
        sta     L0001                           ; D302 85 01                    ..
        sta     L0717,x                         ; D304 9D 17 07                 ...
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
LD317:  bit     $20                             ; D317 24 20                    $ 
        bvs     LD355                           ; D319 70 3A                    p:
        lda     #$C0                            ; D31B A9 C0                    ..
        sta     $20                             ; D31D 85 20                    . 
        lda     $34                             ; D31F A5 34                    .4
        and     #$1F                            ; D321 29 1F                    ).
        asl     a                               ; D323 0A                       .
        asl     a                               ; D324 0A                       .
        tax                                     ; D325 AA                       .
        lda     LD5D2,x                         ; D326 BD D2 D5                 ...
        sta     $22                             ; D329 85 22                    ."
        lda     LD5D3,x                         ; D32B BD D3 D5                 ...
        sta     $23                             ; D32E 85 23                    .#
        lda     LD5D4,x                         ; D330 BD D4 D5                 ...
        sta     $24                             ; D333 85 24                    .$
        lda     LD5D5,x                         ; D335 BD D5 D5                 ...
        sta     $25                             ; D338 85 25                    .%
        lda     $35                             ; D33A A5 35                    .5
        asl     a                               ; D33C 0A                       .
        tax                                     ; D33D AA                       .
        lda     LD616,x                         ; D33E BD 16 D6                 ...
        sta     $38                             ; D341 85 38                    .8
        lda     LD617,x                         ; D343 BD 17 D6                 ...
        sta     $39                             ; D346 85 39                    .9
        lda     #$00                            ; D348 A9 00                    ..
        sta     $35                             ; D34A 85 35                    .5
        sta     $3A                             ; D34C 85 3A                    .:
        sta     $3D                             ; D34E 85 3D                    .=
        lda     #$17                            ; D350 A9 17                    ..
        jmp     L97AD                           ; D352 4C AD 97                 L..

; ----------------------------------------------------------------------------
LD355:  bit     $3D                             ; D355 24 3D                    $=
        bpl     LD35C                           ; D357 10 03                    ..
        jmp     LD4B8                           ; D359 4C B8 D4                 L..

; ----------------------------------------------------------------------------
LD35C:  bit     $35                             ; D35C 24 35                    $5
        bmi     LD377                           ; D35E 30 17                    0.
        lda     $36                             ; D360 A5 36                    .6
        sec                                     ; D362 38                       8
        sbc     #$01                            ; D363 E9 01                    ..
        sta     $36                             ; D365 85 36                    .6
        lda     $37                             ; D367 A5 37                    .7
        sbc     #$00                            ; D369 E9 00                    ..
        sta     $37                             ; D36B 85 37                    .7
        bpl     LD376                           ; D36D 10 07                    ..
        lda     #$80                            ; D36F A9 80                    ..
        sta     $35                             ; D371 85 35                    .5
        jmp     LD468                           ; D373 4C 68 D4                 Lh.

; ----------------------------------------------------------------------------
LD376:  rts                                     ; D376 60                       `

; ----------------------------------------------------------------------------
LD377:  ldx     #$00                            ; D377 A2 00                    ..
        lda     #$03                            ; D379 A9 03                    ..
        sta     $47                             ; D37B 85 47                    .G
LD37D:  lda     $06A0,x                         ; D37D BD A0 06                 ...
        bpl     LD3A5                           ; D380 10 23                    .#
        asl     a                               ; D382 0A                       .
        bpl     LD3A5                           ; D383 10 20                    . 
        lda     $06A2,x                         ; D385 BD A2 06                 ...
        sec                                     ; D388 38                       8
        sbc     $22                             ; D389 E5 22                    ."
        tay                                     ; D38B A8                       .
        lda     $06A3,x                         ; D38C BD A3 06                 ...
        sbc     $23                             ; D38F E5 23                    .#
        bcs     LD39F                           ; D391 B0 0C                    ..
        eor     #$FF                            ; D393 49 FF                    I.
        pha                                     ; D395 48                       H
        tya                                     ; D396 98                       .
        eor     #$FF                            ; D397 49 FF                    I.
        adc     #$01                            ; D399 69 01                    i.
        tay                                     ; D39B A8                       .
        pla                                     ; D39C 68                       h
        adc     #$00                            ; D39D 69 00                    i.
LD39F:  bne     LD3A5                           ; D39F D0 04                    ..
        cpy     #$08                            ; D3A1 C0 08                    ..
        bcc     LD3A8                           ; D3A3 90 03                    ..
LD3A5:  jmp     LD432                           ; D3A5 4C 32 D4                 L2.

; ----------------------------------------------------------------------------
LD3A8:  lda     $06A4,x                         ; D3A8 BD A4 06                 ...
        sec                                     ; D3AB 38                       8
        sbc     $24                             ; D3AC E5 24                    .$
        tay                                     ; D3AE A8                       .
        lda     $06A5,x                         ; D3AF BD A5 06                 ...
        sbc     $25                             ; D3B2 E5 25                    .%
        bcs     LD3C2                           ; D3B4 B0 0C                    ..
        eor     #$FF                            ; D3B6 49 FF                    I.
        pha                                     ; D3B8 48                       H
        tya                                     ; D3B9 98                       .
        eor     #$FF                            ; D3BA 49 FF                    I.
        adc     #$01                            ; D3BC 69 01                    i.
        tay                                     ; D3BE A8                       .
        pla                                     ; D3BF 68                       h
        adc     #$00                            ; D3C0 69 00                    i.
LD3C2:  bne     LD432                           ; D3C2 D0 6E                    .n
        cpy     #$08                            ; D3C4 C0 08                    ..
        bcs     LD432                           ; D3C6 B0 6A                    .j
        lda     $06BF,x                         ; D3C8 BD BF 06                 ...
        ora     #$80                            ; D3CB 09 80                    ..
        sta     $06BF,x                         ; D3CD 9D BF 06                 ...
        inc     $54                             ; D3D0 E6 54                    .T
        ldx     $55                             ; D3D2 A6 55                    .U
        inc     $55                             ; D3D4 E6 55                    .U
        lda     LD4D8,x                         ; D3D6 BD D8 D4                 ...
        sta     $3C                             ; D3D9 85 3C                    .<
        lda     LD4DD,x                         ; D3DB BD DD D4                 ...
        jsr     L8CD0                           ; D3DE 20 D0 8C                  ..
        lda     #$80                            ; D3E1 A9 80                    ..
        sta     $3D                             ; D3E3 85 3D                    .=
        lda     #$00                            ; D3E5 A9 00                    ..
        sta     $32                             ; D3E7 85 32                    .2
        lda     #$FF                            ; D3E9 A9 FF                    ..
        sta     $33                             ; D3EB 85 33                    .3
        lda     #$00                            ; D3ED A9 00                    ..
        sta     $0100                           ; D3EF 8D 00 01                 ...
        ldx     L0101                           ; D3F2 AE 01 01                 ...
        lda     #$AB                            ; D3F5 A9 AB                    ..
        sta     $0102,x                         ; D3F7 9D 02 01                 ...
        inx                                     ; D3FA E8                       .
        lda     #$91                            ; D3FB A9 91                    ..
        sta     $0102,x                         ; D3FD 9D 02 01                 ...
        inx                                     ; D400 E8                       .
        lda     #$02                            ; D401 A9 02                    ..
        sta     $0102,x                         ; D403 9D 02 01                 ...
        inx                                     ; D406 E8                       .
        lda     $54                             ; D407 A5 54                    .T
        jsr     LD139                           ; D409 20 39 D1                  9.
        jsr     LD146                           ; D40C 20 46 D1                  F.
        sta     $0103,x                         ; D40F 9D 03 01                 ...
        tya                                     ; D412 98                       .
        sta     $0102,x                         ; D413 9D 02 01                 ...
        inx                                     ; D416 E8                       .
        inx                                     ; D417 E8                       .
        stx     L0101                           ; D418 8E 01 01                 ...
        lda     #$80                            ; D41B A9 80                    ..
        sta     $0100                           ; D41D 8D 00 01                 ...
        lda     $0304                           ; D420 AD 04 03                 ...
        ora     #$10                            ; D423 09 10                    ..
        sta     $0304                           ; D425 8D 04 03                 ...
        lda     #$0E                            ; D428 A9 0E                    ..
        jsr     LE2CD                           ; D42A 20 CD E2                  ..
        lda     #$39                            ; D42D A9 39                    .9
        jmp     L97AD                           ; D42F 4C AD 97                 L..

; ----------------------------------------------------------------------------
LD432:  txa                                     ; D432 8A                       .
        clc                                     ; D433 18                       .
        adc     #$20                            ; D434 69 20                    i 
        tax                                     ; D436 AA                       .
        dec     $47                             ; D437 C6 47                    .G
        beq     LD43E                           ; D439 F0 03                    ..
        jmp     LD37D                           ; D43B 4C 7D D3                 L}.

; ----------------------------------------------------------------------------
LD43E:  jsr     L97BE                           ; D43E 20 BE 97                  ..
        jsr     L97FA                           ; D441 20 FA 97                  ..
        jsr     L981B                           ; D444 20 1B 98                  ..
        bit     $35                             ; D447 24 35                    $5
        bvs     LD458                           ; D449 70 0D                    p.
        lda     #$01                            ; D44B A9 01                    ..
        bit     $3F                             ; D44D 24 3F                    $?
        beq     LD463                           ; D44F F0 12                    ..
        lda     #$C0                            ; D451 A9 C0                    ..
        sta     $35                             ; D453 85 35                    .5
        jmp     LD463                           ; D455 4C 63 D4                 Lc.

; ----------------------------------------------------------------------------
LD458:  lda     #$01                            ; D458 A9 01                    ..
        bit     $3F                             ; D45A 24 3F                    $?
        bne     LD463                           ; D45C D0 05                    ..
        lda     #$00                            ; D45E A9 00                    ..
        sta     $20                             ; D460 85 20                    . 
        rts                                     ; D462 60                       `

; ----------------------------------------------------------------------------
LD463:  dec     $36                             ; D463 C6 36                    .6
        beq     LD468                           ; D465 F0 01                    ..
        rts                                     ; D467 60                       `

; ----------------------------------------------------------------------------
LD468:  lda     #$00                            ; D468 A9 00                    ..
        sta     $31                             ; D46A 85 31                    .1
        sta     $33                             ; D46C 85 33                    .3
        ldy     $3A                             ; D46E A4 3A                    .:
        lda     ($38),y                         ; D470 B1 38                    .8
        bne     LD479                           ; D472 D0 05                    ..
        lda     #$00                            ; D474 A9 00                    ..
        sta     $20                             ; D476 85 20                    . 
        rts                                     ; D478 60                       `

; ----------------------------------------------------------------------------
LD479:  iny                                     ; D479 C8                       .
        sta     $36                             ; D47A 85 36                    .6
        lda     ($38),y                         ; D47C B1 38                    .8
        iny                                     ; D47E C8                       .
        sty     $3A                             ; D47F 84 3A                    .:
        asl     a                               ; D481 0A                       .
        bcc     LD486                           ; D482 90 02                    ..
        dec     $31                             ; D484 C6 31                    .1
LD486:  asl     a                               ; D486 0A                       .
        rol     $31                             ; D487 26 31                    &1
        asl     a                               ; D489 0A                       .
        rol     $31                             ; D48A 26 31                    &1
        tay                                     ; D48C A8                       .
        and     #$80                            ; D48D 29 80                    ).
        sta     $30                             ; D48F 85 30                    .0
        tya                                     ; D491 98                       .
        asl     a                               ; D492 0A                       .
        asl     a                               ; D493 0A                       .
        bcc     LD498                           ; D494 90 02                    ..
        dec     $33                             ; D496 C6 33                    .3
LD498:  asl     a                               ; D498 0A                       .
        rol     $33                             ; D499 26 33                    &3
        asl     a                               ; D49B 0A                       .
        rol     $33                             ; D49C 26 33                    &3
        sta     $32                             ; D49E 85 32                    .2
        bit     $34                             ; D4A0 24 34                    $4
        bpl     LD4B7                           ; D4A2 10 13                    ..
        lda     $31                             ; D4A4 A5 31                    .1
        eor     #$FF                            ; D4A6 49 FF                    I.
        tay                                     ; D4A8 A8                       .
        lda     $30                             ; D4A9 A5 30                    .0
        eor     #$FF                            ; D4AB 49 FF                    I.
        clc                                     ; D4AD 18                       .
        adc     #$01                            ; D4AE 69 01                    i.
        sta     $30                             ; D4B0 85 30                    .0
        tya                                     ; D4B2 98                       .
        adc     #$00                            ; D4B3 69 00                    i.
        sta     $31                             ; D4B5 85 31                    .1
LD4B7:  rts                                     ; D4B7 60                       `

; ----------------------------------------------------------------------------
LD4B8:  jsr     L97BE                           ; D4B8 20 BE 97                  ..
        jsr     L981B                           ; D4BB 20 1B 98                  ..
        bit     $3D                             ; D4BE 24 3D                    $=
        bvs     LD4CF                           ; D4C0 70 0D                    p.
        lda     $2B                             ; D4C2 A5 2B                    .+
        bne     LD4D7                           ; D4C4 D0 11                    ..
        lda     #$C0                            ; D4C6 A9 C0                    ..
        sta     $3D                             ; D4C8 85 3D                    .=
        lda     $3C                             ; D4CA A5 3C                    .<
        jmp     L97AD                           ; D4CC 4C AD 97                 L..

; ----------------------------------------------------------------------------
LD4CF:  lda     $2B                             ; D4CF A5 2B                    .+
        bne     LD4D7                           ; D4D1 D0 04                    ..
        lda     #$00                            ; D4D3 A9 00                    ..
        sta     $20                             ; D4D5 85 20                    . 
LD4D7:  rts                                     ; D4D7 60                       `

; ----------------------------------------------------------------------------
LD4D8:  .byte   $32                             ; D4D8 32                       2
        .byte   $32                             ; D4D9 32                       2
LD4DA:  .byte   $33                             ; D4DA 33                       3
        .byte   $34                             ; D4DB 34                       4
        .byte   $35                             ; D4DC 35                       5
LD4DD:  .byte   $04                             ; D4DD 04                       .
        .byte   $04                             ; D4DE 04                       .
        asl     $08                             ; D4DF 06 08                    ..
        asl     a                               ; D4E1 0A                       .
        brk                                     ; D4E2 00                       .
        ora     (L0000,x)                       ; D4E3 01 00                    ..
        ora     ($02,x)                         ; D4E5 01 02                    ..
        .byte   $03                             ; D4E7 03                       .
        .byte   $04                             ; D4E8 04                       .
        ora     L0004                           ; D4E9 05 04                    ..
        ora     L0006                           ; D4EB 05 06                    ..
        .byte   $07                             ; D4ED 07                       .
        php                                     ; D4EE 08                       .
        ora     #$08                            ; D4EF 09 08                    ..
        ora     #$0A                            ; D4F1 09 0A                    ..
        .byte   $0B                             ; D4F3 0B                       .
        .byte   $0C                             ; D4F4 0C                       .
        ora     $0D0C                           ; D4F5 0D 0C 0D                 ...
        asl     $100F                           ; D4F8 0E 0F 10                 ...
        ora     ($10),y                         ; D4FB 11 10                    ..
        ora     ($12),y                         ; D4FD 11 12                    ..
        .byte   $13                             ; D4FF 13                       .
        .byte   $14                             ; D500 14                       .
        ora     $14,x                           ; D501 15 14                    ..
        ora     $16,x                           ; D503 15 16                    ..
        .byte   $17                             ; D505 17                       .
        clc                                     ; D506 18                       .
        ora     $1918,y                         ; D507 19 18 19                 ...
        .byte   $1A                             ; D50A 1A                       .
        .byte   $1B                             ; D50B 1B                       .
        .byte   $1C                             ; D50C 1C                       .
        ora     $1D1C,x                         ; D50D 1D 1C 1D                 ...
        asl     a:$1F,x                         ; D510 1E 1F 00                 ...
        brk                                     ; D513 00                       .
        brk                                     ; D514 00                       .
        brk                                     ; D515 00                       .
        brk                                     ; D516 00                       .
        brk                                     ; D517 00                       .
        brk                                     ; D518 00                       .
        sta     ($81,x)                         ; D519 81 81                    ..
        sta     ($81,x)                         ; D51B 81 81                    ..
        sta     (L0001,x)                       ; D51D 81 01                    ..
        brk                                     ; D51F 00                       .
        brk                                     ; D520 00                       .
        brk                                     ; D521 00                       .
LD522:  brk                                     ; D522 00                       .
        brk                                     ; D523 00                       .
        ora     ($81,x)                         ; D524 01 81                    ..
        sta     ($81,x)                         ; D526 81 81                    ..
        sta     ($81,x)                         ; D528 81 81                    ..
        .byte   $02                             ; D52A 02                       .
        .byte   $02                             ; D52B 02                       .
        .byte   $02                             ; D52C 02                       .
        .byte   $02                             ; D52D 02                       .
        .byte   $02                             ; D52E 02                       .
        .byte   $02                             ; D52F 02                       .
        .byte   $02                             ; D530 02                       .
        .byte   $83                             ; D531 83                       .
        .byte   $83                             ; D532 83                       .
        .byte   $83                             ; D533 83                       .
        .byte   $83                             ; D534 83                       .
        .byte   $83                             ; D535 83                       .
        .byte   $03                             ; D536 03                       .
        .byte   $04                             ; D537 04                       .
        .byte   $04                             ; D538 04                       .
        .byte   $04                             ; D539 04                       .
        .byte   $04                             ; D53A 04                       .
        .byte   $04                             ; D53B 04                       .
        .byte   $03                             ; D53C 03                       .
        sta     $85                             ; D53D 85 85                    ..
        sta     $85                             ; D53F 85 85                    ..
        sta     L0004                           ; D541 85 04                    ..
        .byte   $0C                             ; D543 0C                       .
        ora     L0F0E                           ; D544 0D 0E 0F                 ...
        bpl     LD54D                           ; D547 10 04                    ..
        bcc     LD4DA                           ; D549 90 8F                    ..
        .byte   $8E                             ; D54B 8E                       .
        .byte   $8D                             ; D54C 8D                       .
LD54D:  sty     a:$05                           ; D54D 8C 05 00                 ...
        brk                                     ; D550 00                       .
        brk                                     ; D551 00                       .
        brk                                     ; D552 00                       .
        brk                                     ; D553 00                       .
        ora     $81                             ; D554 05 81                    ..
        sta     ($81,x)                         ; D556 81 81                    ..
        sta     ($81,x)                         ; D558 81 81                    ..
        asl     $0E                             ; D55A 06 0E                    ..
        stx     $8E0E                           ; D55C 8E 0E 8E                 ...
        asl     $8E06                           ; D55F 0E 06 8E                 ...
        asl     $0E8E                           ; D562 0E 8E 0E                 ...
        stx     $0207                           ; D565 8E 07 02                 ...
        .byte   $02                             ; D568 02                       .
        .byte   $02                             ; D569 02                       .
        .byte   $02                             ; D56A 02                       .
        .byte   $02                             ; D56B 02                       .
        .byte   $07                             ; D56C 07                       .
        .byte   $83                             ; D56D 83                       .
        .byte   $83                             ; D56E 83                       .
        .byte   $83                             ; D56F 83                       .
        .byte   $83                             ; D570 83                       .
        .byte   $83                             ; D571 83                       .
        php                                     ; D572 08                       .
        asl     L0006                           ; D573 06 06                    ..
        asl     L0006                           ; D575 06 06                    ..
        asl     $08                             ; D577 06 08                    ..
        .byte   $87                             ; D579 87                       .
        .byte   $87                             ; D57A 87                       .
        .byte   $87                             ; D57B 87                       .
        .byte   $87                             ; D57C 87                       .
        .byte   $87                             ; D57D 87                       .
        ora     #$08                            ; D57E 09 08                    ..
        php                                     ; D580 08                       .
        php                                     ; D581 08                       .
        php                                     ; D582 08                       .
        php                                     ; D583 08                       .
        ora     #$89                            ; D584 09 89                    ..
        .byte   $89                             ; D586 89                       .
        .byte   $89                             ; D587 89                       .
        .byte   $89                             ; D588 89                       .
        .byte   $89                             ; D589 89                       .
        asl     a                               ; D58A 0A                       .
        .byte   $0C                             ; D58B 0C                       .
        ora     L0F0E                           ; D58C 0D 0E 0F                 ...
        bpl     LD59B                           ; D58F 10 0A                    ..
        bcc     LD522                           ; D591 90 8F                    ..
        stx     $8C8D                           ; D593 8E 8D 8C                 ...
        .byte   $0B                             ; D596 0B                       .
        asl     a                               ; D597 0A                       .
        asl     a                               ; D598 0A                       .
        asl     a                               ; D599 0A                       .
        asl     a                               ; D59A 0A                       .
LD59B:  asl     a                               ; D59B 0A                       .
        .byte   $0B                             ; D59C 0B                       .
        .byte   $8B                             ; D59D 8B                       .
        .byte   $8B                             ; D59E 8B                       .
        .byte   $8B                             ; D59F 8B                       .
        .byte   $8B                             ; D5A0 8B                       .
        .byte   $8B                             ; D5A1 8B                       .
        .byte   $0C                             ; D5A2 0C                       .
        asl     a                               ; D5A3 0A                       .
        asl     a                               ; D5A4 0A                       .
        asl     a                               ; D5A5 0A                       .
        asl     a                               ; D5A6 0A                       .
        asl     a                               ; D5A7 0A                       .
        .byte   $0C                             ; D5A8 0C                       .
        .byte   $8B                             ; D5A9 8B                       .
        .byte   $8B                             ; D5AA 8B                       .
        .byte   $8B                             ; D5AB 8B                       .
        .byte   $8B                             ; D5AC 8B                       .
        .byte   $8B                             ; D5AD 8B                       .
        ora     $0A0A                           ; D5AE 0D 0A 0A                 ...
        asl     a                               ; D5B1 0A                       .
        asl     a                               ; D5B2 0A                       .
        asl     a                               ; D5B3 0A                       .
        ora     $8B8B                           ; D5B4 0D 8B 8B                 ...
        .byte   $8B                             ; D5B7 8B                       .
        .byte   $8B                             ; D5B8 8B                       .
        .byte   $8B                             ; D5B9 8B                       .
        asl     $0A0A                           ; D5BA 0E 0A 0A                 ...
        asl     a                               ; D5BD 0A                       .
        asl     a                               ; D5BE 0A                       .
        asl     a                               ; D5BF 0A                       .
        asl     $8B8B                           ; D5C0 0E 8B 8B                 ...
        .byte   $8B                             ; D5C3 8B                       .
        .byte   $8B                             ; D5C4 8B                       .
LD5C5:  .byte   $8B                             ; D5C5 8B                       .
        .byte   $0F                             ; D5C6 0F                       .
        asl     a                               ; D5C7 0A                       .
        asl     a                               ; D5C8 0A                       .
        asl     a                               ; D5C9 0A                       .
        asl     a                               ; D5CA 0A                       .
        asl     a                               ; D5CB 0A                       .
        .byte   $0F                             ; D5CC 0F                       .
        .byte   $8B                             ; D5CD 8B                       .
        .byte   $8B                             ; D5CE 8B                       .
        .byte   $8B                             ; D5CF 8B                       .
        .byte   $8B                             ; D5D0 8B                       .
        .byte   $8B                             ; D5D1 8B                       .
LD5D2:  .byte   $20                             ; D5D2 20                        
LD5D3:  .byte   $10                             ; D5D3 10                       .
LD5D4:  cld                                     ; D5D4 D8                       .
LD5D5:  brk                                     ; D5D5 00                       .
        cpx     #$10                            ; D5D6 E0 10                    ..
        cld                                     ; D5D8 D8                       .
        brk                                     ; D5D9 00                       .
        cpx     #$0F                            ; D5DA E0 0F                    ..
        cld                                     ; D5DC D8                       .
LD5DD:  brk                                     ; D5DD 00                       .
        jsr     LD811                           ; D5DE 20 11 D8                  ..
LD5E1:  brk                                     ; D5E1 00                       .
        jsr     LE810                           ; D5E2 20 10 E8                  ..
LD5E5:  brk                                     ; D5E5 00                       .
        cpx     #$10                            ; D5E6 E0 10                    ..
        inx                                     ; D5E8 E8                       .
LD5E9:  brk                                     ; D5E9 00                       .
        brk                                     ; D5EA 00                       .
        bpl     LD5C5                           ; D5EB 10 D8                    ..
        brk                                     ; D5ED 00                       .
        brk                                     ; D5EE 00                       .
        ora     ($D8),y                         ; D5EF 11 D8                    ..
        brk                                     ; D5F1 00                       .
        beq     LD603                           ; D5F2 F0 0F                    ..
        inx                                     ; D5F4 E8                       .
        brk                                     ; D5F5 00                       .
        bpl     LD609                           ; D5F6 10 11                    ..
        inx                                     ; D5F8 E8                       .
        brk                                     ; D5F9 00                       .
        beq     LD60B                           ; D5FA F0 0F                    ..
        cli                                     ; D5FC 58                       X
        brk                                     ; D5FD 00                       .
        bpl     LD611                           ; D5FE 10 11                    ..
        cli                                     ; D600 58                       X
        brk                                     ; D601 00                       .
        .byte   $30                             ; D602 30                       0
LD603:  bpl     LD5DD                           ; D603 10 D8                    ..
        brk                                     ; D605 00                       .
        cli                                     ; D606 58                       X
        bpl     LD5E1                           ; D607 10 D8                    ..
LD609:  brk                                     ; D609 00                       .
        .byte   $80                             ; D60A 80                       .
LD60B:  bpl     LD5E5                           ; D60B 10 D8                    ..
        brk                                     ; D60D 00                       .
        tay                                     ; D60E A8                       .
        bpl     LD5E9                           ; D60F 10 D8                    ..
LD611:  brk                                     ; D611 00                       .
        bne     LD624                           ; D612 D0 10                    ..
        cld                                     ; D614 D8                       .
        brk                                     ; D615 00                       .
LD616:  .byte   $36                             ; D616 36                       6
LD617:  dec     $3D,x                           ; D617 D6 3D                    .=
        dec     $66,x                           ; D619 D6 66                    .f
        dec     $6D,x                           ; D61B D6 6D                    .m
        dec     $88,x                           ; D61D D6 88                    ..
        dec     $9F,x                           ; D61F D6 9F                    ..
        dec     $AA,x                           ; D621 D6 AA                    ..
        .byte   $D6                             ; D623 D6                       .
LD624:  lda     LC6D6,x                         ; D624 BD D6 C6                 ...
        dec     $D3,x                           ; D627 D6 D3                    ..
        dec     $E4,x                           ; D629 D6 E4                    ..
        dec     $EF,x                           ; D62B D6 EF                    ..
        dec     L0004,x                         ; D62D D6 04                    ..
        .byte   $D7                             ; D62F D7                       .
        and     ($D7,x)                         ; D630 21 D7                    !.
        .byte   $32                             ; D632 32                       2
        .byte   $D7                             ; D633 D7                       .
        eor     $D7,x                           ; D634 55 D7                    U.
        rti                                     ; D636 40                       @

; ----------------------------------------------------------------------------
        .byte   $0C                             ; D637 0C                       .
        cpy     #$21                            ; D638 C0 21                    .!
        .byte   $80                             ; D63A 80                       .
        cpy     #$00                            ; D63B C0 00                    ..
        bmi     LD64D                           ; D63D 30 0E                    0.
        jsr     L201E                           ; D63F 20 1E 20                  . 
        rol     $4F18                           ; D642 2E 18 4F                 ..O
        php                                     ; D645 08                       .
        eor     ($08,x)                         ; D646 41 08                    A.
        .byte   $33                             ; D648 33                       3
        php                                     ; D649 08                       .
        .byte   $14                             ; D64A 14                       .
        php                                     ; D64B 08                       .
        .byte   $F4                             ; D64C F4                       .
LD64D:  php                                     ; D64D 08                       .
        .byte   $D3                             ; D64E D3                       .
        php                                     ; D64F 08                       .
        cmp     ($08,x)                         ; D650 C1 08                    ..
        .byte   $CF                             ; D652 CF                       .
        php                                     ; D653 08                       .
        cmp     LFC08,x                         ; D654 DD 08 FC                 ...
        php                                     ; D657 08                       .
        .byte   $1C                             ; D658 1C                       .
        php                                     ; D659 08                       .
        and     $4F08,x                         ; D65A 3D 08 4F                 =.O
        clc                                     ; D65D 18                       .
        eor     ($20,x)                         ; D65E 41 20                    A 
        .byte   $22                             ; D660 22                       "
        jsr     L3012                           ; D661 20 12 30                  .0
        .byte   $02                             ; D664 02                       .
        brk                                     ; D665 00                       .
        .byte   $80                             ; D666 80                       .
        lsr     LC060                           ; D667 4E 60 C0                 N`.
        .byte   $80                             ; D66A 80                       .
        .byte   $42                             ; D66B 42                       B
        brk                                     ; D66C 00                       .
        rti                                     ; D66D 40                       @

; ----------------------------------------------------------------------------
        .byte   $0C                             ; D66E 0C                       .
        php                                     ; D66F 08                       .
        jmp     L4010                           ; D670 4C 10 40                 L.@

; ----------------------------------------------------------------------------
        php                                     ; D673 08                       .
        .byte   $44                             ; D674 44                       D
        jsr     L0804                           ; D675 20 04 08                  ..
        .byte   $44                             ; D678 44                       D
        bpl     LD6BB                           ; D679 10 40                    .@
        php                                     ; D67B 08                       .
        jmp     L0C20                           ; D67C 4C 20 0C                 L .

; ----------------------------------------------------------------------------
        php                                     ; D67F 08                       .
        jmp     L4010                           ; D680 4C 10 40                 L.@

; ----------------------------------------------------------------------------
        php                                     ; D683 08                       .
        .byte   $44                             ; D684 44                       D
        rti                                     ; D685 40                       @

; ----------------------------------------------------------------------------
        .byte   $04                             ; D686 04                       .
        brk                                     ; D687 00                       .
        bmi     LD696                           ; D688 30 0C                    0.
        .byte   $04                             ; D68A 04                       .
        cpy     #$04                            ; D68B C0 04                    ..
        cpy     $0C08                           ; D68D CC 08 0C                 ...
LD690:  .byte   $04                             ; D690 04                       .
        jmp     L4008                           ; D691 4C 08 40                 L.@

; ----------------------------------------------------------------------------
        .byte   $04                             ; D694 04                       .
        .byte   $44                             ; D695 44                       D
LD696:  php                                     ; D696 08                       .
        .byte   $04                             ; D697 04                       .
        .byte   $04                             ; D698 04                       .
        cpy     L0004                           ; D699 C4 04                    ..
        cpy     #$60                            ; D69B C0 60                    .`
        .byte   $02                             ; D69D 02                       .
        brk                                     ; D69E 00                       .
        rti                                     ; D69F 40                       @

; ----------------------------------------------------------------------------
        .byte   $0C                             ; D6A0 0C                       .
        rts                                     ; D6A1 60                       `

; ----------------------------------------------------------------------------
        eor     ($60,x)                         ; D6A2 41 60                    A`
        cpy     #$60                            ; D6A4 C0 60                    .`
        eor     ($80,x)                         ; D6A6 41 80                    A.
        cpy     #$00                            ; D6A8 C0 00                    ..
        rts                                     ; D6AA 60                       `

; ----------------------------------------------------------------------------
        asl     $1E10                           ; D6AB 0E 10 1E                 ...
        php                                     ; D6AE 08                       .
        rol     $2F10                           ; D6AF 2E 10 2F                 ../
        bpl     LD6D4                           ; D6B2 10 20                    . 
        bpl     LD6D7                           ; D6B4 10 21                    .!
        php                                     ; D6B6 08                       .
        .byte   $22                             ; D6B7 22                       "
        bpl     LD6CC                           ; D6B8 10 12                    ..
        rts                                     ; D6BA 60                       `

; ----------------------------------------------------------------------------
LD6BB:  .byte   $02                             ; D6BB 02                       .
        brk                                     ; D6BC 00                       .
        .byte   $80                             ; D6BD 80                       .
        lsr     $0430                           ; D6BE 4E 30 04                 N0.
        rts                                     ; D6C1 60                       `

; ----------------------------------------------------------------------------
        dec     $0440                           ; D6C2 CE 40 04                 .@.
        brk                                     ; D6C5 00                       .
        rti                                     ; D6C6 40                       @

; ----------------------------------------------------------------------------
        jmp     LC030                           ; D6C7 4C 30 C0                 L0.

; ----------------------------------------------------------------------------
        bmi     LD710                           ; D6CA 30 44                    0D
LD6CC:  bmi     LD71A                           ; D6CC 30 4C                    0L
        bmi     LD690                           ; D6CE 30 C0                    0.
        rti                                     ; D6D0 40                       @

; ----------------------------------------------------------------------------
        .byte   $44                             ; D6D1 44                       D
        brk                                     ; D6D2 00                       .
LD6D3:  .byte   $30                             ; D6D3 30                       0
LD6D4:  rol     a                               ; D6D4 2A                       *
        .byte   $20                             ; D6D5 20                        
        .byte   $26                             ; D6D6 26                       &
LD6D7:  jsr     L202A                           ; D6D7 20 2A 20                  * 
        rol     $20                             ; D6DA 26 20                    & 
        rol     a                               ; D6DC 2A                       *
        jsr     L2026                           ; D6DD 20 26 20                  & 
        rol     a                               ; D6E0 2A                       *
        bmi     LD709                           ; D6E1 30 26                    0&
LD6E3:  brk                                     ; D6E3 00                       .
        rti                                     ; D6E4 40                       @

; ----------------------------------------------------------------------------
        .byte   $0C                             ; D6E5 0C                       .
        bpl     LD708                           ; D6E6 10 20                    . 
        jsr     L10E0                           ; D6E8 20 E0 10                  ..
        jsr     L0280                           ; D6EB 20 80 02                  ..
        brk                                     ; D6EE 00                       .
        bvs     LD731                           ; D6EF 70 40                    p@
        php                                     ; D6F1 08                       .
        .byte   $44                             ; D6F2 44                       D
        php                                     ; D6F3 08                       .
        cpy     $50                             ; D6F4 C4 50                    .P
        cpy     #$08                            ; D6F6 C0 08                    ..
        cpy     $08                             ; D6F8 C4 08                    ..
        .byte   $44                             ; D6FA 44                       D
        bvc     LD73D                           ; D6FB 50 40                    P@
        php                                     ; D6FD 08                       .
        .byte   $44                             ; D6FE 44                       D
        php                                     ; D6FF 08                       .
        cpy     $70                             ; D700 C4 70                    .p
LD702:  cpy     #$00                            ; D702 C0 00                    ..
        pha                                     ; D704 48                       H
        rti                                     ; D705 40                       @

; ----------------------------------------------------------------------------
        bpl     LD749                           ; D706 10 41                    .A
LD708:  php                                     ; D708 08                       .
LD709:  .byte   $44                             ; D709 44                       D
        bpl     LD720                           ; D70A 10 14                    ..
        bpl     LD702                           ; D70C 10 F4                    ..
        php                                     ; D70E 08                       .
        .byte   $C4                             ; D70F C4                       .
LD710:  bpl     LD6D3                           ; D710 10 C1                    ..
        bpl     LD6E3                           ; D712 10 CF                    ..
        php                                     ; D714 08                       .
        cpy     LFC10                           ; D715 CC 10 FC                 ...
        bpl     LD736                           ; D718 10 1C                    ..
LD71A:  php                                     ; D71A 08                       .
        jmp     L4F10                           ; D71B 4C 10 4F                 L.O

; ----------------------------------------------------------------------------
        pha                                     ; D71E 48                       H
        rti                                     ; D71F 40                       @

; ----------------------------------------------------------------------------
LD720:  brk                                     ; D720 00                       .
        clc                                     ; D721 18                       .
        rti                                     ; D722 40                       @

; ----------------------------------------------------------------------------
        jsr     L2031                           ; D723 20 31 20                  1 
        .byte   $22                             ; D726 22                       "
        jsr     L2013                           ; D727 20 13 20                  . 
        ora     $2E20,x                         ; D72A 1D 20 2E                 . .
        jsr     L183F                           ; D72D 20 3F 18                  ?.
        rti                                     ; D730 40                       @

; ----------------------------------------------------------------------------
LD731:  brk                                     ; D731 00                       .
        bpl     LD774                           ; D732 10 40                    .@
        .byte   $20                             ; D734 20                        
        .byte   $06                             ; D735 06                       .
LD736:  bpl     LD778                           ; D736 10 40                    .@
        jsr     L100A                           ; D738 20 0A 10                  ..
        rti                                     ; D73B 40                       @

; ----------------------------------------------------------------------------
        .byte   $20                             ; D73C 20                        
LD73D:  asl     $10                             ; D73D 06 10                    ..
        rti                                     ; D73F 40                       @

; ----------------------------------------------------------------------------
        jsr     L100A                           ; D740 20 0A 10                  ..
        rti                                     ; D743 40                       @

; ----------------------------------------------------------------------------
        jsr     L1006                           ; D744 20 06 10                  ..
        rti                                     ; D747 40                       @

; ----------------------------------------------------------------------------
        .byte   $20                             ; D748 20                        
LD749:  asl     a                               ; D749 0A                       .
        bpl     LD78C                           ; D74A 10 40                    .@
        jsr     L1006                           ; D74C 20 06 10                  ..
        rti                                     ; D74F 40                       @

; ----------------------------------------------------------------------------
        jsr     L100A                           ; D750 20 0A 10                  ..
        rti                                     ; D753 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; D754 00                       .
        clc                                     ; D755 18                       .
        rti                                     ; D756 40                       @

; ----------------------------------------------------------------------------
        bmi     LD75D                           ; D757 30 04                    0.
        bmi     LD7A7                           ; D759 30 4C                    0L
        bmi     LD7A1                           ; D75B 30 44                    0D
LD75D:  bmi     LD76B                           ; D75D 30 0C                    0.
        clc                                     ; D75F 18                       .
        rti                                     ; D760 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; D761 00                       .
        lda     #$FF                            ; D762 A9 FF                    ..
        jsr     LE2CD                           ; D764 20 CD E2                  ..
        jsr     L8BEA                           ; D767 20 EA 8B                  ..
        .byte   $20                             ; D76A 20                        
LD76B:  ldx     $8B,y                           ; D76B B6 8B                    ..
        jsr     L8E12                           ; D76D 20 12 8E                  ..
        lda     #$04                            ; D770 A9 04                    ..
        .byte   $20                             ; D772 20                        
        .byte   $BD                             ; D773 BD                       .
LD774:  stx     $03A9                           ; D774 8E A9 03                 ...
        .byte   $8D                             ; D777 8D                       .
LD778:  .byte   $07                             ; D778 07                       .
        .byte   $03                             ; D779 03                       .
        lda     #$04                            ; D77A A9 04                    ..
        jsr     L8D69                           ; D77C 20 69 8D                  i.
        lda     #$00                            ; D77F A9 00                    ..
        sta     $0320                           ; D781 8D 20 03                 . .
        sta     $0322                           ; D784 8D 22 03                 .".
        sta     $0323                           ; D787 8D 23 03                 .#.
        ldx     #$00                            ; D78A A2 00                    ..
LD78C:  lda     LD890,x                         ; D78C BD 90 D8                 ...
        sta     $0200,x                         ; D78F 9D 00 02                 ...
        inx                                     ; D792 E8                       .
        cpx     #$20                            ; D793 E0 20                    . 
        bcc     LD78C                           ; D795 90 F5                    ..
        ldx     #$1F                            ; D797 A2 1F                    ..
        lda     #$00                            ; D799 A9 00                    ..
LD79B:  sta     $20,x                           ; D79B 95 20                    . 
        dex                                     ; D79D CA                       .
        bpl     LD79B                           ; D79E 10 FB                    ..
        .byte   $A2                             ; D7A0 A2                       .
LD7A1:  brk                                     ; D7A1 00                       .
        ldy     #$00                            ; D7A2 A0 00                    ..
LD7A4:  lda     LD8B0,y                         ; D7A4 B9 B0 D8                 ...
LD7A7:  iny                                     ; D7A7 C8                       .
        sta     $0221,x                         ; D7A8 9D 21 02                 .!.
        lda     LD8B0,y                         ; D7AB B9 B0 D8                 ...
        iny                                     ; D7AE C8                       .
        sta     $0222,x                         ; D7AF 9D 22 02                 .".
        lda     LD8B0,y                         ; D7B2 B9 B0 D8                 ...
        iny                                     ; D7B5 C8                       .
        sta     $0223,x                         ; D7B6 9D 23 02                 .#.
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
        sta     $0460                           ; D7D3 8D 60 04                 .`.
LD7D6:  sta     $0400,x                         ; D7D6 9D 00 04                 ...
        dex                                     ; D7D9 CA                       .
        bpl     LD7D6                           ; D7DA 10 FA                    ..
        lda     #$01                            ; D7DC A9 01                    ..
        sta     $0302                           ; D7DE 8D 02 03                 ...
        lda     #$02                            ; D7E1 A9 02                    ..
        jsr     LE2CD                           ; D7E3 20 CD E2                  ..
        jsr     L8BDE                           ; D7E6 20 DE 8B                  ..
        jsr     L8BC2                           ; D7E9 20 C2 8B                  ..
LD7EC:  jsr     L8C40                           ; D7EC 20 40 8C                  @.
        ldy     #$01                            ; D7EF A0 01                    ..
        jsr     L8C60                           ; D7F1 20 60 8C                  `.
        jsr     LDA3A                           ; D7F4 20 3A DA                  :.
        jsr     LDBFA                           ; D7F7 20 FA DB                  ..
        jsr     LD963                           ; D7FA 20 63 D9                  c.
        jsr     LF600                           ; D7FD 20 00 F6                  ..
        jsr     L8C87                           ; D800 20 87 8C                  ..
        .byte   $AD                             ; D803 AD                       .
LD804:  bmi     $D809                           ; D804 30 03                    0.
        and     #$C0                            ; D806 29 C0                    ).
        beq     LD831                           ; D808 F0 27                    .'
        bpl     LD820                           ; D80A 10 14                    ..
        lda     $0460                           ; D80C AD 60 04                 .`.
        clc                                     ; D80F 18                       .
        .byte   $69                             ; D810 69                       i
LD811:  .byte   $04                             ; D811 04                       .
        sta     $0460                           ; D812 8D 60 04                 .`.
        lda     $0320                           ; D815 AD 20 03                 . .
        adc     #$00                            ; D818 69 00                    i.
        sta     $0320                           ; D81A 8D 20 03                 . .
        jmp     LD831                           ; D81D 4C 31 D8                 L1.

; ----------------------------------------------------------------------------
LD820:  lda     $0460                           ; D820 AD 60 04                 .`.
        sec                                     ; D823 38                       8
        sbc     #$08                            ; D824 E9 08                    ..
        sta     $0460                           ; D826 8D 60 04                 .`.
        lda     $0320                           ; D829 AD 20 03                 . .
        sbc     #$00                            ; D82C E9 00                    ..
        sta     $0320                           ; D82E 8D 20 03                 . .
LD831:  lda     $0393                           ; D831 AD 93 03                 ...
        clc                                     ; D834 18                       .
        adc     #$06                            ; D835 69 06                    i.
        sta     $021D                           ; D837 8D 1D 02                 ...
        jsr     LD862                           ; D83A 20 62 D8                  b.
        bit     $0306                           ; D83D 2C 06 03                 ,..
        bmi     LD84C                           ; D840 30 0A                    0.
        lda     $0393                           ; D842 AD 93 03                 ...
        bne     LD7EC                           ; D845 D0 A5                    ..
        bit     $21                             ; D847 24 21                    $!
        bmi     LD7EC                           ; D849 30 A1                    0.
        rts                                     ; D84B 60                       `

; ----------------------------------------------------------------------------
LD84C:  lda     #$40                            ; D84C A9 40                    .@
        sta     $12                             ; D84E 85 12                    ..
LD850:  jsr     L8C40                           ; D850 20 40 8C                  @.
        ldy     #$02                            ; D853 A0 02                    ..
        jsr     L8C60                           ; D855 20 60 8C                  `.
        jsr     LF600                           ; D858 20 00 F6                  ..
        dec     $12                             ; D85B C6 12                    ..
        bne     LD850                           ; D85D D0 F1                    ..
        jmp     LDCC1                           ; D85F 4C C1 DC                 L..

; ----------------------------------------------------------------------------
LD862:  lda     $23                             ; D862 A5 23                    .#
        bne     LD86C                           ; D864 D0 06                    ..
        lda     #$F0                            ; D866 A9 F0                    ..
        sta     $02B0                           ; D868 8D B0 02                 ...
        rts                                     ; D86B 60                       `

; ----------------------------------------------------------------------------
LD86C:  lda     #$D8                            ; D86C A9 D8                    ..
        sta     $02B0                           ; D86E 8D B0 02                 ...
        lda     #$29                            ; D871 A9 29                    .)
        sta     $02B1                           ; D873 8D B1 02                 ...
        bit     $23                             ; D876 24 23                    $#
        .byte   $10                             ; D878 10                       .
LD879:  .byte   $0B                             ; D879 0B                       .
        lda     #$40                            ; D87A A9 40                    .@
        sta     $02B2                           ; D87C 8D B2 02                 ...
        lda     #$20                            ; D87F A9 20                    . 
        sta     $02B3                           ; D881 8D B3 02                 ...
        rts                                     ; D884 60                       `

; ----------------------------------------------------------------------------
LD885:  lda     #$00                            ; D885 A9 00                    ..
        sta     $02B2                           ; D887 8D B2 02                 ...
        lda     #$D8                            ; D88A A9 D8                    ..
        sta     $02B3                           ; D88C 8D B3 02                 ...
        rts                                     ; D88F 60                       `

; ----------------------------------------------------------------------------
LD890:  .byte   $47                             ; D890 47                       G
        .byte   $FF                             ; D891 FF                       .
        jsr     LD8C4                           ; D892 20 C4 D8                  ..
        bmi     LD897                           ; D895 30 00                    0.
LD897:  rts                                     ; D897 60                       `

; ----------------------------------------------------------------------------
        cld                                     ; D898 D8                       .
        and     (L0000),y                       ; D899 31 00                    1.
        pla                                     ; D89B 68                       h
        cld                                     ; D89C D8                       .
        .byte   $32                             ; D89D 32                       2
        brk                                     ; D89E 00                       .
        bvs     LD879                           ; D89F 70 D8                    p.
        rti                                     ; D8A1 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; D8A2 00                       .
        sei                                     ; D8A3 78                       x
        cld                                     ; D8A4 D8                       .
        eor     (L0000,x)                       ; D8A5 41 00                    A.
        .byte   $80                             ; D8A7 80                       .
        cld                                     ; D8A8 D8                       .
        .byte   $42                             ; D8A9 42                       B
        brk                                     ; D8AA 00                       .
        dey                                     ; D8AB 88                       .
        cld                                     ; D8AC D8                       .
        ora     #$00                            ; D8AD 09 00                    ..
        tya                                     ; D8AF 98                       .
LD8B0:  .byte   $03                             ; D8B0 03                       .
        .byte   $02                             ; D8B1 02                       .
        sei                                     ; D8B2 78                       x
        .byte   $03                             ; D8B3 03                       .
        rti                                     ; D8B4 40                       @

; ----------------------------------------------------------------------------
        .byte   $80                             ; D8B5 80                       .
        .byte   $13                             ; D8B6 13                       .
        .byte   $02                             ; D8B7 02                       .
        sei                                     ; D8B8 78                       x
        .byte   $13                             ; D8B9 13                       .
        rti                                     ; D8BA 40                       @

; ----------------------------------------------------------------------------
        .byte   $80                             ; D8BB 80                       .
        ora     (L0000,x)                       ; D8BC 01 00                    ..
        bvs     LD8C2                           ; D8BE 70 02                    p.
        .byte   $02                             ; D8C0 02                       .
        sei                                     ; D8C1 78                       x
LD8C2:  .byte   $02                             ; D8C2 02                       .
        rti                                     ; D8C3 40                       @

; ----------------------------------------------------------------------------
LD8C4:  .byte   $80                             ; D8C4 80                       .
        ora     ($40,x)                         ; D8C5 01 40                    .@
        dey                                     ; D8C7 88                       .
        bpl     LD8CA                           ; D8C8 10 00                    ..
LD8CA:  pla                                     ; D8CA 68                       h
        ora     (L0001),y                       ; D8CB 11 01                    ..
        bvs     LD8E1                           ; D8CD 70 12                    p.
        ora     ($78,x)                         ; D8CF 01 78                    .x
        .byte   $12                             ; D8D1 12                       .
        eor     ($80,x)                         ; D8D2 41 80                    A.
        ora     ($41),y                         ; D8D4 11 41                    .A
        dey                                     ; D8D6 88                       .
        bpl     LD919                           ; D8D7 10 40                    .@
        bcc     LD8FB                           ; D8D9 90 20                    . 
        ora     ($68,x)                         ; D8DB 01 68                    .h
        and     (L0001,x)                       ; D8DD 21 01                    !.
        bvs     LD903                           ; D8DF 70 22                    p"
LD8E1:  brk                                     ; D8E1 00                       .
        sei                                     ; D8E2 78                       x
        .byte   $22                             ; D8E3 22                       "
        rti                                     ; D8E4 40                       @

; ----------------------------------------------------------------------------
        .byte   $80                             ; D8E5 80                       .
        and     ($41,x)                         ; D8E6 21 41                    !A
        dey                                     ; D8E8 88                       .
        jsr     L9041                           ; D8E9 20 41 90                  A.
        .byte   $DB                             ; D8EC DB                       .
        ora     ($60,x)                         ; D8ED 01 60                    .`
        .byte   $DC                             ; D8EF DC                       .
        ora     ($68,x)                         ; D8F0 01 68                    .h
        cmp     $7000,x                         ; D8F2 DD 00 70                 ..p
        dec     $7800,x                         ; D8F5 DE 00 78                 ..x
        dec     $8040,x                         ; D8F8 DE 40 80                 .@.
LD8FB:  cmp     $8840,x                         ; D8FB DD 40 88                 .@.
        .byte   $DC                             ; D8FE DC                       .
        eor     ($90,x)                         ; D8FF 41 90                    A.
        .byte   $DB                             ; D901 DB                       .
        .byte   $41                             ; D902 41                       A
LD903:  tya                                     ; D903 98                       .
        .byte   $EB                             ; D904 EB                       .
        ora     ($60,x)                         ; D905 01 60                    .`
        cpx     $6801                           ; D907 EC 01 68                 ..h
        sbc     $7000                           ; D90A ED 00 70                 ..p
        inc     $7800                           ; D90D EE 00 78                 ..x
        inc     $8040                           ; D910 EE 40 80                 .@.
        sbc     $8840                           ; D913 ED 40 88                 .@.
        .byte   $EC                             ; D916 EC                       .
        .byte   $41                             ; D917 41                       A
LD918:  .byte   $90                             ; D918 90                       .
LD919:  .byte   $EB                             ; D919 EB                       .
        eor     ($98,x)                         ; D91A 41 98                    A.
LD91C:  .byte   $02                             ; D91C 02                       .
        .byte   $A7                             ; D91D A7                       .
        .byte   $02                             ; D91E 02                       .
        .byte   $AF                             ; D91F AF                       .
        .byte   $04                             ; D920 04                       .
        .byte   $B7                             ; D921 B7                       .
        asl     $BF                             ; D922 06 BF                    ..
        asl     $C7                             ; D924 06 C7                    ..
        bpl     LD918                           ; D926 10 F0                    ..
        brk                                     ; D928 00                       .
        .byte   $02                             ; D929 02                       .
        .byte   $9F                             ; D92A 9F                       .
        .byte   $02                             ; D92B 02                       .
        .byte   $A7                             ; D92C A7                       .
        .byte   $04                             ; D92D 04                       .
        .byte   $AF                             ; D92E AF                       .
        asl     $B7                             ; D92F 06 B7                    ..
        asl     $BF                             ; D931 06 BF                    ..
        php                                     ; D933 08                       .
        .byte   $C7                             ; D934 C7                       .
        php                                     ; D935 08                       .
        beq     LD938                           ; D936 F0 00                    ..
LD938:  .byte   $02                             ; D938 02                       .
        .byte   $97                             ; D939 97                       .
        .byte   $02                             ; D93A 02                       .
        .byte   $9F                             ; D93B 9F                       .
        .byte   $04                             ; D93C 04                       .
        .byte   $A7                             ; D93D A7                       .
        asl     $AF                             ; D93E 06 AF                    ..
        asl     $B7                             ; D940 06 B7                    ..
        php                                     ; D942 08                       .
        .byte   $BF                             ; D943 BF                       .
        php                                     ; D944 08                       .
        .byte   $C7                             ; D945 C7                       .
        brk                                     ; D946 00                       .
LD947:  ldx     #$00                            ; D947 A2 00                    ..
LD949:  lda     LD91C,y                         ; D949 B9 1C D9                 ...
        bne     LD94F                           ; D94C D0 01                    ..
        rts                                     ; D94E 60                       `

; ----------------------------------------------------------------------------
LD94F:  sta     $12                             ; D94F 85 12                    ..
        iny                                     ; D951 C8                       .
        lda     LD91C,y                         ; D952 B9 1C D9                 ...
        iny                                     ; D955 C8                       .
LD956:  sta     $0220,x                         ; D956 9D 20 02                 . .
        inx                                     ; D959 E8                       .
        inx                                     ; D95A E8                       .
        inx                                     ; D95B E8                       .
        inx                                     ; D95C E8                       .
        dec     $12                             ; D95D C6 12                    ..
        bne     LD956                           ; D95F D0 F5                    ..
        beq     LD949                           ; D961 F0 E6                    ..
LD963:  lda     $21                             ; D963 A5 21                    .!
        bmi     LD98C                           ; D965 30 25                    0%
        lda     $0393                           ; D967 AD 93 03                 ...
        beq     LD9AB                           ; D96A F0 3F                    .?
        lda     #$01                            ; D96C A9 01                    ..
        bit     $0332                           ; D96E 2C 32 03                 ,2.
        beq     LD9AB                           ; D971 F0 38                    .8
        dec     $0393                           ; D973 CE 93 03                 ...
        lda     $21                             ; D976 A5 21                    .!
        and     #$01                            ; D978 29 01                    ).
        ora     #$80                            ; D97A 09 80                    ..
        sta     $21                             ; D97C 85 21                    .!
        lda     $08                             ; D97E A5 08                    ..
        ora     #$10                            ; D980 09 10                    ..
        sta     $08                             ; D982 85 08                    ..
        lda     #$17                            ; D984 A9 17                    ..
        jsr     LE2CD                           ; D986 20 CD E2                  ..
        jmp     LD9AB                           ; D989 4C AB D9                 L..

; ----------------------------------------------------------------------------
LD98C:  bit     $08                             ; D98C 24 08                    $.
        bmi     LD9B0                           ; D98E 30 20                    0 
        lda     #$10                            ; D990 A9 10                    ..
        bit     $08                             ; D992 24 08                    $.
        beq     LD99D                           ; D994 F0 07                    ..
        lda     #$02                            ; D996 A9 02                    ..
        bit     $0332                           ; D998 2C 32 03                 ,2.
        bne     LD99E                           ; D99B D0 01                    ..
LD99D:  rts                                     ; D99D 60                       `

; ----------------------------------------------------------------------------
LD99E:  lda     #$80                            ; D99E A9 80                    ..
        sta     $08                             ; D9A0 85 08                    ..
        lda     #$02                            ; D9A2 A9 02                    ..
        sta     $09                             ; D9A4 85 09                    ..
        ldy     #$0D                            ; D9A6 A0 0D                    ..
        jmp     LD947                           ; D9A8 4C 47 D9                 LG.

; ----------------------------------------------------------------------------
LD9AB:  bit     $08                             ; D9AB 24 08                    $.
        bmi     LD9B0                           ; D9AD 30 01                    0.
        rts                                     ; D9AF 60                       `

; ----------------------------------------------------------------------------
LD9B0:  bvs     LD9C6                           ; D9B0 70 14                    p.
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
LD9C6:  lda     $08                             ; D9C6 A5 08                    ..
        and     #$01                            ; D9C8 29 01                    ).
        bne     LD9DD                           ; D9CA D0 11                    ..
        dec     $09                             ; D9CC C6 09                    ..
        bne     LD9EA                           ; D9CE D0 1A                    ..
        lda     #$C1                            ; D9D0 A9 C1                    ..
        sta     $08                             ; D9D2 85 08                    ..
        lda     #$02                            ; D9D4 A9 02                    ..
        sta     $09                             ; D9D6 85 09                    ..
        ldy     #$0D                            ; D9D8 A0 0D                    ..
        jmp     LD947                           ; D9DA 4C 47 D9                 LG.

; ----------------------------------------------------------------------------
LD9DD:  dec     $09                             ; D9DD C6 09                    ..
        bne     LD9EA                           ; D9DF D0 09                    ..
        lda     #$00                            ; D9E1 A9 00                    ..
        sta     $08                             ; D9E3 85 08                    ..
        ldy     #$00                            ; D9E5 A0 00                    ..
        jmp     LD947                           ; D9E7 4C 47 D9                 LG.

; ----------------------------------------------------------------------------
LD9EA:  rts                                     ; D9EA 60                       `

; ----------------------------------------------------------------------------
LD9EB:  lda     $23                             ; D9EB A5 23                    .#
        bne     LDA31                           ; D9ED D0 42                    .B
        lda     $22                             ; D9EF A5 22                    ."
        cmp     #$7C                            ; D9F1 C9 7C                    .|
        bcc     LDA31                           ; D9F3 90 3C                    .<
        cmp     #$84                            ; D9F5 C9 84                    ..
        bcs     LDA31                           ; D9F7 B0 38                    .8
        lda     $25                             ; D9F9 A5 25                    .%
        bne     LDA31                           ; D9FB D0 34                    .4
        lda     $24                             ; D9FD A5 24                    .$
        cmp     #$A8                            ; D9FF C9 A8                    ..
        bcc     LDA31                           ; DA01 90 2E                    ..
        cmp     #$B0                            ; DA03 C9 B0                    ..
        bcs     LDA31                           ; DA05 B0 2A                    .*
        lda     #$20                            ; DA07 A9 20                    . 
        bit     $3E                             ; DA09 24 3E                    $>
        beq     LDA31                           ; DA0B F0 24                    .$
        lda     #$80                            ; DA0D A9 80                    ..
        sta     $0306                           ; DA0F 8D 06 03                 ...
        lda     #$18                            ; DA12 A9 18                    ..
        jsr     LE2CD                           ; DA14 20 CD E2                  ..
        ldx     #$00                            ; DA17 A2 00                    ..
        ldy     #$00                            ; DA19 A0 00                    ..
LDA1B:  lda     LDA32,y                         ; DA1B B9 32 DA                 .2.
        sta     $0221,x                         ; DA1E 9D 21 02                 .!.
        lda     LDA33,y                         ; DA21 B9 33 DA                 .3.
        sta     $0222,x                         ; DA24 9D 22 02                 .".
        inx                                     ; DA27 E8                       .
        inx                                     ; DA28 E8                       .
        inx                                     ; DA29 E8                       .
        inx                                     ; DA2A E8                       .
        iny                                     ; DA2B C8                       .
        iny                                     ; DA2C C8                       .
        cpy     #$08                            ; DA2D C0 08                    ..
        bcc     LDA1B                           ; DA2F 90 EA                    ..
LDA31:  rts                                     ; DA31 60                       `

; ----------------------------------------------------------------------------
LDA32:  .byte   $1C                             ; DA32 1C                       .
LDA33:  .byte   $03                             ; DA33 03                       .
        ora     $2C03,x                         ; DA34 1D 03 2C                 ..,
        .byte   $03                             ; DA37 03                       .
        .byte   $2D                             ; DA38 2D                       -
        .byte   $03                             ; DA39 03                       .
LDA3A:  bit     $20                             ; DA3A 24 20                    $ 
        bvs     LDA58                           ; DA3C 70 1A                    p.
        lda     #$C0                            ; DA3E A9 C0                    ..
        sta     $20                             ; DA40 85 20                    . 
        lda     #$00                            ; DA42 A9 00                    ..
        sta     $21                             ; DA44 85 21                    .!
        sta     $38                             ; DA46 85 38                    .8
        lda     #$80                            ; DA48 A9 80                    ..
        sta     $22                             ; DA4A 85 22                    ."
        lda     #$00                            ; DA4C A9 00                    ..
        sta     $23                             ; DA4E 85 23                    .#
        lda     #$50                            ; DA50 A9 50                    .P
        sta     $24                             ; DA52 85 24                    .$
        lda     #$00                            ; DA54 A9 00                    ..
        sta     $25                             ; DA56 85 25                    .%
LDA58:  bit     $21                             ; DA58 24 21                    $!
        bpl     LDA5F                           ; DA5A 10 03                    ..
        jmp     LDB80                           ; DA5C 4C 80 DB                 L..

; ----------------------------------------------------------------------------
LDA5F:  jsr     LDBB2                           ; DA5F 20 B2 DB                  ..
        bit     $21                             ; DA62 24 21                    $!
        bvs     LDA75                           ; DA64 70 0F                    p.
        lda     $21                             ; DA66 A5 21                    .!
        ora     #$40                            ; DA68 09 40                    .@
        sta     $21                             ; DA6A 85 21                    .!
        lda     #$FF                            ; DA6C A9 FF                    ..
        sta     $35                             ; DA6E 85 35                    .5
        lda     $36                             ; DA70 A5 36                    .6
        jmp     LDA7B                           ; DA72 4C 7B DA                 L{.

; ----------------------------------------------------------------------------
LDA75:  lda     $36                             ; DA75 A5 36                    .6
        cmp     $37                             ; DA77 C5 37                    .7
        beq     LDA99                           ; DA79 F0 1E                    ..
LDA7B:  sta     $37                             ; DA7B 85 37                    .7
        asl     a                               ; DA7D 0A                       .
        sta     $12                             ; DA7E 85 12                    ..
        lda     $21                             ; DA80 A5 21                    .!
        and     #$01                            ; DA82 29 01                    ).
        clc                                     ; DA84 18                       .
        adc     $12                             ; DA85 65 12                    e.
        adc     #$04                            ; DA87 69 04                    i.
        jsr     LDBE5                           ; DA89 20 E5 DB                  ..
        jsr     L8C69                           ; DA8C 20 69 8C                  i.
        and     #$03                            ; DA8F 29 03                    ).
        beq     LDA97                           ; DA91 F0 04                    ..
        cmp     #$03                            ; DA93 C9 03                    ..
        bcs     LDA99                           ; DA95 B0 02                    ..
LDA97:  sta     $38                             ; DA97 85 38                    .8
LDA99:  lda     $34                             ; DA99 A5 34                    .4
        cmp     $35                             ; DA9B C5 35                    .5
        beq     LDAFE                           ; DA9D F0 5F                    ._
        sta     $35                             ; DA9F 85 35                    .5
        asl     a                               ; DAA1 0A                       .
        tax                                     ; DAA2 AA                       .
        lda     LF580,x                         ; DAA3 BD 80 F5                 ...
        sta     $18                             ; DAA6 85 18                    ..
        lda     LF581,x                         ; DAA8 BD 81 F5                 ...
        sta     $19                             ; DAAB 85 19                    ..
        lda     $18                             ; DAAD A5 18                    ..
        sta     $30                             ; DAAF 85 30                    .0
        lda     $19                             ; DAB1 A5 19                    ..
        sta     $31                             ; DAB3 85 31                    .1
        lsr     $19                             ; DAB5 46 19                    F.
        ror     $18                             ; DAB7 66 18                    f.
        lda     $18                             ; DAB9 A5 18                    ..
        sta     $32                             ; DABB 85 32                    .2
        lda     $19                             ; DABD A5 19                    ..
        sta     $33                             ; DABF 85 33                    .3
        lda     $38                             ; DAC1 A5 38                    .8
        bne     LDACE                           ; DAC3 D0 09                    ..
        lda     #$00                            ; DAC5 A9 00                    ..
        sta     $30                             ; DAC7 85 30                    .0
        sta     $31                             ; DAC9 85 31                    .1
        jmp     LDAE5                           ; DACB 4C E5 DA                 L..

; ----------------------------------------------------------------------------
LDACE:  cmp     #$01                            ; DACE C9 01                    ..
        beq     LDAE5                           ; DAD0 F0 13                    ..
        lda     $31                             ; DAD2 A5 31                    .1
        eor     #$FF                            ; DAD4 49 FF                    I.
        tay                                     ; DAD6 A8                       .
        lda     $30                             ; DAD7 A5 30                    .0
        eor     #$FF                            ; DAD9 49 FF                    I.
        clc                                     ; DADB 18                       .
        adc     #$01                            ; DADC 69 01                    i.
        sta     $30                             ; DADE 85 30                    .0
        tya                                     ; DAE0 98                       .
        adc     #$00                            ; DAE1 69 00                    i.
        sta     $31                             ; DAE3 85 31                    .1
LDAE5:  lda     #$01                            ; DAE5 A9 01                    ..
        bit     $21                             ; DAE7 24 21                    $!
        beq     LDAFE                           ; DAE9 F0 13                    ..
        lda     $33                             ; DAEB A5 33                    .3
        eor     #$FF                            ; DAED 49 FF                    I.
        tay                                     ; DAEF A8                       .
        lda     $32                             ; DAF0 A5 32                    .2
        eor     #$FF                            ; DAF2 49 FF                    I.
        clc                                     ; DAF4 18                       .
        adc     #$01                            ; DAF5 69 01                    i.
        sta     $32                             ; DAF7 85 32                    .2
        tya                                     ; DAF9 98                       .
        adc     #$00                            ; DAFA 69 00                    i.
        sta     $33                             ; DAFC 85 33                    .3
LDAFE:  lda     $34                             ; DAFE A5 34                    .4
        asl     a                               ; DB00 0A                       .
        tax                                     ; DB01 AA                       .
        lda     #$C0                            ; DB02 A9 C0                    ..
        and     $0330                           ; DB04 2D 30 03                 -0.
        beq     LDB2F                           ; DB07 F0 26                    .&
        bpl     LDB1D                           ; DB09 10 12                    ..
        lda     $30                             ; DB0B A5 30                    .0
        sec                                     ; DB0D 38                       8
        sbc     LF580,x                         ; DB0E FD 80 F5                 ...
        sta     $16                             ; DB11 85 16                    ..
        lda     $31                             ; DB13 A5 31                    .1
        sbc     LF581,x                         ; DB15 FD 81 F5                 ...
        sta     $17                             ; DB18 85 17                    ..
        jmp     LDB37                           ; DB1A 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB1D:  lda     $30                             ; DB1D A5 30                    .0
        clc                                     ; DB1F 18                       .
        adc     LF580,x                         ; DB20 7D 80 F5                 }..
        sta     $16                             ; DB23 85 16                    ..
        lda     $31                             ; DB25 A5 31                    .1
        adc     LF581,x                         ; DB27 7D 81 F5                 }..
        sta     $17                             ; DB2A 85 17                    ..
        jmp     LDB37                           ; DB2C 4C 37 DB                 L7.

; ----------------------------------------------------------------------------
LDB2F:  lda     $30                             ; DB2F A5 30                    .0
        sta     $16                             ; DB31 85 16                    ..
        lda     $31                             ; DB33 A5 31                    .1
        sta     $17                             ; DB35 85 17                    ..
LDB37:  lda     $2C                             ; DB37 A5 2C                    .,
        clc                                     ; DB39 18                       .
        adc     $16                             ; DB3A 65 16                    e.
        sta     $2C                             ; DB3C 85 2C                    .,
        lda     $22                             ; DB3E A5 22                    ."
        adc     $17                             ; DB40 65 17                    e.
        sta     $22                             ; DB42 85 22                    ."
        lda     $17                             ; DB44 A5 17                    ..
        bmi     LDB4F                           ; DB46 30 07                    0.
        lda     $23                             ; DB48 A5 23                    .#
        adc     #$00                            ; DB4A 69 00                    i.
        jmp     LDB53                           ; DB4C 4C 53 DB                 LS.

; ----------------------------------------------------------------------------
LDB4F:  lda     $23                             ; DB4F A5 23                    .#
        adc     #$FF                            ; DB51 69 FF                    i.
LDB53:  sta     $23                             ; DB53 85 23                    .#
        jsr     L981B                           ; DB55 20 1B 98                  ..
        lda     #$01                            ; DB58 A9 01                    ..
        bit     $21                             ; DB5A 24 21                    $!
        bne     LDB6F                           ; DB5C D0 11                    ..
        lda     $24                             ; DB5E A5 24                    .$
        cmp     #$B8                            ; DB60 C9 B8                    ..
        bcc     LDB6C                           ; DB62 90 08                    ..
        lda     #$B8                            ; DB64 A9 B8                    ..
        sta     $24                             ; DB66 85 24                    .$
        lda     #$01                            ; DB68 A9 01                    ..
        sta     $21                             ; DB6A 85 21                    .!
LDB6C:  jmp     LDBB1                           ; DB6C 4C B1 DB                 L..

; ----------------------------------------------------------------------------
LDB6F:  lda     $24                             ; DB6F A5 24                    .$
        cmp     #$50                            ; DB71 C9 50                    .P
        bcs     LDB6C                           ; DB73 B0 F7                    ..
        lda     #$50                            ; DB75 A9 50                    .P
        sta     $24                             ; DB77 85 24                    .$
        lda     #$00                            ; DB79 A9 00                    ..
        sta     $21                             ; DB7B 85 21                    .!
        jmp     LDBB1                           ; DB7D 4C B1 DB                 L..

; ----------------------------------------------------------------------------
LDB80:  bit     $21                             ; DB80 24 21                    $!
        bvs     LDBA5                           ; DB82 70 21                    p!
        lda     $21                             ; DB84 A5 21                    .!
        ora     #$40                            ; DB86 09 40                    .@
        sta     $21                             ; DB88 85 21                    .!
        lda     $23                             ; DB8A A5 23                    .#
        bmi     LDB94                           ; DB8C 30 06                    0.
        bne     LDB9A                           ; DB8E D0 0A                    ..
        lda     $22                             ; DB90 A5 22                    ."
        bmi     LDB9A                           ; DB92 30 06                    0.
LDB94:  lda     $20                             ; DB94 A5 20                    . 
        ora     #$10                            ; DB96 09 10                    ..
        bne     LDB9E                           ; DB98 D0 04                    ..
LDB9A:  lda     $20                             ; DB9A A5 20                    . 
        and     #$EF                            ; DB9C 29 EF                    ).
LDB9E:  sta     $20                             ; DB9E 85 20                    . 
        lda     $36                             ; DBA0 A5 36                    .6
        jmp     LDBE5                           ; DBA2 4C E5 DB                 L..

; ----------------------------------------------------------------------------
LDBA5:  lda     #$02                            ; DBA5 A9 02                    ..
        bit     $3F                             ; DBA7 24 3F                    $?
        beq     LDBB1                           ; DBA9 F0 06                    ..
        lda     $21                             ; DBAB A5 21                    .!
        and     #$01                            ; DBAD 29 01                    ).
        sta     $21                             ; DBAF 85 21                    .!
LDBB1:  rts                                     ; DBB1 60                       `

; ----------------------------------------------------------------------------
LDBB2:  ldy     #$00                            ; DBB2 A0 00                    ..
        lda     $24                             ; DBB4 A5 24                    .$
        sec                                     ; DBB6 38                       8
        sbc     #$50                            ; DBB7 E9 50                    .P
        bcs     LDBBD                           ; DBB9 B0 02                    ..
        lda     #$00                            ; DBBB A9 00                    ..
LDBBD:  cmp     #$10                            ; DBBD C9 10                    ..
        bcc     LDBE0                           ; DBBF 90 1F                    ..
        iny                                     ; DBC1 C8                       .
        sbc     #$10                            ; DBC2 E9 10                    ..
        lsr     a                               ; DBC4 4A                       J
        cmp     #$08                            ; DBC5 C9 08                    ..
        bcs     LDBCE                           ; DBC7 B0 05                    ..
        adc     #$10                            ; DBC9 69 10                    i.
        jmp     LDBE0                           ; DBCB 4C E0 DB                 L..

; ----------------------------------------------------------------------------
LDBCE:  iny                                     ; DBCE C8                       .
        sbc     #$08                            ; DBCF E9 08                    ..
        lsr     a                               ; DBD1 4A                       J
        cmp     #$08                            ; DBD2 C9 08                    ..
        bcc     LDBD8                           ; DBD4 90 02                    ..
        lda     #$07                            ; DBD6 A9 07                    ..
LDBD8:  clc                                     ; DBD8 18                       .
        .byte   $69                             ; DBD9 69                       i
LDBDA:  clc                                     ; DBDA 18                       .
        cmp     #$1E                            ; DBDB C9 1E                    ..
        bcc     LDBE0                           ; DBDD 90 01                    ..
        iny                                     ; DBDF C8                       .
LDBE0:  sta     $34                             ; DBE0 85 34                    .4
        sty     $36                             ; DBE2 84 36                    .6
        rts                                     ; DBE4 60                       `

; ----------------------------------------------------------------------------
LDBE5:  asl     a                               ; DBE5 0A                       .
        tax                                     ; DBE6 AA                       .
        lda     LDED3,x                         ; DBE7 BD D3 DE                 ...
        sta     $28                             ; DBEA 85 28                    .(
        lda     LDED4,x                         ; DBEC BD D4 DE                 ...
        sta     $29                             ; DBEF 85 29                    .)
        lda     #$00                            ; DBF1 A9 00                    ..
        sta     $2A                             ; DBF3 85 2A                    .*
        lda     #$01                            ; DBF5 A9 01                    ..
        sta     $2B                             ; DBF7 85 2B                    .+
        rts                                     ; DBF9 60                       `

; ----------------------------------------------------------------------------
LDBFA:  lda     $2B                             ; DBFA A5 2B                    .+
        beq     LDC39                           ; DBFC F0 3B                    .;
        dec     $2B                             ; DBFE C6 2B                    .+
        bne     LDC39                           ; DC00 D0 37                    .7
        ldy     $2A                             ; DC02 A4 2A                    .*
LDC04:  lda     ($28),y                         ; DC04 B1 28                    .(
        bne     LDC11                           ; DC06 D0 09                    ..
        lda     $3F                             ; DC08 A5 3F                    .?
        ora     #$02                            ; DC0A 09 02                    ..
        sta     $3F                             ; DC0C 85 3F                    .?
        jmp     LDC39                           ; DC0E 4C 39 DC                 L9.

; ----------------------------------------------------------------------------
LDC11:  iny                                     ; DC11 C8                       .
        cmp     #$FF                            ; DC12 C9 FF                    ..
        bne     LDC1A                           ; DC14 D0 04                    ..
        ldy     #$00                            ; DC16 A0 00                    ..
        beq     LDC04                           ; DC18 F0 EA                    ..
LDC1A:  sta     $2B                             ; DC1A 85 2B                    .+
        tax                                     ; DC1C AA                       .
        lda     $3F                             ; DC1D A5 3F                    .?
        and     #$FD                            ; DC1F 29 FD                    ).
        sta     $3F                             ; DC21 85 3F                    .?
        lda     ($28),y                         ; DC23 B1 28                    .(
        iny                                     ; DC25 C8                       .
        sta     $26                             ; DC26 85 26                    .&
        lda     ($28),y                         ; DC28 B1 28                    .(
        iny                                     ; DC2A C8                       .
        sta     $27                             ; DC2B 85 27                    .'
        txa                                     ; DC2D 8A                       .
        and     #$1F                            ; DC2E 29 1F                    ).
        sta     $2B                             ; DC30 85 2B                    .+
        sty     $2A                             ; DC32 84 2A                    .*
        txa                                     ; DC34 8A                       .
        and     #$60                            ; DC35 29 60                    )`
        sta     $3E                             ; DC37 85 3E                    .>
LDC39:  ldy     #$00                            ; DC39 A0 00                    ..
        ldx     #$00                            ; DC3B A2 00                    ..
        lda     #$12                            ; DC3D A9 12                    ..
        sta     L0000                           ; DC3F 85 00                    ..
        lda     $20                             ; DC41 A5 20                    . 
        asl     a                               ; DC43 0A                       .
        asl     a                               ; DC44 0A                       .
        eor     $3E                             ; DC45 45 3E                    E>
        and     #$40                            ; DC47 29 40                    )@
        ora     #$01                            ; DC49 09 01                    ..
        sta     L0001                           ; DC4B 85 01                    ..
LDC4D:  lda     ($26),y                         ; DC4D B1 26                    .&
        cmp     #$80                            ; DC4F C9 80                    ..
        beq     LDCAB                           ; DC51 F0 58                    .X
        iny                                     ; DC53 C8                       .
        bit     L0001                           ; DC54 24 01                    $.
        bvc     LDC5D                           ; DC56 50 05                    P.
        eor     #$FF                            ; DC58 49 FF                    I.
        clc                                     ; DC5A 18                       .
        adc     #$F8                            ; DC5B 69 F8                    i.
LDC5D:  clc                                     ; DC5D 18                       .
        and     #$FF                            ; DC5E 29 FF                    ).
        bmi     LDC6F                           ; DC60 30 0D                    0.
        adc     $22                             ; DC62 65 22                    e"
        sta     $02BB,x                         ; DC64 9D BB 02                 ...
        lda     $23                             ; DC67 A5 23                    .#
        adc     #$00                            ; DC69 69 00                    i.
        beq     LDC7A                           ; DC6B F0 0D                    ..
        bne     LDCA6                           ; DC6D D0 37                    .7
LDC6F:  adc     $22                             ; DC6F 65 22                    e"
        sta     $02BB,x                         ; DC71 9D BB 02                 ...
        lda     $23                             ; DC74 A5 23                    .#
        adc     #$FF                            ; DC76 69 FF                    i.
        bne     LDCA6                           ; DC78 D0 2C                    .,
LDC7A:  lda     ($26),y                         ; DC7A B1 26                    .&
        clc                                     ; DC7C 18                       .
        bmi     LDC86                           ; DC7D 30 07                    0.
        adc     $24                             ; DC7F 65 24                    e$
        sta     $02B8,x                         ; DC81 9D B8 02                 ...
        lda     #$00                            ; DC84 A9 00                    ..
LDC86:  adc     $24                             ; DC86 65 24                    e$
        sta     $02B8,x                         ; DC88 9D B8 02                 ...
        lda     #$FF                            ; DC8B A9 FF                    ..
        adc     $25                             ; DC8D 65 25                    e%
        bne     LDCA6                           ; DC8F D0 15                    ..
        iny                                     ; DC91 C8                       .
        lda     ($26),y                         ; DC92 B1 26                    .&
        iny                                     ; DC94 C8                       .
        sta     $02B9,x                         ; DC95 9D B9 02                 ...
        lda     L0001                           ; DC98 A5 01                    ..
        sta     $02BA,x                         ; DC9A 9D BA 02                 ...
        inx                                     ; DC9D E8                       .
        inx                                     ; DC9E E8                       .
        inx                                     ; DC9F E8                       .
        inx                                     ; DCA0 E8                       .
        dec     L0000                           ; DCA1 C6 00                    ..
        jmp     LDC4D                           ; DCA3 4C 4D DC                 LM.

; ----------------------------------------------------------------------------
LDCA6:  iny                                     ; DCA6 C8                       .
        iny                                     ; DCA7 C8                       .
        jmp     LDC4D                           ; DCA8 4C 4D DC                 LM.

; ----------------------------------------------------------------------------
LDCAB:  ldy     L0000                           ; DCAB A4 00                    ..
        beq     LDCBB                           ; DCAD F0 0C                    ..
        lda     #$F0                            ; DCAF A9 F0                    ..
LDCB1:  sta     $02B8,x                         ; DCB1 9D B8 02                 ...
        inx                                     ; DCB4 E8                       .
        inx                                     ; DCB5 E8                       .
        inx                                     ; DCB6 E8                       .
        inx                                     ; DCB7 E8                       .
        dey                                     ; DCB8 88                       .
        bne     LDCB1                           ; DCB9 D0 F6                    ..
LDCBB:  lda     #$01                            ; DCBB A9 01                    ..
        sta     $0302                           ; DCBD 8D 02 03                 ...
        rts                                     ; DCC0 60                       `

; ----------------------------------------------------------------------------
LDCC1:  jsr     L8BEA                           ; DCC1 20 EA 8B                  ..
        jsr     L8E12                           ; DCC4 20 12 8E                  ..
        jsr     LA78F                           ; DCC7 20 8F A7                  ..
        lda     #$05                            ; DCCA A9 05                    ..
        jsr     L8D69                           ; DCCC 20 69 8D                  i.
        lda     #$01                            ; DCCF A9 01                    ..
        jsr     LACE6                           ; DCD1 20 E6 AC                  ..
        lda     #$03                            ; DCD4 A9 03                    ..
        jsr     L8D69                           ; DCD6 20 69 8D                  i.
        lda     #$03                            ; DCD9 A9 03                    ..
        jsr     L8EBD                           ; DCDB 20 BD 8E                  ..
        lda     #$02                            ; DCDE A9 02                    ..
        sta     $0307                           ; DCE0 8D 07 03                 ...
        lda     #$00                            ; DCE3 A9 00                    ..
        sta     $0320                           ; DCE5 8D 20 03                 . .
        sta     $0323                           ; DCE8 8D 23 03                 .#.
        sta     $0338                           ; DCEB 8D 38 03                 .8.
        sta     $0339                           ; DCEE 8D 39 03                 .9.
        sta     $033B                           ; DCF1 8D 3B 03                 .;.
        lda     #$20                            ; DCF4 A9 20                    . 
        sta     $0322                           ; DCF6 8D 22 03                 .".
        sta     $033A                           ; DCF9 8D 3A 03                 .:.
        jsr     L977C                           ; DCFC 20 7C 97                  |.
        sta     $0302                           ; DCFF 8D 02 03                 ...
        jsr     L8BDE                           ; DD02 20 DE 8B                  ..
        jsr     L8BC2                           ; DD05 20 C2 8B                  ..
LDD08:  jsr     L8C40                           ; DD08 20 40 8C                  @.
        jsr     LDE92                           ; DD0B 20 92 DE                  ..
        jsr     L9A37                           ; DD0E 20 37 9A                  7.
        lda     $0680                           ; DD11 AD 80 06                 ...
        bne     LDD08                           ; DD14 D0 F2                    ..
        jsr     L8BEA                           ; DD16 20 EA 8B                  ..
        jsr     L8BB6                           ; DD19 20 B6 8B                  ..
        lda     $030E                           ; DD1C AD 0E 03                 ...
        ora     #$18                            ; DD1F 09 18                    ..
        sta     $030E                           ; DD21 8D 0E 03                 ...
        jsr     L8E12                           ; DD24 20 12 8E                  ..
        lda     #$05                            ; DD27 A9 05                    ..
        jsr     L8EBD                           ; DD29 20 BD 8E                  ..
        lda     #$03                            ; DD2C A9 03                    ..
        sta     $0307                           ; DD2E 8D 07 03                 ...
        lda     #$06                            ; DD31 A9 06                    ..
        jsr     L8D69                           ; DD33 20 69 8D                  i.
        lda     #$00                            ; DD36 A9 00                    ..
        sta     $0320                           ; DD38 8D 20 03                 . .
        sta     $0322                           ; DD3B 8D 22 03                 .".
        sta     $0323                           ; DD3E 8D 23 03                 .#.
        sta     $0338                           ; DD41 8D 38 03                 .8.
        sta     $0339                           ; DD44 8D 39 03                 .9.
        sta     $033A                           ; DD47 8D 3A 03                 .:.
        sta     $033B                           ; DD4A 8D 3B 03                 .;.
        jsr     L977C                           ; DD4D 20 7C 97                  |.
        lda     #$01                            ; DD50 A9 01                    ..
        sta     $0302                           ; DD52 8D 02 03                 ...
        jsr     L8BDE                           ; DD55 20 DE 8B                  ..
        jsr     L8BC2                           ; DD58 20 C2 8B                  ..
        lda     #$00                            ; DD5B A9 00                    ..
        sta     L0301                           ; DD5D 8D 01 03                 ...
LDD60:  jsr     L8C40                           ; DD60 20 40 8C                  @.
        jsr     LDDC5                           ; DD63 20 C5 DD                  ..
        jsr     L9A37                           ; DD66 20 37 9A                  7.
        lda     $0680                           ; DD69 AD 80 06                 ...
        bne     LDD60                           ; DD6C D0 F2                    ..
        ldy     #$3C                            ; DD6E A0 3C                    .<
        jsr     L8C50                           ; DD70 20 50 8C                  P.
        jsr     LA8A1                           ; DD73 20 A1 A8                  ..
        lda     #$DD                            ; DD76 A9 DD                    ..
        jsr     LA8A1                           ; DD78 20 A1 A8                  ..
        ldy     $DD,x                           ; DD7B B4 DD                    ..
        jsr     LA8A1                           ; DD7D 20 A1 A8                  ..
        .byte   $BF                             ; DD80 BF                       .
        cmp     $5F20,x                         ; DD81 DD 20 5F                 . _
        .byte   $8B                             ; DD84 8B                       .
        lda     #$04                            ; DD85 A9 04                    ..
        jsr     LE2CD                           ; DD87 20 CD E2                  ..
LDD8A:  jsr     L8C40                           ; DD8A 20 40 8C                  @.
        lda     $0574                           ; DD8D AD 74 05                 .t.
        bmi     LDD8A                           ; DD90 30 F8                    0.
        jsr     L8C87                           ; DD92 20 87 8C                  ..
        lda     #$08                            ; DD95 A9 08                    ..
        bit     $0332                           ; DD97 2C 32 03                 ,2.
        beq     LDD8A                           ; DD9A F0 EE                    ..
        lda     $030E                           ; DD9C AD 0E 03                 ...
        and     #$E7                            ; DD9F 29 E7                    ).
        ora     #$08                            ; DDA1 09 08                    ..
        sta     $030E                           ; DDA3 8D 0E 03                 ...
        jmp     L8148                           ; DDA6 4C 48 81                 LH.

; ----------------------------------------------------------------------------
        lsr     $23,x                           ; DDA9 56 23                    V#
        php                                     ; DDAB 08                       .
        inx                                     ; DDAC E8                       .
        sbc     #$EA                            ; DDAD E9 EA                    ..
        .byte   $EB                             ; DDAF EB                       .
        cpx     LEEED                           ; DDB0 EC ED EE                 ...
        .byte   $EF                             ; DDB3 EF                       .
        ror     $23,x                           ; DDB4 76 23                    v#
        php                                     ; DDB6 08                       .
        sed                                     ; DDB7 F8                       .
        sbc     LFBFA,y                         ; DDB8 F9 FA FB                 ...
        .byte   $FC                             ; DDBB FC                       .
        sbc     LFFFE,x                         ; DDBC FD FE FF                 ...
        sbc     $23,x                           ; DDBF F5 23                    .#
        .byte   $03                             ; DDC1 03                       .
        .byte   $7F                             ; DDC2 7F                       .
        .byte   $5F                             ; DDC3 5F                       _
        .byte   $DF                             ; DDC4 DF                       .
LDDC5:  lda     #$80                            ; DDC5 A9 80                    ..
        sta     $40                             ; DDC7 85 40                    .@
        lda     #$06                            ; DDC9 A9 06                    ..
        sta     $41                             ; DDCB 85 41                    .A
        jsr     L9754                           ; DDCD 20 54 97                  T.
        bit     $20                             ; DDD0 24 20                    $ 
        bmi     LDE00                           ; DDD2 30 2C                    0,
        lda     #$C0                            ; DDD4 A9 C0                    ..
        sta     $20                             ; DDD6 85 20                    . 
        lda     #$40                            ; DDD8 A9 40                    .@
        sta     $22                             ; DDDA 85 22                    ."
        lda     #$01                            ; DDDC A9 01                    ..
        sta     $23                             ; DDDE 85 23                    .#
        lda     #$90                            ; DDE0 A9 90                    ..
        sta     $24                             ; DDE2 85 24                    .$
        lda     #$00                            ; DDE4 A9 00                    ..
        sta     $25                             ; DDE6 85 25                    .%
        lda     #$00                            ; DDE8 A9 00                    ..
        sta     $30                             ; DDEA 85 30                    .0
        lda     #$FC                            ; DDEC A9 FC                    ..
        sta     $31                             ; DDEE 85 31                    .1
        lda     #$00                            ; DDF0 A9 00                    ..
        sta     $32                             ; DDF2 85 32                    .2
        lda     #$FF                            ; DDF4 A9 FF                    ..
        sta     $33                             ; DDF6 85 33                    .3
        lda     #$08                            ; DDF8 A9 08                    ..
        jsr     L97AD                           ; DDFA 20 AD 97                  ..
        jmp     L9761                           ; DDFD 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE00:  lda     $34                             ; DE00 A5 34                    .4
        bne     LDE4D                           ; DE02 D0 49                    .I
        jsr     L97FA                           ; DE04 20 FA 97                  ..
        jsr     L981B                           ; DE07 20 1B 98                  ..
        bit     $35                             ; DE0A 24 35                    $5
        bmi     LDE1B                           ; DE0C 30 0D                    0.
        lda     #$01                            ; DE0E A9 01                    ..
        bit     $3F                             ; DE10 24 3F                    $?
        beq     LDE18                           ; DE12 F0 04                    ..
        lda     #$80                            ; DE14 A9 80                    ..
        sta     $35                             ; DE16 85 35                    .5
LDE18:  jmp     L9761                           ; DE18 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE1B:  lda     #$01                            ; DE1B A9 01                    ..
        bit     $3F                             ; DE1D 24 3F                    $?
        bne     LDE18                           ; DE1F D0 F7                    ..
        lda     #$38                            ; DE21 A9 38                    .8
        sta     $24                             ; DE23 85 24                    .$
        lda     #$00                            ; DE25 A9 00                    ..
        sta     $25                             ; DE27 85 25                    .%
        lda     #$80                            ; DE29 A9 80                    ..
        sta     $30                             ; DE2B 85 30                    .0
        lda     #$02                            ; DE2D A9 02                    ..
        sta     $31                             ; DE2F 85 31                    .1
        lda     #$10                            ; DE31 A9 10                    ..
        sta     $32                             ; DE33 85 32                    .2
        lda     #$00                            ; DE35 A9 00                    ..
        sta     $33                             ; DE37 85 33                    .3
        lda     #$01                            ; DE39 A9 01                    ..
        sta     $34                             ; DE3B 85 34                    .4
        lda     #$00                            ; DE3D A9 00                    ..
        sta     $35                             ; DE3F 85 35                    .5
        lda     #$10                            ; DE41 A9 10                    ..
        sta     $36                             ; DE43 85 36                    .6
        lda     #$09                            ; DE45 A9 09                    ..
        jsr     L97AD                           ; DE47 20 AD 97                  ..
        jmp     L9761                           ; DE4A 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE4D:  cmp     #$01                            ; DE4D C9 01                    ..
        bne     LDE84                           ; DE4F D0 33                    .3
        lda     $36                             ; DE51 A5 36                    .6
        beq     LDE5A                           ; DE53 F0 05                    ..
        dec     $36                             ; DE55 C6 36                    .6
        jmp     L9761                           ; DE57 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE5A:  jsr     L97FA                           ; DE5A 20 FA 97                  ..
        jsr     L981B                           ; DE5D 20 1B 98                  ..
        bit     $35                             ; DE60 24 35                    $5
        bmi     LDE71                           ; DE62 30 0D                    0.
        lda     #$01                            ; DE64 A9 01                    ..
        bit     $3F                             ; DE66 24 3F                    $?
        beq     LDE6E                           ; DE68 F0 04                    ..
        lda     #$80                            ; DE6A A9 80                    ..
        sta     $35                             ; DE6C 85 35                    .5
LDE6E:  jmp     L9761                           ; DE6E 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE71:  ldy     #$04                            ; DE71 A0 04                    ..
        jsr     L98B8                           ; DE73 20 B8 98                  ..
        bcc     LDE6E                           ; DE76 90 F6                    ..
        lda     #$02                            ; DE78 A9 02                    ..
        sta     $34                             ; DE7A 85 34                    .4
        lda     #$0A                            ; DE7C A9 0A                    ..
        jsr     L97AD                           ; DE7E 20 AD 97                  ..
        jmp     L9761                           ; DE81 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE84:  jsr     L97BE                           ; DE84 20 BE 97                  ..
        lda     $2B                             ; DE87 A5 2B                    .+
        bne     LDE8F                           ; DE89 D0 04                    ..
        lda     #$00                            ; DE8B A9 00                    ..
        sta     $20                             ; DE8D 85 20                    . 
LDE8F:  jmp     L9761                           ; DE8F 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDE92:  lda     #$80                            ; DE92 A9 80                    ..
        sta     $40                             ; DE94 85 40                    .@
        lda     #$06                            ; DE96 A9 06                    ..
        sta     $41                             ; DE98 85 41                    .A
        jsr     L9754                           ; DE9A 20 54 97                  T.
        jsr     LDEA3                           ; DE9D 20 A3 DE                  ..
        jmp     L9761                           ; DEA0 4C 61 97                 La.

; ----------------------------------------------------------------------------
LDEA3:  bit     $20                             ; DEA3 24 20                    $ 
        bvs     LDEC4                           ; DEA5 70 1D                    p.
        lda     #$C0                            ; DEA7 A9 C0                    ..
        sta     $20                             ; DEA9 85 20                    . 
        lda     #$80                            ; DEAB A9 80                    ..
        sta     $22                             ; DEAD 85 22                    ."
        lda     #$A0                            ; DEAF A9 A0                    ..
        sta     $24                             ; DEB1 85 24                    .$
        lda     #$80                            ; DEB3 A9 80                    ..
        sta     $32                             ; DEB5 85 32                    .2
        lda     #$10                            ; DEB7 A9 10                    ..
        sta     $30                             ; DEB9 85 30                    .0
        lda     #$C0                            ; DEBB A9 C0                    ..
        sta     $34                             ; DEBD 85 34                    .4
        lda     #$0B                            ; DEBF A9 0B                    ..
        jmp     L97AD                           ; DEC1 4C AD 97                 L..

; ----------------------------------------------------------------------------
LDEC4:  jsr     L97FA                           ; DEC4 20 FA 97                  ..
        jsr     L981B                           ; DEC7 20 1B 98                  ..
        dec     $34                             ; DECA C6 34                    .4
        bne     LDED2                           ; DECC D0 04                    ..
        lda     #$00                            ; DECE A9 00                    ..
        sta     $20                             ; DED0 85 20                    . 
LDED2:  rts                                     ; DED2 60                       `

; ----------------------------------------------------------------------------
LDED3:  .byte   $EB                             ; DED3 EB                       .
LDED4:  dec     LDF0D,x                         ; DED4 DE 0D DF                 ...
        .byte   $2F                             ; DED7 2F                       /
        .byte   $DF                             ; DED8 DF                       .
        eor     ($DF),y                         ; DED9 51 DF                    Q.
        adc     $80DF,y                         ; DEDB 79 DF 80                 y..
        .byte   $DF                             ; DEDE DF                       .
        sty     $DF                             ; DEDF 84 DF                    ..
        .byte   $8B                             ; DEE1 8B                       .
        .byte   $DF                             ; DEE2 DF                       .
        .byte   $8F                             ; DEE3 8F                       .
        .byte   $DF                             ; DEE4 DF                       .
        sta     $9DDF,y                         ; DEE5 99 DF 9D                 ...
        .byte   $DF                             ; DEE8 DF                       .
        .byte   $A7                             ; DEE9 A7                       .
        .byte   $DF                             ; DEEA DF                       .
        php                                     ; DEEB 08                       .
        .byte   $AB                             ; DEEC AB                       .
        .byte   $DF                             ; DEED DF                       .
        php                                     ; DEEE 08                       .
        .byte   $B2                             ; DEEF B2                       .
        .byte   $DF                             ; DEF0 DF                       .
        php                                     ; DEF1 08                       .
        lda     $0CDF,y                         ; DEF2 B9 DF 0C                 ...
        dec     $DF                             ; DEF5 C6 DF                    ..
        .byte   $0C                             ; DEF7 0C                       .
        .byte   $D3                             ; DEF8 D3                       .
        .byte   $DF                             ; DEF9 DF                       .
        .byte   $0C                             ; DEFA 0C                       .
        cpx     #$DF                            ; DEFB E0 DF                    ..
        jmp     LDFD3                           ; DEFD 4C D3 DF                 L..

; ----------------------------------------------------------------------------
        jmp     LDFC6                           ; DF00 4C C6 DF                 L..

; ----------------------------------------------------------------------------
        pha                                     ; DF03 48                       H
        lda     $48DF,y                         ; DF04 B9 DF 48                 ..H
        .byte   $B2                             ; DF07 B2                       .
        .byte   $DF                             ; DF08 DF                       .
        pha                                     ; DF09 48                       H
        .byte   $AB                             ; DF0A AB                       .
        .byte   $DF                             ; DF0B DF                       .
        brk                                     ; DF0C 00                       .
LDF0D:  php                                     ; DF0D 08                       .
        sbc     $08DF                           ; DF0E ED DF 08                 ...
        .byte   $F7                             ; DF11 F7                       .
        .byte   $DF                             ; DF12 DF                       .
        php                                     ; DF13 08                       .
        .byte   $04                             ; DF14 04                       .
LDF15:  cpx     #$0C                            ; DF15 E0 0C                    ..
        .byte   $17                             ; DF17 17                       .
        cpx     #$0C                            ; DF18 E0 0C                    ..
        .byte   $33                             ; DF1A 33                       3
        cpx     #$0C                            ; DF1B E0 0C                    ..
        jmp     L4CE0                           ; DF1D 4C E0 4C                 L.L

; ----------------------------------------------------------------------------
        .byte   $33                             ; DF20 33                       3
        cpx     #$4C                            ; DF21 E0 4C                    .L
        .byte   $17                             ; DF23 17                       .
        cpx     #$48                            ; DF24 E0 48                    .H
        .byte   $04                             ; DF26 04                       .
        cpx     #$48                            ; DF27 E0 48                    .H
        .byte   $F7                             ; DF29 F7                       .
        .byte   $DF                             ; DF2A DF                       .
        pha                                     ; DF2B 48                       H
        .byte   $ED                             ; DF2C ED                       .
LDF2D:  .byte   $DF                             ; DF2D DF                       .
        brk                                     ; DF2E 00                       .
        php                                     ; DF2F 08                       .
        .byte   $03                             ; DF30 03                       .
        sbc     ($08,x)                         ; DF31 E1 08                    ..
        beq     LDF15                           ; DF33 F0 E0                    ..
        php                                     ; DF35 08                       .
        .byte   $D4                             ; DF36 D4                       .
        cpx     #$0C                            ; DF37 E0 0C                    ..
        adc     $E0                             ; DF39 65 E0                    e.
        .byte   $0C                             ; DF3B 0C                       .
        .byte   $B2                             ; DF3C B2                       .
        cpx     #$0C                            ; DF3D E0 0C                    ..
        .byte   $87                             ; DF3F 87                       .
        cpx     #$4C                            ; DF40 E0 4C                    .L
        .byte   $B2                             ; DF42 B2                       .
        cpx     #$4C                            ; DF43 E0 4C                    .L
        adc     $E0                             ; DF45 65 E0                    e.
        pha                                     ; DF47 48                       H
        .byte   $D4                             ; DF48 D4                       .
        cpx     #$48                            ; DF49 E0 48                    .H
        beq     LDF2D                           ; DF4B F0 E0                    ..
        pha                                     ; DF4D 48                       H
        .byte   $03                             ; DF4E 03                       .
        sbc     (L0000,x)                       ; DF4F E1 00                    ..
        asl     $FA                             ; DF51 06 FA                    ..
        sbc     (L0006,x)                       ; DF53 E1 06                    ..
        .byte   $E7                             ; DF55 E7                       .
        sbc     (L0006,x)                       ; DF56 E1 06                    ..
        .byte   $CB                             ; DF58 CB                       .
        sbc     (L0006,x)                       ; DF59 E1 06                    ..
        ldy     #$E1                            ; DF5B A0 E1                    ..
        asl     a                               ; DF5D 0A                       .
        ora     $2AE1                           ; DF5E 0D E1 2A                 ..*
        .byte   $3B                             ; DF61 3B                       ;
        sbc     ($2A,x)                         ; DF62 E1 2A                    .*
        jmp     (L6AE1)                         ; DF64 6C E1 6A                 l.j

; ----------------------------------------------------------------------------
LDF67:  .byte   $3B                             ; DF67 3B                       ;
        .byte   $E1                             ; DF68 E1                       .
LDF69:  lsr     a                               ; DF69 4A                       J
        .byte   $0D                             ; DF6A 0D                       .
LDF6B:  sbc     ($46,x)                         ; DF6B E1 46                    .F
        .byte   $A0                             ; DF6D A0                       .
LDF6E:  sbc     ($46,x)                         ; DF6E E1 46                    .F
        .byte   $CB                             ; DF70 CB                       .
        .byte   $E1                             ; DF71 E1                       .
LDF72:  lsr     $E7                             ; DF72 46 E7                    F.
        sbc     ($46,x)                         ; DF74 E1 46                    .F
        .byte   $FA                             ; DF76 FA                       .
        sbc     (L0000,x)                       ; DF77 E1 00                    ..
        php                                     ; DF79 08                       .
        .byte   $04                             ; DF7A 04                       .
        .byte   $E2                             ; DF7B E2                       .
        php                                     ; DF7C 08                       .
        php                                     ; DF7D 08                       .
        .byte   $E2                             ; DF7E E2                       .
LDF7F:  .byte   $FF                             ; DF7F FF                       .
        ora     ($0C,x)                         ; DF80 01 0C                    ..
        .byte   $E2                             ; DF82 E2                       .
LDF83:  brk                                     ; DF83 00                       .
        php                                     ; DF84 08                       .
        bpl     LDF69                           ; DF85 10 E2                    ..
        php                                     ; DF87 08                       .
        .byte   $1D                             ; DF88 1D                       .
        .byte   $E2                             ; DF89 E2                       .
LDF8A:  .byte   $FF                             ; DF8A FF                       .
        ora     ($2A,x)                         ; DF8B 01 2A                    .*
        .byte   $E2                             ; DF8D E2                       .
LDF8E:  brk                                     ; DF8E 00                       .
        asl     $31                             ; DF8F 06 31                    .1
        .byte   $E2                             ; DF91 E2                       .
        asl     $3E                             ; DF92 06 3E                    .>
        .byte   $E2                             ; DF94 E2                       .
        asl     $4B                             ; DF95 06 4B                    .K
        .byte   $E2                             ; DF97 E2                       .
LDF98:  .byte   $FF                             ; DF98 FF                       .
        ora     ($58,x)                         ; DF99 01 58                    .X
        .byte   $E2                             ; DF9B E2                       .
LDF9C:  brk                                     ; DF9C 00                       .
        asl     $5F                             ; DF9D 06 5F                    ._
        .byte   $E2                             ; DF9F E2                       .
        asl     $6F                             ; DFA0 06 6F                    .o
        .byte   $E2                             ; DFA2 E2                       .
        asl     $7F                             ; DFA3 06 7F                    ..
        .byte   $E2                             ; DFA5 E2                       .
        .byte   $FF                             ; DFA6 FF                       .
        ora     ($8F,x)                         ; DFA7 01 8F                    ..
        .byte   $E2                             ; DFA9 E2                       .
        brk                                     ; DFAA 00                       .
        sed                                     ; DFAB F8                       .
        sed                                     ; DFAC F8                       .
        .byte   $AF                             ; DFAD AF                       .
        brk                                     ; DFAE 00                       .
        sed                                     ; DFAF F8                       .
        .byte   $9F                             ; DFB0 9F                       .
        .byte   $80                             ; DFB1 80                       .
        sed                                     ; DFB2 F8                       .
        sed                                     ; DFB3 F8                       .
        lda     LF800                           ; DFB4 AD 00 F8                 ...
        ldx     LF880                           ; DFB7 AE 80 F8                 ...
        beq     LDF67                           ; DFBA F0 AB                    ..
        brk                                     ; DFBC 00                       .
        beq     LDF6B                           ; DFBD F0 AC                    ..
        sed                                     ; DFBF F8                       .
        sed                                     ; DFC0 F8                       .
        .byte   $BB                             ; DFC1 BB                       .
        brk                                     ; DFC2 00                       .
        sed                                     ; DFC3 F8                       .
LDFC4:  .byte   $BC                             ; DFC4 BC                       .
        .byte   $80                             ; DFC5 80                       .
LDFC6:  sed                                     ; DFC6 F8                       .
        .byte   $F0                             ; DFC7 F0                       .
LDFC8:  lda     L0000                           ; DFC8 A5 00                    ..
        beq     LDF72                           ; DFCA F0 A6                    ..
        sed                                     ; DFCC F8                       .
        sed                                     ; DFCD F8                       .
        lda     L0000,x                         ; DFCE B5 00                    ..
        sed                                     ; DFD0 F8                       .
        ldx     $80,y                           ; DFD1 B6 80                    ..
LDFD3:  sed                                     ; DFD3 F8                       .
        beq     LDF7F                           ; DFD4 F0 A9                    ..
        brk                                     ; DFD6 00                       .
        beq     LDF83                           ; DFD7 F0 AA                    ..
        sed                                     ; DFD9 F8                       .
        sed                                     ; DFDA F8                       .
        lda     LF800,y                         ; DFDB B9 00 F8                 ...
        tsx                                     ; DFDE BA                       .
LDFDF:  .byte   $80                             ; DFDF 80                       .
        sed                                     ; DFE0 F8                       .
        beq     LDF8A                           ; DFE1 F0 A7                    ..
LDFE3:  brk                                     ; DFE3 00                       .
        .byte   $F0                             ; DFE4 F0                       .
LDFE5:  tay                                     ; DFE5 A8                       .
        sed                                     ; DFE6 F8                       .
LDFE7:  sed                                     ; DFE7 F8                       .
        .byte   $B7                             ; DFE8 B7                       .
        brk                                     ; DFE9 00                       .
        sed                                     ; DFEA F8                       .
        clv                                     ; DFEB B8                       .
        .byte   $80                             ; DFEC 80                       .
        beq     LDFE7                           ; DFED F0 F8                    ..
        .byte   $E3                             ; DFEF E3                       .
        sed                                     ; DFF0 F8                       .
LDFF1:  sed                                     ; DFF1 F8                       .
        cpx     L0000                           ; DFF2 E4 00                    ..
        sed                                     ; DFF4 F8                       .
        .byte   $F4                             ; DFF5 F4                       .
        .byte   $80                             ; DFF6 80                       .
        beq     LDFF1                           ; DFF7 F0 F8                    ..
        .byte   $C3                             ; DFF9 C3                       .
        sed                                     ; DFFA F8                       .
        sed                                     ; DFFB F8                       .
        cpy     L0000                           ; DFFC C4 00                    ..
        sed                                     ; DFFE F8                       .
        .byte   $D3                             ; DFFF D3                       .
        php                                     ; E000 08                       .
        sed                                     ; E001 F8                       .
        .byte   $D4                             ; E002 D4                       .
        .byte   $80                             ; E003 80                       .
LE004:  sed                                     ; E004 F8                       .
        .byte   $F0                             ; E005 F0                       .
LE006:  sta     (L0000),y                       ; E006 91 00                    ..
        beq     LDF9C                           ; E008 F0 92                    ..
        beq     LE004                           ; E00A F0 F8                    ..
        beq     LE006                           ; E00C F0 F8                    ..
        sed                                     ; E00E F8                       .
LE00F:  sbc     (L0000),y                       ; E00F F1 00                    ..
        sed                                     ; E011 F8                       .
        .byte   $F2                             ; E012 F2                       .
        php                                     ; E013 08                       .
        sed                                     ; E014 F8                       .
        .byte   $F3                             ; E015 F3                       .
        .byte   $80                             ; E016 80                       .
        sed                                     ; E017 F8                       .
        inx                                     ; E018 E8                       .
        sta     (L0000),y                       ; E019 91 00                    ..
        inx                                     ; E01B E8                       .
        .byte   $92                             ; E01C 92                       .
        beq     LE00F                           ; E01D F0 F0                    ..
        .byte   $A0                             ; E01F A0                       .
LE020:  sed                                     ; E020 F8                       .
        .byte   $F0                             ; E021 F0                       .
LE022:  lda     (L0000,x)                       ; E022 A1 00                    ..
        beq     LDFC8                           ; E024 F0 A2                    ..
LE026:  beq     LE020                           ; E026 F0 F8                    ..
        bcs     LE022                           ; E028 B0 F8                    ..
LE02A:  sed                                     ; E02A F8                       .
        lda     (L0000),y                       ; E02B B1 00                    ..
        sed                                     ; E02D F8                       .
        .byte   $B2                             ; E02E B2                       .
        php                                     ; E02F 08                       .
        sed                                     ; E030 F8                       .
        .byte   $9E                             ; E031 9E                       .
        .byte   $80                             ; E032 80                       .
        sed                                     ; E033 F8                       .
        inx                                     ; E034 E8                       .
        .byte   $93                             ; E035 93                       .
        brk                                     ; E036 00                       .
        inx                                     ; E037 E8                       .
        .byte   $94                             ; E038 94                       .
LE039:  sed                                     ; E039 F8                       .
        .byte   $F0                             ; E03A F0                       .
LE03B:  .byte   $A3                             ; E03B A3                       .
        brk                                     ; E03C 00                       .
        beq     LDFE3                           ; E03D F0 A4                    ..
        beq     LE039                           ; E03F F0 F8                    ..
        bcc     LE03B                           ; E041 90 F8                    ..
        sed                                     ; E043 F8                       .
        .byte   $B3                             ; E044 B3                       .
        brk                                     ; E045 00                       .
        sed                                     ; E046 F8                       .
        ldy     $08,x                           ; E047 B4 08                    ..
        sed                                     ; E049 F8                       .
        cpy     #$80                            ; E04A C0 80                    ..
        sed                                     ; E04C F8                       .
        inx                                     ; E04D E8                       .
        cmp     (L0000,x)                       ; E04E C1 00                    ..
        inx                                     ; E050 E8                       .
        .byte   $C2                             ; E051 C2                       .
LE052:  sed                                     ; E052 F8                       .
        beq     LE026                           ; E053 F0 D1                    ..
        brk                                     ; E055 00                       .
        beq     LE02A                           ; E056 F0 D2                    ..
        beq     LE052                           ; E058 F0 F8                    ..
        cpx     #$F8                            ; E05A E0 F8                    ..
        sed                                     ; E05C F8                       .
        sbc     (L0000,x)                       ; E05D E1 00                    ..
        sed                                     ; E05F F8                       .
        .byte   $E2                             ; E060 E2                       .
        php                                     ; E061 08                       .
        sed                                     ; E062 F8                       .
        bne     LDFE5                           ; E063 D0 80                    ..
        sbc     $04E0,y                         ; E065 F9 E0 04                 ...
        ora     ($E0,x)                         ; E068 01 E0                    ..
        ora     $F9                             ; E06A 05 F9                    ..
        inx                                     ; E06C E8                       .
        .byte   $14                             ; E06D 14                       .
        ora     ($E8,x)                         ; E06E 01 E8                    ..
        ora     $F1,x                           ; E070 15 F1                    ..
        beq     LE097                           ; E072 F0 23                    .#
        sbc     $24F0,y                         ; E074 F9 F0 24                 ..$
        ora     ($F0,x)                         ; E077 01 F0                    ..
        and     $F1                             ; E079 25 F1                    %.
        sed                                     ; E07B F8                       .
        .byte   $33                             ; E07C 33                       3
        sbc     $34F8,y                         ; E07D F9 F8 34                 ..4
        ora     ($F8,x)                         ; E080 01 F8                    ..
        and     $09,x                           ; E082 35 09                    5.
        sed                                     ; E084 F8                       .
        rol     $80,x                           ; E085 36 80                    6.
        .byte   $F7                             ; E087 F7                       .
        cpx     #$16                            ; E088 E0 16                    ..
        .byte   $FF                             ; E08A FF                       .
        cpx     #$50                            ; E08B E0 50                    .P
        .byte   $F7                             ; E08D F7                       .
        inx                                     ; E08E E8                       .
        rol     $FF                             ; E08F 26 FF                    &.
        inx                                     ; E091 E8                       .
        rts                                     ; E092 60                       `

; ----------------------------------------------------------------------------
        .byte   $F7                             ; E093 F7                       .
        beq     LE0AD                           ; E094 F0 17                    ..
        .byte   $FF                             ; E096 FF                       .
LE097:  beq     LE109                           ; E097 F0 70                    .p
        .byte   $E7                             ; E099 E7                       .
        sed                                     ; E09A F8                       .
        ora     LF8EF,y                         ; E09B 19 EF F8                 ...
        plp                                     ; E09E 28                       (
        .byte   $F7                             ; E09F F7                       .
        sed                                     ; E0A0 F8                       .
        .byte   $27                             ; E0A1 27                       '
        .byte   $FF                             ; E0A2 FF                       .
        sed                                     ; E0A3 F8                       .
        .byte   $80                             ; E0A4 80                       .
        .byte   $07                             ; E0A5 07                       .
        sed                                     ; E0A6 F8                       .
        sta     (L000F,x)                       ; E0A7 81 0F                    ..
        sed                                     ; E0A9 F8                       .
        .byte   $82                             ; E0AA 82                       .
        .byte   $EF                             ; E0AB EF                       .
        .byte   $F0                             ; E0AC F0                       .
LE0AD:  clc                                     ; E0AD 18                       .
        .byte   $07                             ; E0AE 07                       .
        .byte   $F0                             ; E0AF F0                       .
LE0B0:  adc     ($80),y                         ; E0B0 71 80                    q.
        sed                                     ; E0B2 F8                       .
        cpx     #$53                            ; E0B3 E0 53                    .S
LE0B5:  brk                                     ; E0B5 00                       .
        cpx     #$54                            ; E0B6 E0 54                    .T
        sed                                     ; E0B8 F8                       .
        inx                                     ; E0B9 E8                       .
        .byte   $63                             ; E0BA 63                       c
        brk                                     ; E0BB 00                       .
        inx                                     ; E0BC E8                       .
        .byte   $64                             ; E0BD 64                       d
        beq     LE0B0                           ; E0BE F0 F0                    ..
        .byte   $51                             ; E0C0 51                       Q
LE0C1:  sed                                     ; E0C1 F8                       .
        beq     LE137                           ; E0C2 F0 73                    .s
        brk                                     ; E0C4 00                       .
        beq     LE13B                           ; E0C5 F0 74                    .t
        beq     LE0C1                           ; E0C7 F0 F8                    ..
        adc     ($F8,x)                         ; E0C9 61 F8                    a.
        sed                                     ; E0CB F8                       .
        .byte   $83                             ; E0CC 83                       .
        brk                                     ; E0CD 00                       .
        sed                                     ; E0CE F8                       .
        sty     $08                             ; E0CF 84 08                    ..
        sed                                     ; E0D1 F8                       .
        .byte   $52                             ; E0D2 52                       R
        .byte   $80                             ; E0D3 80                       .
        sed                                     ; E0D4 F8                       .
        inx                                     ; E0D5 E8                       .
        .byte   $04                             ; E0D6 04                       .
        brk                                     ; E0D7 00                       .
        inx                                     ; E0D8 E8                       .
        ora     $F0                             ; E0D9 05 F0                    ..
        beq     LE114                           ; E0DB F0 37                    .7
LE0DD:  sed                                     ; E0DD F8                       .
        beq     LE0F4                           ; E0DE F0 14                    ..
        brk                                     ; E0E0 00                       .
LE0E1:  beq     LE12A                           ; E0E1 F0 47                    .G
        beq     LE0DD                           ; E0E3 F0 F8                    ..
LE0E5:  .byte   $43                             ; E0E5 43                       C
        sed                                     ; E0E6 F8                       .
        sed                                     ; E0E7 F8                       .
        .byte   $44                             ; E0E8 44                       D
LE0E9:  brk                                     ; E0E9 00                       .
        sed                                     ; E0EA F8                       .
        eor     $08                             ; E0EB 45 08                    E.
        sed                                     ; E0ED F8                       .
        lsr     $80                             ; E0EE 46 80                    F.
        .byte   $F7                             ; E0F0 F7                       .
        beq     LE0F7                           ; E0F1 F0 04                    ..
        .byte   $FF                             ; E0F3 FF                       .
LE0F4:  beq     LE0FB                           ; E0F4 F0 05                    ..
        .byte   $EF                             ; E0F6 EF                       .
LE0F7:  sed                                     ; E0F7 F8                       .
        sec                                     ; E0F8 38                       8
        .byte   $F7                             ; E0F9 F7                       .
        sed                                     ; E0FA F8                       .
LE0FB:  and     LF8FF,y                         ; E0FB 39 FF F8                 9..
        .byte   $3A                             ; E0FE 3A                       :
LE0FF:  .byte   $07                             ; E0FF 07                       .
        sed                                     ; E100 F8                       .
        .byte   $3B                             ; E101 3B                       ;
        .byte   $80                             ; E102 80                       .
        inc     $48F8                           ; E103 EE F8 48                 ..H
        inc     $F8,x                           ; E106 F6 F8                    ..
        .byte   $49                             ; E108 49                       I
LE109:  inc     $4AF8,x                         ; E109 FE F8 4A                 ..J
        .byte   $80                             ; E10C 80                       .
        .byte   $F4                             ; E10D F4                       .
        cld                                     ; E10E D8                       .
        eor     $FC,x                           ; E10F 55 FC                    U.
        cld                                     ; E111 D8                       .
        lsr     L00F4,x                         ; E112 56 F4                    V.
LE114:  cpx     #$65                            ; E114 E0 65                    .e
        .byte   $FC                             ; E116 FC                       .
        cpx     #$66                            ; E117 E0 66                    .f
LE119:  .byte   $04                             ; E119 04                       .
        cpx     #$67                            ; E11A E0 67                    .g
        .byte   $F4                             ; E11C F4                       .
LE11D:  inx                                     ; E11D E8                       .
        adc     $FC,x                           ; E11E 75 FC                    u.
        inx                                     ; E120 E8                       .
        .byte   $76                             ; E121 76                       v
LE122:  .byte   $04                             ; E122 04                       .
        inx                                     ; E123 E8                       .
        .byte   $77                             ; E124 77                       w
        .byte   $F4                             ; E125 F4                       .
        beq     LE0AD                           ; E126 F0 85                    ..
        .byte   $FC                             ; E128 FC                       .
        .byte   $F0                             ; E129 F0                       .
LE12A:  stx     L0004                           ; E12A 86 04                    ..
        beq     LE0B5                           ; E12C F0 87                    ..
        cpx     $57F8                           ; E12E EC F8 57                 ..W
        .byte   $F4                             ; E131 F4                       .
        sed                                     ; E132 F8                       .
        sta     $FC,x                           ; E133 95 FC                    ..
        sed                                     ; E135 F8                       .
        .byte   $96                             ; E136 96                       .
LE137:  .byte   $04                             ; E137 04                       .
        sed                                     ; E138 F8                       .
        .byte   $97                             ; E139 97                       .
        .byte   $80                             ; E13A 80                       .
LE13B:  .byte   $F4                             ; E13B F4                       .
        cld                                     ; E13C D8                       .
        cli                                     ; E13D 58                       X
        .byte   $FC                             ; E13E FC                       .
        cld                                     ; E13F D8                       .
        eor     LD804,y                         ; E140 59 04 D8                 Y..
        .byte   $5A                             ; E143 5A                       Z
        .byte   $F4                             ; E144 F4                       .
        cpx     #$68                            ; E145 E0 68                    .h
        .byte   $FC                             ; E147 FC                       .
        cpx     #$69                            ; E148 E0 69                    .i
        .byte   $04                             ; E14A 04                       .
        cpx     #$6A                            ; E14B E0 6A                    .j
        .byte   $F4                             ; E14D F4                       .
        inx                                     ; E14E E8                       .
        sei                                     ; E14F 78                       x
        .byte   $FC                             ; E150 FC                       .
        inx                                     ; E151 E8                       .
        adc     LE804,y                         ; E152 79 04 E8                 y..
        .byte   $7A                             ; E155 7A                       z
        .byte   $F4                             ; E156 F4                       .
        beq     LE0E1                           ; E157 F0 88                    ..
        .byte   $FC                             ; E159 FC                       .
        beq     LE0E5                           ; E15A F0 89                    ..
        .byte   $04                             ; E15C 04                       .
        beq     LE0E9                           ; E15D F0 8A                    ..
        cpx     $4BF8                           ; E15F EC F8 4B                 ..K
        .byte   $F4                             ; E162 F4                       .
        sed                                     ; E163 F8                       .
        tya                                     ; E164 98                       .
        .byte   $FC                             ; E165 FC                       .
        sed                                     ; E166 F8                       .
        sta     LF804,y                         ; E167 99 04 F8                 ...
        txs                                     ; E16A 9A                       .
        .byte   $80                             ; E16B 80                       .
        .byte   $F4                             ; E16C F4                       .
        cld                                     ; E16D D8                       .
        .byte   $5B                             ; E16E 5B                       [
        .byte   $FC                             ; E16F FC                       .
        cld                                     ; E170 D8                       .
        .byte   $5C                             ; E171 5C                       \
        .byte   $04                             ; E172 04                       .
        cld                                     ; E173 D8                       .
        eor     LE0F4,x                         ; E174 5D F4 E0                 ]..
        .byte   $6B                             ; E177 6B                       k
        .byte   $FC                             ; E178 FC                       .
        cpx     #$6C                            ; E179 E0 6C                    .l
        .byte   $04                             ; E17B 04                       .
        cpx     #$6D                            ; E17C E0 6D                    .m
        .byte   $F4                             ; E17E F4                       .
        inx                                     ; E17F E8                       .
        .byte   $7B                             ; E180 7B                       {
        .byte   $FC                             ; E181 FC                       .
        inx                                     ; E182 E8                       .
        .byte   $7C                             ; E183 7C                       |
        .byte   $04                             ; E184 04                       .
        inx                                     ; E185 E8                       .
        adc     LF0F4,x                         ; E186 7D F4 F0                 }..
        .byte   $8B                             ; E189 8B                       .
        .byte   $FC                             ; E18A FC                       .
        beq     LE119                           ; E18B F0 8C                    ..
        .byte   $04                             ; E18D 04                       .
        beq     LE11D                           ; E18E F0 8D                    ..
        cpx     $3CF8                           ; E190 EC F8 3C                 ..<
        .byte   $F4                             ; E193 F4                       .
        sed                                     ; E194 F8                       .
        .byte   $9B                             ; E195 9B                       .
        .byte   $FC                             ; E196 FC                       .
        sed                                     ; E197 F8                       .
        .byte   $9C                             ; E198 9C                       .
        .byte   $04                             ; E199 04                       .
        sed                                     ; E19A F8                       .
        sta     LF80C,x                         ; E19B 9D 0C F8                 ...
        jmp     LF480                           ; E19E 4C 80 F4                 L..

; ----------------------------------------------------------------------------
        cpx     #$55                            ; E1A1 E0 55                    .U
        .byte   $FC                             ; E1A3 FC                       .
        cpx     #$56                            ; E1A4 E0 56                    .V
        .byte   $F4                             ; E1A6 F4                       .
        inx                                     ; E1A7 E8                       .
        adc     $FC                             ; E1A8 65 FC                    e.
        inx                                     ; E1AA E8                       .
        ror     L0004                           ; E1AB 66 04                    f.
        inx                                     ; E1AD E8                       .
        .byte   $67                             ; E1AE 67                       g
        .byte   $F4                             ; E1AF F4                       .
        beq     LE1E0                           ; E1B0 F0 2E                    ..
        .byte   $FC                             ; E1B2 FC                       .
        beq     LE22B                           ; E1B3 F0 76                    .v
        .byte   $04                             ; E1B5 04                       .
        beq     LE22F                           ; E1B6 F0 77                    .w
        .byte   $0C                             ; E1B8 0C                       .
        beq     LE1EA                           ; E1B9 F0 2F                    ./
        cpx     $3DF8                           ; E1BB EC F8 3D                 ..=
        .byte   $F4                             ; E1BE F4                       .
        sed                                     ; E1BF F8                       .
        rol     LF8FC,x                         ; E1C0 3E FC F8                 >..
        .byte   $3F                             ; E1C3 3F                       ?
        .byte   $04                             ; E1C4 04                       .
        sed                                     ; E1C5 F8                       .
        asl     LF80C,x                         ; E1C6 1E 0C F8                 ...
        .byte   $1F                             ; E1C9 1F                       .
        .byte   $80                             ; E1CA 80                       .
        .byte   $F4                             ; E1CB F4                       .
        inx                                     ; E1CC E8                       .
        eor     $FC,x                           ; E1CD 55 FC                    U.
        inx                                     ; E1CF E8                       .
        lsr     L00F4,x                         ; E1D0 56 F4                    V.
        beq     LE239                           ; E1D2 F0 65                    .e
        .byte   $FC                             ; E1D4 FC                       .
        beq     LE23D                           ; E1D5 F0 66                    .f
        .byte   $04                             ; E1D7 04                       .
        beq     LE241                           ; E1D8 F0 67                    .g
        .byte   $F4                             ; E1DA F4                       .
        sed                                     ; E1DB F8                       .
        eor     LF8FC                           ; E1DC 4D FC F8                 M..
        .byte   $4E                             ; E1DF 4E                       N
LE1E0:  .byte   $04                             ; E1E0 04                       .
        sed                                     ; E1E1 F8                       .
        .byte   $4F                             ; E1E2 4F                       O
        .byte   $0C                             ; E1E3 0C                       .
        sed                                     ; E1E4 F8                       .
        lsr     LF480,x                         ; E1E5 5E 80 F4                 ^..
LE1E8:  beq     LE23F                           ; E1E8 F0 55                    .U
LE1EA:  .byte   $FC                             ; E1EA FC                       .
        beq     LE243                           ; E1EB F0 56                    .V
        .byte   $F4                             ; E1ED F4                       .
        sed                                     ; E1EE F8                       .
        ror     LF8FC                           ; E1EF 6E FC F8                 n..
        .byte   $6F                             ; E1F2 6F                       o
        .byte   $04                             ; E1F3 04                       .
        sed                                     ; E1F4 F8                       .
LE1F5:  ror     LF80C,x                         ; E1F5 7E 0C F8                 ~..
        .byte   $7F                             ; E1F8 7F                       .
        .byte   $80                             ; E1F9 80                       .
        .byte   $F4                             ; E1FA F4                       .
        sed                                     ; E1FB F8                       .
        stx     LF8FC                           ; E1FC 8E FC F8                 ...
LE1FF:  .byte   $8F                             ; E1FF 8F                       .
        .byte   $04                             ; E200 04                       .
        sed                                     ; E201 F8                       .
LE202:  .byte   $5F                             ; E202 5F                       _
        .byte   $80                             ; E203 80                       .
        .byte   $FC                             ; E204 FC                       .
        sed                                     ; E205 F8                       .
        .byte   $C7                             ; E206 C7                       .
        .byte   $80                             ; E207 80                       .
        .byte   $FC                             ; E208 FC                       .
        sed                                     ; E209 F8                       .
        .byte   $D7                             ; E20A D7                       .
        .byte   $80                             ; E20B 80                       .
LE20C:  .byte   $FC                             ; E20C FC                       .
        sed                                     ; E20D F8                       .
        .byte   $CF                             ; E20E CF                       .
        .byte   $80                             ; E20F 80                       .
        .byte   $FC                             ; E210 FC                       .
        beq     LE1E8                           ; E211 F0 D5                    ..
        .byte   $F4                             ; E213 F4                       .
        sed                                     ; E214 F8                       .
        iny                                     ; E215 C8                       .
        .byte   $FC                             ; E216 FC                       .
        sed                                     ; E217 F8                       .
        .byte   $C9                             ; E218 C9                       .
LE219:  .byte   $04                             ; E219 04                       .
        sed                                     ; E21A F8                       .
        dex                                     ; E21B CA                       .
        .byte   $80                             ; E21C 80                       .
        .byte   $FC                             ; E21D FC                       .
        beq     LE1F5                           ; E21E F0 D5                    ..
        .byte   $F4                             ; E220 F4                       .
        sed                                     ; E221 F8                       .
        cld                                     ; E222 D8                       .
        .byte   $FC                             ; E223 FC                       .
        sed                                     ; E224 F8                       .
        .byte   $D9                             ; E225 D9                       .
LE226:  .byte   $04                             ; E226 04                       .
        sed                                     ; E227 F8                       .
        .byte   $DA                             ; E228 DA                       .
        .byte   $80                             ; E229 80                       .
        .byte   $FC                             ; E22A FC                       .
LE22B:  beq     LE202                           ; E22B F0 D5                    ..
        .byte   $FC                             ; E22D FC                       .
        sed                                     ; E22E F8                       .
LE22F:  .byte   $DF                             ; E22F DF                       .
        .byte   $80                             ; E230 80                       .
        .byte   $FC                             ; E231 FC                       .
        beq     LE1FF                           ; E232 F0 CB                    ..
        .byte   $F4                             ; E234 F4                       .
        sed                                     ; E235 F8                       .
        inx                                     ; E236 E8                       .
        .byte   $FC                             ; E237 FC                       .
        sed                                     ; E238 F8                       .
LE239:  sbc     #$04                            ; E239 E9 04                    ..
LE23B:  sed                                     ; E23B F8                       .
        nop                                     ; E23C EA                       .
LE23D:  .byte   $80                             ; E23D 80                       .
        .byte   $FC                             ; E23E FC                       .
LE23F:  beq     LE20C                           ; E23F F0 CB                    ..
LE241:  .byte   $F4                             ; E241 F4                       .
        sed                                     ; E242 F8                       .
LE243:  sed                                     ; E243 F8                       .
        .byte   $FC                             ; E244 FC                       .
        sed                                     ; E245 F8                       .
        sbc     LF804,y                         ; E246 F9 04 F8                 ...
        .byte   $FA                             ; E249 FA                       .
        .byte   $80                             ; E24A 80                       .
LE24B:  .byte   $FC                             ; E24B FC                       .
        beq     LE219                           ; E24C F0 CB                    ..
        .byte   $F4                             ; E24E F4                       .
        sed                                     ; E24F F8                       .
        cpy     LF8FC                           ; E250 CC FC F8                 ...
        cmp     LF804                           ; E253 CD 04 F8                 ...
        dec     LFC80                           ; E256 CE 80 FC                 ...
        beq     LE226                           ; E259 F0 CB                    ..
LE25B:  .byte   $FC                             ; E25B FC                       .
        sed                                     ; E25C F8                       .
        .byte   $EF                             ; E25D EF                       .
        .byte   $80                             ; E25E 80                       .
        .byte   $FC                             ; E25F FC                       .
        inx                                     ; E260 E8                       .
        dec     $FC                             ; E261 C6 FC                    ..
        beq     LE23B                           ; E263 F0 D6                    ..
        .byte   $F4                             ; E265 F4                       .
        sed                                     ; E266 F8                       .
        sbc     $FC,x                           ; E267 F5 FC                    ..
        sed                                     ; E269 F8                       .
        .byte   $F6                             ; E26A F6                       .
LE26B:  .byte   $04                             ; E26B 04                       .
        sed                                     ; E26C F8                       .
        .byte   $F7                             ; E26D F7                       .
        .byte   $80                             ; E26E 80                       .
        .byte   $FC                             ; E26F FC                       .
        inx                                     ; E270 E8                       .
        dec     $FC                             ; E271 C6 FC                    ..
        beq     LE24B                           ; E273 F0 D6                    ..
        .byte   $F4                             ; E275 F4                       .
        sed                                     ; E276 F8                       .
        lda     LF8FC,x                         ; E277 BD FC F8                 ...
        ldx     LF804,y                         ; E27A BE 04 F8                 ...
        .byte   $BF                             ; E27D BF                       .
        .byte   $80                             ; E27E 80                       .
        .byte   $FC                             ; E27F FC                       .
        inx                                     ; E280 E8                       .
        dec     $FC                             ; E281 C6 FC                    ..
        beq     LE25B                           ; E283 F0 D6                    ..
        .byte   $F4                             ; E285 F4                       .
        sed                                     ; E286 F8                       .
        sbc     $FC                             ; E287 E5 FC                    ..
        sed                                     ; E289 F8                       .
        inc     L0004                           ; E28A E6 04                    ..
        sed                                     ; E28C F8                       .
        .byte   $E7                             ; E28D E7                       .
        .byte   $80                             ; E28E 80                       .
        .byte   $FC                             ; E28F FC                       .
        inx                                     ; E290 E8                       .
        dec     $FC                             ; E291 C6 FC                    ..
        beq     LE26B                           ; E293 F0 D6                    ..
        .byte   $FC                             ; E295 FC                       .
        sed                                     ; E296 F8                       .
        cmp     $80                             ; E297 C5 80                    ..
        lda     #$00                            ; E299 A9 00                    ..
        sta     $4015                           ; E29B 8D 15 40                 ..@
        lda     #$30                            ; E29E A9 30                    .0
        sta     $4000                           ; E2A0 8D 00 40                 ..@
        sta     $4004                           ; E2A3 8D 04 40                 ..@
        sta     $400C                           ; E2A6 8D 0C 40                 ..@
        lda     #$80                            ; E2A9 A9 80                    ..
        sta     L4008                           ; E2AB 8D 08 40                 ..@
        lda     #$08                            ; E2AE A9 08                    ..
        sta     $4001                           ; E2B0 8D 01 40                 ..@
        sta     $4005                           ; E2B3 8D 05 40                 ..@
        lda     #$00                            ; E2B6 A9 00                    ..
        sta     $0566                           ; E2B8 8D 66 05                 .f.
        lda     #$FF                            ; E2BB A9 FF                    ..
        ldx     #$00                            ; E2BD A2 00                    ..
LE2BF:  sta     $056C,x                         ; E2BF 9D 6C 05                 .l.
        inx                                     ; E2C2 E8                       .
        cpx     #$08                            ; E2C3 E0 08                    ..
        bcc     LE2BF                           ; E2C5 90 F8                    ..
        lda     #$0F                            ; E2C7 A9 0F                    ..
        sta     $4015                           ; E2C9 8D 15 40                 ..@
        rts                                     ; E2CC 60                       `

; ----------------------------------------------------------------------------
LE2CD:  ldx     #$01                            ; E2CD A2 01                    ..
        stx     $055D                           ; E2CF 8E 5D 05                 .].
        cmp     #$E0                            ; E2D2 C9 E0                    ..
        bcs     LE331                           ; E2D4 B0 5B                    .[
        asl     a                               ; E2D6 0A                       .
        tax                                     ; E2D7 AA                       .
        lda     LE8BE,x                         ; E2D8 BD BE E8                 ...
        sta     $F0                             ; E2DB 85 F0                    ..
        lda     LE8BF,x                         ; E2DD BD BF E8                 ...
        sta     $F1                             ; E2E0 85 F1                    ..
        .byte   $A0                             ; E2E2 A0                       .
LE2E3:  brk                                     ; E2E3 00                       .
LE2E4:  lda     ($F0),y                         ; E2E4 B1 F0                    ..
        bmi     LE348                           ; E2E6 30 60                    0`
        iny                                     ; E2E8 C8                       .
        tax                                     ; E2E9 AA                       .
        cmp     #$04                            ; E2EA C9 04                    ..
        bcc     LE2F4                           ; E2EC 90 06                    ..
        lda     ($F0),y                         ; E2EE B1 F0                    ..
        iny                                     ; E2F0 C8                       .
        sta     $055E                           ; E2F1 8D 5E 05                 .^.
LE2F4:  lda     LE34E,x                         ; E2F4 BD 4E E3                 .N.
        tax                                     ; E2F7 AA                       .
        lda     #$80                            ; E2F8 A9 80                    ..
        sta     $0574,x                         ; E2FA 9D 74 05                 .t.
LE2FD:  lda     #$00                            ; E2FD A9 00                    ..
        sta     $0579,x                         ; E2FF 9D 79 05                 .y.
        lda     #$01                            ; E302 A9 01                    ..
        sta     $057A,x                         ; E304 9D 7A 05                 .z.
        lda     #$0C                            ; E307 A9 0C                    ..
        sta     $057B,x                         ; E309 9D 7B 05                 .{.
        lda     ($F0),y                         ; E30C B1 F0                    ..
        iny                                     ; E30E C8                       .
        sta     $057C,x                         ; E30F 9D 7C 05                 .|.
        lda     ($F0),y                         ; E312 B1 F0                    ..
        iny                                     ; E314 C8                       .
        sta     $057D,x                         ; E315 9D 7D 05                 .}.
        lda     LE8FD                           ; E318 AD FD E8                 ...
        sta     $0582,x                         ; E31B 9D 82 05                 ...
        lda     LE8FE                           ; E31E AD FE E8                 ...
        sta     $0583,x                         ; E321 9D 83 05                 ...
        lda     #$0C                            ; E324 A9 0C                    ..
        sta     $058A,x                         ; E326 9D 8A 05                 ...
        lda     #$80                            ; E329 A9 80                    ..
        sta     $058C,x                         ; E32B 9D 8C 05                 ...
        jmp     LE2E4                           ; E32E 4C E4 E2                 L..

; ----------------------------------------------------------------------------
LE331:  sta     $F0                             ; E331 85 F0                    ..
        ldx     #$00                            ; E333 A2 00                    ..
        ldy     #$05                            ; E335 A0 05                    ..
LE337:  lsr     $F0                             ; E337 46 F0                    F.
        bcc     LE340                           ; E339 90 05                    ..
        lda     #$00                            ; E33B A9 00                    ..
        sta     $0574,x                         ; E33D 9D 74 05                 .t.
LE340:  txa                                     ; E340 8A                       .
        clc                                     ; E341 18                       .
        adc     #$1C                            ; E342 69 1C                    i.
        tax                                     ; E344 AA                       .
        dey                                     ; E345 88                       .
        bne     LE337                           ; E346 D0 EF                    ..
LE348:  lda     #$00                            ; E348 A9 00                    ..
        sta     $055D                           ; E34A 8D 5D 05                 .].
        rts                                     ; E34D 60                       `

; ----------------------------------------------------------------------------
LE34E:  brk                                     ; E34E 00                       .
        .byte   $1C                             ; E34F 1C                       .
        sec                                     ; E350 38                       8
        .byte   $54                             ; E351 54                       T
        bvs     LE2FD                           ; E352 70 A9                    p.
        bmi     LE2E3                           ; E354 30 8D                    0.
        .byte   $67                             ; E356 67                       g
        ora     $8D                             ; E357 05 8D                    ..
        pla                                     ; E359 68                       h
        ora     $8D                             ; E35A 05 8D                    ..
        ror     a                               ; E35C 6A                       j
        ora     $A9                             ; E35D 05 A9                    ..
        .byte   $80                             ; E35F 80                       .
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
LE378:  ldx     #$1C                            ; E378 A2 1C                    ..
        lda     $0590                           ; E37A AD 90 05                 ...
        bpl     LE389                           ; E37D 10 0A                    ..
        sta     $F2                             ; E37F 85 F2                    ..
        jsr     LE479                           ; E381 20 79 E4                  y.
        lda     $F2                             ; E384 A5 F2                    ..
        sta     $0590                           ; E386 8D 90 05                 ...
LE389:  ldx     #$38                            ; E389 A2 38                    .8
        lda     $05AC                           ; E38B AD AC 05                 ...
        bpl     LE39A                           ; E38E 10 0A                    ..
        sta     $F2                             ; E390 85 F2                    ..
        jsr     LE4CE                           ; E392 20 CE E4                  ..
        lda     $F2                             ; E395 A5 F2                    ..
        sta     $05AC                           ; E397 8D AC 05                 ...
LE39A:  ldx     #$54                            ; E39A A2 54                    .T
        lda     $05C8                           ; E39C AD C8 05                 ...
        bpl     LE3AB                           ; E39F 10 0A                    ..
        sta     $F2                             ; E3A1 85 F2                    ..
        jsr     LE524                           ; E3A3 20 24 E5                  $.
        lda     $F2                             ; E3A6 A5 F2                    ..
        sta     $05C8                           ; E3A8 8D C8 05                 ...
LE3AB:  ldx     #$70                            ; E3AB A2 70                    .p
        lda     $05E4                           ; E3AD AD E4 05                 ...
        bpl     LE3D9                           ; E3B0 10 27                    .'
        sta     $F2                             ; E3B2 85 F2                    ..
        lda     $055E                           ; E3B4 AD 5E 05                 .^.
        bne     LE3BF                           ; E3B7 D0 06                    ..
        jsr     LE424                           ; E3B9 20 24 E4                  $.
        jmp     LE3D4                           ; E3BC 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3BF:  cmp     #$02                            ; E3BF C9 02                    ..
        bcs     LE3C9                           ; E3C1 B0 06                    ..
        jsr     LE479                           ; E3C3 20 79 E4                  y.
        jmp     LE3D4                           ; E3C6 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3C9:  bne     LE3D1                           ; E3C9 D0 06                    ..
        jsr     LE4CE                           ; E3CB 20 CE E4                  ..
        jmp     LE3D4                           ; E3CE 4C D4 E3                 L..

; ----------------------------------------------------------------------------
LE3D1:  jsr     LE524                           ; E3D1 20 24 E5                  $.
LE3D4:  lda     $F2                             ; E3D4 A5 F2                    ..
        sta     $05E4                           ; E3D6 8D E4 05                 ...
LE3D9:  ldx     #$00                            ; E3D9 A2 00                    ..
LE3DB:  lda     LE417,x                         ; E3DB BD 17 E4                 ...
        tay                                     ; E3DE A8                       .
        lda     $055F,x                         ; E3DF BD 5F 05                 ._.
        cmp     $056C,x                         ; E3E2 DD 6C 05                 .l.
        bne     LE3F2                           ; E3E5 D0 0B                    ..
        lda     $0560,x                         ; E3E7 BD 60 05                 .`.
        cmp     $056D,x                         ; E3EA DD 6D 05                 .m.
        beq     LE401                           ; E3ED F0 12                    ..
        lda     $055F,x                         ; E3EF BD 5F 05                 ._.
LE3F2:  sta     $056C,x                         ; E3F2 9D 6C 05                 .l.
        sta     $4000,y                         ; E3F5 99 00 40                 ..@
        lda     $0560,x                         ; E3F8 BD 60 05                 .`.
        sta     $056D,x                         ; E3FB 9D 6D 05                 .m.
        sta     $4001,y                         ; E3FE 99 01 40                 ..@
LE401:  inx                                     ; E401 E8                       .
        inx                                     ; E402 E8                       .
        cpx     #$08                            ; E403 E0 08                    ..
        bcc     LE3DB                           ; E405 90 D4                    ..
LE407:  lda     LE417,x                         ; E407 BD 17 E4                 ...
        tay                                     ; E40A A8                       .
        lda     $055F,x                         ; E40B BD 5F 05                 ._.
        sta     $4000,y                         ; E40E 99 00 40                 ..@
        inx                                     ; E411 E8                       .
        cpx     #$0C                            ; E412 E0 0C                    ..
        bcc     LE407                           ; E414 90 F1                    ..
        rts                                     ; E416 60                       `

; ----------------------------------------------------------------------------
LE417:  .byte   $02                             ; E417 02                       .
        .byte   $03                             ; E418 03                       .
        asl     $07                             ; E419 06 07                    ..
        asl     a                               ; E41B 0A                       .
        .byte   $0B                             ; E41C 0B                       .
        asl     a:L000F                         ; E41D 0E 0F 00                 ...
        .byte   $04                             ; E420 04                       .
        php                                     ; E421 08                       .
        .byte   $0C                             ; E422 0C                       .
        .byte   $15                             ; E423 15                       .
LE424:  lda     #$30                            ; E424 A9 30                    .0
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
LE43B:  bit     $F2                             ; E43B 24 F2                    $.
        bvc     LE440                           ; E43D 50 01                    P.
        rts                                     ; E43F 60                       `

; ----------------------------------------------------------------------------
LE440:  jsr     LE560                           ; E440 20 60 E5                  `.
        lda     #$20                            ; E443 A9 20                    . 
        bit     $F2                             ; E445 24 F2                    $.
        beq     LE44C                           ; E447 F0 03                    ..
        jmp     LE451                           ; E449 4C 51 E4                 LQ.

; ----------------------------------------------------------------------------
LE44C:  lsr     a                               ; E44C 4A                       J
        bit     $F2                             ; E44D 24 F2                    $.
        beq     LE451                           ; E44F F0 00                    ..
LE451:  lda     $0578,x                         ; E451 BD 78 05                 .x.
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
LE479:  lda     #$30                            ; E479 A9 30                    .0
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
LE490:  bit     $F2                             ; E490 24 F2                    $.
        bvc     LE495                           ; E492 50 01                    P.
        rts                                     ; E494 60                       `

; ----------------------------------------------------------------------------
LE495:  jsr     LE560                           ; E495 20 60 E5                  `.
        lda     #$20                            ; E498 A9 20                    . 
        bit     $F2                             ; E49A 24 F2                    $.
        beq     LE4A1                           ; E49C F0 03                    ..
        jmp     LE4A6                           ; E49E 4C A6 E4                 L..

; ----------------------------------------------------------------------------
LE4A1:  lsr     a                               ; E4A1 4A                       J
        bit     $F2                             ; E4A2 24 F2                    $.
        beq     LE4A6                           ; E4A4 F0 00                    ..
LE4A6:  lda     $0578,x                         ; E4A6 BD 78 05                 .x.
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
LE4CE:  lda     #$80                            ; E4CE A9 80                    ..
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
LE4E5:  bit     $F2                             ; E4E5 24 F2                    $.
        bvc     LE4EA                           ; E4E7 50 01                    P.
        rts                                     ; E4E9 60                       `

; ----------------------------------------------------------------------------
LE4EA:  jsr     LE560                           ; E4EA 20 60 E5                  `.
        lda     #$20                            ; E4ED A9 20                    . 
        bit     $F2                             ; E4EF 24 F2                    $.
        beq     LE4F6                           ; E4F1 F0 03                    ..
        jmp     LE4FB                           ; E4F3 4C FB E4                 L..

; ----------------------------------------------------------------------------
LE4F6:  lsr     a                               ; E4F6 4A                       J
        bit     $F2                             ; E4F7 24 F2                    $.
        beq     LE4FB                           ; E4F9 F0 00                    ..
LE4FB:  lda     $0578,x                         ; E4FB BD 78 05                 .x.
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
LE523:  rts                                     ; E523 60                       `

; ----------------------------------------------------------------------------
LE524:  lda     #$30                            ; E524 A9 30                    .0
        sta     $056A                           ; E526 8D 6A 05                 .j.
        dec     $057A,x                         ; E529 DE 7A 05                 .z.
        bne     LE53B                           ; E52C D0 0D                    ..
        lda     #$02                            ; E52E A9 02                    ..
        sta     $056B                           ; E530 8D 6B 05                 .k.
        jsr     LE5E9                           ; E533 20 E9 E5                  ..
        bit     $F2                             ; E536 24 F2                    $.
        bvc     LE551                           ; E538 50 17                    P.
        rts                                     ; E53A 60                       `

; ----------------------------------------------------------------------------
LE53B:  bit     $F2                             ; E53B 24 F2                    $.
        bvc     LE540                           ; E53D 50 01                    P.
        rts                                     ; E53F 60                       `

; ----------------------------------------------------------------------------
LE540:  jsr     LE560                           ; E540 20 60 E5                  `.
        lda     #$20                            ; E543 A9 20                    . 
        bit     $F2                             ; E545 24 F2                    $.
        beq     LE54C                           ; E547 F0 03                    ..
        jmp     LE551                           ; E549 4C 51 E5                 LQ.

; ----------------------------------------------------------------------------
LE54C:  lsr     a                               ; E54C 4A                       J
        bit     $F2                             ; E54D 24 F2                    $.
        beq     LE551                           ; E54F F0 00                    ..
LE551:  lda     $0578,x                         ; E551 BD 78 05                 .x.
        ora     #$30                            ; E554 09 30                    .0
        sta     $056A                           ; E556 8D 6A 05                 .j.
        lda     $0577,x                         ; E559 BD 77 05                 .w.
        sta     $0565                           ; E55C 8D 65 05                 .e.
        rts                                     ; E55F 60                       `

; ----------------------------------------------------------------------------
LE560:  lda     $F2                             ; E560 A5 F2                    ..
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
LE579:  lda     $057E,x                         ; E579 BD 7E 05                 .~.
        beq     LE5E8                           ; E57C F0 6A                    .j
        dec     $057E,x                         ; E57E DE 7E 05                 .~.
        bne     LE5E8                           ; E581 D0 65                    .e
LE583:  lda     $057F,x                         ; E583 BD 7F 05                 ...
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
LE59B:  sta     $0578,x                         ; E59B 9D 78 05                 .x.
        tya                                     ; E59E 98                       .
        sta     $057E,x                         ; E59F 9D 7E 05                 .~.
        rts                                     ; E5A2 60                       `

; ----------------------------------------------------------------------------
LE5A3:  dec     $0578,x                         ; E5A3 DE 78 05                 .x.
        bpl     LE5AD                           ; E5A6 10 05                    ..
        lda     #$00                            ; E5A8 A9 00                    ..
        sta     $0578,x                         ; E5AA 9D 78 05                 .x.
LE5AD:  sta     $057E,x                         ; E5AD 9D 7E 05                 .~.
        rts                                     ; E5B0 60                       `

; ----------------------------------------------------------------------------
LE5B1:  lda     $0580,x                         ; E5B1 BD 80 05                 ...
        beq     LE5E8                           ; E5B4 F0 32                    .2
        dec     $0580,x                         ; E5B6 DE 80 05                 ...
        bne     LE5E8                           ; E5B9 D0 2D                    .-
LE5BB:  lda     $0582,x                         ; E5BB BD 82 05                 ...
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
LE5DD:  sta     $0578,x                         ; E5DD 9D 78 05                 .x.
        tya                                     ; E5E0 98                       .
        lsr     a                               ; E5E1 4A                       J
        lsr     a                               ; E5E2 4A                       J
        lsr     a                               ; E5E3 4A                       J
        lsr     a                               ; E5E4 4A                       J
        sta     $0580,x                         ; E5E5 9D 80 05                 ...
LE5E8:  rts                                     ; E5E8 60                       `

; ----------------------------------------------------------------------------
LE5E9:  lda     $057C,x                         ; E5E9 BD 7C 05                 .|.
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
LE608:  jsr     LE89B                           ; E608 20 9B E8                  ..
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
LE622:  cmp     #$E0                            ; E622 C9 E0                    ..
        bcs     LE638                           ; E624 B0 12                    ..
        sbc     #$BE                            ; E626 E9 BE                    ..
        sta     $058D,x                         ; E628 9D 8D 05                 ...
        lda     $F0                             ; E62B A5 F0                    ..
        sta     $058E,x                         ; E62D 9D 8E 05                 ...
        lda     $F1                             ; E630 A5 F1                    ..
        sta     $058F,x                         ; E632 9D 8F 05                 ...
        jmp     LE608                           ; E635 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE638:  sbc     #$EC                            ; E638 E9 EC                    ..
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
LE65A:  asl     a                               ; E65A 0A                       .
        tay                                     ; E65B A8                       .
        lda     LE7BA,y                         ; E65C B9 BA E7                 ...
        sta     L00F4                           ; E65F 85 F4                    ..
        lda     LE7BB,y                         ; E661 B9 BB E7                 ...
        sta     $F5                             ; E664 85 F5                    ..
        jmp     (L00F4)                         ; E666 6C F4 00                 l..

; ----------------------------------------------------------------------------
LE669:  tay                                     ; E669 A8                       .
        and     #$40                            ; E66A 29 40                    )@
        beq     LE674                           ; E66C F0 06                    ..
        lda     $F2                             ; E66E A5 F2                    ..
        ora     #$04                            ; E670 09 04                    ..
        sta     $F2                             ; E672 85 F2                    ..
LE674:  tya                                     ; E674 98                       .
        and     #$3F                            ; E675 29 3F                    )?
        cmp     #$3F                            ; E677 C9 3F                    .?
        bne     LE684                           ; E679 D0 09                    ..
        lda     $F2                             ; E67B A5 F2                    ..
        ora     #$40                            ; E67D 09 40                    .@
        sta     $F2                             ; E67F 85 F2                    ..
        jmp     LE7AF                           ; E681 4C AF E7                 L..

; ----------------------------------------------------------------------------
LE684:  lda     $056B                           ; E684 AD 6B 05                 .k.
        cmp     #$02                            ; E687 C9 02                    ..
        bne     LE694                           ; E689 D0 09                    ..
        sty     $F7                             ; E68B 84 F7                    ..
        lda     #$00                            ; E68D A9 00                    ..
        sta     $F6                             ; E68F 85 F6                    ..
        jmp     LE6CF                           ; E691 4C CF E6                 L..

; ----------------------------------------------------------------------------
LE694:  tya                                     ; E694 98                       .
        and     #$30                            ; E695 29 30                    )0
        lsr     a                               ; E697 4A                       J
        sta     L00F4                           ; E698 85 F4                    ..
        lsr     a                               ; E69A 4A                       J
        adc     L00F4                           ; E69B 65 F4                    e.
        sta     L00F4                           ; E69D 85 F4                    ..
        tya                                     ; E69F 98                       .
        and     #$0F                            ; E6A0 29 0F                    ).
        adc     L00F4                           ; E6A2 65 F4                    e.
        adc     $058A,x                         ; E6A4 7D 8A 05                 }..
        ldy     #$00                            ; E6A7 A0 00                    ..
LE6A9:  cmp     #$0C                            ; E6A9 C9 0C                    ..
        bcc     LE6B2                           ; E6AB 90 05                    ..
        sbc     #$0C                            ; E6AD E9 0C                    ..
        iny                                     ; E6AF C8                       .
        bne     LE6A9                           ; E6B0 D0 F7                    ..
LE6B2:  sty     L00F4                           ; E6B2 84 F4                    ..
        asl     a                               ; E6B4 0A                       .
        tay                                     ; E6B5 A8                       .
        lda     LE8A6,y                         ; E6B6 B9 A6 E8                 ...
        sta     $F6                             ; E6B9 85 F6                    ..
        lda     LE8A7,y                         ; E6BB B9 A7 E8                 ...
        sta     $F7                             ; E6BE 85 F7                    ..
        lda     L00F4                           ; E6C0 A5 F4                    ..
        sta     $058B,x                         ; E6C2 9D 8B 05                 ...
        beq     LE6CF                           ; E6C5 F0 08                    ..
        tay                                     ; E6C7 A8                       .
LE6C8:  lsr     $F7                             ; E6C8 46 F7                    F.
        ror     $F6                             ; E6CA 66 F6                    f.
        dey                                     ; E6CC 88                       .
        bne     LE6C8                           ; E6CD D0 F9                    ..
LE6CF:  lda     $F6                             ; E6CF A5 F6                    ..
        sta     $0584,x                         ; E6D1 9D 84 05                 ...
        lda     $F7                             ; E6D4 A5 F7                    ..
        sta     $0585,x                         ; E6D6 9D 85 05                 ...
        lda     #$20                            ; E6D9 A9 20                    . 
        bit     $F2                             ; E6DB 24 F2                    $.
        beq     LE73E                           ; E6DD F0 5F                    ._
        lda     #$00                            ; E6DF A9 00                    ..
        sta     L00F4                           ; E6E1 85 F4                    ..
        lda     $F6                             ; E6E3 A5 F6                    ..
        sec                                     ; E6E5 38                       8
        sbc     $0576,x                         ; E6E6 FD 76 05                 .v.
        tay                                     ; E6E9 A8                       .
        lda     $F7                             ; E6EA A5 F7                    ..
        sbc     $0577,x                         ; E6EC FD 77 05                 .w.
        bcs     LE6FF                           ; E6EF B0 0E                    ..
        inc     L00F4                           ; E6F1 E6 F4                    ..
        eor     #$FF                            ; E6F3 49 FF                    I.
        pha                                     ; E6F5 48                       H
        tya                                     ; E6F6 98                       .
        eor     #$FF                            ; E6F7 49 FF                    I.
        adc     #$01                            ; E6F9 69 01                    i.
        tay                                     ; E6FB A8                       .
        pla                                     ; E6FC 68                       h
        adc     #$00                            ; E6FD 69 00                    i.
LE6FF:  sty     $F6                             ; E6FF 84 F6                    ..
        sta     $F7                             ; E701 85 F7                    ..
        lda     $0589,x                         ; E703 BD 89 05                 ...
        sta     $0588,x                         ; E706 9D 88 05                 ...
        sta     $F5                             ; E709 85 F5                    ..
        lda     #$00                            ; E70B A9 00                    ..
        ldy     #$10                            ; E70D A0 10                    ..
LE70F:  asl     $F6                             ; E70F 06 F6                    ..
        rol     $F7                             ; E711 26 F7                    &.
        rol     a                               ; E713 2A                       *
        cmp     $F5                             ; E714 C5 F5                    ..
        bcc     LE71C                           ; E716 90 04                    ..
        sbc     $F5                             ; E718 E5 F5                    ..
        inc     $F6                             ; E71A E6 F6                    ..
LE71C:  dey                                     ; E71C 88                       .
        bne     LE70F                           ; E71D D0 F0                    ..
        ldy     $F6                             ; E71F A4 F6                    ..
        lda     $F7                             ; E721 A5 F7                    ..
        dec     L00F4                           ; E723 C6 F4                    ..
        bne     LE734                           ; E725 D0 0D                    ..
        eor     #$FF                            ; E727 49 FF                    I.
        pha                                     ; E729 48                       H
        tya                                     ; E72A 98                       .
        eor     #$FF                            ; E72B 49 FF                    I.
        clc                                     ; E72D 18                       .
        adc     #$01                            ; E72E 69 01                    i.
        tay                                     ; E730 A8                       .
        pla                                     ; E731 68                       h
        adc     #$00                            ; E732 69 00                    i.
LE734:  sta     $0587,x                         ; E734 9D 87 05                 ...
        tya                                     ; E737 98                       .
        sta     $0586,x                         ; E738 9D 86 05                 ...
        jmp     LE764                           ; E73B 4C 64 E7                 Ld.

; ----------------------------------------------------------------------------
LE73E:  lda     $F6                             ; E73E A5 F6                    ..
        sta     $0576,x                         ; E740 9D 76 05                 .v.
        lda     $F7                             ; E743 A5 F7                    ..
        sta     $0577,x                         ; E745 9D 77 05                 .w.
        lda     #$10                            ; E748 A9 10                    ..
        bit     $F2                             ; E74A 24 F2                    $.
        beq     LE764                           ; E74C F0 16                    ..
        lda     $0586,x                         ; E74E BD 86 05                 ...
        sta     L00F4                           ; E751 85 F4                    ..
        lda     $0587,x                         ; E753 BD 87 05                 ...
        sta     $F5                             ; E756 85 F5                    ..
        ldy     #$00                            ; E758 A0 00                    ..
        lda     (L00F4),y                       ; E75A B1 F4                    ..
        sta     $0588,x                         ; E75C 9D 88 05                 ...
        lda     #$01                            ; E75F A9 01                    ..
        sta     $0589,x                         ; E761 9D 89 05                 ...
LE764:  lda     #$08                            ; E764 A9 08                    ..
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
        sta     L00F4                           ; E784 85 F4                    ..
        lda     $057F,x                         ; E786 BD 7F 05                 ...
        asl     a                               ; E789 0A                       .
        bcs     LE79A                           ; E78A B0 0E                    ..
        asl     a                               ; E78C 0A                       .
        bcs     LE7A1                           ; E78D B0 12                    ..
        lda     L00F4                           ; E78F A5 F4                    ..
        lsr     a                               ; E791 4A                       J
        clc                                     ; E792 18                       .
        adc     L00F4                           ; E793 65 F4                    e.
        sta     L00F4                           ; E795 85 F4                    ..
        jmp     LE7A1                           ; E797 4C A1 E7                 L..

; ----------------------------------------------------------------------------
LE79A:  lsr     L00F4                           ; E79A 46 F4                    F.
        asl     a                               ; E79C 0A                       .
        bcc     LE7A1                           ; E79D 90 02                    ..
        lsr     L00F4                           ; E79F 46 F4                    F.
LE7A1:  sec                                     ; E7A1 38                       8
        lda     L00F4                           ; E7A2 A5 F4                    ..
        bne     LE7A7                           ; E7A4 D0 01                    ..
        clc                                     ; E7A6 18                       .
LE7A7:  lda     $057A,x                         ; E7A7 BD 7A 05                 .z.
        sbc     L00F4                           ; E7AA E5 F4                    ..
        sta     $057E,x                         ; E7AC 9D 7E 05                 .~.
LE7AF:  lda     $F0                             ; E7AF A5 F0                    ..
        sta     $057C,x                         ; E7B1 9D 7C 05                 .|.
LE7B4:  lda     $F1                             ; E7B4 A5 F1                    ..
LE7B6:  .byte   $9D                             ; E7B6 9D                       .
        .byte   $7D                             ; E7B7 7D                       }
LE7B8:  ora     $60                             ; E7B8 05 60                    .`
LE7BA:  .byte   $E2                             ; E7BA E2                       .
LE7BB:  .byte   $E7                             ; E7BB E7                       .
        inc     $E7,x                           ; E7BC F6 E7                    ..
        .byte   $FF                             ; E7BE FF                       .
        .byte   $E7                             ; E7BF E7                       .
        php                                     ; E7C0 08                       .
        inx                                     ; E7C1 E8                       .
LE7C2:  ora     $E8,x                           ; E7C2 15 E8                    ..
LE7C4:  .byte   $1E                             ; E7C4 1E                       .
        inx                                     ; E7C5 E8                       .
LE7C6:  .byte   $2B                             ; E7C6 2B                       +
        inx                                     ; E7C7 E8                       .
LE7C8:  .byte   $3A                             ; E7C8 3A                       :
        inx                                     ; E7C9 E8                       .
        bcc     LE7B4                           ; E7CA 90 E8                    ..
        bcc     LE7B6                           ; E7CC 90 E8                    ..
        bcc     LE7B8                           ; E7CE 90 E8                    ..
        bcc     LE7BA                           ; E7D0 90 E8                    ..
        .byte   $43                             ; E7D2 43                       C
        inx                                     ; E7D3 E8                       .
        .byte   $52                             ; E7D4 52                       R
        inx                                     ; E7D5 E8                       .
        .byte   $64                             ; E7D6 64                       d
        inx                                     ; E7D7 E8                       .
        bcc     LE7C2                           ; E7D8 90 E8                    ..
        bcc     LE7C4                           ; E7DA 90 E8                    ..
        bcc     LE7C6                           ; E7DC 90 E8                    ..
        bcc     LE7C8                           ; E7DE 90 E8                    ..
        .byte   $93                             ; E7E0 93                       .
        inx                                     ; E7E1 E8                       .
        jsr     LE89B                           ; E7E2 20 9B E8                  ..
        asl     a                               ; E7E5 0A                       .
        tay                                     ; E7E6 A8                       .
        lda     LE8FD,y                         ; E7E7 B9 FD E8                 ...
        sta     $0582,x                         ; E7EA 9D 82 05                 ...
        lda     LE8FE,y                         ; E7ED B9 FE E8                 ...
        sta     $0583,x                         ; E7F0 9D 83 05                 ...
        jmp     LE608                           ; E7F3 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E7F6 20 9B E8                  ..
        sta     $058C,x                         ; E7F9 9D 8C 05                 ...
        jmp     LE608                           ; E7FC 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        jsr     LE89B                           ; E7FF 20 9B E8                  ..
        .byte   $9D                             ; E802 9D                       .
        .byte   $79                             ; E803 79                       y
LE804:  ora     $4C                             ; E804 05 4C                    .L
        php                                     ; E806 08                       .
        inc     $20                             ; E807 E6 20                    . 
        .byte   $9B                             ; E809 9B                       .
        inx                                     ; E80A E8                       .
        clc                                     ; E80B 18                       .
        adc     $0579,x                         ; E80C 7D 79 05                 }y.
        .byte   $9D                             ; E80F 9D                       .
LE810:  adc     $4C05,y                         ; E810 79 05 4C                 y.L
        php                                     ; E813 08                       .
        inc     $20                             ; E814 E6 20                    . 
        .byte   $9B                             ; E816 9B                       .
        inx                                     ; E817 E8                       .
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
        .byte   $20                             ; E847 20                        
LE848:  .byte   $9B                             ; E848 9B                       .
        inx                                     ; E849 E8                       .
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
LE861:  jmp     LE608                           ; E861 4C 08 E6                 L..

; ----------------------------------------------------------------------------
        dec     $058D,x                         ; E864 DE 8D 05                 ...
        beq     LE881                           ; E867 F0 18                    ..
        lda     $058E,x                         ; E869 BD 8E 05                 ...
        sta     L00F4                           ; E86C 85 F4                    ..
        lda     $058F,x                         ; E86E BD 8F 05                 ...
        sta     $F5                             ; E871 85 F5                    ..
        ldy     #$02                            ; E873 A0 02                    ..
        lda     (L00F4),y                       ; E875 B1 F4                    ..
        sta     $F0                             ; E877 85 F0                    ..
        iny                                     ; E879 C8                       .
        lda     (L00F4),y                       ; E87A B1 F4                    ..
        sta     $F1                             ; E87C 85 F1                    ..
        jmp     LE608                           ; E87E 4C 08 E6                 L..

; ----------------------------------------------------------------------------
LE881:  lda     $058E,x                         ; E881 BD 8E 05                 ...
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
LE89B:  ldy     #$00                            ; E89B A0 00                    ..
        lda     ($F0),y                         ; E89D B1 F0                    ..
        inc     $F0                             ; E89F E6 F0                    ..
        bne     LE8A5                           ; E8A1 D0 02                    ..
        inc     $F1                             ; E8A3 E6 F1                    ..
LE8A5:  rts                                     ; E8A5 60                       `

; ----------------------------------------------------------------------------
LE8A6:  .byte   $E4                             ; E8A6 E4                       .
LE8A7:  ror     a                               ; E8A7 6A                       j
        cpx     $64                             ; E8A8 E4 64                    .d
        .byte   $3A                             ; E8AA 3A                       :
        .byte   $5F                             ; E8AB 5F                       _
        .byte   $E2                             ; E8AC E2                       .
        eor     $54D7,y                         ; E8AD 59 D7 54                 Y.T
        .byte   $14                             ; E8B0 14                       .
        bvc     LE848                           ; E8B1 50 95                    P.
        .byte   $4B                             ; E8B3 4B                       K
        .byte   $57                             ; E8B4 57                       W
        .byte   $47                             ; E8B5 47                       G
        lsr     $43,x                           ; E8B6 56 43                    VC
        .byte   $8F                             ; E8B8 8F                       .
        .byte   $3F                             ; E8B9 3F                       ?
        sbc     $A03B,x                         ; E8BA FD 3B A0                 .;.
        sec                                     ; E8BD 38                       8
LE8BE:  txs                                     ; E8BE 9A                       .
LE8BF:  sbc     #$F9                            ; E8BF E9 F9                    ..
        sbc     #$31                            ; E8C1 E9 31                    .1
        .byte   $F2                             ; E8C3 F2                       .
        ora     ($ED),y                         ; E8C4 11 ED                    ..
        .byte   $9C                             ; E8C6 9C                       .
        inc     LEAD0                           ; E8C7 EE D0 EA                 ...
        .byte   $F7                             ; E8CA F7                       .
        .byte   $F4                             ; E8CB F4                       .
        .byte   $92                             ; E8CC 92                       .
        .byte   $F3                             ; E8CD F3                       .
        .byte   $64                             ; E8CE 64                       d
        .byte   $F3                             ; E8CF F3                       .
        .byte   $3C                             ; E8D0 3C                       <
        .byte   $F3                             ; E8D1 F3                       .
        .byte   $82                             ; E8D2 82                       .
        .byte   $F3                             ; E8D3 F3                       .
        .byte   $12                             ; E8D4 12                       .
        .byte   $F3                             ; E8D5 F3                       .
        sbc     $F3,x                           ; E8D6 F5 F3                    ..
        .byte   $D3                             ; E8D8 D3                       .
        .byte   $F3                             ; E8D9 F3                       .
        sbc     $05EC,y                         ; E8DA F9 EC 05                 ...
        .byte   $F4                             ; E8DD F4                       .
        ora     ($F3,x)                         ; E8DE 01 F3                    ..
        ora     L00F4                           ; E8E0 05 F4                    ..
LE8E2:  ror     $EB                             ; E8E2 66 EB                    f.
        .byte   $FC                             ; E8E4 FC                       .
        inx                                     ; E8E5 E8                       .
        pla                                     ; E8E6 68                       h
        .byte   $F4                             ; E8E7 F4                       .
        .byte   $C7                             ; E8E8 C7                       .
        .byte   $F4                             ; E8E9 F4                       .
        cpx     L00F4                           ; E8EA E4 F4                    ..
        .byte   $EF                             ; E8EC EF                       .
        .byte   $F2                             ; E8ED F2                       .
        .byte   $32                             ; E8EE 32                       2
        .byte   $F4                             ; E8EF F4                       .
        rts                                     ; E8F0 60                       `

; ----------------------------------------------------------------------------
        cpx     LEC1A                           ; E8F1 EC 1A EC                 ...
        bcc     LE8E2                           ; E8F4 90 EC                    ..
        txs                                     ; E8F6 9A                       .
        sbc     #$9A                            ; E8F7 E9 9A                    ..
        .byte   $EB                             ; E8F9 EB                       .
        .byte   $04                             ; E8FA 04                       .
        .byte   $EC                             ; E8FB EC                       .
        .byte   $FF                             ; E8FC FF                       .
LE8FD:  .byte   $11                             ; E8FD 11                       .
LE8FE:  sbc     #$24                            ; E8FE E9 24                    .$
        sbc     #$26                            ; E900 E9 26                    .&
        sbc     #$2C                            ; E902 E9 2C                    .,
        sbc     #$3B                            ; E904 E9 3B                    .;
        sbc     #$3C                            ; E906 E9 3C                    .<
        sbc     #$47                            ; E908 E9 47                    .G
        sbc     #$54                            ; E90A E9 54                    .T
        sbc     #$5F                            ; E90C E9 5F                    ._
        sbc     #$69                            ; E90E E9 69                    .i
        sbc     #$13                            ; E910 E9 13                    ..
        .byte   $17                             ; E912 17                       .
        .byte   $1B                             ; E913 1B                       .
        .byte   $7F                             ; E914 7F                       .
        rol     $3C3D,x                         ; E915 3E 3D 3C                 >=<
        .byte   $3B                             ; E918 3B                       ;
        .byte   $3A                             ; E919 3A                       :
        and     $3738,y                         ; E91A 39 38 37                 987
        lsr     $45                             ; E91D 46 45                    FE
        .byte   $54                             ; E91F 54                       T
        .byte   $53                             ; E920 53                       S
        .byte   $52                             ; E921 52                       R
        eor     (L0000),y                       ; E922 51 00                    Q.
        clc                                     ; E924 18                       .
        .byte   $0F                             ; E925 0F                       .
        clc                                     ; E926 18                       .
        .byte   $2F                             ; E927 2F                       /
        .byte   $1B                             ; E928 1B                       .
        .byte   $17                             ; E929 17                       .
        .byte   $13                             ; E92A 13                       .
        brk                                     ; E92B 00                       .
        .byte   $1C                             ; E92C 1C                       .
        ora     LFF1E,x                         ; E92D 1D 1E FF                 ...
        stx     $7C8D                           ; E930 8E 8D 7C                 ..|
        .byte   $7B                             ; E933 7B                       {
        txa                                     ; E934 8A                       .
        .byte   $89                             ; E935 89                       .
        dey                                     ; E936 88                       .
        .byte   $87                             ; E937 87                       .
        stx     $85                             ; E938 86 85                    ..
        .byte   $04                             ; E93A 04                       .
        .byte   $0F                             ; E93B 0F                       .
        .byte   $7F                             ; E93C 7F                       .
        lsr     $4C4D                           ; E93D 4E 4D 4C                 NML
        .byte   $8B                             ; E940 8B                       .
        txa                                     ; E941 8A                       .
        cmp     #$C8                            ; E942 C9 C8                    ..
        .byte   $C7                             ; E944 C7                       .
        dec     $05                             ; E945 C6 05                    ..
        .byte   $8F                             ; E947 8F                       .
        lsr     $2C3D                           ; E948 4E 3D 2C                 N=,
        .byte   $1B                             ; E94B 1B                       .
        .byte   $1A                             ; E94C 1A                       .
        ora     $1718,y                         ; E94D 19 18 17                 ...
        asl     $15,x                           ; E950 16 15                    ..
        .byte   $14                             ; E952 14                       .
        .byte   $03                             ; E953 03                       .
        .byte   $FA                             ; E954 FA                       .
        .byte   $4B                             ; E955 4B                       K
        jmp     L3E3D                           ; E956 4C 3D 3E                 L=>

; ----------------------------------------------------------------------------
        .byte   $FF                             ; E959 FF                       .
        inc     $8C8D,x                         ; E95A FE 8D 8C                 ...
        .byte   $8B                             ; E95D 8B                       .
        asl     a                               ; E95E 0A                       .
        .byte   $2F                             ; E95F 2F                       /
        rol     $4C3D                           ; E960 2E 3D 4C                 .=L
        .byte   $4B                             ; E963 4B                       K
        txa                                     ; E964 8A                       .
        sbc     LF7F8,y                         ; E965 F9 F8 F7                 ...
        asl     $1F                             ; E968 06 1F                    ..
        ora     L1A1B,x                         ; E96A 1D 1B 1A                 ...
        .byte   $1C                             ; E96D 1C                       .
        .byte   $1A                             ; E96E 1A                       .
        clc                                     ; E96F 18                       .
        brk                                     ; E970 00                       .
        .byte   $1A                             ; E971 1A                       .
        .byte   $17                             ; E972 17                       .
        .byte   $14                             ; E973 14                       .
        clc                                     ; E974 18                       .
        .byte   $14                             ; E975 14                       .
        asl     L0004,x                         ; E976 16 04                    ..
LE978:  .byte   $04                             ; E978 04                       .
        asl     $08                             ; E979 06 08                    ..
        .byte   $0C                             ; E97B 0C                       .
        bpl     LE996                           ; E97C 10 18                    ..
        jsr     L4030                           ; E97E 20 30 40                  0@
        rts                                     ; E981 60                       `

; ----------------------------------------------------------------------------
        .byte   $80                             ; E982 80                       .
        asl     a                               ; E983 0A                       .
        .byte   $14                             ; E984 14                       .
        .byte   $03                             ; E985 03                       .
        .byte   $02                             ; E986 02                       .
        ora     (L0003,x)                       ; E987 01 03                    ..
        .byte   $04                             ; E989 04                       .
        asl     $09                             ; E98A 06 09                    ..
        .byte   $0C                             ; E98C 0C                       .
        .byte   $12                             ; E98D 12                       .
        clc                                     ; E98E 18                       .
        bit     $30                             ; E98F 24 30                    $0
        pha                                     ; E991 48                       H
        rts                                     ; E992 60                       `

; ----------------------------------------------------------------------------
        php                                     ; E993 08                       .
        ora     #$03                            ; E994 09 03                    ..
LE996:  .byte   $02                             ; E996 02                       .
        ora     ($9A,x)                         ; E997 01 9A                    ..
        sbc     #$00                            ; E999 E9 00                    ..
        ldy     $E9                             ; E99B A4 E9                    ..
        ora     ($DC,x)                         ; E99D 01 DC                    ..
        sbc     #$02                            ; E99F E9 02                    ..
        .byte   $EB                             ; E9A1 EB                       .
        sbc     #$FF                            ; E9A2 E9 FF                    ..
        cpx     LED08                           ; E9A4 EC 08 ED                 ...
        brk                                     ; E9A7 00                       .
        inc     LF00D                           ; E9A8 EE 0D F0                 ...
        brk                                     ; E9AB 00                       .
        .byte   $F2                             ; E9AC F2                       .
        .byte   $C2                             ; E9AD C2                       .
        cpx     #$E1                            ; E9AE E0 E1                    ..
        sbc     #$EF                            ; E9B0 E9 EF                    ..
        inc     LE1E0,x                         ; E9B2 FE E0 E1                 ...
        sbc     #$EF                            ; E9B5 E9 EF                    ..
        inc     LE1E0,x                         ; E9B7 FE E0 E1                 ...
        sbc     #$EF                            ; E9BA E9 EF                    ..
        inc     LE1E0,x                         ; E9BC FE E0 E1                 ...
        sbc     #$EF                            ; E9BF E9 EF                    ..
        inc     LE1E0,x                         ; E9C1 FE E0 E1                 ...
        sbc     #$EF                            ; E9C4 E9 EF                    ..
        .byte   $02                             ; E9C6 02                       .
        cpx     #$E1                            ; E9C7 E0 E1                    ..
        sbc     #$EF                            ; E9C9 E9 EF                    ..
        .byte   $02                             ; E9CB 02                       .
        cpx     #$E1                            ; E9CC E0 E1                    ..
        sbc     #$EF                            ; E9CE E9 EF                    ..
        .byte   $02                             ; E9D0 02                       .
        cpx     #$E1                            ; E9D1 E0 E1                    ..
        sbc     #$EF                            ; E9D3 E9 EF                    ..
        .byte   $02                             ; E9D5 02                       .
        cpx     #$E1                            ; E9D6 E0 E1                    ..
        sbc     #$F8                            ; E9D8 E9 F8                    ..
        ldy     $E9                             ; E9DA A4 E9                    ..
        .byte   $80                             ; E9DC 80                       .
        .byte   $3F                             ; E9DD 3F                       ?
        sed                                     ; E9DE F8                       .
        ldy     $E9                             ; E9DF A4 E9                    ..
        .byte   $82                             ; E9E1 82                       .
        .byte   $22                             ; E9E2 22                       "
        .byte   $32                             ; E9E3 32                       2
        .byte   $22                             ; E9E4 22                       "
        .byte   $27                             ; E9E5 27                       '
        .byte   $22                             ; E9E6 22                       "
        .byte   $32                             ; E9E7 32                       2
        .byte   $22                             ; E9E8 22                       "
        .byte   $27                             ; E9E9 27                       '
        .byte   $FA                             ; E9EA FA                       .
        cpx     $8A04                           ; E9EB EC 04 8A                 ...
        .byte   $57                             ; E9EE 57                       W
        .byte   $17                             ; E9EF 17                       .
        eor     $15,x                           ; E9F0 55 15                    U.
        .byte   $54                             ; E9F2 54                       T
        .byte   $14                             ; E9F3 14                       .
        .byte   $53                             ; E9F4 53                       S
        .byte   $13                             ; E9F5 13                       .
        sed                                     ; E9F6 F8                       .
        .byte   $EB                             ; E9F7 EB                       .
        sbc     #$00                            ; E9F8 E9 00                    ..
        .byte   $03                             ; E9FA 03                       .
        nop                                     ; E9FB EA                       .
        ora     ($61,x)                         ; E9FC 01 61                    .a
        nop                                     ; E9FE EA                       .
        .byte   $02                             ; E9FF 02                       .
        cmp     ($EA,x)                         ; EA00 C1 EA                    ..
        .byte   $FF                             ; EA02 FF                       .
        cpx     LED07                           ; EA03 EC 07 ED                 ...
        brk                                     ; EA06 00                       .
        inc     LF007                           ; EA07 EE 07 F0                 ...
        ora     #$F2                            ; EA0A 09 F2                    ..
        dex                                     ; EA0C CA                       .
        cmp     ($84,x)                         ; EA0D C1 84                    ..
        asl     $15,x                           ; EA0F 16 15                    ..
        .byte   $14                             ; EA11 14                       .
        cli                                     ; EA12 58                       X
        dey                                     ; EA13 88                       .
        clc                                     ; EA14 18                       .
        .byte   $17                             ; EA15 17                       .
        asl     $F9,x                           ; EA16 16 F9                    ..
        cpx     LF205                           ; EA18 EC 05 F2                 ...
        pha                                     ; EA1B 48                       H
        .byte   $82                             ; EA1C 82                       .
        .byte   $1A                             ; EA1D 1A                       .
        ora     $1718,y                         ; EA1E 19 18 17                 ...
        asl     $85,x                           ; EA21 16 85                    ..
        .byte   $3F                             ; EA23 3F                       ?
        dey                                     ; EA24 88                       .
        .byte   $3F                             ; EA25 3F                       ?
        stx     $3F                             ; EA26 86 3F                    .?
        sty     $EF                             ; EA28 84 EF                    ..
        .byte   $04                             ; EA2A 04                       .
        clc                                     ; EA2B 18                       .
        clc                                     ; EA2C 18                       .
        .byte   $EF                             ; EA2D EF                       .
        .byte   $FB                             ; EA2E FB                       .
        clc                                     ; EA2F 18                       .
        clc                                     ; EA30 18                       .
        .byte   $EF                             ; EA31 EF                       .
        .byte   $FA                             ; EA32 FA                       .
        clc                                     ; EA33 18                       .
        clc                                     ; EA34 18                       .
        .byte   $EF                             ; EA35 EF                       .
        .byte   $07                             ; EA36 07                       .
        .byte   $82                             ; EA37 82                       .
        .byte   $13                             ; EA38 13                       .
        sty     $18                             ; EA39 84 18                    ..
        .byte   $82                             ; EA3B 82                       .
        .byte   $1A                             ; EA3C 1A                       .
        .byte   $EF                             ; EA3D EF                       .
        .byte   $FA                             ; EA3E FA                       .
        .byte   $23                             ; EA3F 23                       #
        .byte   $EF                             ; EA40 EF                       .
        asl     $85                             ; EA41 06 85                    ..
        .byte   $3F                             ; EA43 3F                       ?
        sty     $3F                             ; EA44 84 3F                    .?
        .byte   $82                             ; EA46 82                       .
        .byte   $23                             ; EA47 23                       #
        .byte   $22                             ; EA48 22                       "
        and     ($22,x)                         ; EA49 21 22                    !"
        clc                                     ; EA4B 18                       .
        .byte   $3F                             ; EA4C 3F                       ?
        stx     $3F                             ; EA4D 86 3F                    .?
        sty     $EF                             ; EA4F 84 EF                    ..
        .byte   $04                             ; EA51 04                       .
        clc                                     ; EA52 18                       .
        clc                                     ; EA53 18                       .
        .byte   $EF                             ; EA54 EF                       .
        .byte   $FB                             ; EA55 FB                       .
        clc                                     ; EA56 18                       .
        clc                                     ; EA57 18                       .
        .byte   $EF                             ; EA58 EF                       .
        .byte   $FA                             ; EA59 FA                       .
        clc                                     ; EA5A 18                       .
        clc                                     ; EA5B 18                       .
        .byte   $EF                             ; EA5C EF                       .
        .byte   $07                             ; EA5D 07                       .
        sed                                     ; EA5E F8                       .
        .byte   $03                             ; EA5F 03                       .
        nop                                     ; EA60 EA                       .
        cpx     LED07                           ; EA61 EC 07 ED                 ...
        rti                                     ; EA64 40                       @

; ----------------------------------------------------------------------------
        inc     LF007                           ; EA65 EE 07 F0                 ...
        ora     #$F2                            ; EA68 09 F2                    ..
        dex                                     ; EA6A CA                       .
        cmp     ($87,x)                         ; EA6B C1 87                    ..
        .byte   $1A                             ; EA6D 1A                       .
        sty     $61                             ; EA6E 84 61                    .a
        dey                                     ; EA70 88                       .
        adc     ($8A,x)                         ; EA71 61 8A                    a.
        and     ($F9,x)                         ; EA73 21 F9                    !.
        cpx     LF205                           ; EA75 EC 05 F2                 ...
        pha                                     ; EA78 48                       H
        .byte   $82                             ; EA79 82                       .
        .byte   $23                             ; EA7A 23                       #
        .byte   $3F                             ; EA7B 3F                       ?
        .byte   $3F                             ; EA7C 3F                       ?
        .byte   $3F                             ; EA7D 3F                       ?
        .byte   $23                             ; EA7E 23                       #
        sta     $3F                             ; EA7F 85 3F                    .?
        sty     $3F                             ; EA81 84 3F                    .?
        .byte   $1A                             ; EA83 1A                       .
        clc                                     ; EA84 18                       .
        .byte   $82                             ; EA85 82                       .
        .byte   $13                             ; EA86 13                       .
        .byte   $3F                             ; EA87 3F                       ?
        stx     $3F                             ; EA88 86 3F                    .?
        sty     $EF                             ; EA8A 84 EF                    ..
        .byte   $04                             ; EA8C 04                       .
        and     ($21,x)                         ; EA8D 21 21                    !!
        .byte   $EF                             ; EA8F EF                       .
        .byte   $FB                             ; EA90 FB                       .
        and     ($21,x)                         ; EA91 21 21                    !!
        .byte   $EF                             ; EA93 EF                       .
        .byte   $FA                             ; EA94 FA                       .
        and     ($21,x)                         ; EA95 21 21                    !!
        .byte   $EF                             ; EA97 EF                       .
        .byte   $07                             ; EA98 07                       .
        .byte   $82                             ; EA99 82                       .
        clc                                     ; EA9A 18                       .
        sty     $21                             ; EA9B 84 21                    .!
        .byte   $82                             ; EA9D 82                       .
        .byte   $23                             ; EA9E 23                       #
        .byte   $EF                             ; EA9F EF                       .
        .byte   $FA                             ; EAA0 FA                       .
        plp                                     ; EAA1 28                       (
        .byte   $EF                             ; EAA2 EF                       .
        asl     $85                             ; EAA3 06 85                    ..
        .byte   $3F                             ; EAA5 3F                       ?
        sty     $3F                             ; EAA6 84 3F                    .?
        .byte   $1A                             ; EAA8 1A                       .
        clc                                     ; EAA9 18                       .
        .byte   $82                             ; EAAA 82                       .
        .byte   $13                             ; EAAB 13                       .
        .byte   $3F                             ; EAAC 3F                       ?
        stx     $3F                             ; EAAD 86 3F                    .?
        sty     $EF                             ; EAAF 84 EF                    ..
        .byte   $04                             ; EAB1 04                       .
        and     ($21,x)                         ; EAB2 21 21                    !!
        .byte   $EF                             ; EAB4 EF                       .
        .byte   $FB                             ; EAB5 FB                       .
        and     ($21,x)                         ; EAB6 21 21                    !!
        .byte   $EF                             ; EAB8 EF                       .
        .byte   $FA                             ; EAB9 FA                       .
        and     ($21,x)                         ; EABA 21 21                    !!
        .byte   $EF                             ; EABC EF                       .
        .byte   $07                             ; EABD 07                       .
        sed                                     ; EABE F8                       .
        adc     ($EA,x)                         ; EABF 61 EA                    a.
        cpx     #$64                            ; EAC1 E0 64                    .d
        sbc     $F2,x                           ; EAC3 F5 F2                    ..
        sta     ($CF,x)                         ; EAC5 81 CF                    ..
        stx     $0A                             ; EAC7 86 0A                    ..
        sbc     $07CF,y                         ; EAC9 F9 CF 07                 ...
        sbc     LC1F8,y                         ; EACC F9 F8 C1                 ...
        nop                                     ; EACF EA                       .
LEAD0:  brk                                     ; EAD0 00                       .
        .byte   $DA                             ; EAD1 DA                       .
        nop                                     ; EAD2 EA                       .
        ora     ($08,x)                         ; EAD3 01 08                    ..
        .byte   $EB                             ; EAD5 EB                       .
        .byte   $02                             ; EAD6 02                       .
        rol     $EB,x                           ; EAD7 36 EB                    6.
        .byte   $FF                             ; EAD9 FF                       .
        cpx     LED06                           ; EADA EC 06 ED                 ...
        brk                                     ; EADD 00                       .
        inc     LF005                           ; EADE EE 05 F0                 ...
        .byte   $0C                             ; EAE1 0C                       .
        .byte   $F2                             ; EAE2 F2                       .
        .byte   $C3                             ; EAE3 C3                       .
        sty     $12,x                           ; EAE4 94 12                    ..
        .byte   $22                             ; EAE6 22                       "
        ora     $25,x                           ; EAE7 15 25                    .%
        stx     $17,y                           ; EAE9 96 17                    ..
        sty     $19,x                           ; EAEB 94 19                    ..
        .byte   $62                             ; EAED 62                       b
        .byte   $22                             ; EAEE 22                       "
        .byte   $32                             ; EAEF 32                       2
        and     $35                             ; EAF0 25 35                    %5
        stx     $27,y                           ; EAF2 96 27                    .'
        sty     $29,x                           ; EAF4 94 29                    .)
        .byte   $3F                             ; EAF6 3F                       ?
        .byte   $92                             ; EAF7 92                       .
        .byte   $32                             ; EAF8 32                       2
        bmi     LEB3A                           ; EAF9 30 3F                    0?
        .byte   $27                             ; EAFB 27                       '
        and     $3F                             ; EAFC 25 3F                    %?
        .byte   $27                             ; EAFE 27                       '
        and     $27                             ; EAFF 25 27                    %'
        and     $94                             ; EB01 25 94                    %.
        bit     $20                             ; EB03 24 20                    $ 
        jsr     LFF22                           ; EB05 20 22 FF                  ".
        cpx     LED06                           ; EB08 EC 06 ED                 ...
        brk                                     ; EB0B 00                       .
        inc     LF005                           ; EB0C EE 05 F0                 ...
        .byte   $0C                             ; EB0F 0C                       .
        .byte   $F2                             ; EB10 F2                       .
        .byte   $C3                             ; EB11 C3                       .
        sty     $09,x                           ; EB12 94 09                    ..
        ora     L2212,y                         ; EB14 19 12 22                 .."
        stx     $14,y                           ; EB17 96 14                    ..
        sty     $15,x                           ; EB19 94 15                    ..
        ora     $2919,y                         ; EB1B 19 19 29                 ..)
        .byte   $22                             ; EB1E 22                       "
        .byte   $32                             ; EB1F 32                       2
        stx     $24,y                           ; EB20 96 24                    .$
        sty     $25,x                           ; EB22 94 25                    .%
        .byte   $3F                             ; EB24 3F                       ?
        .byte   $92                             ; EB25 92                       .
        .byte   $2B                             ; EB26 2B                       +
        and     #$3F                            ; EB27 29 3F                    )?
        bit     $22                             ; EB29 24 22                    $"
        .byte   $3F                             ; EB2B 3F                       ?
        .byte   $22                             ; EB2C 22                       "
        .byte   $22                             ; EB2D 22                       "
        .byte   $22                             ; EB2E 22                       "
        .byte   $22                             ; EB2F 22                       "
        sty     $20,x                           ; EB30 94 20                    . 
        .byte   $17                             ; EB32 17                       .
        .byte   $17                             ; EB33 17                       .
        ora     LE0FF,y                         ; EB34 19 FF E0                 ...
        .byte   $64                             ; EB37 64                       d
        sbc     $94,x                           ; EB38 F5 94                    ..
LEB3A:  .byte   $12                             ; EB3A 12                       .
        .byte   $12                             ; EB3B 12                       .
        .byte   $22                             ; EB3C 22                       "
        .byte   $12                             ; EB3D 12                       .
        stx     $20,y                           ; EB3E 96 20                    . 
        sty     $19,x                           ; EB40 94 19                    ..
        .byte   $57                             ; EB42 57                       W
        .byte   $17                             ; EB43 17                       .
        stx     $15,y                           ; EB44 96 15                    ..
        .byte   $14                             ; EB46 14                       .
        sty     $15,x                           ; EB47 94 15                    ..
        stx     $10,y                           ; EB49 96 10                    ..
        .byte   $92                             ; EB4B 92                       .
        .byte   $12                             ; EB4C 12                       .
        .byte   $12                             ; EB4D 12                       .
        stx     $3F,y                           ; EB4E 96 3F                    .?
        .byte   $92                             ; EB50 92                       .
        .byte   $12                             ; EB51 12                       .
        .byte   $12                             ; EB52 12                       .
        stx     $3F,y                           ; EB53 96 3F                    .?
        sty     $10,x                           ; EB55 94 10                    ..
        .byte   $92                             ; EB57 92                       .
        bpl     LEB99                           ; EB58 10 3F                    .?
        .byte   $F3                             ; EB5A F3                       .
        stx     $7072                           ; EB5B 8E 72 70                 .rp
        ror     a                               ; EB5E 6A                       j
        pla                                     ; EB5F 68                       h
        ror     $65                             ; EB60 66 65                    fe
        .byte   $64                             ; EB62 64                       d
        .byte   $63                             ; EB63 63                       c
        .byte   $62                             ; EB64 62                       b
        .byte   $FF                             ; EB65 FF                       .
        brk                                     ; EB66 00                       .
        .byte   $72                             ; EB67 72                       r
        .byte   $EB                             ; EB68 EB                       .
        ora     ($70,x)                         ; EB69 01 70                    .p
        .byte   $EB                             ; EB6B EB                       .
        .byte   $03                             ; EB6C 03                       .
        stx     LFFEB                           ; EB6D 8E EB FF                 ...
        .byte   $82                             ; EB70 82                       .
        .byte   $3F                             ; EB71 3F                       ?
        cpx     LED04                           ; EB72 EC 04 ED                 ...
        brk                                     ; EB75 00                       .
        inc     LF002                           ; EB76 EE 02 F0                 ...
        jsr     L8FCF                           ; EB79 20 CF 8F                  ..
        rts                                     ; EB7C 60                       `

; ----------------------------------------------------------------------------
        lsr     $5A5C,x                         ; EB7D 5E 5C 5A                 ^\Z
        cli                                     ; EB80 58                       X
        lsr     $54,x                           ; EB81 56 54                    VT
        .byte   $52                             ; EB83 52                       R
        bvc     LEBCE                           ; EB84 50 48                    PH
        lsr     $44                             ; EB86 46 44                    FD
        .byte   $02                             ; EB88 02                       .
        sbc     ($F7),y                         ; EB89 F1 F7                    ..
        sbc     LFF00,y                         ; EB8B F9 00 FF                 ...
        cpx     LEE05                           ; EB8E EC 05 EE                 ...
        .byte   $02                             ; EB91 02                       .
        sta     ($49,x)                         ; EB92 81 49                    .I
        lsr     a                               ; EB94 4A                       J
        .byte   $4B                             ; EB95 4B                       K
        jmp     L0E4D                           ; EB96 4C 4D 0E                 LM.

; ----------------------------------------------------------------------------
LEB99:  .byte   $FF                             ; EB99 FF                       .
        brk                                     ; EB9A 00                       .
        ldy     $EB                             ; EB9B A4 EB                    ..
        ora     ($C2,x)                         ; EB9D 01 C2                    ..
        .byte   $EB                             ; EB9F EB                       .
        .byte   $02                             ; EBA0 02                       .
        cpx     #$EB                            ; EBA1 E0 EB                    ..
        .byte   $FF                             ; EBA3 FF                       .
        cpx     LED07                           ; EBA4 EC 07 ED                 ...
        .byte   $80                             ; EBA7 80                       .
        inc     LF002                           ; EBA8 EE 02 F0                 ...
        brk                                     ; EBAB 00                       .
        .byte   $F2                             ; EBAC F2                       .
        .byte   $F2                             ; EBAD F2                       .
        sty     $25,x                           ; EBAE 94 25                    .%
        bit     $23                             ; EBB0 24 23                    $#
        .byte   $22                             ; EBB2 22                       "
        jsr     L201B                           ; EBB3 20 1B 20                  . 
        .byte   $22                             ; EBB6 22                       "
        and     $24                             ; EBB7 25 24                    %$
        .byte   $27                             ; EBB9 27                       '
        rol     $29                             ; EBBA 26 29                    &)
        plp                                     ; EBBC 28                       (
        and     #$2B                            ; EBBD 29 2B                    )+
        tya                                     ; EBBF 98                       .
        .byte   $30                             ; EBC0 30                       0
LEBC1:  .byte   $FF                             ; EBC1 FF                       .
        cpx     LED07                           ; EBC2 EC 07 ED                 ...
        .byte   $80                             ; EBC5 80                       .
        inc     LF002                           ; EBC6 EE 02 F0                 ...
        brk                                     ; EBC9 00                       .
        .byte   $F2                             ; EBCA F2                       .
        .byte   $F2                             ; EBCB F2                       .
        sty     $20,x                           ; EBCC 94 20                    . 
LEBCE:  jsr     L1A1A                           ; EBCE 20 1A 1A                  ..
        .byte   $17                             ; EBD1 17                       .
        .byte   $17                             ; EBD2 17                       .
        .byte   $17                             ; EBD3 17                       .
        .byte   $1B                             ; EBD4 1B                       .
        jsr     L2220                           ; EBD5 20 20 22                   "
        .byte   $22                             ; EBD8 22                       "
        bit     $24                             ; EBD9 24 24                    $$
        and     $27                             ; EBDB 25 27                    %'
        tya                                     ; EBDD 98                       .
        .byte   $27                             ; EBDE 27                       '
        .byte   $FF                             ; EBDF FF                       .
        cpx     #$64                            ; EBE0 E0 64                    .d
        sbc     $94,x                           ; EBE2 F5 94                    ..
        bpl     LEBFD                           ; EBE4 10 17                    ..
        asl     a                               ; EBE6 0A                       .
        ora     $07,x                           ; EBE7 15 07                    ..
        .byte   $12                             ; EBE9 12                       .
        .byte   $07                             ; EBEA 07                       .
        .byte   $07                             ; EBEB 07                       .
        bpl     LEC05                           ; EBEC 10 17                    ..
        .byte   $12                             ; EBEE 12                       .
        ora     $1B14,y                         ; EBEF 19 14 1B                 ...
        ora     $17,x                           ; EBF2 15 17                    ..
        .byte   $F3                             ; EBF4 F3                       .
        .byte   $9F                             ; EBF5 9F                       .
        jsr     L1A1B                           ; EBF6 20 1B 1A                  ..
        ora     $1718,y                         ; EBF9 19 18 17                 ...
        .byte   $16                             ; EBFC 16                       .
LEBFD:  ora     $14,x                           ; EBFD 15 14                    ..
        .byte   $13                             ; EBFF 13                       .
        .byte   $12                             ; EC00 12                       .
        ora     ($10),y                         ; EC01 11 10                    ..
        .byte   $FF                             ; EC03 FF                       .
        brk                                     ; EC04 00                       .
LEC05:  .byte   $0D                             ; EC05 0D                       .
LEC06:  cpx     $0B01                           ; EC06 EC 01 0B                 ...
        cpx     LF0FF                           ; EC09 EC FF F0                 ...
        ora     ($EC,x)                         ; EC0C 01 EC                    ..
        .byte   $04                             ; EC0E 04                       .
        sbc     LC300                           ; EC0F ED 00 C3                 ...
        .byte   $82                             ; EC12 82                       .
        ora     $80,x                           ; EC13 15 80                    ..
        .byte   $3F                             ; EC15 3F                       ?
        sbc     $0FEE,y                         ; EC16 F9 EE 0F                 ...
        .byte   $FF                             ; EC19 FF                       .
LEC1A:  brk                                     ; EC1A 00                       .
        bit     $EC                             ; EC1B 24 EC                    $.
        ora     ($3C,x)                         ; EC1D 01 3C                    .<
        cpx     $5402                           ; EC1F EC 02 54                 ..T
        cpx     LECFF                           ; EC22 EC FF EC                 ...
        ora     $ED                             ; EC25 05 ED                    ..
        brk                                     ; EC27 00                       .
        inc     LF004                           ; EC28 EE 04 F0                 ...
        .byte   $0C                             ; EC2B 0C                       .
        .byte   $F2                             ; EC2C F2                       .
        cmp     ($94,x)                         ; EC2D C1 94                    ..
        ora     L191B,y                         ; EC2F 19 1B 19                 ...
        ora     $19,x                           ; EC32 15 19                    ..
        .byte   $1B                             ; EC34 1B                       .
        jsr     L2022                           ; EC35 20 22 20                  " 
        .byte   $1B                             ; EC38 1B                       .
        .byte   $3F                             ; EC39 3F                       ?
        jsr     LECFF                           ; EC3A 20 FF EC                  ..
        ora     $ED                             ; EC3D 05 ED                    ..
        brk                                     ; EC3F 00                       .
        inc     LF004                           ; EC40 EE 04 F0                 ...
        .byte   $0C                             ; EC43 0C                       .
        .byte   $F2                             ; EC44 F2                       .
        cmp     ($94,x)                         ; EC45 C1 94                    ..
        ora     $17,x                           ; EC47 15 17                    ..
        ora     $12,x                           ; EC49 15 12                    ..
        ora     $17,x                           ; EC4B 15 17                    ..
        ora     $171B,y                         ; EC4D 19 1B 17                 ...
        .byte   $17                             ; EC50 17                       .
        .byte   $3F                             ; EC51 3F                       ?
        .byte   $17                             ; EC52 17                       .
        .byte   $FF                             ; EC53 FF                       .
        cpx     #$64                            ; EC54 E0 64                    .d
        sbc     $98,x                           ; EC56 F5 98                    ..
        ora     $17,x                           ; EC58 15 17                    ..
        sty     $20,x                           ; EC5A 94 20                    . 
        .byte   $17                             ; EC5C 17                       .
        .byte   $3F                             ; EC5D 3F                       ?
        jsr     L04FF                           ; EC5E 20 FF 04                  ..
        ora     ($65,x)                         ; EC61 01 65                    .e
        cpx     LECFF                           ; EC63 EC FF EC                 ...
        asl     $ED                             ; EC66 06 ED                    ..
        .byte   $80                             ; EC68 80                       .
        beq     LEC83                           ; EC69 F0 18                    ..
        inc     LC300                           ; EC6B EE 00 C3                 ...
        .byte   $8F                             ; EC6E 8F                       .
        bpl     LEC91                           ; EC6F 10 20                    . 
        .byte   $EF                             ; EC71 EF                       .
        .byte   $03                             ; EC72 03                       .
        sbc     $EE,y                           ; EC73 F9 EE 00                 ...
        .byte   $C3                             ; EC76 C3                       .
        .byte   $8F                             ; EC77 8F                       .
        .byte   $14                             ; EC78 14                       .
        bit     $EF                             ; EC79 24 EF                    $.
        .byte   $03                             ; EC7B 03                       .
        sbc     $EE,y                           ; EC7C F9 EE 00                 ...
        .byte   $C3                             ; EC7F C3                       .
LEC80:  .byte   $8F                             ; EC80 8F                       .
        .byte   $17                             ; EC81 17                       .
        .byte   $27                             ; EC82 27                       '
LEC83:  .byte   $EF                             ; EC83 EF                       .
        .byte   $03                             ; EC84 03                       .
        sbc     $EE,y                           ; EC85 F9 EE 00                 ...
        .byte   $C3                             ; EC88 C3                       .
        .byte   $8F                             ; EC89 8F                       .
        jsr     LEF30                           ; EC8A 20 30 EF                  0.
        .byte   $03                             ; EC8D 03                       .
        sbc     $FF,y                           ; EC8E F9 FF 00                 ...
LEC91:  txs                                     ; EC91 9A                       .
        cpx     $BE01                           ; EC92 EC 01 BE                 ...
        cpx     LE202                           ; EC95 EC 02 E2                 ...
        cpx     LECFF                           ; EC98 EC FF EC                 ...
        ora     $ED                             ; EC9B 05 ED                    ..
        cpy     #$F0                            ; EC9D C0 F0                    ..
        .byte   $0C                             ; EC9F 0C                       .
        .byte   $F2                             ; ECA0 F2                       .
        cmp     ($EE,x)                         ; ECA1 C1 EE                    ..
        .byte   $03                             ; ECA3 03                       .
        cmp     ($84,x)                         ; ECA4 C1 84                    ..
        .byte   $17                             ; ECA6 17                       .
        .byte   $9B                             ; ECA7 9B                       .
        ora     $3F84,y                         ; ECA8 19 84 3F                 ..?
        .byte   $9B                             ; ECAB 9B                       .
        ora     $3F84,y                         ; ECAC 19 84 3F                 ..?
        .byte   $9B                             ; ECAF 9B                       .
        ora     $2296,y                         ; ECB0 19 96 22                 .."
        sbc     $2098,y                         ; ECB3 F9 98 20                 .. 
        .byte   $22                             ; ECB6 22                       "
        sty     $29                             ; ECB7 84 29                    .)
        .byte   $9B                             ; ECB9 9B                       .
        .byte   $27                             ; ECBA 27                       '
        stx     $29,y                           ; ECBB 96 29                    .)
        .byte   $FF                             ; ECBD FF                       .
        cpx     LED05                           ; ECBE EC 05 ED                 ...
        cpy     #$F0                            ; ECC1 C0 F0                    ..
        .byte   $0C                             ; ECC3 0C                       .
        .byte   $F2                             ; ECC4 F2                       .
        cmp     ($EE,x)                         ; ECC5 C1 EE                    ..
        .byte   $03                             ; ECC7 03                       .
        cmp     ($84,x)                         ; ECC8 C1 84                    ..
        .byte   $14                             ; ECCA 14                       .
        .byte   $9B                             ; ECCB 9B                       .
        .byte   $14                             ; ECCC 14                       .
        sty     $3F                             ; ECCD 84 3F                    .?
        .byte   $9B                             ; ECCF 9B                       .
        .byte   $14                             ; ECD0 14                       .
        sty     $3F                             ; ECD1 84 3F                    .?
        .byte   $9B                             ; ECD3 9B                       .
        .byte   $14                             ; ECD4 14                       .
        stx     $19,y                           ; ECD5 96 19                    ..
        sbc     $1998,y                         ; ECD7 F9 98 19                 ...
        .byte   $1B                             ; ECDA 1B                       .
        sty     $24                             ; ECDB 84 24                    .$
        .byte   $9B                             ; ECDD 9B                       .
        bit     $96                             ; ECDE 24 96                    $.
        bit     $FF                             ; ECE0 24 FF                    $.
        cpx     #$64                            ; ECE2 E0 64                    .d
        sbc     $C7,x                           ; ECE4 F5 C7                    ..
        stx     $09,y                           ; ECE6 96 09                    ..
        sbc     $1598,y                         ; ECE8 F9 98 15                 ...
        .byte   $17                             ; ECEB 17                       .
        sty     $09                             ; ECEC 84 09                    ..
        .byte   $9B                             ; ECEE 9B                       .
        ora     $0984,y                         ; ECEF 19 84 09                 ...
        .byte   $9B                             ; ECF2 9B                       .
        ora     $0907,y                         ; ECF3 19 07 09                 ...
        .byte   $07                             ; ECF6 07                       .
        ora     #$FF                            ; ECF7 09 FF                    ..
        .byte   $04                             ; ECF9 04                       .
        ora     ($FE,x)                         ; ECFA 01 FE                    ..
        cpx     LECFF                           ; ECFC EC FF EC                 ...
LECFF:  asl     $ED                             ; ECFF 06 ED                    ..
LED01:  cpy     #$EE                            ; ED01 C0 EE                    ..
        brk                                     ; ED03 00                       .
LED04:  .byte   $F0                             ; ED04 F0                       .
LED05:  .byte   $0C                             ; ED05 0C                       .
LED06:  .byte   $8F                             ; ED06 8F                       .
LED07:  .byte   $C5                             ; ED07 C5                       .
LED08:  rts                                     ; ED08 60                       `

; ----------------------------------------------------------------------------
LED09:  bmi     LED0D                           ; ED09 30 02                    0.
        sbc     (L0003),y                       ; ED0B F1 03                    ..
LED0D:  .byte   $EF                             ; ED0D EF                       .
        ora     ($F9,x)                         ; ED0E 01 F9                    ..
        .byte   $FF                             ; ED10 FF                       .
        brk                                     ; ED11 00                       .
        .byte   $1B                             ; ED12 1B                       .
        sbc     $9301                           ; ED13 ED 01 93                 ...
        sbc     $1102                           ; ED16 ED 02 11                 ...
        inc     LECFF                           ; ED19 EE FF EC                 ...
        php                                     ; ED1C 08                       .
        sbc     LEE00                           ; ED1D ED 00 EE                 ...
        ora     $F0                             ; ED20 05 F0                    ..
        .byte   $0C                             ; ED22 0C                       .
        .byte   $F2                             ; ED23 F2                       .
        .byte   $C2                             ; ED24 C2                       .
        .byte   $82                             ; ED25 82                       .
        .byte   $12                             ; ED26 12                       .
        .byte   $14                             ; ED27 14                       .
        cpx     #$5B                            ; ED28 E0 5B                    .[
        sbc     $1722                           ; ED2A ED 22 17                 .".
        stx     $17                             ; ED2D 86 17                    ..
        .byte   $17                             ; ED2F 17                       .
        sty     $1B                             ; ED30 84 1B                    ..
        eor     $598A,y                         ; ED32 59 8A 59                 Y.Y
        .byte   $87                             ; ED35 87                       .
        ora     $1984,y                         ; ED36 19 84 19                 ...
        stx     $17                             ; ED39 86 17                    ..
        sty     $3F                             ; ED3B 84 3F                    .?
        .byte   $82                             ; ED3D 82                       .
        .byte   $12                             ; ED3E 12                       .
        .byte   $14                             ; ED3F 14                       .
        cpx     #$5B                            ; ED40 E0 5B                    .[
        sbc     $1722                           ; ED42 ED 22 17                 .".
        stx     $17                             ; ED45 86 17                    ..
        .byte   $17                             ; ED47 17                       .
        sty     $16                             ; ED48 84 16                    ..
        .byte   $57                             ; ED4A 57                       W
        txa                                     ; ED4B 8A                       .
        .byte   $57                             ; ED4C 57                       W
        .byte   $87                             ; ED4D 87                       .
        .byte   $17                             ; ED4E 17                       .
        sty     $19                             ; ED4F 84 19                    ..
        stx     $17                             ; ED51 86 17                    ..
        sty     $19                             ; ED53 84 19                    ..
        .byte   $82                             ; ED55 82                       .
        .byte   $12                             ; ED56 12                       .
        .byte   $14                             ; ED57 14                       .
        sed                                     ; ED58 F8                       .
        plp                                     ; ED59 28                       (
        sbc     $1784                           ; ED5A ED 84 17                 ...
        .byte   $17                             ; ED5D 17                       .
        .byte   $82                             ; ED5E 82                       .
        .byte   $12                             ; ED5F 12                       .
        sty     $14                             ; ED60 84 14                    ..
        .byte   $82                             ; ED62 82                       .
        .byte   $12                             ; ED63 12                       .
        .byte   $87                             ; ED64 87                       .
        jsr     L5B84                           ; ED65 20 84 5B                  .[
        dey                                     ; ED68 88                       .
        .byte   $5B                             ; ED69 5B                       [
        sty     $1B                             ; ED6A 84 1B                    ..
        .byte   $82                             ; ED6C 82                       .
        .byte   $1B                             ; ED6D 1B                       .
        .byte   $22                             ; ED6E 22                       "
        .byte   $1B                             ; ED6F 1B                       .
        ora     $3F17,y                         ; ED70 19 17 3F                 ..?
        .byte   $22                             ; ED73 22                       "
        .byte   $32                             ; ED74 32                       2
        .byte   $32                             ; ED75 32                       2
        .byte   $22                             ; ED76 22                       "
        .byte   $32                             ; ED77 32                       2
        .byte   $32                             ; ED78 32                       2
        sty     $3F                             ; ED79 84 3F                    .?
        .byte   $87                             ; ED7B 87                       .
        .byte   $17                             ; ED7C 17                       .
        sty     $57                             ; ED7D 84 57                    .W
        dey                                     ; ED7F 88                       .
        .byte   $57                             ; ED80 57                       W
        sty     $17                             ; ED81 84 17                    ..
        .byte   $3F                             ; ED83 3F                       ?
        .byte   $EF                             ; ED84 EF                       .
        .byte   $FC                             ; ED85 FC                       .
        .byte   $22                             ; ED86 22                       "
        .byte   $62                             ; ED87 62                       b
        .byte   $22                             ; ED88 22                       "
        .byte   $EF                             ; ED89 EF                       .
        .byte   $04                             ; ED8A 04                       .
        .byte   $17                             ; ED8B 17                       .
        stx     $17                             ; ED8C 86 17                    ..
        .byte   $3F                             ; ED8E 3F                       ?
        sty     $22                             ; ED8F 84 22                    ."
        .byte   $62                             ; ED91 62                       b
        .byte   $FA                             ; ED92 FA                       .
        cpx     LED08                           ; ED93 EC 08 ED                 ...
        cpy     #$EE                            ; ED96 C0 EE                    ..
        ora     $F0                             ; ED98 05 F0                    ..
        .byte   $0C                             ; ED9A 0C                       .
        .byte   $F2                             ; ED9B F2                       .
        .byte   $C2                             ; ED9C C2                       .
        sty     $3F                             ; ED9D 84 3F                    .?
        cpx     #$DA                            ; ED9F E0 DA                    ..
        sbc     $1217                           ; EDA1 ED 17 12                 ...
        stx     $12                             ; EDA4 86 12                    ..
        .byte   $12                             ; EDA6 12                       .
        sty     $14                             ; EDA7 84 14                    ..
        .byte   $54                             ; EDA9 54                       T
        dey                                     ; EDAA 88                       .
        eor     $84,x                           ; EDAB 55 84                    U.
        ora     $15,x                           ; EDAD 15 15                    ..
        .byte   $14                             ; EDAF 14                       .
        .byte   $52                             ; EDB0 52                       R
        .byte   $87                             ; EDB1 87                       .
        .byte   $12                             ; EDB2 12                       .
        sty     $12                             ; EDB3 84 12                    ..
        stx     $10                             ; EDB5 86 10                    ..
        sty     $0B                             ; EDB7 84 0B                    ..
        .byte   $3F                             ; EDB9 3F                       ?
        cpx     #$DA                            ; EDBA E0 DA                    ..
        sbc     $1217                           ; EDBC ED 17 12                 ...
        stx     $12                             ; EDBF 86 12                    ..
        .byte   $12                             ; EDC1 12                       .
        sty     $12                             ; EDC2 84 12                    ..
        .byte   $52                             ; EDC4 52                       R
        .byte   $12                             ; EDC5 12                       .
        .byte   $22                             ; EDC6 22                       "
        .byte   $27                             ; EDC7 27                       '
        .byte   $22                             ; EDC8 22                       "
        and     #$86                            ; EDC9 29 86                    ).
        .byte   $2B                             ; EDCB 2B                       +
        sty     $27                             ; EDCC 84 27                    .'
        bmi     LEDF7                           ; EDCE 30 27                    0'
        .byte   $2B                             ; EDD0 2B                       +
        .byte   $27                             ; EDD1 27                       '
        and     #$86                            ; EDD2 29 86                    ).
        .byte   $2B                             ; EDD4 2B                       +
        sty     $27                             ; EDD5 84 27                    .'
        sed                                     ; EDD7 F8                       .
        .byte   $9F                             ; EDD8 9F                       .
        sbc     $2282                           ; EDD9 ED 82 22                 .."
        .byte   $32                             ; EDDC 32                       2
        .byte   $32                             ; EDDD 32                       2
        .byte   $22                             ; EDDE 22                       "
        .byte   $32                             ; EDDF 32                       2
        .byte   $32                             ; EDE0 32                       2
        sty     $3F                             ; EDE1 84 3F                    .?
        .byte   $87                             ; EDE3 87                       .
        .byte   $17                             ; EDE4 17                       .
        sty     $57                             ; EDE5 84 57                    .W
        dey                                     ; EDE7 88                       .
        .byte   $57                             ; EDE8 57                       W
        sty     $17                             ; EDE9 84 17                    ..
        stx     $3F                             ; EDEB 86 3F                    .?
        .byte   $82                             ; EDED 82                       .
        .byte   $12                             ; EDEE 12                       .
        .byte   $14                             ; EDEF 14                       .
        sty     $17                             ; EDF0 84 17                    ..
        .byte   $17                             ; EDF2 17                       .
        .byte   $82                             ; EDF3 82                       .
        .byte   $12                             ; EDF4 12                       .
        sty     $14                             ; EDF5 84 14                    ..
LEDF7:  .byte   $82                             ; EDF7 82                       .
        .byte   $12                             ; EDF8 12                       .
        .byte   $87                             ; EDF9 87                       .
        jsr     L5B84                           ; EDFA 20 84 5B                  .[
        dey                                     ; EDFD 88                       .
        .byte   $5B                             ; EDFE 5B                       [
        .byte   $84                             ; EDFF 84                       .
LEE00:  .byte   $1B                             ; EE00 1B                       .
LEE01:  .byte   $3F                             ; EE01 3F                       ?
        .byte   $EF                             ; EE02 EF                       .
        .byte   $FC                             ; EE03 FC                       .
        .byte   $17                             ; EE04 17                       .
LEE05:  .byte   $57                             ; EE05 57                       W
LEE06:  .byte   $17                             ; EE06 17                       .
LEE07:  .byte   $EF                             ; EE07 EF                       .
LEE08:  .byte   $04                             ; EE08 04                       .
        .byte   $12                             ; EE09 12                       .
        stx     $12                             ; EE0A 86 12                    ..
        .byte   $3F                             ; EE0C 3F                       ?
        sty     $17                             ; EE0D 84 17                    ..
        eor     $FA,x                           ; EE0F 55 FA                    U.
        cpx     LF004                           ; EE11 EC 04 F0                 ...
        clc                                     ; EE14 18                       .
        .byte   $F2                             ; EE15 F2                       .
        cmp     ($82,x)                         ; EE16 C1 82                    ..
        .byte   $02                             ; EE18 02                       .
        .byte   $04                             ; EE19 04                       .
        cpx     #$46                            ; EE1A E0 46                    .F
        inc     $8203                           ; EE1C EE 03 82                 ...
        .byte   $03                             ; EE1F 03                       .
        .byte   $3F                             ; EE20 3F                       ?
        .byte   $03                             ; EE21 03                       .
        .byte   $3F                             ; EE22 3F                       ?
        .byte   $03                             ; EE23 03                       .
        .byte   $3F                             ; EE24 3F                       ?
        .byte   $03                             ; EE25 03                       .
        .byte   $3F                             ; EE26 3F                       ?
        .byte   $03                             ; EE27 03                       .
        .byte   $3F                             ; EE28 3F                       ?
        .byte   $03                             ; EE29 03                       .
        .byte   $3F                             ; EE2A 3F                       ?
        .byte   $03                             ; EE2B 03                       .
        .byte   $3F                             ; EE2C 3F                       ?
        sty     $02                             ; EE2D 84 02                    ..
        stx     $02                             ; EE2F 86 02                    ..
        sty     $02                             ; EE31 84 02                    ..
        .byte   $04                             ; EE33 04                       .
        stx     L0004                           ; EE34 86 04                    ..
        sty     L0004                           ; EE36 84 04                    ..
        ora     $86                             ; EE38 05 86                    ..
        ora     $84                             ; EE3A 05 84                    ..
        ora     L0006                           ; EE3C 05 06                    ..
        stx     L0006                           ; EE3E 86 06                    ..
        .byte   $82                             ; EE40 82                       .
        .byte   $02                             ; EE41 02                       .
        .byte   $04                             ; EE42 04                       .
        sed                                     ; EE43 F8                       .
        .byte   $1A                             ; EE44 1A                       .
        inc     $0784                           ; EE45 EE 84 07                 ...
        .byte   $82                             ; EE48 82                       .
        .byte   $07                             ; EE49 07                       .
        .byte   $3F                             ; EE4A 3F                       ?
        sty     $07                             ; EE4B 84 07                    ..
        .byte   $82                             ; EE4D 82                       .
        .byte   $07                             ; EE4E 07                       .
        .byte   $3F                             ; EE4F 3F                       ?
        .byte   $07                             ; EE50 07                       .
        .byte   $3F                             ; EE51 3F                       ?
        .byte   $07                             ; EE52 07                       .
        .byte   $3F                             ; EE53 3F                       ?
        sty     $07                             ; EE54 84 07                    ..
        .byte   $82                             ; EE56 82                       .
        .byte   $07                             ; EE57 07                       .
        .byte   $3F                             ; EE58 3F                       ?
        .byte   $07                             ; EE59 07                       .
        .byte   $3F                             ; EE5A 3F                       ?
        .byte   $07                             ; EE5B 07                       .
        .byte   $3F                             ; EE5C 3F                       ?
        sty     $07                             ; EE5D 84 07                    ..
        .byte   $82                             ; EE5F 82                       .
        .byte   $07                             ; EE60 07                       .
        .byte   $3F                             ; EE61 3F                       ?
        .byte   $07                             ; EE62 07                       .
        .byte   $3F                             ; EE63 3F                       ?
        .byte   $0B                             ; EE64 0B                       .
        .byte   $12                             ; EE65 12                       .
        .byte   $0B                             ; EE66 0B                       .
        ora     #$02                            ; EE67 09 02                    ..
        .byte   $04                             ; EE69 04                       .
        sty     $05                             ; EE6A 84 05                    ..
        .byte   $82                             ; EE6C 82                       .
        ora     $3F                             ; EE6D 05 3F                    .?
        sty     $05                             ; EE6F 84 05                    ..
        .byte   $82                             ; EE71 82                       .
        ora     $3F                             ; EE72 05 3F                    .?
        ora     $3F                             ; EE74 05 3F                    .?
        ora     $3F                             ; EE76 05 3F                    .?
        sty     $05                             ; EE78 84 05                    ..
        .byte   $82                             ; EE7A 82                       .
        ora     $3F                             ; EE7B 05 3F                    .?
        ora     $3F                             ; EE7D 05 3F                    .?
        ora     $3F                             ; EE7F 05 3F                    .?
        sty     $05                             ; EE81 84 05                    ..
        .byte   $82                             ; EE83 82                       .
        ora     $3F                             ; EE84 05 3F                    .?
        ora     $85                             ; EE86 05 85                    ..
        .byte   $3F                             ; EE88 3F                       ?
        sty     $05                             ; EE89 84 05                    ..
        .byte   $44                             ; EE8B 44                       D
        .byte   $04                             ; EE8C 04                       .
        .byte   $82                             ; EE8D 82                       .
        .byte   $04                             ; EE8E 04                       .
        .byte   $3F                             ; EE8F 3F                       ?
        .byte   $04                             ; EE90 04                       .
        .byte   $3F                             ; EE91 3F                       ?
        .byte   $04                             ; EE92 04                       .
        .byte   $3F                             ; EE93 3F                       ?
        .byte   $04                             ; EE94 04                       .
        .byte   $3F                             ; EE95 3F                       ?
        .byte   $04                             ; EE96 04                       .
        .byte   $3F                             ; EE97 3F                       ?
        sty     L0004                           ; EE98 84 04                    ..
        .byte   $43                             ; EE9A 43                       C
        .byte   $FA                             ; EE9B FA                       .
        brk                                     ; EE9C 00                       .
        ldx     $EE                             ; EE9D A6 EE                    ..
        ora     ($BA,x)                         ; EE9F 01 BA                    ..
        .byte   $EF                             ; EEA1 EF                       .
        .byte   $02                             ; EEA2 02                       .
        .byte   $34                             ; EEA3 34                       4
        sbc     ($FF),y                         ; EEA4 F1 FF                    ..
        cpx     LED07                           ; EEA6 EC 07 ED                 ...
        cpy     #$EE                            ; EEA9 C0 EE                    ..
        ora     $F0                             ; EEAB 05 F0                    ..
        .byte   $0C                             ; EEAD 0C                       .
        .byte   $F2                             ; EEAE F2                       .
        .byte   $C2                             ; EEAF C2                       .
        txa                                     ; EEB0 8A                       .
        .byte   $3F                             ; EEB1 3F                       ?
        .byte   $3F                             ; EEB2 3F                       ?
        .byte   $3F                             ; EEB3 3F                       ?
        .byte   $89                             ; EEB4 89                       .
        .byte   $3F                             ; EEB5 3F                       ?
        sty     $3F                             ; EEB6 84 3F                    .?
        .byte   $82                             ; EEB8 82                       .
        asl     $17,x                           ; EEB9 16 17                    ..
        cpx     #$99                            ; EEBB E0 99                    ..
        .byte   $EF                             ; EEBD EF                       .
        sty     $3F                             ; EEBE 84 3F                    .?
        .byte   $82                             ; EEC0 82                       .
        .byte   $17                             ; EEC1 17                       .
        ora     $99E0,y                         ; EEC2 19 E0 99                 ...
        .byte   $EF                             ; EEC5 EF                       .
        stx     $12                             ; EEC6 86 12                    ..
        sty     $10                             ; EEC8 84 10                    ..
        .byte   $14                             ; EECA 14                       .
        .byte   $3F                             ; EECB 3F                       ?
        stx     $17                             ; EECC 86 17                    ..
        sty     $17                             ; EECE 84 17                    ..
        ora     $1B17,y                         ; EED0 19 17 1B                 ...
        jsr     L861B                           ; EED3 20 1B 86                  ..
        .byte   $17                             ; EED6 17                       .
        sty     $14                             ; EED7 84 14                    ..
        stx     $17                             ; EED9 86 17                    ..
        sty     $16                             ; EEDB 84 16                    ..
        stx     $17                             ; EEDD 86 17                    ..
        ora     L1B84,y                         ; EEDF 19 84 1B                 ...
        stx     $20                             ; EEE2 86 20                    . 
        sty     $1B                             ; EEE4 84 1B                    ..
        ora     $8717,y                         ; EEE6 19 17 87                 ...
        bit     $86                             ; EEE9 24 86                    $.
        .byte   $22                             ; EEEB 22                       "
        .byte   $82                             ; EEEC 82                       .
LEEED:  bpl     LEF01                           ; EEED 10 12                    ..
        .byte   $14                             ; EEEF 14                       .
        asl     $17,x                           ; EEF0 16 17                    ..
        sty     $19                             ; EEF2 84 19                    ..
        .byte   $82                             ; EEF4 82                       .
        .byte   $1B                             ; EEF5 1B                       .
        stx     $20                             ; EEF6 86 20                    . 
        .byte   $22                             ; EEF8 22                       "
        bit     $84                             ; EEF9 24 84                    $.
        .byte   $22                             ; EEFB 22                       "
        stx     $1B                             ; EEFC 86 1B                    ..
        sty     $19                             ; EEFE 84 19                    ..
        .byte   $82                             ; EF00 82                       .
LEF01:  .byte   $1B                             ; EF01 1B                       .
        ora     $1417,y                         ; EF02 19 17 14                 ...
        sty     $14                             ; EF05 84 14                    ..
        .byte   $17                             ; EF07 17                       .
        .byte   $87                             ; EF08 87                       .
        .byte   $3F                             ; EF09 3F                       ?
        sty     $14                             ; EF0A 84 14                    ..
        .byte   $17                             ; EF0C 17                       .
        .byte   $1B                             ; EF0D 1B                       .
        dey                                     ; EF0E 88                       .
        .byte   $62                             ; EF0F 62                       b
        sty     $22                             ; EF10 84 22                    ."
        .byte   $17                             ; EF12 17                       .
        stx     $19                             ; EF13 86 19                    ..
        sbc     $8A80                           ; EF15 ED 80 8A                 ...
        .byte   $62                             ; EF18 62                       b
        dey                                     ; EF19 88                       .
        .byte   $22                             ; EF1A 22                       "
        sty     $1B20                           ; EF1B 8C 20 1B                 . .
        sta     $20                             ; EF1E 85 20                    . 
        .byte   $87                             ; EF20 87                       .
        .byte   $1B                             ; EF21 1B                       .
        sty     $17                             ; EF22 84 17                    ..
        stx     $19                             ; EF24 86 19                    ..
        sty     $1B                             ; EF26 84 1B                    ..
        .byte   $54                             ; EF28 54                       T
        .byte   $14                             ; EF29 14                       .
        .byte   $12                             ; EF2A 12                       .
        .byte   $87                             ; EF2B 87                       .
        .byte   $12                             ; EF2C 12                       .
        .byte   $82                             ; EF2D 82                       .
        .byte   $12                             ; EF2E 12                       .
        .byte   $14                             ; EF2F 14                       .
LEF30:  asl     $17,x                           ; EF30 16 17                    ..
        sty     $19                             ; EF32 84 19                    ..
        stx     $17                             ; EF34 86 17                    ..
        sty     $14                             ; EF36 84 14                    ..
        stx     $17                             ; EF38 86 17                    ..
        .byte   $82                             ; EF3A 82                       .
        .byte   $53                             ; EF3B 53                       S
        .byte   $14                             ; EF3C 14                       .
        sty     $17                             ; EF3D 84 17                    ..
        .byte   $14                             ; EF3F 14                       .
        stx     $19                             ; EF40 86 19                    ..
        sty     $1B                             ; EF42 84 1B                    ..
        stx     $14                             ; EF44 86 14                    ..
        sty     $12                             ; EF46 84 12                    ..
        stx     $22                             ; EF48 86 22                    ."
        jsr     L1B84                           ; EF4A 20 84 1B                  ..
        .byte   $87                             ; EF4D 87                       .
        ora     $2382,y                         ; EF4E 19 82 23                 ..#
        sta     $24                             ; EF51 85 24                    .$
        dey                                     ; EF53 88                       .
        .byte   $22                             ; EF54 22                       "
        sty     $3F                             ; EF55 84 3F                    .?
        .byte   $82                             ; EF57 82                       .
        .byte   $12                             ; EF58 12                       .
        .byte   $14                             ; EF59 14                       .
        asl     $17,x                           ; EF5A 16 17                    ..
        sty     $19                             ; EF5C 84 19                    ..
        txa                                     ; EF5E 8A                       .
        .byte   $62                             ; EF5F 62                       b
        dey                                     ; EF60 88                       .
        .byte   $22                             ; EF61 22                       "
        sty     $2627                           ; EF62 8C 27 26                 .'&
        sta     $27                             ; EF65 85 27                    .'
        stx     $24                             ; EF67 86 24                    .$
        sty     $20                             ; EF69 84 20                    . 
        .byte   $87                             ; EF6B 87                       .
        .byte   $22                             ; EF6C 22                       "
        sty     $24                             ; EF6D 84 24                    .$
        .byte   $5B                             ; EF6F 5B                       [
        .byte   $1B                             ; EF70 1B                       .
        ora     $1988,y                         ; EF71 19 88 19                 ...
        stx     $1B                             ; EF74 86 1B                    ..
        .byte   $89                             ; EF76 89                       .
        .byte   $17                             ; EF77 17                       .
        stx     $22                             ; EF78 86 22                    ."
        .byte   $89                             ; EF7A 89                       .
        .byte   $1B                             ; EF7B 1B                       .
        sty     $24                             ; EF7C 84 24                    .$
        .byte   $22                             ; EF7E 22                       "
        stx     $27                             ; EF7F 86 27                    .'
        sty     $24                             ; EF81 84 24                    .$
        .byte   $22                             ; EF83 22                       "
        stx     $27                             ; EF84 86 27                    .'
        .byte   $64                             ; EF86 64                       d
        bit     $27                             ; EF87 24 27                    $'
        sty     $27                             ; EF89 84 27                    .'
        .byte   $87                             ; EF8B 87                       .
        and     #$8A                            ; EF8C 29 8A                    ).
        .byte   $67                             ; EF8E 67                       g
        stx     $27                             ; EF8F 86 27                    .'
        sty     $16                             ; EF91 84 16                    ..
        .byte   $82                             ; EF93 82                       .
        asl     $16,x                           ; EF94 16 16                    ..
        sty     $17                             ; EF96 84 17                    ..
        .byte   $FF                             ; EF98 FF                       .
        .byte   $87                             ; EF99 87                       .
        .byte   $22                             ; EF9A 22                       "
        .byte   $82                             ; EF9B 82                       .
        asl     $17,x                           ; EF9C 16 17                    ..
        sty     $22                             ; EF9E 84 22                    ."
        jsr     L201B                           ; EFA0 20 1B 20                  . 
        .byte   $17                             ; EFA3 17                       .
        .byte   $82                             ; EFA4 82                       .
        asl     $57,x                           ; EFA5 16 57                    .W
        stx     $17                             ; EFA7 86 17                    ..
        .byte   $3F                             ; EFA9 3F                       ?
        sty     $12                             ; EFAA 84 12                    ..
        .byte   $14                             ; EFAC 14                       .
        .byte   $87                             ; EFAD 87                       .
        ora     $82,x                           ; EFAE 15 82                    ..
        .byte   $12                             ; EFB0 12                       .
        .byte   $14                             ; EFB1 14                       .
        sty     $15                             ; EFB2 84 15                    ..
        .byte   $17                             ; EFB4 17                       .
        ora     $893F,y                         ; EFB5 19 3F 89                 .?.
        .byte   $12                             ; EFB8 12                       .
        .byte   $FA                             ; EFB9 FA                       .
        cpx     #$07                            ; EFBA E0 07                    ..
        sbc     ($E0),y                         ; EFBC F1 E0                    ..
        .byte   $07                             ; EFBE 07                       .
        sbc     ($E0),y                         ; EFBF F1 E0                    ..
        .byte   $07                             ; EFC1 07                       .
        sbc     ($E0),y                         ; EFC2 F1 E0                    ..
        .byte   $07                             ; EFC4 07                       .
        sbc     ($E0),y                         ; EFC5 F1 E0                    ..
        .byte   $07                             ; EFC7 07                       .
        sbc     ($E0),y                         ; EFC8 F1 E0                    ..
        .byte   $07                             ; EFCA 07                       .
        sbc     ($E0),y                         ; EFCB F1 E0                    ..
        .byte   $22                             ; EFCD 22                       "
        sbc     ($ED),y                         ; EFCE F1 ED                    ..
        .byte   $80                             ; EFD0 80                       .
        inc     $8406                           ; EFD1 EE 06 84                 ...
        .byte   $12                             ; EFD4 12                       .
        .byte   $82                             ; EFD5 82                       .
        .byte   $22                             ; EFD6 22                       "
        .byte   $22                             ; EFD7 22                       "
        sty     $20                             ; EFD8 84 20                    . 
        .byte   $1B                             ; EFDA 1B                       .
        .byte   $82                             ; EFDB 82                       .
        ora     $1712,y                         ; EFDC 19 12 17                 ...
        ora     $EE,y                           ; EFDF 19 EE 00                 ...
LEFE2:  .byte   $02                             ; EFE2 02                       .
        .byte   $04                             ; EFE3 04                       .
        asl     $07                             ; EFE4 06 07                    ..
        cpx     #$07                            ; EFE6 E0 07                    ..
        sbc     ($E0),y                         ; EFE8 F1 E0                    ..
        .byte   $07                             ; EFEA 07                       .
        sbc     ($E0),y                         ; EFEB F1 E0                    ..
        .byte   $22                             ; EFED 22                       "
        sbc     ($ED),y                         ; EFEE F1 ED                    ..
        rti                                     ; EFF0 40                       @

; ----------------------------------------------------------------------------
        inc     LEC06                           ; EFF1 EE 06 EC                 ...
        php                                     ; EFF4 08                       .
        sty     $12                             ; EFF5 84 12                    ..
        .byte   $22                             ; EFF7 22                       "
        .byte   $12                             ; EFF8 12                       .
        jsr     L1B12                           ; EFF9 20 12 1B                  ..
        .byte   $12                             ; EFFC 12                       .
        ora     $80ED,y                         ; EFFD 19 ED 80                 ...
LF000:  .byte   $F2                             ; F000 F2                       .
LF001:  .byte   $B5                             ; F001 B5                       .
LF002:  .byte   $82                             ; F002 82                       .
        .byte   $20                             ; F003 20                        
LF004:  .byte   $20                             ; F004 20                        
LF005:  .byte   $27                             ; F005 27                       '
        .byte   $27                             ; F006 27                       '
LF007:  bmi     LF039                           ; F007 30 30                    00
        .byte   $37                             ; F009 37                       7
        .byte   $37                             ; F00A 37                       7
        bmi     LF03F                           ; F00B 30 32                    02
LF00D:  bmi     LF041                           ; F00D 30 32                    02
        bmi     LF043                           ; F00F 30 32                    02
        bmi     LF045                           ; F011 30 32                    02
        .byte   $1B                             ; F013 1B                       .
        .byte   $1B                             ; F014 1B                       .
        .byte   $27                             ; F015 27                       '
        .byte   $27                             ; F016 27                       '
        .byte   $2B                             ; F017 2B                       +
        .byte   $2B                             ; F018 2B                       +
        .byte   $37                             ; F019 37                       7
        .byte   $37                             ; F01A 37                       7
        .byte   $2B                             ; F01B 2B                       +
        bmi     LF049                           ; F01C 30 2B                    0+
        bmi     LF04B                           ; F01E 30 2B                    0+
        bmi     LF04D                           ; F020 30 2B                    0+
        bmi     LF03D                           ; F022 30 19                    0.
        ora     $2626,y                         ; F024 19 26 26                 .&&
        .byte   $32                             ; F027 32                       2
        .byte   $32                             ; F028 32                       2
        rol     $36,x                           ; F029 36 36                    66
        bmi     LF05F                           ; F02B 30 32                    02
        bmi     LF061                           ; F02D 30 32                    02
        bmi     LF063                           ; F02F 30 32                    02
        bmi     LF065                           ; F031 30 32                    02
        sbc     LF240                           ; F033 ED 40 F2                 .@.
        cmp     ($EC,x)                         ; F036 C1 EC                    ..
        .byte   $07                             ; F038 07                       .
LF039:  sty     $27                             ; F039 84 27                    .'
        rol     $24                             ; F03B 26 24                    &$
LF03D:  .byte   $87                             ; F03D 87                       .
        .byte   $30                             ; F03E 30                       0
LF03F:  stx     $2B                             ; F03F 86 2B                    .+
LF041:  .byte   $82                             ; F041 82                       .
        .byte   $19                             ; F042 19                       .
LF043:  .byte   $1B                             ; F043 1B                       .
        .byte   $20                             ; F044 20                        
LF045:  .byte   $22                             ; F045 22                       "
        bit     $84                             ; F046 24 84                    $.
        .byte   $26                             ; F048 26                       &
LF049:  .byte   $ED                             ; F049 ED                       .
        .byte   $80                             ; F04A 80                       .
LF04B:  .byte   $F2                             ; F04B F2                       .
        .byte   $B5                             ; F04C B5                       .
LF04D:  .byte   $82                             ; F04D 82                       .
        .byte   $27                             ; F04E 27                       '
        rol     $37,x                           ; F04F 36 37                    67
        rol     $34,x                           ; F051 36 34                    64
        .byte   $32                             ; F053 32                       2
        .byte   $37                             ; F054 37                       7
        rol     $37,x                           ; F055 36 37                    67
        sbc     LF240                           ; F057 ED 40 F2                 .@.
        cmp     ($86,x)                         ; F05A C1 86                    ..
        bmi     LEFE2                           ; F05C 30 84                    0.
        .byte   $2B                             ; F05E 2B                       +
LF05F:  .byte   $27                             ; F05F 27                       '
        .byte   $ED                             ; F060 ED                       .
LF061:  .byte   $80                             ; F061 80                       .
        .byte   $F2                             ; F062 F2                       .
LF063:  lda     $82,x                           ; F063 B5 82                    ..
LF065:  rol     $37,x                           ; F065 36 37                    67
        rol     $37,x                           ; F067 36 37                    67
        rol     $37,x                           ; F069 36 37                    67
        rol     $37,x                           ; F06B 36 37                    67
        sty     $20                             ; F06D 84 20                    . 
        bit     $82                             ; F06F 24 82                    $.
        .byte   $34                             ; F071 34                       4
        .byte   $34                             ; F072 34                       4
        .byte   $37                             ; F073 37                       7
        .byte   $37                             ; F074 37                       7
        .byte   $34                             ; F075 34                       4
        .byte   $34                             ; F076 34                       4
        .byte   $37                             ; F077 37                       7
        .byte   $37                             ; F078 37                       7
        sty     $34                             ; F079 84 34                    .4
        .byte   $37                             ; F07B 37                       7
        cpx     LED07                           ; F07C EC 07 ED                 ...
        rti                                     ; F07F 40                       @

; ----------------------------------------------------------------------------
        .byte   $F2                             ; F080 F2                       .
        cmp     ($88,x)                         ; F081 C1 88                    ..
        .byte   $6B                             ; F083 6B                       k
        sty     $2B                             ; F084 84 2B                    .+
        bit     $86                             ; F086 24 86                    $.
        rol     $F0                             ; F088 26 F0                    &.
        .byte   $0C                             ; F08A 0C                       .
        sbc     LEC80                           ; F08B ED 80 EC                 ...
        ora     #$C5                            ; F08E 09 C5                    ..
        .byte   $82                             ; F090 82                       .
        .byte   $32                             ; F091 32                       2
        bmi     LF0BF                           ; F092 30 2B                    0+
        and     #$30                            ; F094 29 30                    )0
        .byte   $2B                             ; F096 2B                       +
        and     #$27                            ; F097 29 27                    )'
        .byte   $2B                             ; F099 2B                       +
        and     #$27                            ; F09A 29 27                    )'
        bit     $29                             ; F09C 24 29                    $)
        .byte   $27                             ; F09E 27                       '
        bit     $22                             ; F09F 24 22                    $"
        sbc     $08EC,y                         ; F0A1 F9 EC 08                 ...
        sbc     $8680                           ; F0A4 ED 80 86                 ...
        ora     $1784,y                         ; F0A7 19 84 17                 ...
        .byte   $87                             ; F0AA 87                       .
        asl     $82,x                           ; F0AB 16 82                    ..
        asl     $85,x                           ; F0AD 16 85                    ..
        .byte   $17                             ; F0AF 17                       .
        dey                                     ; F0B0 88                       .
        ora     $3F84,y                         ; F0B1 19 84 3F                 ..?
        .byte   $82                             ; F0B4 82                       .
        .byte   $0B                             ; F0B5 0B                       .
        bpl     LF0CA                           ; F0B6 10 12                    ..
        .byte   $14                             ; F0B8 14                       .
        sty     $16                             ; F0B9 84 16                    ..
        cpx     LED09                           ; F0BB EC 09 ED                 ...
        .byte   $80                             ; F0BE 80                       .
LF0BF:  .byte   $C2                             ; F0BF C2                       .
        .byte   $82                             ; F0C0 82                       .
        .byte   $32                             ; F0C1 32                       2
        bmi     LF0EF                           ; F0C2 30 2B                    0+
        and     #$30                            ; F0C4 29 30                    )0
        .byte   $2B                             ; F0C6 2B                       +
        and     #$27                            ; F0C7 29 27                    )'
        .byte   $2B                             ; F0C9 2B                       +
LF0CA:  and     #$27                            ; F0CA 29 27                    )'
        bit     $29                             ; F0CC 24 29                    $)
        .byte   $27                             ; F0CE 27                       '
        bit     $22                             ; F0CF 24 22                    $"
        sbc     $3032,y                         ; F0D1 F9 32 30                 .20
        .byte   $2B                             ; F0D4 2B                       +
        and     #$30                            ; F0D5 29 30                    )0
        .byte   $2B                             ; F0D7 2B                       +
        and     #$27                            ; F0D8 29 27                    )'
        .byte   $2B                             ; F0DA 2B                       +
        and     #$27                            ; F0DB 29 27                    )'
        bit     $EC                             ; F0DD 24 EC                    $.
        .byte   $07                             ; F0DF 07                       .
        sbc     $8600                           ; F0E0 ED 00 86                 ...
        ora     $1489,y                         ; F0E3 19 89 14                 ...
        stx     $1B                             ; F0E6 86 1B                    ..
        .byte   $89                             ; F0E8 89                       .
        .byte   $17                             ; F0E9 17                       .
        sty     $20                             ; F0EA 84 20                    . 
        .byte   $1B                             ; F0EC 1B                       .
        stx     $24                             ; F0ED 86 24                    .$
LF0EF:  sty     $20                             ; F0EF 84 20                    . 
        .byte   $1B                             ; F0F1 1B                       .
        stx     $24                             ; F0F2 86 24                    .$
LF0F4:  rts                                     ; F0F4 60                       `

; ----------------------------------------------------------------------------
        jsr     L8424                           ; F0F5 20 24 84                  $.
        bit     $87                             ; F0F8 24 87                    $.
        bit     $8A                             ; F0FA 24 8A                    $.
        .byte   $62                             ; F0FC 62                       b
        stx     $22                             ; F0FD 86 22                    ."
LF0FF:  sty     $10                             ; F0FF 84 10                    ..
        .byte   $82                             ; F101 82                       .
LF102:  bpl     LF114                           ; F102 10 10                    ..
        sty     $12                             ; F104 84 12                    ..
        .byte   $FF                             ; F106 FF                       .
        cpx     LED09                           ; F107 EC 09 ED                 ...
        brk                                     ; F10A 00                       .
        .byte   $EE                             ; F10B EE                       .
LF10C:  .byte   $02                             ; F10C 02                       .
        beq     $F10F                           ; F10D F0 00                    ..
        .byte   $F3                             ; F10F F3                       .
        .byte   $82                             ; F110 82                       .
        .byte   $07                             ; F111 07                       .
        asl     L0004                           ; F112 06 04                    ..
LF114:  .byte   $02                             ; F114 02                       .
        .byte   $07                             ; F115 07                       .
        asl     L0004                           ; F116 06 04                    ..
        .byte   $02                             ; F118 02                       .
        .byte   $07                             ; F119 07                       .
        asl     L0004                           ; F11A 06 04                    ..
        .byte   $02                             ; F11C 02                       .
        .byte   $04                             ; F11D 04                       .
        asl     $07                             ; F11E 06 07                    ..
        ora     #$FA                            ; F120 09 FA                    ..
        .byte   $82                             ; F122 82                       .
        ora     L0004                           ; F123 05 04                    ..
        .byte   $02                             ; F125 02                       .
        brk                                     ; F126 00                       .
        ora     L0004                           ; F127 05 04                    ..
        .byte   $02                             ; F129 02                       .
        brk                                     ; F12A 00                       .
        ora     L0004                           ; F12B 05 04                    ..
        .byte   $02                             ; F12D 02                       .
        brk                                     ; F12E 00                       .
        .byte   $02                             ; F12F 02                       .
LF130:  .byte   $04                             ; F130 04                       .
        ora     $07                             ; F131 05 07                    ..
        .byte   $FA                             ; F133 FA                       .
        cpx     #$64                            ; F134 E0 64                    .d
LF136:  .byte   $F5                             ; F136 F5                       .
LF137:  cpx     #$02                            ; F137 E0 02                    ..
        .byte   $F2                             ; F139 F2                       .
        cpx     #$02                            ; F13A E0 02                    ..
        .byte   $F2                             ; F13C F2                       .
        cpx     #$02                            ; F13D E0 02                    ..
        .byte   $F2                             ; F13F F2                       .
        cpx     #$02                            ; F140 E0 02                    ..
        .byte   $F2                             ; F142 F2                       .
        cpx     #$02                            ; F143 E0 02                    ..
        .byte   $F2                             ; F145 F2                       .
        cpx     #$02                            ; F146 E0 02                    ..
        .byte   $F2                             ; F148 F2                       .
        cpx     #$08                            ; F149 E0 08                    ..
        .byte   $F2                             ; F14B F2                       .
        cpx     #$02                            ; F14C E0 02                    ..
        .byte   $F2                             ; F14E F2                       .
        cpx     #$02                            ; F14F E0 02                    ..
        .byte   $F2                             ; F151 F2                       .
        cpx     #$08                            ; F152 E0 08                    ..
        .byte   $F2                             ; F154 F2                       .
        sty     $10                             ; F155 84 10                    ..
        bpl     LF170                           ; F157 10 17                    ..
        bpl     LF19A                           ; F159 10 3F                    .?
        .byte   $82                             ; F15B 82                       .
        .byte   $12                             ; F15C 12                       .
        .byte   $14                             ; F15D 14                       .
        sty     $17                             ; F15E 84 17                    ..
        ora     $1784,y                         ; F160 19 84 17                 ...
        .byte   $17                             ; F163 17                       .
        .byte   $3F                             ; F164 3F                       ?
        .byte   $17                             ; F165 17                       .
        .byte   $3F                             ; F166 3F                       ?
        .byte   $82                             ; F167 82                       .
        .byte   $1B                             ; F168 1B                       .
        jsr     L191B                           ; F169 20 1B 19                  ..
        sty     $17                             ; F16C 84 17                    ..
        .byte   $12                             ; F16E 12                       .
        .byte   $12                             ; F16F 12                       .
LF170:  ora     $3F12,y                         ; F170 19 12 3F                 ..?
        .byte   $82                             ; F173 82                       .
        asl     $17,x                           ; F174 16 17                    ..
        sty     $19                             ; F176 84 19                    ..
        .byte   $22                             ; F178 22                       "
        .byte   $14                             ; F179 14                       .
        .byte   $14                             ; F17A 14                       .
        bit     $14                             ; F17B 24 14                    $.
        .byte   $3F                             ; F17D 3F                       ?
        .byte   $14                             ; F17E 14                       .
LF17F:  stx     $12                             ; F17F 86 12                    ..
        sty     $10                             ; F181 84 10                    ..
        bpl     LF10C                           ; F183 10 87                    ..
        .byte   $3F                             ; F185 3F                       ?
        .byte   $82                             ; F186 82                       .
        jsr     L191B                           ; F187 20 1B 19                  ..
        .byte   $17                             ; F18A 17                       .
        sty     $14                             ; F18B 84 14                    ..
        .byte   $0B                             ; F18D 0B                       .
        .byte   $0B                             ; F18E 0B                       .
        .byte   $3F                             ; F18F 3F                       ?
        stx     $17                             ; F190 86 17                    ..
        .byte   $14                             ; F192 14                       .
        sty     $10                             ; F193 84 10                    ..
        ora     #$09                            ; F195 09 09                    ..
        .byte   $87                             ; F197 87                       .
        .byte   $3F                             ; F198 3F                       ?
        .byte   $84                             ; F199 84                       .
LF19A:  .byte   $0B                             ; F19A 0B                       .
        stx     $10                             ; F19B 86 10                    ..
        sty     $12                             ; F19D 84 12                    ..
        .byte   $12                             ; F19F 12                       .
        .byte   $3F                             ; F1A0 3F                       ?
        .byte   $3F                             ; F1A1 3F                       ?
        .byte   $3F                             ; F1A2 3F                       ?
        .byte   $14                             ; F1A3 14                       .
        stx     $16                             ; F1A4 86 16                    ..
        cpx     #$11                            ; F1A6 E0 11                    ..
        .byte   $F2                             ; F1A8 F2                       .
        .byte   $87                             ; F1A9 87                       .
        bpl     LF130                           ; F1AA 10 84                    ..
        bpl     LF136                           ; F1AC 10 88                    ..
        bpl     LF137                           ; F1AE 10 87                    ..
        .byte   $0B                             ; F1B0 0B                       .
        sty     $0B                             ; F1B1 84 0B                    ..
        dey                                     ; F1B3 88                       .
        .byte   $0B                             ; F1B4 0B                       .
        .byte   $87                             ; F1B5 87                       .
        ora     #$84                            ; F1B6 09 84                    ..
        ora     #$88                            ; F1B8 09 88                    ..
        ora     #$86                            ; F1BA 09 86                    ..
        .byte   $12                             ; F1BC 12                       .
        sta     $22                             ; F1BD 85 22                    ."
        .byte   $82                             ; F1BF 82                       .
        .byte   $12                             ; F1C0 12                       .
        sty     $12                             ; F1C1 84 12                    ..
        .byte   $12                             ; F1C3 12                       .
        .byte   $14                             ; F1C4 14                       .
        asl     $E0,x                           ; F1C5 16 E0                    ..
        ora     ($F2),y                         ; F1C7 11 F2                    ..
        sty     $3F                             ; F1C9 84 3F                    .?
        bpl     LF1DD                           ; F1CB 10 10                    ..
        jsr     L3F10                           ; F1CD 20 10 3F                  .?
        stx     $10                             ; F1D0 86 10                    ..
        sty     $3F                             ; F1D2 84 3F                    .?
        .byte   $0B                             ; F1D4 0B                       .
        .byte   $0B                             ; F1D5 0B                       .
        .byte   $1B                             ; F1D6 1B                       .
        .byte   $0B                             ; F1D7 0B                       .
        .byte   $3F                             ; F1D8 3F                       ?
        stx     $0B                             ; F1D9 86 0B                    ..
        sty     $09                             ; F1DB 84 09                    ..
LF1DD:  ora     $0919,y                         ; F1DD 19 19 09                 ...
        ora     #$19                            ; F1E0 09 19                    ..
        ora     $860B,y                         ; F1E2 19 0B 86                 ...
        .byte   $12                             ; F1E5 12                       .
        sta     $22                             ; F1E6 85 22                    ."
        .byte   $82                             ; F1E8 82                       .
        .byte   $12                             ; F1E9 12                       .
        sty     $12                             ; F1EA 84 12                    ..
        .byte   $12                             ; F1EC 12                       .
        .byte   $14                             ; F1ED 14                       .
        asl     $17,x                           ; F1EE 16 17                    ..
        stx     $3F                             ; F1F0 86 3F                    .?
        sty     $14                             ; F1F2 84 14                    ..
        .byte   $3F                             ; F1F4 3F                       ?
        .byte   $12                             ; F1F5 12                       .
        .byte   $3F                             ; F1F6 3F                       ?
        bpl     LF17F                           ; F1F7 10 86                    ..
        .byte   $07                             ; F1F9 07                       .
        sty     L0006                           ; F1FA 84 06                    ..
        .byte   $82                             ; F1FC 82                       .
        asl     L0006                           ; F1FD 06 06                    ..
        .byte   $84                             ; F1FF 84                       .
LF200:  .byte   $07                             ; F200 07                       .
        .byte   $FF                             ; F201 FF                       .
        stx     $17                             ; F202 86 17                    ..
LF204:  .byte   $17                             ; F204 17                       .
LF205:  .byte   $17                             ; F205 17                       .
        .byte   $17                             ; F206 17                       .
        .byte   $FA                             ; F207 FA                       .
        ora     $15,x                           ; F208 15 15                    ..
        ora     $15,x                           ; F20A 15 15                    ..
        .byte   $12                             ; F20C 12                       .
        .byte   $12                             ; F20D 12                       .
        .byte   $12                             ; F20E 12                       .
        .byte   $12                             ; F20F 12                       .
        .byte   $FA                             ; F210 FA                       .
        .byte   $87                             ; F211 87                       .
        .byte   $17                             ; F212 17                       .
        sty     $17                             ; F213 84 17                    ..
        .byte   $87                             ; F215 87                       .
        .byte   $17                             ; F216 17                       .
        sty     $56                             ; F217 84 56                    .V
        asl     $16,x                           ; F219 16 16                    ..
        stx     $16                             ; F21B 86 16                    ..
        sty     $1616                           ; F21D 8C 16 16                 ...
        sta     $16                             ; F220 85 16                    ..
        .byte   $87                             ; F222 87                       .
        .byte   $14                             ; F223 14                       .
        sty     $14                             ; F224 84 14                    ..
        .byte   $87                             ; F226 87                       .
        .byte   $14                             ; F227 14                       .
        sty     $52                             ; F228 84 52                    .R
        .byte   $12                             ; F22A 12                       .
        .byte   $12                             ; F22B 12                       .
        stx     $12                             ; F22C 86 12                    ..
        .byte   $3F                             ; F22E 3F                       ?
        .byte   $12                             ; F22F 12                       .
        .byte   $FA                             ; F230 FA                       .
        brk                                     ; F231 00                       .
        .byte   $3B                             ; F232 3B                       ;
        .byte   $F2                             ; F233 F2                       .
        ora     ($82,x)                         ; F234 01 82                    ..
        .byte   $F2                             ; F236 F2                       .
        .byte   $02                             ; F237 02                       .
        lda     LFFF2,x                         ; F238 BD F2 FF                 ...
        cpx     LED07                           ; F23B EC 07 ED                 ...
        cpy     #$EE                            ; F23E C0 EE                    ..
LF240:  .byte   $03                             ; F240 03                       .
        beq     LF24F                           ; F241 F0 0C                    ..
        cpx     #$76                            ; F243 E0 76                    .v
LF245:  .byte   $F2                             ; F245 F2                       .
        txs                                     ; F246 9A                       .
        asl     $E0,x                           ; F247 16 E0                    ..
        ror     $F2,x                           ; F249 76 F2                    v.
        sta     $9416,y                         ; F24B 99 16 94                 ...
        .byte   $15                             ; F24E 15                       .
LF24F:  .byte   $14                             ; F24F 14                       .
        cpx     LF205                           ; F250 EC 05 F2                 ...
        lda     $ED,x                           ; F253 B5 ED                    ..
        bcc     LF245                           ; F255 90 EE                    ..
        ora     $C1                             ; F257 05 C1                    ..
        .byte   $92                             ; F259 92                       .
        clc                                     ; F25A 18                       .
        clc                                     ; F25B 18                       .
        clc                                     ; F25C 18                       .
        clc                                     ; F25D 18                       .
        clc                                     ; F25E 18                       .
        .byte   $3F                             ; F25F 3F                       ?
        clc                                     ; F260 18                       .
        clc                                     ; F261 18                       .
        clc                                     ; F262 18                       .
        clc                                     ; F263 18                       .
        clc                                     ; F264 18                       .
        .byte   $3F                             ; F265 3F                       ?
        stx     $22,y                           ; F266 96 22                    ."
        sbc     $96F3,y                         ; F268 F9 F3 96                 ...
        rol     $25                             ; F26B 26 25                    &%
        bit     $23                             ; F26D 24 23                    $#
        .byte   $23                             ; F26F 23                       #
        .byte   $22                             ; F270 22                       "
        and     ($20,x)                         ; F271 21 20                    ! 
        sed                                     ; F273 F8                       .
        .byte   $3B                             ; F274 3B                       ;
        .byte   $F2                             ; F275 F2                       .
        .byte   $92                             ; F276 92                       .
LF277:  pha                                     ; F277 48                       H
        .byte   $12                             ; F278 12                       .
        tya                                     ; F279 98                       .
        cli                                     ; F27A 58                       X
        sty     $18,x                           ; F27B 94 18                    ..
        .byte   $17                             ; F27D 17                       .
        .byte   $92                             ; F27E 92                       .
        clc                                     ; F27F 18                       .
        .byte   $17                             ; F280 17                       .
        .byte   $FA                             ; F281 FA                       .
        cpx     LF205                           ; F282 EC 05 F2                 ...
        and     $ED,x                           ; F285 35 ED                    5.
        bcc     LF277                           ; F287 90 EE                    ..
        .byte   $07                             ; F289 07                       .
        beq     LF2A4                           ; F28A F0 18                    ..
        .byte   $C3                             ; F28C C3                       .
        sty     $23,x                           ; F28D 94 23                    .#
        .byte   $33                             ; F28F 33                       3
        .byte   $3F                             ; F290 3F                       ?
        .byte   $23                             ; F291 23                       #
        .byte   $33                             ; F292 33                       3
        .byte   $3F                             ; F293 3F                       ?
        .byte   $23                             ; F294 23                       #
        .byte   $33                             ; F295 33                       3
        sbc     $0CF0,y                         ; F296 F9 F0 0C                 ...
        .byte   $F2                             ; F299 F2                       .
        lda     $EC,x                           ; F29A B5 EC                    ..
        ora     $EE                             ; F29C 05 EE                    ..
        ora     $C1                             ; F29E 05 C1                    ..
        .byte   $92                             ; F2A0 92                       .
        .byte   $17                             ; F2A1 17                       .
        .byte   $17                             ; F2A2 17                       .
        .byte   $17                             ; F2A3 17                       .
LF2A4:  .byte   $17                             ; F2A4 17                       .
        .byte   $17                             ; F2A5 17                       .
        .byte   $3F                             ; F2A6 3F                       ?
        .byte   $17                             ; F2A7 17                       .
        .byte   $17                             ; F2A8 17                       .
        .byte   $17                             ; F2A9 17                       .
        .byte   $17                             ; F2AA 17                       .
        .byte   $17                             ; F2AB 17                       .
        .byte   $3F                             ; F2AC 3F                       ?
        stx     $21,y                           ; F2AD 96 21                    .!
        sbc     $96F3,y                         ; F2AF F9 F3 96                 ...
        .byte   $22                             ; F2B2 22                       "
        and     ($20,x)                         ; F2B3 21 20                    ! 
        .byte   $1B                             ; F2B5 1B                       .
        ora     $1919,y                         ; F2B6 19 19 19                 ...
        ora     $82F8,y                         ; F2B9 19 F8 82                 ...
        .byte   $F2                             ; F2BC F2                       .
        cpx     LF204                           ; F2BD EC 04 F2                 ...
        sta     ($F0),y                         ; F2C0 91 F0                    ..
        .byte   $0C                             ; F2C2 0C                       .
        cmp     ($94,x)                         ; F2C3 C1 94                    ..
        .byte   $17                             ; F2C5 17                       .
        clc                                     ; F2C6 18                       .
        ora     $18,x                           ; F2C7 15 18                    ..
        .byte   $17                             ; F2C9 17                       .
        clc                                     ; F2CA 18                       .
        ora     $18,x                           ; F2CB 15 18                    ..
        stx     $17,y                           ; F2CD 96 17                    ..
        clc                                     ; F2CF 18                       .
        ora     $18,x                           ; F2D0 15 18                    ..
        sbc     $94C1,y                         ; F2D2 F9 C1 94                 ...
        .byte   $12                             ; F2D5 12                       .
        .byte   $13                             ; F2D6 13                       .
        .byte   $0B                             ; F2D7 0B                       .
        .byte   $13                             ; F2D8 13                       .
        .byte   $12                             ; F2D9 12                       .
        .byte   $13                             ; F2DA 13                       .
        .byte   $0B                             ; F2DB 0B                       .
        .byte   $0B                             ; F2DC 0B                       .
        sbc     $0796,y                         ; F2DD F9 96 07                 ...
        .byte   $12                             ; F2E0 12                       .
        ora     ($0A),y                         ; F2E1 11 0A                    ..
        sty     $19,x                           ; F2E3 94 19                    ..
        asl     a                               ; F2E5 0A                       .
        .byte   $17                             ; F2E6 17                       .
        .byte   $1A                             ; F2E7 1A                       .
        ora     L1A1A,y                         ; F2E8 19 1A 1A                 ...
        .byte   $1A                             ; F2EB 1A                       .
        sed                                     ; F2EC F8                       .
        lda     $04F2,x                         ; F2ED BD F2 04                 ...
        .byte   $03                             ; F2F0 03                       .
        .byte   $F4                             ; F2F1 F4                       .
        .byte   $F2                             ; F2F2 F2                       .
        .byte   $FF                             ; F2F3 FF                       .
        cpx     LEE01                           ; F2F4 EC 01 EE                 ...
        brk                                     ; F2F7 00                       .
        .byte   $F2                             ; F2F8 F2                       .
        .byte   $44                             ; F2F9 44                       D
        .byte   $80                             ; F2FA 80                       .
        .byte   $04                             ; F2FB 04                       .
        .byte   $F4                             ; F2FC F4                       .
        clc                                     ; F2FD 18                       .
        sta     L000F                           ; F2FE 85 0F                    ..
        .byte   $FF                             ; F300 FF                       .
        .byte   $03                             ; F301 03                       .
        ora     $F3                             ; F302 05 F3                    ..
        .byte   $FF                             ; F304 FF                       .
        cpx     LEE07                           ; F305 EC 07 EE                 ...
        ora     ($8E,x)                         ; F308 01 8E                    ..
        .byte   $0F                             ; F30A 0F                       .
        ora     $494B                           ; F30B 0D 4B 49                 .KI
        .byte   $47                             ; F30E 47                       G
        eor     L0003                           ; F30F 45 03                    E.
        .byte   $FF                             ; F311 FF                       .
        .byte   $04                             ; F312 04                       .
        ora     ($1A,x)                         ; F313 01 1A                    ..
        .byte   $F3                             ; F315 F3                       .
        .byte   $03                             ; F316 03                       .
        rol     LFFF3                           ; F317 2E F3 FF                 ...
        cpx     LED06                           ; F31A EC 06 ED                 ...
        rti                                     ; F31D 40                       @

; ----------------------------------------------------------------------------
        inc     LF004                           ; F31E EE 04 F0                 ...
        .byte   $1C                             ; F321 1C                       .
        .byte   $8F                             ; F322 8F                       .
        .byte   $1A                             ; F323 1A                       .
        rol     a                               ; F324 2A                       *
        .byte   $3A                             ; F325 3A                       :
        .byte   $C2                             ; F326 C2                       .
        adc     #$59                            ; F327 69 59                    iY
        sbc     ($F5),y                         ; F329 F1 F5                    ..
        sbc     LFF29,y                         ; F32B F9 29 FF                 .).
        cpx     LEE06                           ; F32E EC 06 EE                 ...
        .byte   $02                             ; F331 02                       .
        .byte   $8F                             ; F332 8F                       .
        .byte   $4F                             ; F333 4F                       O
        eor     $494B                           ; F334 4D 4B 49                 MKI
        .byte   $47                             ; F337 47                       G
        eor     $43                             ; F338 45 43                    EC
        ora     ($FF,x)                         ; F33A 01 FF                    ..
        .byte   $04                             ; F33C 04                       .
        ora     ($44,x)                         ; F33D 01 44                    .D
        .byte   $F3                             ; F33F F3                       .
        .byte   $03                             ; F340 03                       .
        .byte   $5C                             ; F341 5C                       \
        .byte   $F3                             ; F342 F3                       .
        .byte   $FF                             ; F343 FF                       .
        cpx     LED06                           ; F344 EC 06 ED                 ...
        .byte   $80                             ; F347 80                       .
        inc     LF000                           ; F348 EE 00 F0                 ...
        .byte   $04                             ; F34B 04                       .
        .byte   $F3                             ; F34C F3                       .
        .byte   $8F                             ; F34D 8F                       .
        .byte   $C2                             ; F34E C2                       .
        sei                                     ; F34F 78                       x
        bvs     LF3BA                           ; F350 70 68                    ph
        rts                                     ; F352 60                       `

; ----------------------------------------------------------------------------
        cli                                     ; F353 58                       X
        bvc     LF35E                           ; F354 50 08                    P.
        inc     LF102                           ; F356 EE 02 F1                 ...
        .byte   $07                             ; F359 07                       .
        sbc     LECFF,y                         ; F35A F9 FF EC                 ...
        .byte   $06                             ; F35D 06                       .
LF35E:  inc     $8D00                           ; F35E EE 00 8D                 ...
        eor     L0003                           ; F361 45 03                    E.
        .byte   $FF                             ; F363 FF                       .
        .byte   $04                             ; F364 04                       .
        .byte   $02                             ; F365 02                       .
        adc     #$F3                            ; F366 69 F3                    i.
        .byte   $FF                             ; F368 FF                       .
        cpx     #$64                            ; F369 E0 64                    .d
        sbc     $F3,x                           ; F36B F5 F3                    ..
        beq     LF38B                           ; F36D F0 1C                    ..
        .byte   $8F                             ; F36F 8F                       .
        and     $37,x                           ; F370 35 37                    57
        and     $0CF0,y                         ; F372 39 F0 0C                 9..
        cmp     #$2A                            ; F375 C9 2A                    .*
        sbc     ($FF),y                         ; F377 F1 FF                    ..
        sbc     LC88F,y                         ; F379 F9 8F C8                 ...
        adc     #$F1                            ; F37C 69 F1                    i.
        inc     $20F9,x                         ; F37E FE F9 20                 .. 
        .byte   $FF                             ; F381 FF                       .
        .byte   $04                             ; F382 04                       .
        .byte   $03                             ; F383 03                       .
        .byte   $87                             ; F384 87                       .
        .byte   $F3                             ; F385 F3                       .
        .byte   $FF                             ; F386 FF                       .
        cpx     LEE00                           ; F387 EC 00 EE                 ...
        brk                                     ; F38A 00                       .
LF38B:  stx     $4D4F                           ; F38B 8E 4F 4D                 .OM
        .byte   $4B                             ; F38E 4B                       K
        pha                                     ; F38F 48                       H
        asl     $FF                             ; F390 06 FF                    ..
        brk                                     ; F392 00                       .
        .byte   $9C                             ; F393 9C                       .
        .byte   $F3                             ; F394 F3                       .
        ora     ($B3,x)                         ; F395 01 B3                    ..
        .byte   $F3                             ; F397 F3                       .
        .byte   $02                             ; F398 02                       .
        dex                                     ; F399 CA                       .
        .byte   $F3                             ; F39A F3                       .
        .byte   $FF                             ; F39B FF                       .
        cpx     LED01                           ; F39C EC 01 ED                 ...
        brk                                     ; F39F 00                       .
        inc     LF000                           ; F3A0 EE 00 F0                 ...
        .byte   $F7                             ; F3A3 F7                       .
        .byte   $F2                             ; F3A4 F2                       .
        ora     ($81,x)                         ; F3A5 01 81                    ..
        bit     $23                             ; F3A7 24 23                    $#
        .byte   $22                             ; F3A9 22                       "
        and     ($81,x)                         ; F3AA 21 81                    !.
        .byte   $13                             ; F3AC 13                       .
        .byte   $14                             ; F3AD 14                       .
        .byte   $13                             ; F3AE 13                       .
        .byte   $14                             ; F3AF 14                       .
        .byte   $13                             ; F3B0 13                       .
        .byte   $14                             ; F3B1 14                       .
        .byte   $FF                             ; F3B2 FF                       .
        cpx     LED01                           ; F3B3 EC 01 ED                 ...
        brk                                     ; F3B6 00                       .
        inc     LF000                           ; F3B7 EE 00 F0                 ...
LF3BA:  .byte   $F7                             ; F3BA F7                       .
        .byte   $F2                             ; F3BB F2                       .
        ora     ($81,x)                         ; F3BC 01 81                    ..
        .byte   $1B                             ; F3BE 1B                       .
        .byte   $1A                             ; F3BF 1A                       .
        ora     $8118,y                         ; F3C0 19 18 81                 ...
        php                                     ; F3C3 08                       .
        ora     #$08                            ; F3C4 09 08                    ..
        ora     #$08                            ; F3C6 09 08                    ..
        ora     #$FF                            ; F3C8 09 FF                    ..
        cpx     LF001                           ; F3CA EC 01 F0                 ...
        .byte   $F7                             ; F3CD F7                       .
        .byte   $F2                             ; F3CE F2                       .
        ora     ($F8,x)                         ; F3CF 01 F8                    ..
        lda     $04F3,x                         ; F3D1 BD F3 04                 ...
        ora     ($DD,x)                         ; F3D4 01 DD                    ..
LF3D6:  .byte   $F3                             ; F3D6 F3                       .
        .byte   $FF                             ; F3D7 FF                       .
        beq     LF3D6                           ; F3D8 F0 FC                    ..
        sed                                     ; F3DA F8                       .
        .byte   $DF                             ; F3DB DF                       .
        .byte   $F3                             ; F3DC F3                       .
        beq     LF3DF                           ; F3DD F0 00                    ..
LF3DF:  .byte   $EC                             ; F3DF EC                       .
        .byte   $06                             ; F3E0 06                       .
LF3E1:  sbc     $EE80                           ; F3E1 ED 80 EE                 ...
        brk                                     ; F3E4 00                       .
        .byte   $F2                             ; F3E5 F2                       .
        .byte   $C2                             ; F3E6 C2                       .
        .byte   $8F                             ; F3E7 8F                       .
        asl     $10                             ; F3E8 06 10                    ..
        asl     $20,x                           ; F3EA 16 20                    . 
        .byte   $C2                             ; F3EC C2                       .
        jsr     L2724                           ; F3ED 20 24 27                  $'
        bmi     LF3E1                           ; F3F0 30 EF                    0.
        .byte   $03                             ; F3F2 03                       .
        sbc     L04FF,y                         ; F3F3 F9 FF 04                 ...
        ora     ($D8,x)                         ; F3F6 01 D8                    ..
        .byte   $F3                             ; F3F8 F3                       .
        .byte   $03                             ; F3F9 03                       .
        sbc     LFFF3,x                         ; F3FA FD F3 FF                 ...
        cpx     LEE06                           ; F3FD EC 06 EE                 ...
        brk                                     ; F400 00                       .
        sta     $0244                           ; F401 8D 44 02                 .D.
        .byte   $FF                             ; F404 FF                       .
        .byte   $04                             ; F405 04                       .
        ora     ($0D,x)                         ; F406 01 0D                    ..
        .byte   $F4                             ; F408 F4                       .
        .byte   $03                             ; F409 03                       .
        asl     LFFF4,x                         ; F40A 1E F4 FF                 ...
        cpx     LEE06                           ; F40D EC 06 EE                 ...
        brk                                     ; F410 00                       .
        beq     LF413                           ; F411 F0 00                    ..
LF413:  .byte   $F3                             ; F413 F3                       .
        .byte   $8F                             ; F414 8F                       .
        cmp     $20                             ; F415 C5 20                    . 
        and     ($EE,x)                         ; F417 21 EE                    !.
        ora     ($F0,x)                         ; F419 01 F0                    ..
        .byte   $FF                             ; F41B FF                       .
        sbc     LECFF,y                         ; F41C F9 FF EC                 ...
        asl     $EE                             ; F41F 06 EE                    ..
        brk                                     ; F421 00                       .
        .byte   $F3                             ; F422 F3                       .
        .byte   $C2                             ; F423 C2                       .
        .byte   $8F                             ; F424 8F                       .
        asl     LF90D                           ; F425 0E 0D F9                 ...
        stx     $4647                           ; F428 8E 47 46                 .GF
        eor     $82                             ; F42B 45 82                    E.
        .byte   $44                             ; F42D 44                       D
        .byte   $43                             ; F42E 43                       C
        .byte   $42                             ; F42F 42                       B
        brk                                     ; F430 00                       .
        .byte   $FF                             ; F431 FF                       .
        ora     ($0D,x)                         ; F432 01 0D                    ..
        .byte   $F4                             ; F434 F4                       .
        .byte   $03                             ; F435 03                       .
        asl     a:L00F4,x                       ; F436 1E F4 00                 ...
        .byte   $3F                             ; F439 3F                       ?
        .byte   $F4                             ; F43A F4                       .
        .byte   $02                             ; F43B 02                       .
        .byte   $53                             ; F43C 53                       S
        .byte   $F4                             ; F43D F4                       .
        .byte   $FF                             ; F43E FF                       .
        cpx     LED06                           ; F43F EC 06 ED                 ...
        brk                                     ; F442 00                       .
        inc     LF000                           ; F443 EE 00 F0                 ...
        jsr     LC48E                           ; F446 20 8E C4                  ..
        bpl     LF46B                           ; F449 10 20                    . 
        .byte   $14                             ; F44B 14                       .
        bit     $17                             ; F44C 24 17                    $.
        .byte   $27                             ; F44E 27                       '
        .byte   $EF                             ; F44F EF                       .
        .byte   $03                             ; F450 03                       .
        sbc     LE0FF,y                         ; F451 F9 FF E0                 ...
        .byte   $64                             ; F454 64                       d
        sbc     $8F,x                           ; F455 F5 8F                    ..
        bpl     LF46C                           ; F457 10 13                    ..
        .byte   $12                             ; F459 12                       .
        .byte   $17                             ; F45A 17                       .
        asl     a                               ; F45B 0A                       .
        .byte   $12                             ; F45C 12                       .
        .byte   $17                             ; F45D 17                       .
        bpl     LF472                           ; F45E 10 12                    ..
        jsr     L191B                           ; F460 20 1B 19                  ..
        .byte   $17                             ; F463 17                       .
        ora     $13,x                           ; F464 15 13                    ..
        ora     ($FF),y                         ; F466 11 FF                    ..
        .byte   $04                             ; F468 04                       .
        ora     ($6D,x)                         ; F469 01 6D                    .m
LF46B:  .byte   $F4                             ; F46B F4                       .
LF46C:  .byte   $FF                             ; F46C FF                       .
        cpx     LED04                           ; F46D EC 04 ED                 ...
        rti                                     ; F470 40                       @

; ----------------------------------------------------------------------------
        .byte   $F0                             ; F471 F0                       .
LF472:  asl     a:$EE                           ; F472 0E EE 00                 ...
        .byte   $8F                             ; F475 8F                       .
        asl     a                               ; F476 0A                       .
        .byte   $1A                             ; F477 1A                       .
        bpl     LF49A                           ; F478 10 20                    . 
        .byte   $14                             ; F47A 14                       .
        bit     $82                             ; F47B 24 82                    $.
        .byte   $3F                             ; F47D 3F                       ?
        .byte   $8F                             ; F47E 8F                       .
        .byte   $C4                             ; F47F C4                       .
LF480:  .byte   $13                             ; F480 13                       .
        ora     $2923,y                         ; F481 19 23 29                 .#)
        .byte   $EF                             ; F484 EF                       .
        .byte   $04                             ; F485 04                       .
        sbc     L04FF,y                         ; F486 F9 FF 04                 ...
        .byte   $02                             ; F489 02                       .
        bcc     LF480                           ; F48A 90 F4                    ..
        .byte   $03                             ; F48C 03                       .
        .byte   $A7                             ; F48D A7                       .
        .byte   $F4                             ; F48E F4                       .
        .byte   $FF                             ; F48F FF                       .
        cpx     LF004                           ; F490 EC 04 F0                 ...
        .byte   $04                             ; F493 04                       .
        .byte   $8F                             ; F494 8F                       .
        asl     $0A                             ; F495 06 0A                    ..
        .byte   $12                             ; F497 12                       .
        .byte   $14                             ; F498 14                       .
        .byte   $17                             ; F499 17                       .
LF49A:  ora     $2522,y                         ; F49A 19 22 25                 ."%
        .byte   $82                             ; F49D 82                       .
        .byte   $3F                             ; F49E 3F                       ?
        stx     $2527                           ; F49F 8E 27 25                 .'%
        .byte   $23                             ; F4A2 23                       #
        and     ($1B,x)                         ; F4A3 21 1B                    !.
        clc                                     ; F4A5 18                       .
        .byte   $FF                             ; F4A6 FF                       .
        cpx     LEE08                           ; F4A7 EC 08 EE                 ...
        ora     $F2                             ; F4AA 05 F2                    ..
        sbc     ($8F),y                         ; F4AC F1 8F                    ..
        lsr     a                               ; F4AE 4A                       J
        pha                                     ; F4AF 48                       H
        .byte   $47                             ; F4B0 47                       G
        lsr     $45                             ; F4B1 46 45                    FE
        .byte   $43                             ; F4B3 43                       C
        .byte   $02                             ; F4B4 02                       .
        .byte   $82                             ; F4B5 82                       .
        .byte   $3F                             ; F4B6 3F                       ?
        .byte   $8F                             ; F4B7 8F                       .
        lsr     $47                             ; F4B8 46 47                    FG
        eor     #$0D                            ; F4BA 49 0D                    I.
        .byte   $3F                             ; F4BC 3F                       ?
        .byte   $C2                             ; F4BD C2                       .
        .byte   $EF                             ; F4BE EF                       .
        ora     $8F                             ; F4BF 05 8F                    ..
        .byte   $47                             ; F4C1 47                       G
        eor     #$0D                            ; F4C2 49 0D                    I.
        .byte   $3F                             ; F4C4 3F                       ?
        sbc     L04FF,y                         ; F4C5 F9 FF 04                 ...
        ora     ($CC,x)                         ; F4C8 01 CC                    ..
        .byte   $F4                             ; F4CA F4                       .
        .byte   $FF                             ; F4CB FF                       .
        cpx     LED06                           ; F4CC EC 06 ED                 ...
        .byte   $80                             ; F4CF 80                       .
        inc     LF001                           ; F4D0 EE 01 F0                 ...
        .byte   $0C                             ; F4D3 0C                       .
        .byte   $C3                             ; F4D4 C3                       .
        stx     $3525                           ; F4D5 8E 25 35                 .%5
        .byte   $27                             ; F4D8 27                       '
        .byte   $37                             ; F4D9 37                       7
        and     #$39                            ; F4DA 29 39                    )9
        .byte   $2B                             ; F4DC 2B                       +
        .byte   $3B                             ; F4DD 3B                       ;
        sbc     (L0000),y                       ; F4DE F1 00                    ..
        .byte   $EF                             ; F4E0 EF                       .
        .byte   $04                             ; F4E1 04                       .
        sbc     L04FF,y                         ; F4E2 F9 FF 04                 ...
        ora     ($E9,x)                         ; F4E5 01 E9                    ..
        .byte   $F4                             ; F4E7 F4                       .
        .byte   $FF                             ; F4E8 FF                       .
        cpx     LED06                           ; F4E9 EC 06 ED                 ...
        .byte   $80                             ; F4EC 80                       .
        inc     LF001                           ; F4ED EE 01 F0                 ...
        .byte   $0C                             ; F4F0 0C                       .
        .byte   $C3                             ; F4F1 C3                       .
        stx     $3727                           ; F4F2 8E 27 37                 .'7
        sbc     $FF,y                           ; F4F5 F9 FF 00                 ...
        inc     $01F4,x                         ; F4F8 FE F4 01                 ...
        .byte   $34                             ; F4FB 34                       4
        sbc     $FF,x                           ; F4FC F5 FF                    ..
        cpx     LED05                           ; F4FE EC 05 ED                 ...
        brk                                     ; F501 00                       .
        .byte   $F2                             ; F502 F2                       .
        cmp     ($F0,x)                         ; F503 C1 F0                    ..
        .byte   $F4                             ; F505 F4                       .
        .byte   $C3                             ; F506 C3                       .
        inc     $9409                           ; F507 EE 09 94                 ...
        .byte   $17                             ; F50A 17                       .
        clc                                     ; F50B 18                       .
        inc     $9407                           ; F50C EE 07 94                 ...
        .byte   $17                             ; F50F 17                       .
        clc                                     ; F510 18                       .
        inc     $9406                           ; F511 EE 06 94                 ...
        .byte   $17                             ; F514 17                       .
        clc                                     ; F515 18                       .
        inc     $9403                           ; F516 EE 03 94                 ...
        .byte   $17                             ; F519 17                       .
        clc                                     ; F51A 18                       .
        inc     $1703                           ; F51B EE 03 17                 ...
        clc                                     ; F51E 18                       .
        ora     $18,x                           ; F51F 15 18                    ..
        .byte   $17                             ; F521 17                       .
        clc                                     ; F522 18                       .
        ora     $18,x                           ; F523 15 18                    ..
        sbc     $94C7,y                         ; F525 F9 C7 94                 ...
        .byte   $17                             ; F528 17                       .
        clc                                     ; F529 18                       .
        .byte   $EF                             ; F52A EF                       .
        .byte   $02                             ; F52B 02                       .
        sbc     $9ADD,y                         ; F52C F9 DD 9A                 ...
        .byte   $3F                             ; F52F 3F                       ?
        sbc     LFEF8,y                         ; F530 F9 F8 FE                 ...
        .byte   $F4                             ; F533 F4                       .
        cpx     LED07                           ; F534 EC 07 ED                 ...
        cpy     #$EE                            ; F537 C0 EE                    ..
        .byte   $02                             ; F539 02                       .
        beq     LF548                           ; F53A F0 0C                    ..
        txs                                     ; F53C 9A                       .
        .byte   $3F                             ; F53D 3F                       ?
        .byte   $3F                             ; F53E 3F                       ?
        .byte   $3F                             ; F53F 3F                       ?
        .byte   $3F                             ; F540 3F                       ?
        .byte   $92                             ; F541 92                       .
        clc                                     ; F542 18                       .
        .byte   $22                             ; F543 22                       "
        txs                                     ; F544 9A                       .
        pla                                     ; F545 68                       h
        .byte   $99                             ; F546 99                       .
        pla                                     ; F547 68                       h
LF548:  sty     $28,x                           ; F548 94 28                    .(
        .byte   $92                             ; F54A 92                       .
        clc                                     ; F54B 18                       .
        .byte   $22                             ; F54C 22                       "
        sta     $9468,y                         ; F54D 99 68 94                 .h.
        plp                                     ; F550 28                       (
        .byte   $92                             ; F551 92                       .
        clc                                     ; F552 18                       .
        .byte   $22                             ; F553 22                       "
        sty     $28,x                           ; F554 94 28                    .(
        .byte   $92                             ; F556 92                       .
        .byte   $22                             ; F557 22                       "
        plp                                     ; F558 28                       (
        sty     $32,x                           ; F559 94 32                    .2
        tya                                     ; F55B 98                       .
        .byte   $3F                             ; F55C 3F                       ?
        .byte   $DF                             ; F55D DF                       .
        txs                                     ; F55E 9A                       .
        .byte   $3F                             ; F55F 3F                       ?
        sbc     $34F8,y                         ; F560 F9 F8 34                 ..4
        sbc     $EC,x                           ; F563 F5 EC                    ..
        .byte   $04                             ; F565 04                       .
        beq     LF574                           ; F566 F0 0C                    ..
        .byte   $F2                             ; F568 F2                       .
        cmp     ($FA,x)                         ; F569 C1 FA                    ..
        brk                                     ; F56B 00                       .
        brk                                     ; F56C 00                       .
        brk                                     ; F56D 00                       .
        brk                                     ; F56E 00                       .
        brk                                     ; F56F 00                       .
        brk                                     ; F570 00                       .
        brk                                     ; F571 00                       .
        brk                                     ; F572 00                       .
        brk                                     ; F573 00                       .
LF574:  ora     (L0000,x)                       ; F574 01 00                    ..
        brk                                     ; F576 00                       .
        brk                                     ; F577 00                       .
        brk                                     ; F578 00                       .
        brk                                     ; F579 00                       .
        .byte   $3F                             ; F57A 3F                       ?
        .byte   $1F                             ; F57B 1F                       .
        .byte   $1F                             ; F57C 1F                       .
        .byte   $0F                             ; F57D 0F                       .
        .byte   $0F                             ; F57E 0F                       .
        .byte   $07                             ; F57F 07                       .
LF580:  php                                     ; F580 08                       .
LF581:  brk                                     ; F581 00                       .
        bpl     LF584                           ; F582 10 00                    ..
LF584:  clc                                     ; F584 18                       .
        brk                                     ; F585 00                       .
        jsr     L2800                           ; F586 20 00 28                  .(
        brk                                     ; F589 00                       .
        bmi     LF58C                           ; F58A 30 00                    0.
LF58C:  sec                                     ; F58C 38                       8
        brk                                     ; F58D 00                       .
        rti                                     ; F58E 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; F58F 00                       .
        pha                                     ; F590 48                       H
        brk                                     ; F591 00                       .
        bvc     LF594                           ; F592 50 00                    P.
LF594:  cli                                     ; F594 58                       X
        brk                                     ; F595 00                       .
        rts                                     ; F596 60                       `

; ----------------------------------------------------------------------------
        brk                                     ; F597 00                       .
        pla                                     ; F598 68                       h
        brk                                     ; F599 00                       .
        bvs     LF59C                           ; F59A 70 00                    p.
LF59C:  sei                                     ; F59C 78                       x
        brk                                     ; F59D 00                       .
        .byte   $80                             ; F59E 80                       .
        brk                                     ; F59F 00                       .
        dey                                     ; F5A0 88                       .
        brk                                     ; F5A1 00                       .
        bcc     LF5A4                           ; F5A2 90 00                    ..
LF5A4:  tya                                     ; F5A4 98                       .
        brk                                     ; F5A5 00                       .
        ldy     #$00                            ; F5A6 A0 00                    ..
        tay                                     ; F5A8 A8                       .
        brk                                     ; F5A9 00                       .
        bcs     LF5AC                           ; F5AA B0 00                    ..
LF5AC:  clv                                     ; F5AC B8                       .
        brk                                     ; F5AD 00                       .
        cpy     #$00                            ; F5AE C0 00                    ..
        iny                                     ; F5B0 C8                       .
        brk                                     ; F5B1 00                       .
        bne     LF5B4                           ; F5B2 D0 00                    ..
LF5B4:  cld                                     ; F5B4 D8                       .
        brk                                     ; F5B5 00                       .
        cpx     #$00                            ; F5B6 E0 00                    ..
        inx                                     ; F5B8 E8                       .
        brk                                     ; F5B9 00                       .
        beq     LF5BC                           ; F5BA F0 00                    ..
LF5BC:  sed                                     ; F5BC F8                       .
        brk                                     ; F5BD 00                       .
        brk                                     ; F5BE 00                       .
LF5BF:  .byte   $01                             ; F5BF 01                       .
LF5C0:  brk                                     ; F5C0 00                       .
        .byte   $02                             ; F5C1 02                       .
        .byte   $02                             ; F5C2 02                       .
        .byte   $02                             ; F5C3 02                       .
        .byte   $02                             ; F5C4 02                       .
        .byte   $02                             ; F5C5 02                       .
        brk                                     ; F5C6 00                       .
        .byte   $02                             ; F5C7 02                       .
        .byte   $02                             ; F5C8 02                       .
        .byte   $02                             ; F5C9 02                       .
        .byte   $02                             ; F5CA 02                       .
        .byte   $02                             ; F5CB 02                       .
        brk                                     ; F5CC 00                       .
        .byte   $02                             ; F5CD 02                       .
        .byte   $02                             ; F5CE 02                       .
        .byte   $02                             ; F5CF 02                       .
        .byte   $02                             ; F5D0 02                       .
        .byte   $02                             ; F5D1 02                       .
        brk                                     ; F5D2 00                       .
        .byte   $02                             ; F5D3 02                       .
        .byte   $02                             ; F5D4 02                       .
        .byte   $02                             ; F5D5 02                       .
        .byte   $02                             ; F5D6 02                       .
        .byte   $02                             ; F5D7 02                       .
        brk                                     ; F5D8 00                       .
        .byte   $02                             ; F5D9 02                       .
        .byte   $02                             ; F5DA 02                       .
        .byte   $02                             ; F5DB 02                       .
        .byte   $02                             ; F5DC 02                       .
        .byte   $02                             ; F5DD 02                       .
        brk                                     ; F5DE 00                       .
        .byte   $02                             ; F5DF 02                       .
        brk                                     ; F5E0 00                       .
        ora     $1808,y                         ; F5E1 19 08 18                 ...
        php                                     ; F5E4 08                       .
        clc                                     ; F5E5 18                       .
        php                                     ; F5E6 08                       .
        clc                                     ; F5E7 18                       .
        brk                                     ; F5E8 00                       .
        ora     $1808,y                         ; F5E9 19 08 18                 ...
        php                                     ; F5EC 08                       .
        clc                                     ; F5ED 18                       .
        php                                     ; F5EE 08                       .
        clc                                     ; F5EF 18                       .
        .byte   $04                             ; F5F0 04                       .
        lsr     $02                             ; F5F1 46 02                    F.
        lsr     L0004                           ; F5F3 46 04                    F.
        lsr     L0004                           ; F5F5 46 04                    F.
        lsr     $02                             ; F5F7 46 02                    F.
        lsr     L0004                           ; F5F9 46 04                    F.
        lsr     L0004                           ; F5FB 46 04                    F.
        lsr     $02                             ; F5FD 46 02                    F.
        .byte   $46                             ; F5FF 46                       F
LF600:  ldx     #$00                            ; F600 A2 00                    ..
        ldy     #$00                            ; F602 A0 00                    ..
LF604:  bit     $2002                           ; F604 2C 02 20                 ,. 
        bvc     LF604                           ; F607 50 FB                    P.
        bvs     LF611                           ; F609 70 06                    p.
LF60B:  ldy     LF5BF,x                         ; F60B BC BF F5                 ...
LF60E:  dey                                     ; F60E 88                       .
        bne     LF60E                           ; F60F D0 FD                    ..
LF611:  lda     $0401,x                         ; F611 BD 01 04                 ...
        sta     $2005                           ; F614 8D 05 20                 .. 
        lda     #$00                            ; F617 A9 00                    ..
        sta     $2005                           ; F619 8D 05 20                 .. 
        lda     $0330                           ; F61C AD 30 03                 .0.
        and     #$C0                            ; F61F 29 C0                    ).
        beq     LF655                           ; F621 F0 32                    .2
        bpl     LF63E                           ; F623 10 19                    ..
        jmp     LF628                           ; F625 4C 28 F6                 L(.

; ----------------------------------------------------------------------------
LF628:  lda     $0400,x                         ; F628 BD 00 04                 ...
        clc                                     ; F62B 18                       .
        adc     LF580,x                         ; F62C 7D 80 F5                 }..
        sta     $0400,x                         ; F62F 9D 00 04                 ...
        lda     $0401,x                         ; F632 BD 01 04                 ...
        adc     LF581,x                         ; F635 7D 81 F5                 }..
        sta     $0401,x                         ; F638 9D 01 04                 ...
        jmp     LF66E                           ; F63B 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF63E:  nop                                     ; F63E EA                       .
        lda     $0400,x                         ; F63F BD 00 04                 ...
        sec                                     ; F642 38                       8
        sbc     LF580,x                         ; F643 FD 80 F5                 ...
        sta     $0400,x                         ; F646 9D 00 04                 ...
        lda     $0401,x                         ; F649 BD 01 04                 ...
        sbc     LF581,x                         ; F64C FD 81 F5                 ...
        sta     $0401,x                         ; F64F 9D 01 04                 ...
        jmp     LF66E                           ; F652 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF655:  bne     LF657                           ; F655 D0 00                    ..
LF657:  nop                                     ; F657 EA                       .
        lda     $0400,x                         ; F658 BD 00 04                 ...
        clc                                     ; F65B 18                       .
        adc     LF580,x                         ; F65C 7D 80 F5                 }..
        sta     $0460,y                         ; F65F 99 60 04                 .`.
        lda     $0401,x                         ; F662 BD 01 04                 ...
        adc     LF581,x                         ; F665 7D 81 F5                 }..
        sta     $0460,y                         ; F668 99 60 04                 .`.
        jmp     LF66E                           ; F66B 4C 6E F6                 Ln.

; ----------------------------------------------------------------------------
LF66E:  ldy     LF5C0,x                         ; F66E BC C0 F5                 ...
        inx                                     ; F671 E8                       .
        inx                                     ; F672 E8                       .
        cpx     #$40                            ; F673 E0 40                    .@
        bcs     LF695                           ; F675 B0 1E                    ..
        lda     LF696,y                         ; F677 B9 96 F6                 ...
        sta     L0462                           ; F67A 8D 62 04                 .b.
        lda     LF697,y                         ; F67D B9 97 F6                 ...
        sta     $0463                           ; F680 8D 63 04                 .c.
        jmp     (L0462)                         ; F683 6C 62 04                 lb.

; ----------------------------------------------------------------------------
        nop                                     ; F686 EA                       .
        nop                                     ; F687 EA                       .
        nop                                     ; F688 EA                       .
        cmp     L0000                           ; F689 C5 00                    ..
        jmp     LF60B                           ; F68B 4C 0B F6                 L..

; ----------------------------------------------------------------------------
        nop                                     ; F68E EA                       .
        nop                                     ; F68F EA                       .
        nop                                     ; F690 EA                       .
        nop                                     ; F691 EA                       .
        jmp     LF60B                           ; F692 4C 0B F6                 L..

; ----------------------------------------------------------------------------
LF695:  rts                                     ; F695 60                       `

; ----------------------------------------------------------------------------
LF696:  dey                                     ; F696 88                       .
LF697:  inc     $8F,x                           ; F697 F6 8F                    ..
        inc     $87,x                           ; F699 F6 87                    ..
        inc     $8E,x                           ; F69B F6 8E                    ..
        inc     $86,x                           ; F69D F6 86                    ..
        inc     $20,x                           ; F69F F6 20                    . 
        .byte   $2B                             ; F6A1 2B                       +
        jsr     L2020                           ; F6A2 20 20 20                    
        jsr     L2020                           ; F6A5 20 20 20                    
        jsr     L2020                           ; F6A8 20 20 20                    
        jsr     L2020                           ; F6AB 20 20 20                    
        jsr     L5020                           ; F6AE 20 20 50                   P
        eor     ($55,x)                         ; F6B1 41 55                    AU
LF6B3:  .byte   $53                             ; F6B3 53                       S
        eor     $20                             ; F6B4 45 20                    E 
        jsr     L2020                           ; F6B6 20 20 20                    
        jsr     L2020                           ; F6B9 20 20 20                    
        jsr     L2020                           ; F6BC 20 20 20                    
        jsr     L2020                           ; F6BF 20 20 20                    
        jsr     L0000                           ; F6C2 20 00 00                  ..
        brk                                     ; F6C5 00                       .
        brk                                     ; F6C6 00                       .
        brk                                     ; F6C7 00                       .
        .byte   $FF                             ; F6C8 FF                       .
        .byte   $FF                             ; F6C9 FF                       .
        .byte   $FF                             ; F6CA FF                       .
        .byte   $FF                             ; F6CB FF                       .
        .byte   $FC                             ; F6CC FC                       .
LF6CD:  sed                                     ; F6CD F8                       .
        beq     LF6B3                           ; F6CE F0 E3                    ..
        brk                                     ; F6D0 00                       .
        brk                                     ; F6D1 00                       .
        brk                                     ; F6D2 00                       .
        brk                                     ; F6D3 00                       .
        brk                                     ; F6D4 00                       .
        brk                                     ; F6D5 00                       .
        brk                                     ; F6D6 00                       .
        brk                                     ; F6D7 00                       .
        .byte   $87                             ; F6D8 87                       .
        sbc     ($C0,x)                         ; F6D9 E1 C0                    ..
        brk                                     ; F6DB 00                       .
        brk                                     ; F6DC 00                       .
        brk                                     ; F6DD 00                       .
        .byte   $80                             ; F6DE 80                       .
        brk                                     ; F6DF 00                       .
        brk                                     ; F6E0 00                       .
        brk                                     ; F6E1 00                       .
        brk                                     ; F6E2 00                       .
        brk                                     ; F6E3 00                       .
        brk                                     ; F6E4 00                       .
        brk                                     ; F6E5 00                       .
        brk                                     ; F6E6 00                       .
        brk                                     ; F6E7 00                       .
        .byte   $EF                             ; F6E8 EF                       .
        stx     a:$88                           ; F6E9 8E 88 00                 ...
        brk                                     ; F6EC 00                       .
        brk                                     ; F6ED 00                       .
        brk                                     ; F6EE 00                       .
        brk                                     ; F6EF 00                       .
        brk                                     ; F6F0 00                       .
        brk                                     ; F6F1 00                       .
        brk                                     ; F6F2 00                       .
        brk                                     ; F6F3 00                       .
        brk                                     ; F6F4 00                       .
        brk                                     ; F6F5 00                       .
        brk                                     ; F6F6 00                       .
        brk                                     ; F6F7 00                       .
        .byte   $FF                             ; F6F8 FF                       .
        .byte   $0F                             ; F6F9 0F                       .
        .byte   $03                             ; F6FA 03                       .
        .byte   $07                             ; F6FB 07                       .
        .byte   $03                             ; F6FC 03                       .
        brk                                     ; F6FD 00                       .
        brk                                     ; F6FE 00                       .
        brk                                     ; F6FF 00                       .
        sei                                     ; F700 78                       x
        sei                                     ; F701 78                       x
        .byte   $47                             ; F702 47                       G
        pha                                     ; F703 48                       H
        lsr     $49                             ; F704 46 49                    FI
        .byte   $47                             ; F706 47                       G
        pha                                     ; F707 48                       H
        .byte   $73                             ; F708 73                       s
        .byte   $34                             ; F709 34                       4
        .byte   $80                             ; F70A 80                       .
        .byte   $3F                             ; F70B 3F                       ?
        .byte   $80                             ; F70C 80                       .
        .byte   $80                             ; F70D 80                       .
        .byte   $80                             ; F70E 80                       .
        .byte   $80                             ; F70F 80                       .
        .byte   $3C                             ; F710 3C                       <
        asl     $0582,x                         ; F711 1E 82 05                 ...
        and     $23,x                           ; F714 35 23                    5#
        jsr     L4013                           ; F716 20 13 40                  .@
        eor     ($43,x)                         ; F719 41 43                    AC
        rti                                     ; F71B 40                       @

; ----------------------------------------------------------------------------
        eor     #$4A                            ; F71C 49 4A                    IJ
        rts                                     ; F71E 60                       `

; ----------------------------------------------------------------------------
        sei                                     ; F71F 78                       x
        .byte   $73                             ; F720 73                       s
        .byte   $1B                             ; F721 1B                       .
        bit     $80                             ; F722 24 80                    $.
        .byte   $80                             ; F724 80                       .
        .byte   $80                             ; F725 80                       .
        .byte   $80                             ; F726 80                       .
        .byte   $2F                             ; F727 2F                       /
        and     $0D1D,x                         ; F728 3D 1D 0D                 =..
        asl     $36                             ; F72B 06 36                    .6
        ora     $35                             ; F72D 05 35                    .5
        and     ($78),y                         ; F72F 31 78                    1x
        .byte   $42                             ; F731 42                       B
        .byte   $44                             ; F732 44                       D
        rti                                     ; F733 40                       @

; ----------------------------------------------------------------------------
        eor     $48                             ; F734 45 48                    EH
        adc     $67                             ; F736 65 67                    eg
        .byte   $64                             ; F738 64                       d
        .byte   $74                             ; F739 74                       t
        .byte   $72                             ; F73A 72                       r
        .byte   $3A                             ; F73B 3A                       :
        .byte   $80                             ; F73C 80                       .
        bpl     LF752                           ; F73D 10 13                    ..
        .byte   $80                             ; F73F 80                       .
        .byte   $80                             ; F740 80                       .
        .byte   $3C                             ; F741 3C                       <
        php                                     ; F742 08                       .
        ora     #$28                            ; F743 09 28                    .(
        .byte   $03                             ; F745 03                       .
        rol     $23,x                           ; F746 36 23                    6#
        sei                                     ; F748 78                       x
        .byte   $4B                             ; F749 4B                       K
        jmp     L717A                           ; F74A 4C 7A 71                 Lzq

; ----------------------------------------------------------------------------
        .byte   $63                             ; F74D 63                       c
        ror     $61                             ; F74E 66 61                    fa
        adc     ($63),y                         ; F750 71 63                    qc
LF752:  ror     $34                             ; F752 66 34                    f4
        bit     $3108                           ; F754 2C 08 31                 ,.1
        .byte   $80                             ; F757 80                       .
        .byte   $80                             ; F758 80                       .
        and     $301D,x                         ; F759 3D 1D 30                 =.0
        asl     $81                             ; F75C 06 81                    ..
        .byte   $37                             ; F75E 37                       7
        and     $78,x                           ; F75F 35 78                    5x
        .byte   $4B                             ; F761 4B                       K
        eor     $0769                           ; F762 4D 69 07                 Mi.
        .byte   $0B                             ; F765 0B                       .
        .byte   $1A                             ; F766 1A                       .
        rol     a                               ; F767 2A                       *
        asl     a                               ; F768 0A                       .
        .byte   $1A                             ; F769 1A                       .
        rol     a                               ; F76A 2A                       *
        .byte   $80                             ; F76B 80                       .
        .byte   $80                             ; F76C 80                       .
        ora     ($32),y                         ; F76D 11 32                    .2
        .byte   $80                             ; F76F 80                       .
        .byte   $80                             ; F770 80                       .
        .byte   $80                             ; F771 80                       .
        ora     ($33),y                         ; F772 11 33                    .3
        ora     #$19                            ; F774 09 19                    ..
        and     #$39                            ; F776 29 39                    )9
        sei                                     ; F778 78                       x
        lsr     $6A56                           ; F779 4E 56 6A                 NVj
        .byte   $72                             ; F77C 72                       r
        .byte   $1B                             ; F77D 1B                       .
        bit     $80                             ; F77E 24 80                    $.
        .byte   $80                             ; F780 80                       .
        .byte   $80                             ; F781 80                       .
        .byte   $80                             ; F782 80                       .
        .byte   $0F                             ; F783 0F                       .
        .byte   $80                             ; F784 80                       .
        .byte   $80                             ; F785 80                       .
        .byte   $80                             ; F786 80                       .
        .byte   $80                             ; F787 80                       .
        asl     $8080                           ; F788 0E 80 80                 ...
        .byte   $80                             ; F78B 80                       .
        ora     ($21),y                         ; F78C 11 21                    .!
        ora     $7882,x                         ; F78E 1D 82 78                 ..x
        .byte   $4F                             ; F791 4F                       O
        eor     $59,x                           ; F792 55 59                    UY
        .byte   $64                             ; F794 64                       d
        .byte   $74                             ; F795 74                       t
        .byte   $72                             ; F796 72                       r
        .byte   $1B                             ; F797 1B                       .
        .byte   $14                             ; F798 14                       .
        bit     $80                             ; F799 24 80                    $.
        .byte   $1F                             ; F79B 1F                       .
        .byte   $80                             ; F79C 80                       .
        .byte   $80                             ; F79D 80                       .
        .byte   $0F                             ; F79E 0F                       .
        .byte   $80                             ; F79F 80                       .
        .byte   $80                             ; F7A0 80                       .
        .byte   $80                             ; F7A1 80                       .
        .byte   $80                             ; F7A2 80                       .
        .byte   $80                             ; F7A3 80                       .
        .byte   $80                             ; F7A4 80                       .
        .byte   $80                             ; F7A5 80                       .
        .byte   $3C                             ; F7A6 3C                       <
        asl     $5078,x                         ; F7A7 1E 78 50                 .xP
        .byte   $57                             ; F7AA 57                       W
        cli                                     ; F7AB 58                       X
        .byte   $5A                             ; F7AC 5A                       Z
        sei                                     ; F7AD 78                       x
        .byte   $64                             ; F7AE 64                       d
        .byte   $62                             ; F7AF 62                       b
        .byte   $62                             ; F7B0 62                       b
        .byte   $72                             ; F7B1 72                       r
        .byte   $3A                             ; F7B2 3A                       :
        .byte   $3F                             ; F7B3 3F                       ?
        .byte   $80                             ; F7B4 80                       .
        .byte   $80                             ; F7B5 80                       .
        .byte   $1F                             ; F7B6 1F                       .
        asl     $8080                           ; F7B7 0E 80 80                 ...
        asl     $8080                           ; F7BA 0E 80 80                 ...
        .byte   $80                             ; F7BD 80                       .
        and     $451D,x                         ; F7BE 3D 1D 45                 =.E
        eor     ($54),y                         ; F7C1 51 54                    QT
        adc     $71                             ; F7C3 65 71                    eq
        .byte   $67                             ; F7C5 67                       g
        sei                                     ; F7C6 78                       x
        sei                                     ; F7C7 78                       x
        sei                                     ; F7C8 78                       x
        .byte   $73                             ; F7C9 73                       s
        .byte   $5F                             ; F7CA 5F                       _
        .byte   $80                             ; F7CB 80                       .
        .byte   $80                             ; F7CC 80                       .
        .byte   $80                             ; F7CD 80                       .
        .byte   $3F                             ; F7CE 3F                       ?
        asl     $8080                           ; F7CF 0E 80 80                 ...
        .byte   $2F                             ; F7D2 2F                       /
        .byte   $80                             ; F7D3 80                       .
        .byte   $80                             ; F7D4 80                       .
        .byte   $80                             ; F7D5 80                       .
        .byte   $80                             ; F7D6 80                       .
        ora     ($41),y                         ; F7D7 11 41                    .A
        .byte   $52                             ; F7D9 52                       R
        .byte   $53                             ; F7DA 53                       S
        .byte   $73                             ; F7DB 73                       s
        .byte   $0B                             ; F7DC 0B                       .
        ror     $78,x                           ; F7DD 76 78                    vx
        sei                                     ; F7DF 78                       x
        adc     $66                             ; F7E0 65 66                    ef
        and     ($80),y                         ; F7E2 31 80                    1.
        .byte   $80                             ; F7E4 80                       .
        .byte   $80                             ; F7E5 80                       .
        .byte   $80                             ; F7E6 80                       .
        .byte   $2F                             ; F7E7 2F                       /
        .byte   $2F                             ; F7E8 2F                       /
        .byte   $80                             ; F7E9 80                       .
        .byte   $80                             ; F7EA 80                       .
        .byte   $80                             ; F7EB 80                       .
        .byte   $0F                             ; F7EC 0F                       .
        .byte   $80                             ; F7ED 80                       .
        .byte   $80                             ; F7EE 80                       .
        .byte   $80                             ; F7EF 80                       .
        adc     $71                             ; F7F0 65 71                    eq
        .byte   $63                             ; F7F2 63                       c
        ror     $3B                             ; F7F3 66 3B                    f;
        adc     ($71,x)                         ; F7F5 61 71                    aq
        .byte   $63                             ; F7F7 63                       c
LF7F8:  ror     $30                             ; F7F8 66 30                    f0
        .byte   $23                             ; F7FA 23                       #
        jsr     L8013                           ; F7FB 20 13 80                  ..
        .byte   $80                             ; F7FE 80                       .
        .byte   $80                             ; F7FF 80                       .
LF800:  .byte   $80                             ; F800 80                       .
        .byte   $80                             ; F801 80                       .
        .byte   $80                             ; F802 80                       .
        .byte   $80                             ; F803 80                       .
LF804:  .byte   $80                             ; F804 80                       .
        .byte   $80                             ; F805 80                       .
        .byte   $0F                             ; F806 0F                       .
        .byte   $80                             ; F807 80                       .
        ror     $30                             ; F808 66 30                    f0
        and     ($12,x)                         ; F80A 21 12                    !.
LF80C:  .byte   $80                             ; F80C 80                       .
        ora     ($12),y                         ; F80D 11 12                    ..
        .byte   $22                             ; F80F 22                       "
        and     ($33,x)                         ; F810 21 33                    !3
        ora     $35                             ; F812 05 35                    .5
        and     ($80),y                         ; F814 31 80                    1.
        .byte   $80                             ; F816 80                       .
        .byte   $80                             ; F817 80                       .
        .byte   $80                             ; F818 80                       .
        bpl     LF83B                           ; F819 10 20                    . 
        .byte   $13                             ; F81B 13                       .
        .byte   $80                             ; F81C 80                       .
        .byte   $80                             ; F81D 80                       .
        .byte   $1F                             ; F81E 1F                       .
        .byte   $80                             ; F81F 80                       .
        and     ($32,x)                         ; F820 21 32                    !2
        .byte   $80                             ; F822 80                       .
        .byte   $80                             ; F823 80                       .
        .byte   $04                             ; F824 04                       .
        bit     $80                             ; F825 24 80                    $.
        .byte   $80                             ; F827 80                       .
        .byte   $80                             ; F828 80                       .
        bit     $3606                           ; F829 2C 06 36                 ,.6
        .byte   $23                             ; F82C 23                       #
        .byte   $13                             ; F82D 13                       .
        .byte   $80                             ; F82E 80                       .
        .byte   $80                             ; F82F 80                       .
        and     $3505                           ; F830 2D 05 35                 -.5
        and     ($80),y                         ; F833 31 80                    1.
        .byte   $80                             ; F835 80                       .
        .byte   $3F                             ; F836 3F                       ?
        .byte   $80                             ; F837 80                       .
        .byte   $80                             ; F838 80                       .
        .byte   $80                             ; F839 80                       .
        .byte   $2F                             ; F83A 2F                       /
LF83B:  bit     $3505                           ; F83B 2C 05 35                 ,.5
        .byte   $3A                             ; F83E 3A                       :
        asl     $2C2F                           ; F83F 0E 2F 2C                 ./,
        ora     #$28                            ; F842 09 28                    .(
        and     $31,x                           ; F844 35 31                    51
        .byte   $80                             ; F846 80                       .
        asl     $092E                           ; F847 0E 2E 09                 ...
        and     $8031,y                         ; F84A 39 31 80                 91.
        .byte   $80                             ; F84D 80                       .
        .byte   $80                             ; F84E 80                       .
        .byte   $80                             ; F84F 80                       .
        .byte   $80                             ; F850 80                       .
        .byte   $80                             ; F851 80                       .
        asl     $092C                           ; F852 0E 2C 09                 .,.
        and     $3F34,y                         ; F855 39 34 3F                 94?
        .byte   $80                             ; F858 80                       .
        .byte   $80                             ; F859 80                       .
        .byte   $3C                             ; F85A 3C                       <
        asl     $36                             ; F85B 06 36                    .6
        and     ($80),y                         ; F85D 31 80                    1.
        .byte   $2F                             ; F85F 2F                       /
        .byte   $80                             ; F860 80                       .
        ora     ($21),y                         ; F861 11 21                    .!
        .byte   $32                             ; F863 32                       2
        .byte   $80                             ; F864 80                       .
        .byte   $2F                             ; F865 2F                       /
        .byte   $80                             ; F866 80                       .
        .byte   $80                             ; F867 80                       .
        .byte   $80                             ; F868 80                       .
        .byte   $80                             ; F869 80                       .
        .byte   $80                             ; F86A 80                       .
        .byte   $80                             ; F86B 80                       .
        asl     a                               ; F86C 0A                       .
        rol     a                               ; F86D 2A                       *
        .byte   $80                             ; F86E 80                       .
        .byte   $80                             ; F86F 80                       .
        .byte   $80                             ; F870 80                       .
        .byte   $80                             ; F871 80                       .
        and     $3909,x                         ; F872 3D 09 39                 =.9
        and     ($80),y                         ; F875 31 80                    1.
        .byte   $80                             ; F877 80                       .
        .byte   $80                             ; F878 80                       .
        .byte   $80                             ; F879 80                       .
        .byte   $80                             ; F87A 80                       .
        .byte   $80                             ; F87B 80                       .
        .byte   $80                             ; F87C 80                       .
        .byte   $80                             ; F87D 80                       .
        .byte   $80                             ; F87E 80                       .
        .byte   $80                             ; F87F 80                       .
LF880:  .byte   $80                             ; F880 80                       .
        .byte   $80                             ; F881 80                       .
        .byte   $80                             ; F882 80                       .
        .byte   $80                             ; F883 80                       .
        bpl     LF8A6                           ; F884 10 20                    . 
        jsr     L1320                           ; F886 20 20 13                   .
        .byte   $80                             ; F889 80                       .
        .byte   $80                             ; F88A 80                       .
        ora     ($21),y                         ; F88B 11 21                    .!
        .byte   $32                             ; F88D 32                       2
        .byte   $80                             ; F88E 80                       .
        .byte   $80                             ; F88F 80                       .
        .byte   $80                             ; F890 80                       .
        .byte   $80                             ; F891 80                       .
        asl     $8080                           ; F892 0E 80 80                 ...
        .byte   $80                             ; F895 80                       .
        .byte   $80                             ; F896 80                       .
        .byte   $80                             ; F897 80                       .
        .byte   $80                             ; F898 80                       .
        .byte   $80                             ; F899 80                       .
        .byte   $80                             ; F89A 80                       .
        and     $706B                           ; F89B 2D 6B 70                 -kp
        .byte   $62                             ; F89E 62                       b
        .byte   $72                             ; F89F 72                       r
        and     ($80),y                         ; F8A0 31 80                    1.
        .byte   $2F                             ; F8A2 2F                       /
        .byte   $80                             ; F8A3 80                       .
        .byte   $80                             ; F8A4 80                       .
        .byte   $80                             ; F8A5 80                       .
LF8A6:  .byte   $80                             ; F8A6 80                       .
        asl     $8080                           ; F8A7 0E 80 80                 ...
        .byte   $1F                             ; F8AA 1F                       .
        .byte   $80                             ; F8AB 80                       .
        .byte   $80                             ; F8AC 80                       .
        bpl     LF8CF                           ; F8AD 10 20                    . 
        .byte   $13                             ; F8AF 13                       .
        .byte   $80                             ; F8B0 80                       .
        .byte   $0F                             ; F8B1 0F                       .
        .byte   $80                             ; F8B2 80                       .
        rol     $6761                           ; F8B3 2E 61 67                 .ag
        sei                                     ; F8B6 78                       x
        .byte   $73                             ; F8B7 73                       s
        lsr     $8080,x                         ; F8B8 5E 80 80                 ^..
        .byte   $80                             ; F8BB 80                       .
        .byte   $80                             ; F8BC 80                       .
        .byte   $0F                             ; F8BD 0F                       .
        .byte   $80                             ; F8BE 80                       .
        .byte   $2F                             ; F8BF 2F                       /
        .byte   $80                             ; F8C0 80                       .
        .byte   $80                             ; F8C1 80                       .
        .byte   $2F                             ; F8C2 2F                       /
        .byte   $80                             ; F8C3 80                       .
        and     $3505                           ; F8C4 2D 05 35                 -.5
        and     ($80),y                         ; F8C7 31 80                    1.
        .byte   $1F                             ; F8C9 1F                       .
        .byte   $80                             ; F8CA 80                       .
        .byte   $80                             ; F8CB 80                       .
        .byte   $22                             ; F8CC 22                       "
        adc     ($71,x)                         ; F8CD 61 71                    aq
LF8CF:  ror     $34                             ; F8CF 66 34                    f4
        .byte   $80                             ; F8D1 80                       .
        .byte   $80                             ; F8D2 80                       .
        .byte   $0F                             ; F8D3 0F                       .
        .byte   $80                             ; F8D4 80                       .
        .byte   $1F                             ; F8D5 1F                       .
        .byte   $80                             ; F8D6 80                       .
        .byte   $80                             ; F8D7 80                       .
        asl     $8080                           ; F8D8 0E 80 80                 ...
        bpl     LF8FD                           ; F8DB 10 20                    . 
        ora     #$39                            ; F8DD 09 39                    .9
        .byte   $23                             ; F8DF 23                       #
        .byte   $80                             ; F8E0 80                       .
        .byte   $2F                             ; F8E1 2F                       /
        .byte   $80                             ; F8E2 80                       .
        .byte   $04                             ; F8E3 04                       .
        bit     $0A                             ; F8E4 24 0A                    $.
        .byte   $1A                             ; F8E6 1A                       .
        rol     a                               ; F8E7 2A                       *
        .byte   $80                             ; F8E8 80                       .
        .byte   $80                             ; F8E9 80                       .
        .byte   $80                             ; F8EA 80                       .
        .byte   $80                             ; F8EB 80                       .
        .byte   $80                             ; F8EC 80                       .
        .byte   $80                             ; F8ED 80                       .
        .byte   $80                             ; F8EE 80                       .
LF8EF:  .byte   $80                             ; F8EF 80                       .
        .byte   $80                             ; F8F0 80                       .
        .byte   $80                             ; F8F1 80                       .
        bpl     LF951                           ; F8F2 10 5D                    .]
        ora     $8282                           ; F8F4 0D 82 82                 ...
        .byte   $82                             ; F8F7 82                       .
        .byte   $80                             ; F8F8 80                       .
        .byte   $80                             ; F8F9 80                       .
        .byte   $2D                             ; F8FA 2D                       -
        .byte   $6B                             ; F8FB 6B                       k
LF8FC:  .byte   $72                             ; F8FC 72                       r
LF8FD:  .byte   $1B                             ; F8FD 1B                       .
        .byte   $24                             ; F8FE 24                       $
LF8FF:  .byte   $80                             ; F8FF 80                       .
        .byte   $04                             ; F900 04                       .
        bit     $10                             ; F901 24 10                    $.
        .byte   $13                             ; F903 13                       .
        .byte   $80                             ; F904 80                       .
        .byte   $80                             ; F905 80                       .
        .byte   $80                             ; F906 80                       .
        .byte   $80                             ; F907 80                       .
        .byte   $80                             ; F908 80                       .
        bpl     LF968                           ; F909 10 5D                    .]
        php                                     ; F90B 08                       .
        .byte   $82                             ; F90C 82                       .
LF90D:  ora     $15                             ; F90D 05 15                    ..
        and     L000F                           ; F90F 25 0F                    %.
        .byte   $80                             ; F911 80                       .
        .byte   $5B                             ; F912 5B                       [
        ror     $64,x                           ; F913 76 64                    vd
        .byte   $74                             ; F915 74                       t
        .byte   $72                             ; F916 72                       r
        .byte   $5C                             ; F917 5C                       \
        .byte   $6B                             ; F918 6B                       k
        .byte   $62                             ; F919 62                       b
        .byte   $72                             ; F91A 72                       r
        .byte   $23                             ; F91B 23                       #
        .byte   $13                             ; F91C 13                       .
        .byte   $80                             ; F91D 80                       .
        .byte   $80                             ; F91E 80                       .
        asl     $052D                           ; F91F 0E 2D 05                 .-.
        ora     $25,x                           ; F922 15 25                    .%
        and     L0006,x                         ; F924 35 06                    5.
        sta     ($81,x)                         ; F926 81 81                    ..
        .byte   $1F                             ; F928 1F                       .
        bit     $776B                           ; F929 2C 6B 77                 ,kw
        sei                                     ; F92C 78                       x
        sei                                     ; F92D 78                       x
        adc     #$07                            ; F92E 69 07                    i.
        ror     $78,x                           ; F930 76 78                    vx
        .byte   $64                             ; F932 64                       d
        .byte   $72                             ; F933 72                       r
        and     ($80),y                         ; F934 31 80                    1.
        .byte   $80                             ; F936 80                       .
        .byte   $80                             ; F937 80                       .
        rol     $0209                           ; F938 2E 09 02                 ...
        sta     ($37,x)                         ; F93B 81 37                    .7
        .byte   $03                             ; F93D 03                       .
        sta     ($81,x)                         ; F93E 81 81                    ..
        .byte   $3F                             ; F940 3F                       ?
        .byte   $80                             ; F941 80                       .
        ror     $78,x                           ; F942 76 78                    vx
        sei                                     ; F944 78                       x
        sei                                     ; F945 78                       x
        ror     a                               ; F946 6A                       j
        bvs     LF9C0                           ; F947 70 77                    pw
        sei                                     ; F949 78                       x
        sei                                     ; F94A 78                       x
        .byte   $73                             ; F94B 73                       s
        and     ($80),y                         ; F94C 31 80                    1.
        .byte   $80                             ; F94E 80                       .
        .byte   $80                             ; F94F 80                       .
        .byte   $80                             ; F950 80                       .
LF951:  .byte   $22                             ; F951 22                       "
        ora     #$19                            ; F952 09 19                    ..
        .byte   $02                             ; F954 02                       .
        sec                                     ; F955 38                       8
        ora     $8029,y                         ; F956 19 29 80                 .).
        bit     $7876                           ; F959 2C 76 78                 ,vx
        sei                                     ; F95C 78                       x
        sei                                     ; F95D 78                       x
        sei                                     ; F95E 78                       x
        sei                                     ; F95F 78                       x
        sei                                     ; F960 78                       x
        sei                                     ; F961 78                       x
        sei                                     ; F962 78                       x
        .byte   $73                             ; F963 73                       s
        and     ($80),y                         ; F964 31 80                    1.
        .byte   $80                             ; F966 80                       .
        .byte   $80                             ; F967 80                       .
LF968:  .byte   $1F                             ; F968 1F                       .
        .byte   $80                             ; F969 80                       .
        ora     ($08),y                         ; F96A 11 08                    ..
        ora     #$39                            ; F96C 09 39                    .9
        ora     $15                             ; F96E 05 15                    ..
        .byte   $80                             ; F970 80                       .
        and     $6576                           ; F971 2D 76 65                 -ve
        adc     $63,x                           ; F974 75 63                    uc
        .byte   $67                             ; F976 67                       g
        sei                                     ; F977 78                       x
        sei                                     ; F978 78                       x
        sei                                     ; F979 78                       x
        sei                                     ; F97A 78                       x
        .byte   $73                             ; F97B 73                       s
        and     ($80),y                         ; F97C 31 80                    1.
        .byte   $80                             ; F97E 80                       .
        .byte   $80                             ; F97F 80                       .
        .byte   $2F                             ; F980 2F                       /
        .byte   $80                             ; F981 80                       .
        bpl     LF991                           ; F982 10 0D                    ..
        brk                                     ; F984 00                       .
        php                                     ; F985 08                       .
        asl     $81                             ; F986 06 81                    ..
        .byte   $80                             ; F988 80                       .
        rol     $7961                           ; F989 2E 61 79                 .ay
        .byte   $72                             ; F98C 72                       r
        bmi     LF9F0                           ; F98D 30 61                    0a
        .byte   $67                             ; F98F 67                       g
        sei                                     ; F990 78                       x
LF991:  sei                                     ; F991 78                       x
        adc     $66                             ; F992 65 66                    ef
        and     ($80),y                         ; F994 31 80                    1.
        .byte   $80                             ; F996 80                       .
        .byte   $80                             ; F997 80                       .
        bpl     LF9BA                           ; F998 10 20                    . 
        ora     $15                             ; F99A 05 15                    ..
        and     $35                             ; F99C 25 35                    %5
        asl     $81                             ; F99E 06 81                    ..
        .byte   $80                             ; F9A0 80                       .
        .byte   $80                             ; F9A1 80                       .
        .byte   $3C                             ; F9A2 3C                       <
        ror     $73,x                           ; F9A3 76 73                    vs
        and     ($11),y                         ; F9A5 31 11                    1.
        adc     ($71,x)                         ; F9A7 61 71                    aq
        .byte   $63                             ; F9A9 63                       c
        ror     $68                             ; F9AA 66 68                    fh
        and     ($80),y                         ; F9AC 31 80                    1.
        bpl     LF9D0                           ; F9AE 10 20                    . 
        ora     $15                             ; F9B0 05 15                    ..
        .byte   $03                             ; F9B2 03                       .
        sta     ($81,x)                         ; F9B3 81 81                    ..
        rol     $09,x                           ; F9B5 36 09                    6.
        sta     ($80,x)                         ; F9B7 81 80                    ..
        .byte   $80                             ; F9B9 80                       .
LF9BA:  and     $6661,x                         ; F9BA 3D 61 66                 =af
        and     ($80),y                         ; F9BD 31 80                    1.
        .byte   $11                             ; F9BF 11                       .
LF9C0:  and     ($1D,x)                         ; F9C0 21 1D                    !.
        bmi     LF9E5                           ; F9C2 30 21                    0!
        .byte   $32                             ; F9C4 32                       2
        and     $3505                           ; F9C5 2D 05 35                 -.5
        asl     $81                             ; F9C8 06 81                    ..
        sta     ($81,x)                         ; F9CA 81 81                    ..
        sta     ($37,x)                         ; F9CC 81 37                    .7
        rol     $81                             ; F9CE 26 81                    &.
LF9D0:  .byte   $80                             ; F9D0 80                       .
        .byte   $0F                             ; F9D1 0F                       .
        .byte   $80                             ; F9D2 80                       .
        ora     ($21),y                         ; F9D3 11 21                    .!
        .byte   $32                             ; F9D5 32                       2
        .byte   $2F                             ; F9D6 2F                       /
        .byte   $80                             ; F9D7 80                       .
        .byte   $80                             ; F9D8 80                       .
        .byte   $22                             ; F9D9 22                       "
        .byte   $32                             ; F9DA 32                       2
        .byte   $80                             ; F9DB 80                       .
        .byte   $80                             ; F9DC 80                       .
        rol     $3706                           ; F9DD 2E 06 37                 ..7
        .byte   $03                             ; F9E0 03                       .
        sta     ($81,x)                         ; F9E1 81 81                    ..
        sta     ($81,x)                         ; F9E3 81 81                    ..
LF9E5:  sta     ($81,x)                         ; F9E5 81 81                    ..
        sta     ($80,x)                         ; F9E7 81 80                    ..
        .byte   $80                             ; F9E9 80                       .
        .byte   $80                             ; F9EA 80                       .
        .byte   $80                             ; F9EB 80                       .
        .byte   $80                             ; F9EC 80                       .
        .byte   $80                             ; F9ED 80                       .
        .byte   $80                             ; F9EE 80                       .
        .byte   $0E                             ; F9EF 0E                       .
LF9F0:  .byte   $80                             ; F9F0 80                       .
        .byte   $80                             ; F9F1 80                       .
        .byte   $80                             ; F9F2 80                       .
        .byte   $80                             ; F9F3 80                       .
        .byte   $80                             ; F9F4 80                       .
        .byte   $80                             ; F9F5 80                       .
        asl     $81                             ; F9F6 06 81                    ..
        sta     ($81,x)                         ; F9F8 81 81                    ..
        sta     ($81,x)                         ; F9FA 81 81                    ..
        sta     ($81,x)                         ; F9FC 81 81                    ..
        sta     ($81,x)                         ; F9FE 81 81                    ..
        .byte   $FF                             ; FA00 FF                       .
        .byte   $FF                             ; FA01 FF                       .
        .byte   $FF                             ; FA02 FF                       .
        .byte   $FF                             ; FA03 FF                       .
        .byte   $AF                             ; FA04 AF                       .
        tax                                     ; FA05 AA                       .
        asl     a                               ; FA06 0A                       .
        tax                                     ; FA07 AA                       .
        tax                                     ; FA08 AA                       .
        ror     a                               ; FA09 6A                       j
        eor     $66,x                           ; FA0A 55 66                    Uf
        asl     a                               ; FA0C 0A                       .
        .byte   $FF                             ; FA0D FF                       .
        .byte   $FF                             ; FA0E FF                       .
        .byte   $FF                             ; FA0F FF                       .
        .byte   $FF                             ; FA10 FF                       .
        .byte   $FF                             ; FA11 FF                       .
        .byte   $AF                             ; FA12 AF                       .
        asl     a                               ; FA13 0A                       .
        ldx     $AA                             ; FA14 A6 AA                    ..
        txs                                     ; FA16 9A                       .
        eor     $0655,y                         ; FA17 59 55 06                 YU.
        .byte   $FF                             ; FA1A FF                       .
        .byte   $FF                             ; FA1B FF                       .
        ldx     $AAAA                           ; FA1C AE AA AA                 ...
        tax                                     ; FA1F AA                       .
        asl     a                               ; FA20 0A                       .
        tax                                     ; FA21 AA                       .
        tax                                     ; FA22 AA                       .
        tax                                     ; FA23 AA                       .
        txs                                     ; FA24 9A                       .
        sta     LFF09,y                         ; FA25 99 09 FF                 ...
        .byte   $FF                             ; FA28 FF                       .
        .byte   $FF                             ; FA29 FF                       .
        .byte   $EF                             ; FA2A EF                       .
        inc     $0AAA                           ; FA2B EE AA 0A                 ...
        tax                                     ; FA2E AA                       .
        tax                                     ; FA2F AA                       .
        tax                                     ; FA30 AA                       .
        tax                                     ; FA31 AA                       .
        tax                                     ; FA32 AA                       .
        asl     a                               ; FA33 0A                       .
        .byte   $FF                             ; FA34 FF                       .
        .byte   $FF                             ; FA35 FF                       .
        .byte   $FB                             ; FA36 FB                       .
        .byte   $FF                             ; FA37 FF                       .
        .byte   $FF                             ; FA38 FF                       .
        tax                                     ; FA39 AA                       .
        asl     a                               ; FA3A 0A                       .
        tax                                     ; FA3B AA                       .
        tax                                     ; FA3C AA                       .
        tax                                     ; FA3D AA                       .
        tax                                     ; FA3E AA                       .
        tax                                     ; FA3F AA                       .
        asl     a                               ; FA40 0A                       .
        .byte   $BF                             ; FA41 BF                       .
        .byte   $BB                             ; FA42 BB                       .
        tsx                                     ; FA43 BA                       .
        .byte   $BB                             ; FA44 BB                       .
        .byte   $AB                             ; FA45 AB                       .
        ror     $0A                             ; FA46 66 0A                    f.
        tax                                     ; FA48 AA                       .
        tax                                     ; FA49 AA                       .
        tax                                     ; FA4A AA                       .
        tax                                     ; FA4B AA                       .
        tax                                     ; FA4C AA                       .
        asl     a                               ; FA4D 0A                       .
        tax                                     ; FA4E AA                       .
        tax                                     ; FA4F AA                       .
        ror     $AA                             ; FA50 66 AA                    f.
        tax                                     ; FA52 AA                       .
        eor     L0006,x                         ; FA53 55 06                    U.
        tax                                     ; FA55 AA                       .
        tax                                     ; FA56 AA                       .
        eor     $AA,x                           ; FA57 55 AA                    U.
        tax                                     ; FA59 AA                       .
        asl     a                               ; FA5A 0A                       .
        tax                                     ; FA5B AA                       .
        tax                                     ; FA5C AA                       .
        sta     $AAAA,y                         ; FA5D 99 AA AA                 ...
        .byte   $5A                             ; FA60 5A                       Z
        ora     $AA                             ; FA61 05 AA                    ..
        tax                                     ; FA63 AA                       .
        tax                                     ; FA64 AA                       .
        tax                                     ; FA65 AA                       .
        tax                                     ; FA66 AA                       .
        asl     a                               ; FA67 0A                       .
        tax                                     ; FA68 AA                       .
        tax                                     ; FA69 AA                       .
        inc     $AAEE                           ; FA6A EE EE AA                 ...
        tax                                     ; FA6D AA                       .
        tax                                     ; FA6E AA                       .
        tax                                     ; FA6F AA                       .
        tax                                     ; FA70 AA                       .
        tax                                     ; FA71 AA                       .
        tax                                     ; FA72 AA                       .
        tax                                     ; FA73 AA                       .
        asl     a                               ; FA74 0A                       .
        tax                                     ; FA75 AA                       .
        tax                                     ; FA76 AA                       .
        .byte   $FB                             ; FA77 FB                       .
        .byte   $FF                             ; FA78 FF                       .
        tax                                     ; FA79 AA                       .
        tax                                     ; FA7A AA                       .
        tax                                     ; FA7B AA                       .
        tax                                     ; FA7C AA                       .
        tax                                     ; FA7D AA                       .
        tax                                     ; FA7E AA                       .
        tax                                     ; FA7F AA                       .
        eor     $0A,x                           ; FA80 55 0A                    U.
        tax                                     ; FA82 AA                       .
        nop                                     ; FA83 EA                       .
        ldx     $AAAA                           ; FA84 AE AA AA                 ...
        tax                                     ; FA87 AA                       .
        tax                                     ; FA88 AA                       .
        tax                                     ; FA89 AA                       .
        tax                                     ; FA8A AA                       .
        tax                                     ; FA8B AA                       .
        stx     $66,y                           ; FA8C 96 66                    .f
        asl     $AA                             ; FA8E 06 AA                    ..
        inc     $AFFF,x                         ; FA90 FE FF AF                 ...
        .byte   $FF                             ; FA93 FF                       .
        .byte   $EF                             ; FA94 EF                       .
        tax                                     ; FA95 AA                       .
        tax                                     ; FA96 AA                       .
        tax                                     ; FA97 AA                       .
        eor     $55,x                           ; FA98 55 55                    UU
        eor     $05,x                           ; FA9A 55 05                    U.
        tax                                     ; FA9C AA                       .
        .byte   $FF                             ; FA9D FF                       .
        .byte   $FF                             ; FA9E FF                       .
        .byte   $FF                             ; FA9F FF                       .
        .byte   $FF                             ; FAA0 FF                       .
        .byte   $FF                             ; FAA1 FF                       .
        tax                                     ; FAA2 AA                       .
        tax                                     ; FAA3 AA                       .
        tax                                     ; FAA4 AA                       .
        txs                                     ; FAA5 9A                       .
        eor     $55,x                           ; FAA6 55 55                    UU
        ora     $AA                             ; FAA8 05 AA                    ..
        .byte   $FF                             ; FAAA FF                       .
        .byte   $BF                             ; FAAB BF                       .
        .byte   $FF                             ; FAAC FF                       .
        .byte   $FF                             ; FAAD FF                       .
        .byte   $FF                             ; FAAE FF                       .
        tax                                     ; FAAF AA                       .
        tax                                     ; FAB0 AA                       .
        tax                                     ; FAB1 AA                       .
        ror     a                               ; FAB2 6A                       j
        eor     $55,x                           ; FAB3 55 55                    UU
        ora     $AA                             ; FAB5 05 AA                    ..
        .byte   $FA                             ; FAB7 FA                       .
        .byte   $AF                             ; FAB8 AF                       .
        tsx                                     ; FAB9 BA                       .
        .byte   $BB                             ; FABA BB                       .
        .byte   $BB                             ; FABB BB                       .
        tax                                     ; FABC AA                       .
        ror     a                               ; FABD 6A                       j
        lsr     $55,x                           ; FABE 56 55                    VU
        eor     $55,x                           ; FAC0 55 55                    UU
        ora     $AA                             ; FAC2 05 AA                    ..
        tax                                     ; FAC4 AA                       .
        tax                                     ; FAC5 AA                       .
        tax                                     ; FAC6 AA                       .
        tax                                     ; FAC7 AA                       .
        tax                                     ; FAC8 AA                       .
        tax                                     ; FAC9 AA                       .
        .byte   $5A                             ; FACA 5A                       Z
        eor     $55,x                           ; FACB 55 55                    UU
        eor     $55,x                           ; FACD 55 55                    UU
        ora     L0003                           ; FACF 05 03                    ..
        .byte   $03                             ; FAD1 03                       .
        .byte   $07                             ; FAD2 07                       .
        .byte   $07                             ; FAD3 07                       .
        .byte   $03                             ; FAD4 03                       .
        brk                                     ; FAD5 00                       .
        brk                                     ; FAD6 00                       .
        brk                                     ; FAD7 00                       .
        .byte   $03                             ; FAD8 03                       .
        .byte   $03                             ; FAD9 03                       .
        .byte   $07                             ; FADA 07                       .
        .byte   $07                             ; FADB 07                       .
        .byte   $03                             ; FADC 03                       .
        brk                                     ; FADD 00                       .
        brk                                     ; FADE 00                       .
        brk                                     ; FADF 00                       .
        .byte   $80                             ; FAE0 80                       .
        .byte   $80                             ; FAE1 80                       .
        cpy     #$C0                            ; FAE2 C0 C0                    ..
        .byte   $80                             ; FAE4 80                       .
        brk                                     ; FAE5 00                       .
        brk                                     ; FAE6 00                       .
        brk                                     ; FAE7 00                       .
        .byte   $80                             ; FAE8 80                       .
        .byte   $80                             ; FAE9 80                       .
        cpy     #$C0                            ; FAEA C0 C0                    ..
        .byte   $80                             ; FAEC 80                       .
LFAED:  brk                                     ; FAED 00                       .
        brk                                     ; FAEE 00                       .
        brk                                     ; FAEF 00                       .
        brk                                     ; FAF0 00                       .
        brk                                     ; FAF1 00                       .
        brk                                     ; FAF2 00                       .
        brk                                     ; FAF3 00                       .
        brk                                     ; FAF4 00                       .
        brk                                     ; FAF5 00                       .
        brk                                     ; FAF6 00                       .
        brk                                     ; FAF7 00                       .
        brk                                     ; FAF8 00                       .
        brk                                     ; FAF9 00                       .
        brk                                     ; FAFA 00                       .
        brk                                     ; FAFB 00                       .
        brk                                     ; FAFC 00                       .
        brk                                     ; FAFD 00                       .
        brk                                     ; FAFE 00                       .
        brk                                     ; FAFF 00                       .
        ora     (L0001,x)                       ; FB00 01 01                    ..
        ora     ($58,x)                         ; FB02 01 58                    .X
        .byte   $FF                             ; FB04 FF                       .
        .byte   $FF                             ; FB05 FF                       .
        .byte   $FF                             ; FB06 FF                       .
        .byte   $FF                             ; FB07 FF                       .
        .byte   $02                             ; FB08 02                       .
        bpl     LFB0D                           ; FB09 10 02                    ..
        .byte   $02                             ; FB0B 02                       .
        .byte   $10                             ; FB0C 10                       .
LFB0D:  .byte   $02                             ; FB0D 02                       .
        .byte   $02                             ; FB0E 02                       .
        .byte   $02                             ; FB0F 02                       .
        ora     ($08),y                         ; FB10 11 08                    ..
        ora     ($18),y                         ; FB12 11 18                    ..
        .byte   $04                             ; FB14 04                       .
        ora     $14                             ; FB15 05 14                    ..
        ora     $10,x                           ; FB17 15 10                    ..
        bpl     LFB1D                           ; FB19 10 02                    ..
        .byte   $02                             ; FB1B 02                       .
        .byte   $8E                             ; FB1C 8E                       .
LFB1D:  .byte   $8F                             ; FB1D 8F                       .
        .byte   $9E                             ; FB1E 9E                       .
        .byte   $9F                             ; FB1F 9F                       .
        cli                                     ; FB20 58                       X
        ora     (L0001,x)                       ; FB21 01 01                    ..
        ora     ($0A,x)                         ; FB23 01 0A                    ..
        .byte   $0B                             ; FB25 0B                       .
        .byte   $1A                             ; FB26 1A                       .
        .byte   $1B                             ; FB27 1B                       .
        ora     #$11                            ; FB28 09 11                    ..
        ora     $0611,y                         ; FB2A 19 11 06                 ...
        .byte   $07                             ; FB2D 07                       .
        ora     $0611,y                         ; FB2E 19 11 06                 ...
        .byte   $07                             ; FB31 07                       .
        and     $0111,y                         ; FB32 39 11 01                 9..
        ora     ($58,x)                         ; FB35 01 58                    .X
        ora     ($68,x)                         ; FB37 01 68                    .h
        adc     #$01                            ; FB39 69 01                    i.
        ora     (L0001,x)                       ; FB3B 01 01                    ..
        ora     ($68,x)                         ; FB3D 01 68                    .h
        adc     #$0C                            ; FB3F 69 0C                    i.
        ora     $1D1C                           ; FB41 0D 1C 1D                 ...
        asl     $1E0F                           ; FB44 0E 0F 1E                 ...
        .byte   $1F                             ; FB47 1F                       .
        rol     $292F                           ; FB48 2E 2F 29                 ./)
        ora     ($4C),y                         ; FB4B 11 4C                    .L
        eor     $5D11                           ; FB4D 4D 11 5D                 M.]
        ora     ($28),y                         ; FB50 11 28                    .(
        ora     ($18),y                         ; FB52 11 18                    ..
        jsr     L3021                           ; FB54 20 21 30                  !0
        and     ($02),y                         ; FB57 31 02                    1.
        .byte   $02                             ; FB59 02                       .
        bcc     LFAED                           ; FB5A 90 91                    ..
        .byte   $80                             ; FB5C 80                       .
        .byte   $80                             ; FB5D 80                       .
        sta     ($81,x)                         ; FB5E 81 81                    ..
        .byte   $02                             ; FB60 02                       .
        .byte   $02                             ; FB61 02                       .
        .byte   $92                             ; FB62 92                       .
        .byte   $93                             ; FB63 93                       .
        rol     a                               ; FB64 2A                       *
        .byte   $2B                             ; FB65 2B                       +
        .byte   $3A                             ; FB66 3A                       :
        .byte   $3B                             ; FB67 3B                       ;
        and     #$11                            ; FB68 29 11                    ).
        ora     $1611,y                         ; FB6A 19 11 16                 ...
        .byte   $17                             ; FB6D 17                       .
        ora     ($18),y                         ; FB6E 11 18                    ..
        asl     $17,x                           ; FB70 16 17                    ..
        ora     ($38),y                         ; FB72 11 38                    .8
        pha                                     ; FB74 48                       H
        eor     #$03                            ; FB75 49 03                    I.
        .byte   $03                             ; FB77 03                       .
        pha                                     ; FB78 48                       H
        eor     $0303,y                         ; FB79 59 03 03                 Y..
        sei                                     ; FB7C 78                       x
        adc     $6968,y                         ; FB7D 79 68 69                 yhi
        bit     $1C2D                           ; FB80 2C 2D 1C                 ,-.
        ora     $2F2E,x                         ; FB83 1D 2E 2F                 ../
        asl     $191F,x                         ; FB86 1E 1F 19                 ...
        ora     ($1E),y                         ; FB89 11 1E                    ..
        .byte   $34                             ; FB8B 34                       4
        sty     $9C8D                           ; FB8C 8C 8D 9C                 ...
        sta     $2811,x                         ; FB8F 9D 11 28                 ..(
        ora     ($38),y                         ; FB92 11 38                    .8
        rti                                     ; FB94 40                       @

; ----------------------------------------------------------------------------
        eor     ($50,x)                         ; FB95 41 50                    AP
        eor     ($84),y                         ; FB97 51 84                    Q.
        sta     $94                             ; FB99 85 94                    ..
        sta     $86,x                           ; FB9B 95 86                    ..
        .byte   $87                             ; FB9D 87                       .
        stx     $97,y                           ; FB9E 96 97                    ..
        .byte   $64                             ; FBA0 64                       d
        bpl     LFC17                           ; FBA1 10 74                    .t
        adc     $4A,x                           ; FBA3 75 4A                    uJ
        .byte   $4B                             ; FBA5 4B                       K
        .byte   $5A                             ; FBA6 5A                       Z
        .byte   $5B                             ; FBA7 5B                       [
        and     #$11                            ; FBA8 29 11                    ).
        and     $2511,y                         ; FBAA 39 11 25                 9.%
        rol     $11                             ; FBAD 26 11                    &.
        ora     ($11),y                         ; FBAF 11 11                    ..
        ora     ($12),y                         ; FBB1 11 12                    ..
        .byte   $13                             ; FBB3 13                       .
        ora     ($11),y                         ; FBB4 11 11                    ..
        .byte   $3C                             ; FBB6 3C                       <
        and     $1111,x                         ; FBB7 3D 11 11                 =..
        rol     $783F,x                         ; FBBA 3E 3F 78                 >?x
        adc     L0101,y                         ; FBBD 79 01 01                 y..
        jmp     (L7C6D)                         ; FBC0 6C 6D 7C                 lm|

; ----------------------------------------------------------------------------
        adc     $6F6E,x                         ; FBC3 7D 6E 6F                 }no
        ror     $5E7F,x                         ; FBC6 7E 7F 5E                 ~.^
        .byte   $5F                             ; FBC9 5F                       _
        ora     ($11),y                         ; FBCA 11 11                    ..
        lsr     $4F5F,x                         ; FBCC 5E 5F 4F                 ^_O
        .byte   $3F                             ; FBCF 3F                       ?
        .byte   $27                             ; FBD0 27                       '
        .byte   $07                             ; FBD1 07                       .
        ora     ($11),y                         ; FBD2 11 11                    ..
        rts                                     ; FBD4 60                       `

; ----------------------------------------------------------------------------
        adc     ($70,x)                         ; FBD5 61 70                    ap
        adc     ($62),y                         ; FBD7 71 62                    qb
        .byte   $63                             ; FBD9 63                       c
        .byte   $72                             ; FBDA 72                       r
        .byte   $73                             ; FBDB 73                       s
        .byte   $64                             ; FBDC 64                       d
        adc     $74                             ; FBDD 65 74                    et
        adc     $66,x                           ; FBDF 75 66                    uf
        .byte   $67                             ; FBE1 67                       g
        ror     $77,x                           ; FBE2 76 77                    vw
        ror     a                               ; FBE4 6A                       j
        .byte   $6B                             ; FBE5 6B                       k
        .byte   $7A                             ; FBE6 7A                       z
        .byte   $7B                             ; FBE7 7B                       {
        asl     $24,x                           ; FBE8 16 24                    .$
        ora     ($11),y                         ; FBEA 11 11                    ..
        asl     $07,x                           ; FBEC 16 07                    ..
        .byte   $12                             ; FBEE 12                       .
        .byte   $13                             ; FBEF 13                       .
        ora     $1E11,y                         ; FBF0 19 11 1E                 ...
        .byte   $5C                             ; FBF3 5C                       \
        ora     ($11),y                         ; FBF4 11 11                    ..
        rol     $7C3F,x                         ; FBF6 3E 3F 7C                 >?|
        .byte   $5E                             ; FBF9 5E                       ^
LFBFA:  .byte   $7C                             ; FBFA 7C                       |
        .byte   $4F                             ; FBFB 4F                       O
        ora     (L0001,x)                       ; FBFC 01 01                    ..
        sei                                     ; FBFE 78                       x
        adc     $2203,y                         ; FBFF 79 03 22                 y."
        .byte   $03                             ; FC02 03                       .
        .byte   $22                             ; FC03 22                       "
        .byte   $03                             ; FC04 03                       .
        .byte   $23                             ; FC05 23                       #
        .byte   $22                             ; FC06 22                       "
        .byte   $33                             ; FC07 33                       3
LFC08:  .byte   $22                             ; FC08 22                       "
        .byte   $32                             ; FC09 32                       2
        .byte   $23                             ; FC0A 23                       #
        .byte   $03                             ; FC0B 03                       .
        .byte   $23                             ; FC0C 23                       #
        .byte   $22                             ; FC0D 22                       "
        .byte   $33                             ; FC0E 33                       3
        .byte   $22                             ; FC0F 22                       "
LFC10:  .byte   $33                             ; FC10 33                       3
        .byte   $03                             ; FC11 03                       .
        .byte   $03                             ; FC12 03                       .
        .byte   $22                             ; FC13 22                       "
        .byte   $03                             ; FC14 03                       .
        .byte   $22                             ; FC15 22                       "
        .byte   $03                             ; FC16 03                       .
LFC17:  .byte   $23                             ; FC17 23                       #
        .byte   $03                             ; FC18 03                       .
        .byte   $03                             ; FC19 03                       .
        .byte   $03                             ; FC1A 03                       .
        .byte   $22                             ; FC1B 22                       "
        .byte   $03                             ; FC1C 03                       .
        .byte   $03                             ; FC1D 03                       .
        .byte   $03                             ; FC1E 03                       .
        .byte   $23                             ; FC1F 23                       #
        .byte   $32                             ; FC20 32                       2
        .byte   $33                             ; FC21 33                       3
        .byte   $03                             ; FC22 03                       .
        .byte   $03                             ; FC23 03                       .
        .byte   $03                             ; FC24 03                       .
        .byte   $23                             ; FC25 23                       #
        .byte   $32                             ; FC26 32                       2
        .byte   $33                             ; FC27 33                       3
        .byte   $03                             ; FC28 03                       .
        .byte   $23                             ; FC29 23                       #
        .byte   $22                             ; FC2A 22                       "
        .byte   $33                             ; FC2B 33                       3
        .byte   $53                             ; FC2C 53                       S
        .byte   $32                             ; FC2D 32                       2
        .byte   $03                             ; FC2E 03                       .
        .byte   $03                             ; FC2F 03                       .
        .byte   $23                             ; FC30 23                       #
        .byte   $53                             ; FC31 53                       S
        .byte   $33                             ; FC32 33                       3
        .byte   $03                             ; FC33 03                       .
        .byte   $32                             ; FC34 32                       2
        .byte   $53                             ; FC35 53                       S
        .byte   $03                             ; FC36 03                       .
        .byte   $03                             ; FC37 03                       .
        .byte   $53                             ; FC38 53                       S
        .byte   $42                             ; FC39 42                       B
        .byte   $03                             ; FC3A 03                       .
        .byte   $52                             ; FC3B 52                       R
        .byte   $03                             ; FC3C 03                       .
        .byte   $03                             ; FC3D 03                       .
        .byte   $53                             ; FC3E 53                       S
        .byte   $43                             ; FC3F 43                       C
        .byte   $22                             ; FC40 22                       "
        .byte   $53                             ; FC41 53                       S
        .byte   $22                             ; FC42 22                       "
        .byte   $03                             ; FC43 03                       .
        .byte   $53                             ; FC44 53                       S
        .byte   $33                             ; FC45 33                       3
        .byte   $03                             ; FC46 03                       .
        .byte   $03                             ; FC47 03                       .
        .byte   $22                             ; FC48 22                       "
        .byte   $03                             ; FC49 03                       .
        .byte   $23                             ; FC4A 23                       #
        .byte   $03                             ; FC4B 03                       .
        .byte   $33                             ; FC4C 33                       3
        .byte   $03                             ; FC4D 03                       .
        .byte   $03                             ; FC4E 03                       .
        .byte   $03                             ; FC4F 03                       .
        .byte   $23                             ; FC50 23                       #
        .byte   $32                             ; FC51 32                       2
        .byte   $33                             ; FC52 33                       3
        .byte   $03                             ; FC53 03                       .
        .byte   $03                             ; FC54 03                       .
        .byte   $42                             ; FC55 42                       B
        .byte   $43                             ; FC56 43                       C
        .byte   $52                             ; FC57 52                       R
        .byte   $32                             ; FC58 32                       2
        .byte   $42                             ; FC59 42                       B
        .byte   $03                             ; FC5A 03                       .
        .byte   $52                             ; FC5B 52                       R
        .byte   $23                             ; FC5C 23                       #
        .byte   $03                             ; FC5D 03                       .
        .byte   $33                             ; FC5E 33                       3
        .byte   $22                             ; FC5F 22                       "
        .byte   $03                             ; FC60 03                       .
LFC61:  .byte   $22                             ; FC61 22                       "
        .byte   $42                             ; FC62 42                       B
        .byte   $23                             ; FC63 23                       #
        .byte   $42                             ; FC64 42                       B
        .byte   $03                             ; FC65 03                       .
        .byte   $52                             ; FC66 52                       R
        .byte   $53                             ; FC67 53                       S
        .byte   $52                             ; FC68 52                       R
        .byte   $33                             ; FC69 33                       3
        .byte   $03                             ; FC6A 03                       .
        .byte   $03                             ; FC6B 03                       .
        ora     ($35),y                         ; FC6C 11 35                    .5
        .byte   $44                             ; FC6E 44                       D
        eor     $54                             ; FC6F 45 54                    ET
        eor     $44,x                           ; FC71 55 44                    UD
        eor     $36                             ; FC73 45 36                    E6
        .byte   $37                             ; FC75 37                       7
        .byte   $03                             ; FC76 03                       .
        .byte   $03                             ; FC77 03                       .
        ror     $7E6F                           ; FC78 6E 6F 7E                 no~
        lsr     $25                             ; FC7B 46 25                    F%
LFC7D:  .byte   $47                             ; FC7D 47                       G
        ora     ($57),y                         ; FC7E 11 57                    .W
LFC80:  .byte   $23                             ; FC80 23                       #
        .byte   $03                             ; FC81 03                       .
        .byte   $33                             ; FC82 33                       3
        .byte   $03                             ; FC83 03                       .
        ldx     #$A3                            ; FC84 A2 A3                    ..
        .byte   $B2                             ; FC86 B2                       .
        .byte   $B3                             ; FC87 B3                       .
        cpx     #$E1                            ; FC88 E0 E1                    ..
        beq     LFC7D                           ; FC8A F0 F1                    ..
        .byte   $E2                             ; FC8C E2                       .
        .byte   $E3                             ; FC8D E3                       .
        .byte   $F2                             ; FC8E F2                       .
        .byte   $F3                             ; FC8F F3                       .
        tay                                     ; FC90 A8                       .
        lda     #$B8                            ; FC91 A9 B8                    ..
        .byte   $B9                             ; FC93 B9                       .
        tax                                     ; FC94 AA                       .
LFC95:  .byte   $AB                             ; FC95 AB                       .
        tsx                                     ; FC96 BA                       .
        .byte   $BB                             ; FC97 BB                       .
        cpy     $C5                             ; FC98 C4 C5                    ..
        .byte   $D4                             ; FC9A D4                       .
        cmp     $AA,x                           ; FC9B D5 AA                    ..
        inc     $AA                             ; FC9D E6 AA                    ..
        tax                                     ; FC9F AA                       .
        ora     (L0001,x)                       ; FCA0 01 01                    ..
        ora     ($E7,x)                         ; FCA2 01 E7                    ..
        cpx     $E4                             ; FCA4 E4 E4                    ..
        sbc     $E5                             ; FCA6 E5 E5                    ..
        tax                                     ; FCA8 AA                       .
        tax                                     ; FCA9 AA                       .
        inc     $F7,x                           ; FCAA F6 F7                    ..
        ldy     #$A1                            ; FCAC A0 A1                    ..
        bcs     LFC61                           ; FCAE B0 B1                    ..
        brk                                     ; FCB0 00                       .
        brk                                     ; FCB1 00                       .
        brk                                     ; FCB2 00                       .
        brk                                     ; FCB3 00                       .
        brk                                     ; FCB4 00                       .
        brk                                     ; FCB5 00                       .
        brk                                     ; FCB6 00                       .
        brk                                     ; FCB7 00                       .
        brk                                     ; FCB8 00                       .
        brk                                     ; FCB9 00                       .
        brk                                     ; FCBA 00                       .
        brk                                     ; FCBB 00                       .
        brk                                     ; FCBC 00                       .
        brk                                     ; FCBD 00                       .
        brk                                     ; FCBE 00                       .
        brk                                     ; FCBF 00                       .
        cpy     #$C1                            ; FCC0 C0 C1                    ..
        bne     LFC95                           ; FCC2 D0 D1                    ..
        .byte   $C2                             ; FCC4 C2                       .
        .byte   $C3                             ; FCC5 C3                       .
        .byte   $D2                             ; FCC6 D2                       .
        .byte   $D3                             ; FCC7 D3                       .
        ldy     $A5                             ; FCC8 A4 A5                    ..
        ldy     $B5,x                           ; FCCA B4 B5                    ..
        ldx     $A7                             ; FCCC A6 A7                    ..
        ldx     $B7,y                           ; FCCE B6 B7                    ..
        iny                                     ; FCD0 C8                       .
        cmp     #$D8                            ; FCD1 C9 D8                    ..
        cmp     LCBCA,y                         ; FCD3 D9 CA CB                 ...
        .byte   $DA                             ; FCD6 DA                       .
        .byte   $DB                             ; FCD7 DB                       .
        inc     $E6                             ; FCD8 E6 E6                    ..
        lda     #$A9                            ; FCDA A9 A9                    ..
        inc     $AA                             ; FCDC E6 AA                    ..
        tax                                     ; FCDE AA                       .
        tax                                     ; FCDF AA                       .
        tax                                     ; FCE0 AA                       .
        tax                                     ; FCE1 AA                       .
        tax                                     ; FCE2 AA                       .
        tax                                     ; FCE3 AA                       .
        tay                                     ; FCE4 A8                       .
        inc     $B8                             ; FCE5 E6 B8                    ..
        lda     $AAAA,y                         ; FCE7 B9 AA AA                 ...
        .byte   $F4                             ; FCEA F4                       .
        sbc     L0000,x                         ; FCEB F5 00                    ..
        brk                                     ; FCED 00                       .
        brk                                     ; FCEE 00                       .
        brk                                     ; FCEF 00                       .
        brk                                     ; FCF0 00                       .
        brk                                     ; FCF1 00                       .
        brk                                     ; FCF2 00                       .
        brk                                     ; FCF3 00                       .
        .byte   $04                             ; FCF4 04                       .
        .byte   $04                             ; FCF5 04                       .
        .byte   $02                             ; FCF6 02                       .
        .byte   $02                             ; FCF7 02                       .
        ora     L0004                           ; FCF8 05 04                    ..
        .byte   $02                             ; FCFA 02                       .
        .byte   $02                             ; FCFB 02                       .
        ora     $05                             ; FCFC 05 05                    ..
        .byte   $02                             ; FCFE 02                       .
        .byte   $02                             ; FCFF 02                       .
        ora     (L0001,x)                       ; FD00 01 01                    ..
        ora     (L0001,x)                       ; FD02 01 01                    ..
        .byte   $02                             ; FD04 02                       .
        .byte   $02                             ; FD05 02                       .
        .byte   $02                             ; FD06 02                       .
        .byte   $02                             ; FD07 02                       .
        .byte   $03                             ; FD08 03                       .
        .byte   $03                             ; FD09 03                       .
        .byte   $03                             ; FD0A 03                       .
        .byte   $03                             ; FD0B 03                       .
        jmp     (L7C6D)                         ; FD0C 6C 6D 7C                 lm|

; ----------------------------------------------------------------------------
        adc     $6F6E,x                         ; FD0F 7D 6E 6F                 }no
        ror     $8C7F,x                         ; FD12 7E 7F 8C                 ~..
        sta     $9D9C                           ; FD15 8D 9C 9D                 ...
        stx     $9E8F                           ; FD18 8E 8F 9E                 ...
        .byte   $9F                             ; FD1B 9F                       .
        php                                     ; FD1C 08                       .
        ora     #$18                            ; FD1D 09 18                    ..
        ora     $5150,y                         ; FD1F 19 50 51                 .PQ
        .byte   $53                             ; FD22 53                       S
        .byte   $54                             ; FD23 54                       T
        ora     (L0001,x)                       ; FD24 01 01                    ..
        ora     ($28,x)                         ; FD26 01 28                    .(
        ora     (L0001,x)                       ; FD28 01 01                    ..
        bpl     LFD3D                           ; FD2A 10 11                    ..
        jsr     L3021                           ; FD2C 20 21 30                  !0
        and     ($AC),y                         ; FD2F 31 AC                    1.
        lda     $BDBC                           ; FD31 AD BC BD                 ...
        ldx     $BEAF                           ; FD34 AE AF BE                 ...
        .byte   $BF                             ; FD37 BF                       .
        .byte   $02                             ; FD38 02                       .
        .byte   $02                             ; FD39 02                       .
        cpy     $02CD                           ; FD3A CC CD 02                 ...
LFD3D:  .byte   $02                             ; FD3D 02                       .
        dec     $32CF                           ; FD3E CE CF 32                 ..2
        .byte   $33                             ; FD41 33                       3
        and     $25                             ; FD42 25 25                    %%
        .byte   $34                             ; FD44 34                       4
        and     $25,x                           ; FD45 35 25                    5%
        and     $36                             ; FD47 25 36                    %6
        .byte   $37                             ; FD49 37                       7
        and     $25                             ; FD4A 25 25                    %%
        ora     (L0001,x)                       ; FD4C 01 01                    ..
        rol     $27                             ; FD4E 26 27                    &'
        .byte   $22                             ; FD50 22                       "
        .byte   $23                             ; FD51 23                       #
        and     $25                             ; FD52 25 25                    %%
        bit     $33                             ; FD54 24 33                    $3
        and     $25                             ; FD56 25 25                    %%
        sec                                     ; FD58 38                       8
        and     $2525,y                         ; FD59 39 25 25                 9%%
        .byte   $3A                             ; FD5C 3A                       :
        .byte   $02                             ; FD5D 02                       .
        and     $25                             ; FD5E 25 25                    %%
        .byte   $02                             ; FD60 02                       .
        .byte   $02                             ; FD61 02                       .
        and     $25                             ; FD62 25 25                    %%
        .byte   $02                             ; FD64 02                       .
        .byte   $3F                             ; FD65 3F                       ?
        and     $25                             ; FD66 25 25                    %%
        ora     (L0001,x)                       ; FD68 01 01                    ..
        ora     ($29,x)                         ; FD6A 01 29                    .)
        .byte   $1A                             ; FD6C 1A                       .
        .byte   $1B                             ; FD6D 1B                       .
        rol     a                               ; FD6E 2A                       *
        .byte   $2B                             ; FD6F 2B                       +
        ora     (L0001,x)                       ; FD70 01 01                    ..
        ora     ($0B,x)                         ; FD72 01 0B                    ..
        ora     (L0001,x)                       ; FD74 01 01                    ..
        .byte   $0C                             ; FD76 0C                       .
        ora     $1D1C                           ; FD77 0D 1C 1D                 ...
        .byte   $02                             ; FD7A 02                       .
        and     $011E                           ; FD7B 2D 1E 01                 -..
        rol     $382F                           ; FD7E 2E 2F 38                 ./8
        .byte   $02                             ; FD81 02                       .
        and     $25                             ; FD82 25 25                    %%
        bit     $2533                           ; FD84 2C 33 25                 ,3%
        and     $23                             ; FD87 25 23                    %#
        bit     $25                             ; FD89 24 25                    $%
        and     $44                             ; FD8B 25 44                    %D
        ora     ($02,x)                         ; FD8D 01 02                    ..
        eor     $40,x                           ; FD8F 55 40                    U@
        eor     ($02,x)                         ; FD91 41 02                    A.
        .byte   $02                             ; FD93 02                       .
        ora     ($45,x)                         ; FD94 01 45                    .E
        .byte   $52                             ; FD96 52                       R
        .byte   $02                             ; FD97 02                       .
        eor     $4701,y                         ; FD98 59 01 47                 Y.G
        eor     L0001                           ; FD9B 45 01                    E.
        ora     ($46,x)                         ; FD9D 01 46                    .F
        rti                                     ; FD9F 40                       @

; ----------------------------------------------------------------------------
        ora     (L0001,x)                       ; FDA0 01 01                    ..
        eor     (L0001,x)                       ; FDA2 41 01                    A.
        .byte   $02                             ; FDA4 02                       .
        .byte   $52                             ; FDA5 52                       R
        .byte   $02                             ; FDA6 02                       .
        .byte   $02                             ; FDA7 02                       .
        ora     (L0001,x)                       ; FDA8 01 01                    ..
        .byte   $43                             ; FDAA 43                       C
        .byte   $44                             ; FDAB 44                       D
        eor     L0001,x                         ; FDAC 55 01                    U.
        .byte   $02                             ; FDAE 02                       .
        lsr     L0001,x                         ; FDAF 56 01                    V.
        ora     ($57,x)                         ; FDB1 01 57                    .W
        cli                                     ; FDB3 58                       X
        ora     (L0001,x)                       ; FDB4 01 01                    ..
        eor     $015A,y                         ; FDB6 59 5A 01                 YZ.
        ora     ($45,x)                         ; FDB9 01 45                    .E
        lsr     L0001                           ; FDBB 46 01                    F.
        jmp     L025B                           ; FDBD 4C 5B 02                 L[.

; ----------------------------------------------------------------------------
        ora     (L0001,x)                       ; FDC0 01 01                    ..
        ora     ($3C,x)                         ; FDC2 01 3C                    .<
        .byte   $53                             ; FDC4 53                       S
        .byte   $54                             ; FDC5 54                       T
        and     $013E,x                         ; FDC6 3D 3E 01                 =>.
        ora     ($50,x)                         ; FDC9 01 50                    .P
        eor     ($48),y                         ; FDCB 51 48                    QH
        .byte   $02                             ; FDCD 02                       .
        .byte   $02                             ; FDCE 02                       .
        .byte   $02                             ; FDCF 02                       .
        eor     $5D4E                           ; FDD0 4D 4E 5D                 MN]
        lsr     $594F,x                         ; FDD3 5E 4F 59                 ^OY
        .byte   $5F                             ; FDD6 5F                       _
        .byte   $02                             ; FDD7 02                       .
        lsr     $40                             ; FDD8 46 40                    F@
        .byte   $02                             ; FDDA 02                       .
        .byte   $02                             ; FDDB 02                       .
        brk                                     ; FDDC 00                       .
        brk                                     ; FDDD 00                       .
        brk                                     ; FDDE 00                       .
        brk                                     ; FDDF 00                       .
        brk                                     ; FDE0 00                       .
        brk                                     ; FDE1 00                       .
        brk                                     ; FDE2 00                       .
        brk                                     ; FDE3 00                       .
        brk                                     ; FDE4 00                       .
        brk                                     ; FDE5 00                       .
        brk                                     ; FDE6 00                       .
        brk                                     ; FDE7 00                       .
        brk                                     ; FDE8 00                       .
        brk                                     ; FDE9 00                       .
        brk                                     ; FDEA 00                       .
        brk                                     ; FDEB 00                       .
        brk                                     ; FDEC 00                       .
        brk                                     ; FDED 00                       .
        brk                                     ; FDEE 00                       .
        brk                                     ; FDEF 00                       .
        brk                                     ; FDF0 00                       .
        brk                                     ; FDF1 00                       .
        brk                                     ; FDF2 00                       .
        brk                                     ; FDF3 00                       .
        brk                                     ; FDF4 00                       .
        brk                                     ; FDF5 00                       .
        brk                                     ; FDF6 00                       .
        brk                                     ; FDF7 00                       .
        brk                                     ; FDF8 00                       .
        brk                                     ; FDF9 00                       .
        brk                                     ; FDFA 00                       .
        brk                                     ; FDFB 00                       .
        brk                                     ; FDFC 00                       .
        brk                                     ; FDFD 00                       .
        brk                                     ; FDFE 00                       .
LFDFF:  brk                                     ; FDFF 00                       .
        ror     $66                             ; FE00 66 66                    ff
        ror     $66                             ; FE02 66 66                    ff
        ror     $66                             ; FE04 66 66                    ff
        rti                                     ; FE06 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; FE07 00                       .
        brk                                     ; FE08 00                       .
        brk                                     ; FE09 00                       .
        brk                                     ; FE0A 00                       .
        brk                                     ; FE0B 00                       .
        brk                                     ; FE0C 00                       .
        brk                                     ; FE0D 00                       .
        brk                                     ; FE0E 00                       .
        brk                                     ; FE0F 00                       .
        ror     $66                             ; FE10 66 66                    ff
        ror     $66                             ; FE12 66 66                    ff
        ror     $64                             ; FE14 66 64                    fd
        bmi     LFE18                           ; FE16 30 00                    0.
LFE18:  brk                                     ; FE18 00                       .
        brk                                     ; FE19 00                       .
        brk                                     ; FE1A 00                       .
        brk                                     ; FE1B 00                       .
        brk                                     ; FE1C 00                       .
        brk                                     ; FE1D 00                       .
        brk                                     ; FE1E 00                       .
        brk                                     ; FE1F 00                       .
        ror     $66                             ; FE20 66 66                    ff
        ror     $66                             ; FE22 66 66                    ff
        ror     $64                             ; FE24 66 64                    fd
        brk                                     ; FE26 00                       .
        brk                                     ; FE27 00                       .
        brk                                     ; FE28 00                       .
        brk                                     ; FE29 00                       .
        brk                                     ; FE2A 00                       .
        rol     $66,x                           ; FE2B 36 66                    6f
        ror     $30                             ; FE2D 66 30                    f0
        brk                                     ; FE2F 00                       .
        ror     $66                             ; FE30 66 66                    ff
        ror     $66                             ; FE32 66 66                    ff
        ror     $63                             ; FE34 66 63                    fc
        brk                                     ; FE36 00                       .
        brk                                     ; FE37 00                       .
        brk                                     ; FE38 00                       .
        brk                                     ; FE39 00                       .
        rol     $66,x                           ; FE3A 36 66                    6f
        ror     $66                             ; FE3C 66 66                    ff
        ror     $40                             ; FE3E 66 40                    f@
        ror     $66                             ; FE40 66 66                    ff
        ldx     $66,y                           ; FE42 B6 66                    .f
        .byte   $63                             ; FE44 63                       c
        brk                                     ; FE45 00                       .
        rol     $63,x                           ; FE46 36 63                    6c
        lsr     $63                             ; FE48 46 63                    Fc
        rol     $66,x                           ; FE4A 36 66                    6f
        ror     $66                             ; FE4C 66 66                    ff
        ror     $43                             ; FE4E 66 43                    fC
        ror     $66                             ; FE50 66 66                    ff
        .byte   $33                             ; FE52 33                       3
        ror     $66                             ; FE53 66 66                    ff
        .byte   $64                             ; FE55 64                       d
        rol     $63,x                           ; FE56 36 63                    6c
        lsr     $66                             ; FE58 46 66                    Ff
        .byte   $33                             ; FE5A 33                       3
        ror     $66                             ; FE5B 66 66                    ff
        .byte   $64                             ; FE5D 64                       d
        .byte   $44                             ; FE5E 44                       D
        bmi     LFEC7                           ; FE5F 30 66                    0f
        ror     $33                             ; FE61 66 33                    f3
        ror     $66                             ; FE63 66 66                    ff
        .byte   $63                             ; FE65 63                       c
        .byte   $03                             ; FE66 03                       .
        bmi     LFEAF                           ; FE67 30 46                    0F
        ror     $33                             ; FE69 66 33                    f3
        ror     $66                             ; FE6B 66 66                    ff
        ror     $40                             ; FE6D 66 40                    f@
        brk                                     ; FE6F 00                       .
        ror     $66                             ; FE70 66 66                    ff
        bmi     LFEAA                           ; FE72 30 36                    06
        ror     $63                             ; FE74 66 63                    fc
        brk                                     ; FE76 00                       .
        brk                                     ; FE77 00                       .
        lsr     $66                             ; FE78 46 66                    Ff
        bmi     LFEB6                           ; FE7A 30 3A                    0:
        ror     $66                             ; FE7C 66 66                    ff
        .byte   $64                             ; FE7E 64                       d
        brk                                     ; FE7F 00                       .
        ror     $66                             ; FE80 66 66                    ff
        bmi     LFEBA                           ; FE82 30 36                    06
        ror     $64                             ; FE84 66 64                    fd
        brk                                     ; FE86 00                       .
        brk                                     ; FE87 00                       .
        .byte   $34                             ; FE88 34                       4
        .byte   $43                             ; FE89 43                       C
        .byte   $03                             ; FE8A 03                       .
        ror     $66                             ; FE8B 66 66                    ff
        ror     $64                             ; FE8D 66 64                    fd
        brk                                     ; FE8F 00                       .
        .byte   $33                             ; FE90 33                       3
        ror     $30                             ; FE91 66 30                    f0
        rol     $66,x                           ; FE93 36 66                    6f
        .byte   $43                             ; FE95 43                       C
        brk                                     ; FE96 00                       .
        brk                                     ; FE97 00                       .
        brk                                     ; FE98 00                       .
        brk                                     ; FE99 00                       .
        .byte   $03                             ; FE9A 03                       .
        ror     $66                             ; FE9B 66 66                    ff
        ror     $64                             ; FE9D 66 64                    fd
        bmi     LFEA4                           ; FE9F 30 03                    0.
        ror     $30                             ; FEA1 66 30                    f0
        .byte   $03                             ; FEA3 03                       .
LFEA4:  .byte   $34                             ; FEA4 34                       4
        lsr     $66                             ; FEA5 46 66                    Ff
        bmi     LFEA9                           ; FEA7 30 00                    0.
LFEA9:  brk                                     ; FEA9 00                       .
LFEAA:  .byte   $04                             ; FEAA 04                       .
        ror     $66                             ; FEAB 66 66                    ff
        ror     $64                             ; FEAD 66 64                    fd
LFEAF:  bmi     LFEB1                           ; FEAF 30 00                    0.
LFEB1:  .byte   $33                             ; FEB1 33                       3
        brk                                     ; FEB2 00                       .
        brk                                     ; FEB3 00                       .
        brk                                     ; FEB4 00                       .
        .byte   $46                             ; FEB5 46                       F
LFEB6:  ror     $66                             ; FEB6 66 66                    ff
        rti                                     ; FEB8 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; FEB9 00                       .
LFEBA:  .byte   $03                             ; FEBA 03                       .
        lsr     $66                             ; FEBB 46 66                    Ff
        ror     $64                             ; FEBD 66 64                    fd
        brk                                     ; FEBF 00                       .
        brk                                     ; FEC0 00                       .
        brk                                     ; FEC1 00                       .
        brk                                     ; FEC2 00                       .
        brk                                     ; FEC3 00                       .
        brk                                     ; FEC4 00                       .
        .byte   $34                             ; FEC5 34                       4
        .byte   $46                             ; FEC6 46                       F
LFEC7:  ror     $40                             ; FEC7 66 40                    f@
        brk                                     ; FEC9 00                       .
        brk                                     ; FECA 00                       .
        .byte   $34                             ; FECB 34                       4
        .byte   $44                             ; FECC 44                       D
        .byte   $44                             ; FECD 44                       D
        .byte   $43                             ; FECE 43                       C
        brk                                     ; FECF 00                       .
        brk                                     ; FED0 00                       .
        lsr     $40                             ; FED1 46 40                    F@
        brk                                     ; FED3 00                       .
        brk                                     ; FED4 00                       .
        brk                                     ; FED5 00                       .
        .byte   $34                             ; FED6 34                       4
        .byte   $44                             ; FED7 44                       D
        bmi     LFEDA                           ; FED8 30 00                    0.
LFEDA:  brk                                     ; FEDA 00                       .
        brk                                     ; FEDB 00                       .
        brk                                     ; FEDC 00                       .
        brk                                     ; FEDD 00                       .
        brk                                     ; FEDE 00                       .
        brk                                     ; FEDF 00                       .
        brk                                     ; FEE0 00                       .
        .byte   $34                             ; FEE1 34                       4
        bmi     LFEE4                           ; FEE2 30 00                    0.
LFEE4:  brk                                     ; FEE4 00                       .
        brk                                     ; FEE5 00                       .
        brk                                     ; FEE6 00                       .
        brk                                     ; FEE7 00                       .
        brk                                     ; FEE8 00                       .
        brk                                     ; FEE9 00                       .
        brk                                     ; FEEA 00                       .
        brk                                     ; FEEB 00                       .
        brk                                     ; FEEC 00                       .
        brk                                     ; FEED 00                       .
        lsr     $66                             ; FEEE 46 66                    Ff
        brk                                     ; FEF0 00                       .
        brk                                     ; FEF1 00                       .
        brk                                     ; FEF2 00                       .
        brk                                     ; FEF3 00                       .
        brk                                     ; FEF4 00                       .
        brk                                     ; FEF5 00                       .
        brk                                     ; FEF6 00                       .
        brk                                     ; FEF7 00                       .
LFEF8:  brk                                     ; FEF8 00                       .
        brk                                     ; FEF9 00                       .
        brk                                     ; FEFA 00                       .
        brk                                     ; FEFB 00                       .
        brk                                     ; FEFC 00                       .
        brk                                     ; FEFD 00                       .
        lsr     $66                             ; FEFE 46 66                    Ff
LFF00:  bmi     LFF02                           ; FF00 30 00                    0.
LFF02:  brk                                     ; FF02 00                       .
        brk                                     ; FF03 00                       .
        brk                                     ; FF04 00                       .
        brk                                     ; FF05 00                       .
        brk                                     ; FF06 00                       .
        brk                                     ; FF07 00                       .
        brk                                     ; FF08 00                       .
LFF09:  brk                                     ; FF09 00                       .
        brk                                     ; FF0A 00                       .
        brk                                     ; FF0B 00                       .
        brk                                     ; FF0C 00                       .
        .byte   $04                             ; FF0D 04                       .
        .byte   $66                             ; FF0E 66                       f
LFF0F:  ror     $44                             ; FF0F 66 44                    fD
        bmi     LFF13                           ; FF11 30 00                    0.
LFF13:  brk                                     ; FF13 00                       .
        brk                                     ; FF14 00                       .
        .byte   $04                             ; FF15 04                       .
        ror     $40                             ; FF16 66 40                    f@
        brk                                     ; FF18 00                       .
        brk                                     ; FF19 00                       .
LFF1A:  .byte   $04                             ; FF1A 04                       .
        ror     $30                             ; FF1B 66 30                    f0
        .byte   $04                             ; FF1D 04                       .
LFF1E:  ror     $66                             ; FF1E 66 66                    ff
LFF20:  lsr     $64                             ; FF20 46 64                    Fd
LFF22:  rti                                     ; FF22 40                       @

; ----------------------------------------------------------------------------
LFF23:  brk                                     ; FF23 00                       .
        brk                                     ; FF24 00                       .
        .byte   $04                             ; FF25 04                       .
        ror     $40                             ; FF26 66 40                    f@
        brk                                     ; FF28 00                       .
LFF29:  brk                                     ; FF29 00                       .
        .byte   $44                             ; FF2A 44                       D
        ror     $64                             ; FF2B 66 64                    fd
        lsr     $66                             ; FF2D 46 66                    Ff
        ror     $66                             ; FF2F 66 66                    ff
        .byte   $64                             ; FF31 64                       d
        bmi     LFF34                           ; FF32 30 00                    0.
LFF34:  brk                                     ; FF34 00                       .
        .byte   $03                             ; FF35 03                       .
        .byte   $44                             ; FF36 44                       D
        bmi     LFF39                           ; FF37 30 00                    0.
LFF39:  .byte   $04                             ; FF39 04                       .
        lsr     $66                             ; FF3A 46 66                    Ff
        ror     $66                             ; FF3C 66 66                    ff
        ror     $66                             ; FF3E 66 66                    ff
        ror     $66                             ; FF40 66 66                    ff
        .byte   $64                             ; FF42 64                       d
        brk                                     ; FF43 00                       .
        brk                                     ; FF44 00                       .
        brk                                     ; FF45 00                       .
        brk                                     ; FF46 00                       .
        brk                                     ; FF47 00                       .
        brk                                     ; FF48 00                       .
        .byte   $04                             ; FF49 04                       .
        ror     $66                             ; FF4A 66 66                    ff
        ror     $66                             ; FF4C 66 66                    ff
        ror     $66                             ; FF4E 66 66                    ff
        lsr     $66                             ; FF50 46 66                    Ff
        .byte   $64                             ; FF52 64                       d
        brk                                     ; FF53 00                       .
        brk                                     ; FF54 00                       .
        brk                                     ; FF55 00                       .
        brk                                     ; FF56 00                       .
        brk                                     ; FF57 00                       .
        .byte   $04                             ; FF58 04                       .
        ror     $66                             ; FF59 66 66                    ff
        ror     $66                             ; FF5B 66 66                    ff
        ror     $66                             ; FF5D 66 66                    ff
        ror     $46                             ; FF5F 66 46                    fF
        ror     $64                             ; FF61 66 64                    fd
        bmi     LFF65                           ; FF63 30 00                    0.
LFF65:  brk                                     ; FF65 00                       .
        brk                                     ; FF66 00                       .
        brk                                     ; FF67 00                       .
        .byte   $04                             ; FF68 04                       .
        ror     $66                             ; FF69 66 66                    ff
        ror     $66                             ; FF6B 66 66                    ff
        ror     $66                             ; FF6D 66 66                    ff
        ror     $44                             ; FF6F 66 44                    fD
        lsr     $64                             ; FF71 46 64                    Fd
        .byte   $44                             ; FF73 44                       D
        rti                                     ; FF74 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; FF75 00                       .
        brk                                     ; FF76 00                       .
        brk                                     ; FF77 00                       .
        .byte   $04                             ; FF78 04                       .
        .byte   $44                             ; FF79 44                       D
        ror     $66                             ; FF7A 66 66                    ff
        ror     $66                             ; FF7C 66 66                    ff
        .byte   $66                             ; FF7E 66                       f
LFF7F:  ror     L0000                           ; FF7F 66 00                    f.
        brk                                     ; FF81 00                       .
        brk                                     ; FF82 00                       .
        brk                                     ; FF83 00                       .
        brk                                     ; FF84 00                       .
        ora     (L0000,x)                       ; FF85 01 00                    ..
        brk                                     ; FF87 00                       .
        brk                                     ; FF88 00                       .
        brk                                     ; FF89 00                       .
        brk                                     ; FF8A 00                       .
        .byte   $02                             ; FF8B 02                       .
        brk                                     ; FF8C 00                       .
LFF8D:  brk                                     ; FF8D 00                       .
        brk                                     ; FF8E 00                       .
LFF8F:  brk                                     ; FF8F 00                       .
        brk                                     ; FF90 00                       .
        .byte   $03                             ; FF91 03                       .
        brk                                     ; FF92 00                       .
        brk                                     ; FF93 00                       .
        brk                                     ; FF94 00                       .
        brk                                     ; FF95 00                       .
        brk                                     ; FF96 00                       .
        .byte   $04                             ; FF97 04                       .
        brk                                     ; FF98 00                       .
        brk                                     ; FF99 00                       .
        brk                                     ; FF9A 00                       .
        brk                                     ; FF9B 00                       .
        brk                                     ; FF9C 00                       .
        ora     L0000                           ; FF9D 05 00                    ..
        brk                                     ; FF9F 00                       .
        brk                                     ; FFA0 00                       .
        brk                                     ; FFA1 00                       .
        brk                                     ; FFA2 00                       .
        php                                     ; FFA3 08                       .
        brk                                     ; FFA4 00                       .
        brk                                     ; FFA5 00                       .
        brk                                     ; FFA6 00                       .
        brk                                     ; FFA7 00                       .
        ora     (L0000,x)                       ; FFA8 01 00                    ..
        brk                                     ; FFAA 00                       .
        brk                                     ; FFAB 00                       .
        brk                                     ; FFAC 00                       .
        brk                                     ; FFAD 00                       .
        .byte   $01                             ; FFAE 01                       .
LFFAF:  ora     L0000                           ; FFAF 05 00                    ..
        brk                                     ; FFB1 00                       .
        brk                                     ; FFB2 00                       .
        brk                                     ; FFB3 00                       .
        .byte   $02                             ; FFB4 02                       .
        brk                                     ; FFB5 00                       .
        brk                                     ; FFB6 00                       .
        brk                                     ; FFB7 00                       .
        brk                                     ; FFB8 00                       .
        brk                                     ; FFB9 00                       .
        .byte   $03                             ; FFBA 03                       .
        brk                                     ; FFBB 00                       .
        brk                                     ; FFBC 00                       .
LFFBD:  brk                                     ; FFBD 00                       .
        brk                                     ; FFBE 00                       .
        brk                                     ; FFBF 00                       .
        ora     L0000                           ; FFC0 05 00                    ..
        brk                                     ; FFC2 00                       .
        brk                                     ; FFC3 00                       .
        brk                                     ; FFC4 00                       .
        brk                                     ; FFC5 00                       .
LFFC6:  php                                     ; FFC6 08                       .
        brk                                     ; FFC7 00                       .
        brk                                     ; FFC8 00                       .
        brk                                     ; FFC9 00                       .
        brk                                     ; FFCA 00                       .
        ora     (L0000,x)                       ; FFCB 01 00                    ..
        brk                                     ; FFCD 00                       .
        brk                                     ; FFCE 00                       .
        brk                                     ; FFCF 00                       .
        brk                                     ; FFD0 00                       .
        ora     ($05,x)                         ; FFD1 01 05                    ..
        brk                                     ; FFD3 00                       .
        brk                                     ; FFD4 00                       .
        brk                                     ; FFD5 00                       .
        brk                                     ; FFD6 00                       .
        .byte   $02                             ; FFD7 02                       .
        brk                                     ; FFD8 00                       .
        brk                                     ; FFD9 00                       .
LFFDA:  brk                                     ; FFDA 00                       .
        brk                                     ; FFDB 00                       .
        brk                                     ; FFDC 00                       .
        .byte   $03                             ; FFDD 03                       .
        brk                                     ; FFDE 00                       .
        brk                                     ; FFDF 00                       .
        brk                                     ; FFE0 00                       .
        brk                                     ; FFE1 00                       .
LFFE2:  brk                                     ; FFE2 00                       .
        ora     L0000                           ; FFE3 05 00                    ..
        brk                                     ; FFE5 00                       .
        brk                                     ; FFE6 00                       .
        brk                                     ; FFE7 00                       .
        ora     (L0000,x)                       ; FFE8 01 00                    ..
        brk                                     ; FFEA 00                       .
LFFEB:  brk                                     ; FFEB 00                       .
        .byte   $70                             ; FFEC 70                       p
LFFED:  .byte   $FF                             ; FFED FF                       .
        .byte   $FF                             ; FFEE FF                       .
        .byte   $FF                             ; FFEF FF                       .
        .byte   $3C                             ; FFF0 3C                       <
        .byte   $3C                             ; FFF1 3C                       <
LFFF2:  .byte   $3C                             ; FFF2 3C                       <
LFFF3:  .byte   $FC                             ; FFF3 FC                       .
LFFF4:  .byte   $FC                             ; FFF4 FC                       .
        .byte   $FC                             ; FFF5 FC                       .
        sed                                     ; FFF6 F8                       .
        cpx     #$DF                            ; FFF7 E0 DF                    ..
        .byte   $DF                             ; FFF9 DF                       .
        .byte   $7B                             ; FFFA 7B                       {
        txa                                     ; FFFB 8A                       .
        brk                                     ; FFFC 00                       .
        .byte   $81                             ; FFFD 81                       .
LFFFE:  .byte   $B5                             ; FFFE B5                       .
LFFFF:  .byte   $8B                             ; FFFF 8B                       .

; End of "game" segment
; ----------------------------------------------------------------------------
.code

