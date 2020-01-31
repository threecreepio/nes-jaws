const PAGESIZE = 0x4000;
const HEADERSIZE = 16;
const fs = require('fs');
const cproc = require('child_process');
const nes = fs.readFileSync('./files/original.nes');
const cdl = fs.existsSync('./files/original.cdl') && fs.readFileSync('./files/original.cdl');
const pageCount = nes[4];
const suffix = (pageCount * PAGESIZE) + HEADERSIZE;
try { fs.mkdirSync('src'); } catch(ex) {}
fs.writeFileSync('./src/prefix.bin', nes.slice(0, HEADERSIZE));
fs.writeFileSync('./src/suffix.bin', nes.slice(suffix));

for (var i=0; i<pageCount; ++i) {
    console.log('disassembling page ' + i);
    const start = (PAGESIZE * i);
    const end = start + PAGESIZE;
    const prgSlice = nes.slice(start + HEADERSIZE, end + HEADERSIZE);
    fs.writeFileSync('TMP.prg.bin', prgSlice);
    const startAddr = i % 2 === 0 ? '8000' : 'C000';

    let cdlRanges = '';
    if (cdl) {
        const cdlSlice = cdl.slice(start, end);
        cdlRanges = Array.from(cdlSlice).map((byte, i) => {
            const type = (byte & 0b00100010) ? 'BYTETABLE' : 'CODE';
            return `RANGE { START \$${(0x8000 + i).toString(16)}; END \$${(0x8000 + i).toString(16)}; TYPE ${type}; };`
        }).join('\n');
    }

    fs.writeFileSync('TMP.infofile', `
GLOBAL {
    OUTPUTNAME      "src/${i}.asm";
    INPUTNAME       "TMP.prg.bin";
    STARTADDR       $${ startAddr };
    CPU             "6502";
};
SEGMENT { START $${ startAddr }; END $FFFF; NAME "game"; };
${cdlRanges}
`);
    cproc.execFileSync('./files/bin/da65.exe', ['-i', 'TMP.infofile', '-v', '--comments', '4']);
}
fs.unlinkSync('TMP.infofile');
fs.unlinkSync('TMP.prg.bin');
