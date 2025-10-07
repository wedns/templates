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

.PHONY: build-test bt
build-test: bd
	@$(CC) src/test.c -fsanitize=address $(C_FLAGS) -o build/test
bt: build-test

.PHONY: build-test-no-asan btna
build-test-no-asan: bd
	@$(CC) src/test.c $(C_FLAGS) -o build/test
btna: build-test-no-asan

.PHONY: test t
test: bt
	@./build/test
t: test

.PHONY: debug d
debug: b
	@$(DBG) ./build/main
d: debug

.PHONY: debug-test dt
debug-test: bt
	@$(DBG) ./build/test
dt: debug-test

.PHONY: valgrind v
valgrind: bna
	@$(VALGRIND_BIN) $(VALGRIND_FLAGS) ./build/main
v: valgrind

.PHONY: valgrind-test vt
valgrind-test: btna
	@$(VALGRIND_BIN) $(VALGRIND_FLAGS) ./build/test
vt: valgrind-test

.PHONY: watch w
watch-run:
	@$(WATCH_COMMAND) "make run"
w: watch-run

.PHONY: watch-valgrind wv
watch-valgrind:
	@$(WATCH_COMMAND) "make valgrind"
wv: watch-valgrind

.PHONY: watch-test wt
watch-test:
	@$(WATCH_COMMAND) "make test"
wt: watch-test
