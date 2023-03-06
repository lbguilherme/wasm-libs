.PHONY: libyaml

libyaml: libc

libyaml: build-container wasm32-wasi-sysroot wasm32-wasi-sysroot/lib/wasm32-wasi/libyaml.a

wasm32-wasi-sysroot/lib/wasm32-wasi/libyaml.a: libs/libyaml/build.sh
	$(BUILD_ENV) bash /mnt/libs/libyaml/build.sh
