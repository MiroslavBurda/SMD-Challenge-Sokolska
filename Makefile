

all: build/panel.kicad_pcb build/panel.fab

clean:
	rm -rf build

build:
	mkdir -p build

build/panel.kicad_pcb: smd_challenge_sokolska.kicad_pcb build
	kikit panelize grid --gridsize 5 2 --vcuts --railsLr 5 $< $@

build/%.fab: build/%.kicad_pcb
	kikit fab jlcpcb $< $@