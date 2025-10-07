# Simple C template

This template is a simplified version of the [C template](../c/) and, by extent,
a modified version of
[Kay Lack's Toy C](https://github.com/neoeno/toy-c-project-template) as well.

The scope of this template is purely educational, for simple exercises that use
a single `main.c` file.

## Makefile usage

Before running anything, check the [Makefile](./Makefile) and make sure you have
all the needed software installed and variables defined to your liking.

These are the main targets you need to know to get started:

- `make run` or `make r`: compiles and runs `src/main.c`.
- `make valgrind` or `make v`: compiles `src/main.c` and loads the resulting
  binary into valgrind's memcheck tool.
- `make debug` or `make d`: compiles `src/main.c` and loads the resulting binary
  into your debugger of choice.

<!-- markdownlint-disable -->
<details>
  <summary>
	<b>Additional targets</b>
  </summary>

There are various different targets dedicated for builds. Moreover, since we use
Valgrind, there are usually two targets for builds: one with the
`-fsanitize=address` flag and one without it.

By default, every target uses the flag, with the exeception of `make valgrind`
and `make v`. This is because Valgrind's memcheck needs additional setup to work
with this particular flag.

But if one personally wants to build without it, it's totally possible: just
append `-no-asan` (or `na`) to the name of the target!

- `make build-dir` or `make bd`: Creates the `./build` directory if it already
  doesn't exists.
- `make build` or `make b`: compiles `./src/main.c` to `./build/main`.
- `make build-no-asan` or `make bna`: same as `build`, but without the
  `-fsanitize=address` flag.

There are also some targets that use a
[watch](https://man.archlinux.org/man/watch.1) command. The classic `watch` is
totally fine, but personally i would recommend checking
[hwatch](https://github.com/blacknon/hwatch) out.

These can be useful for, e. g. letting a tmux pane with the watch command
running side-by-side with the text editor, or just to avoid having to manually
call the make target everytime.

- `make watch` or `make w`: run a watch command over the `make run` target.
- `make watch-valgrind` or `make wv`: run a watch command over the
  `make valgrind` target.

</details>
<!-- markdownlint-restore -->
