# RISC-V template

!! WORK-IN-PROGRESS !!

Template created to experiment during the Computer Architecture course from
university. It is targeted at solving very simple 32 bits RISC-V exercises.

## Makefile usage

Before running anything, check the [Makefile](./Makefile) and make sure you have
all the needed software installed and variables defined to your liking.

These are the targets you need to know to get started:

- `make build` or `make b`: assembles `src/main.S`.
- `make run` or `make r`: assembles and runs `src/main.S`.
- `make debug` or `make d`: assembles `src/main.S` and loads the resulting
  binary into your debugger of choice.
- `make disassemble` or `make dasm`: assembles `src/main.S` and then disassemble
  the resulting binary, printing it to stdout.

## How to write code

The `src` directory is where all code should go. It is divided as follows:

- `main.S`: `_start` and library functions (most of your code) should be here.
- `support.S`: Supporting functions and macros to be used in `main.S`.
