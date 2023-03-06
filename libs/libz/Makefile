.PHONY: libz

libz: libc

libz: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libz.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libz.a: libs/libz/build.sh
	$(BUILD_ENV) bash /mnt/libs/libz/build.sh
