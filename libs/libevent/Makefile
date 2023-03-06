.PHONY: libevent2

libevent2: libc

libevent2: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libevent2.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libevent2.a: libs/libevent2/build.sh
	$(BUILD_ENV) bash /mnt/libs/libevent2/build.sh
