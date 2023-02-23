.PHONY: libpcre2

libpcre2: libc

libpcre2: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre2.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre2-8.a: libs/libpcre2/build.sh
	$(BUILD_ENV) bash /mnt/libs/libpcre2/build.sh
