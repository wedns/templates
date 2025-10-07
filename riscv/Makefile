AS = clang
DBG = gdb -q
DISASSEMBLER = llvm-objdump
EMULATOR = qemu-riscv32

# We use .PHONY to tell make to always run these commands even if a file exists
# with the same name in this directory. For more information on .PHONY, see
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build-dir bd
build-dir:
	@if [ ! -d build ]; then mkdir build; fi
bd: build-dir

.PHONY: build b
build: build-dir
	@$(AS) src/main.S -g -march=rv32im --target=riscv32 -ffreestanding -nostdlib -o build/main
b: build

.PHONY: run r
run: build
	@$(EMULATOR) ./build/main
r: run

.PHONY: debug d
debug: build
	@$(DBG) ./build/main
d: debug

.PHONY: disassemble dasm
disassemble: build
	@$(DISASSEMBLER) -d -j .text -j .data -j .rodata --disassembler-color=on ./build/main
dasm: disassemble
