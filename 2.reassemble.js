const fs = require('fs');
const nes = fs.readFileSync('./files/original.nes');
const pageCount = nes[4];
const path = require('path');
const cproc = require('child_process');
const expectedSize = 0x4000;
const buffers = [];
buffers.push(fs.readFileSync('src/prefix.bin'));

for (let i=0; i<pageCount; ++i) {
    console.log(`reassembling page ${i}`);
    const startAddr = i % 2 === 0 ? '8000' : 'C000';
    fs.writeFileSync('TMP.ldconfig', `MEMORY { 
    ROM0: start = \$${startAddr}, size = \$4000, file = "TMP.prg.bin";
}
SEGMENTS { 
    game: load = ROM0, type = ro; 
}
`);
    cproc.execFileSync('./files/bin/ca65.exe', [`src/${i}.asm`, '-o', `TMP.prg.o`, '--relax-checks']);
    cproc.execFileSync('./files/bin/ld65.exe', ['-C', 'TMP.ldconfig', `TMP.prg.o`]);
    const actualSize = fs.statSync(`TMP.prg.bin`).size;
    buffers.push(fs.readFileSync('TMP.prg.bin'));

    const resizeBy = expectedSize - actualSize;
    if (resizeBy > 0) {
        throw new Error(`${i}.asm is ${resizeBy} byte(s) too SMALL!`);
    } else if (resizeBy < 0) {
        throw new Error(`${i}.asm is ${-resizeBy} byte(s) too LARGE!`);
    }
}
fs.unlinkSync('TMP.ldconfig');
fs.unlinkSync('TMP.prg.bin');
fs.unlinkSync('TMP.prg.o');

buffers.push(fs.readFileSync('src/suffix.bin'));

const nesOutput = Buffer.concat(buffers);
fs.writeFileSync('output.nes', nesOutput);
console.log('wrote output.nes (' + nesOutput.byteLength + ' bytes)');
