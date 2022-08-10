.PHONY: libclang_rt

libclang_rt: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libclang_rt.builtins-wasm32.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libclang_rt.builtins-wasm32.a: libs/libclang_rt/build.sh
	@$(BUILD_ENV) bash /mnt/libs/libclang_rt/build.sh
