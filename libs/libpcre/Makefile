.PHONY: libpcre

libpcre: libc

libpcre: wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libpcre.a: build-container wasm32-wasi-sysroot libs/libpcre/build.sh
	$(BUILD_ENV) bash /mnt/libs/libpcre/build.sh
