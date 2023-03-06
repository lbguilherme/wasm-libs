.PHONY: libxml2

libxml2: libc libz

libxml2: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libxml2.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libxml2.a: libs/libxml2/build.sh
	$(BUILD_ENV) bash /mnt/libs/libxml2/build.sh
