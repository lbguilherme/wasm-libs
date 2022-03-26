.PHONY: libclang_rt

libclang_rt: wasm32-wasi-sysroot/lib/wasm32-wasi/libclang_rt.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libclang_rt.a: build-container wasm32-wasi-sysroot libs/libclang_rt/build.sh
	@$(BUILD_ENV) bash /mnt/libs/libclang_rt/build.sh
