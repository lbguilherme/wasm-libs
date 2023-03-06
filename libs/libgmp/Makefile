.PHONY: libgmp

libgmp: libc

libgmp: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libgmp.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libgmp.a: libs/libgmp/build.sh
	$(BUILD_ENV) bash /mnt/libs/libgmp/build.sh
