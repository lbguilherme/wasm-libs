# WebAssembly Libs for WASI

This repo has a set of helper scripts to build popular libraries for the WebAssembly WASI target.

Use `make <libname>` to build a library, or `make all` to make all of them. Docker is the only required dependency.

Included libraries:

| Name | Description | Source |
| --- | --- | --- |
| libc | wasi-libc based on musl 1.2.3, from wasi-sdk-19 | [Source](https://github.com/WebAssembly/wasi-libc) |
| libclang_rt | Clang's runtime library, from wasi-sdk-19 | [Source](https://github.com/WebAssembly/wasi-sdk) |
| libgc | Boehm-Demers-Weiser Garbage Collector version 8.2.2 | [Source](https://github.com/ivmai/bdwgc) |
| libgmp | GMP library 6.2.1 | [Source](https://gmplib.org/) |
| libpcre | PCRE library version 8.45 | [Source](https://www.pcre.org/) |
| libpcre2 | PCRE library version 10.42 | [Source](https://github.com/PCRE2Project/pcre2) |
| libxml2 | XML library version 2.10.3 | [Source](https://github.com/GNOME/libxml2) |
| libyaml | YAML library version 0.2.5 | [Source](https://github.com/yaml/libyaml) |
| libz | ZLIB data compression library 1.2.13 | [Source](https://zlib.net/) |
