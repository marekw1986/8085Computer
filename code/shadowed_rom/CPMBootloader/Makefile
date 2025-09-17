# Adjust the run address to match the .org in the source code
all: bootloader.bin
	
bootloader.p: bootloader.asm
	asl -o bootloader.p -L -OLIST bootloader.lst bootloader.asm -cpu 8085undoc
	
bootloader.bin: bootloader.p
	p2bin -l '$$00' bootloader.p bootloader.bin


clean:
	$(RM) *.lst *.hex labels.asm *.p *.bin

distclean: clean
