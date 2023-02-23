.PHONY: libgc

libgc: libc

libgc: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libgc.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libgc.a: libs/libgc/build.sh
	$(BUILD_ENV) bash /mnt/libs/libgc/build.sh
