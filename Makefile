AS = ca65
CC = cc65
LD = ld65
IPS = flips.exe

.PHONY: clean

%.o: %.asm
	$(AS) -g --debug-info $< -o $@

patch.zip: patch.ips
	zip $@ readme.txt patch.ips

patch.ips: main.nes
	$(IPS) --exact --create --ips "files/original.nes" "main.nes" $@

main.nes: layout src/entry.o
	$(LD)  --dbgfile $@.dbg -C $^ -o $@

clean:
	rm -f release.zip main*.nes patch.ips *.o src/*.o
