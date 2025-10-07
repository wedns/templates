# C template

This template is an expanded version of
[Kay Lack's Toy C](https://github.com/neoeno/toy-c-project-template).

The scope of this template is purely educational, for simple problem sets and
small projects.

An even more simpler version is also available as [C Simple](../c_simple/).

## Makefile usage

Before running anything, check the [Makefile](./Makefile) and make sure you have
all the needed software installed and variables defined to your liking.

These are the main targets you need to know to get started:

- `make run` or `make r`: compiles and runs `src/main.c`.
- `make test` or `make t`: compiles and runs `src/test.c`.
- `make valgrind` or `make v`: compiles `src/main.c` and loads the resulting
  binary into valgrind's memcheck tool.
- `make valgrind-test` or `make vt`: compiles `src/test.c` and loads the
  resulting binary into valgrind's memcheck tool.
- `make debug` or `make d`: compiles `src/main.c` and loads the resulting binary
  into your debugger of choice.
- `make debug-test` or `make dt`: compiles `src/test.c` and loads the resulting
  binary into your debugger of choice.

<!-- markdownlint-disable -->
<details>
  <summary>
	<b>Additional targets</b>
  </summary>

There are various different targets dedicated for builds. Moreover, since we use
Valgrind, there are usually two targets for builds: one with the
`-fsanitize=address` flag and one without it.

By default, every target uses the flag, with the exeception of `make valgrind`,
`make valgrind-test` and their respective shorter aliases `make v` and
`make vt`. This is because Valgrind's memcheck needs additional setup to work
with this particular flag.

But if one personally wants to build without it, it's totally possible: just
append `-no-asan` (or `na`) to the name of the target!

- `make build-dir` or `make bd`: Creates the `./build` directory if it already
  doesn't exists.
- `make build` or `make b`: compiles `./src/main.c` to `./build/main`.
- `make build-no-asan` or `make bna`: same as `build`, but without the
  `-fsanitize=address` flag.
- `make build-test` or `make bt`: compiles `./src/test.c` to `./build/test`.
- `make build-test-no-asan` or `make btna`: same as `build-test`, but without
  the `-fsanitize=address` flag.

There are also some targets that use a
[watch](https://man.archlinux.org/man/watch.1) command. The classic `watch` is
totally fine, but personally i would recommend checking
[hwatch](https://github.com/blacknon/hwatch) out.

These can be useful for, e. g. letting a tmux pane with the watch command
running side-by-side with the text editor, or just to avoid having to manually
call the make target everytime.

Be aware that by default tests will print ANSI colors, so remind to either have
a color flag on your watch program, or to adapt your `test.c` to not print a
colored output.

- `make watch` or `make w`: run a watch command over the `make run` target.
- `make watch-test` or `make wt`: run a watch command over the `make test`
  target.
- `make watch-valgrind` or `make wv`: run a watch command over the
  `make valgrind` target.

</details>
<!-- markdownlint-restore -->

## How to write code

The `src` directory is where all code should go. It is divided as follows:

- `lib.c`: All functions, execept `main`, should go in here.
- `test.c`: Tests for the functions defined in `lib.c`.
- `main.c`: `main` code should go here, calling functions defined in `lib.c`.

This is far from how a professional C project should work, but it's fine for the
educative purpouse of this template.
