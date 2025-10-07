# You can change these variables if you want to use different tools or flags
CC = gcc
C_FLAGS = -O0 -Wall -Werror -g
DBG = gdb -q
VALGRIND_BIN = valgrind
VALGRIND_FLAGS = --leak-check=full -s --track-origins=yes --show-leak-kinds=all
WATCH_COMMAND = watch --interval 0.5 --no-title --color

# We use .PHONY to tell make to always run these commands even if a file exists
# with the same name in this directory. For more information on .PHONY, see
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build-dir bd
build-dir:
	@if [ ! -d build ]; then mkdir build; fi
bd: build-dir

.PHONY: build b
build: bd
	@$(CC) src/main.c -fsanitize=address $(C_FLAGS) -o build/main
b: build

.PHONY: build-no-asan bna
build-no-asan: bd
	@$(CC) src/main.c $(C_FLAGS) -o build/main
bna: build-no-asan

.PHONY: run r
run: b
	@./build/main
r: run

.PHONY: debug d
debug: b
	@$(DBG) ./build/main
d: debug

.PHONY: valgrind v
valgrind: bna
	@$(VALGRIND_BIN) $(VALGRIND_FLAGS) ./build/main
v: valgrind

.PHONY: watch w
watch-run:
	@$(WATCH_COMMAND) "make run"
w: watch-run

.PHONY: watch-valgrind wv
watch-valgrind:
	@$(WATCH_COMMAND) "make valgrind"
wv: watch-valgrind
