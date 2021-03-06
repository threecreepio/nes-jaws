AS = ca65
LD = ld65

.PHONY: clean

build: jaws.chr main.nes

integritycheck: build
	radiff2 -x main.nes original.nes | head -n 100

%.o: %.asm
	$(AS) --create-dep "$@.dep" -g --debug-info $< -o $@

main.nes: layout ines.o
	$(LD)  --dbgfile $@.dbg -C $^ -o $@

jaws.chr: original.nes
	dd if="original.nes" of="$@" bs=1 skip=32784

clean:
	rm -f ./main*.nes ./*.nes.dbg ./*.chr ./*.o ./*.dep

include $(wildcard ./*.dep ./*/*.dep)
