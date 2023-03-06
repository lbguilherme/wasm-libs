.PHONY: libssl

libssl: libc

libssl: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libssl.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libssl.a: libs/libssl/build.sh
	$(BUILD_ENV) bash /mnt/libs/libssl/build.sh
