.PHONY: libpcre

libpcre: libc

libpcre: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre.a: libs/libpcre/build.sh
	$(BUILD_ENV) bash /mnt/libs/libpcre/build.sh
