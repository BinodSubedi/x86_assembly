ASSEMBLER = nasm
LINKER = ld
OUTFMT = elf64

CODEDIR = .
ASMFILES= $(foreach D, $(CODEDIR), $(wildcard $(D)/*.asm))
OBJECTFILES = $(patsubst %.asm, %.o, $(ASMFILES))
ELF64EXECS = $(patsubst %.asm, %, $(ASMFILES))


all: $(ELF64EXECS)


%:%.o
	$(LINKER) -o $@ $<

%.o:%.asm
	$(ASSEMBLER) -f $(OUTFMT) -o $@ $<


clean:
	rm -rf $(ELF64EXECS) $(OBJECTFILES)


.PHONY: all clean
