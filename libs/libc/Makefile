.PHONY: libc

libc: libclang_rt

libc: wasm32-wasi-sysroot/lib/wasm32-wasi/libc.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libc.a: build-container wasm32-wasi-sysroot libs/libc/build.sh
	@$(BUILD_ENV) bash /mnt/libs/libc/build.sh
