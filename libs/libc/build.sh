set -e

WASI_SDK=14

wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-$WASI_SDK/wasi-sysroot-$WASI_SDK.0.tar.gz
tar -xzf wasi-sysroot-$WASI_SDK.0.tar.gz

cp -r wasi-sysroot/include/* $SYSROOT/include
cp -r wasi-sysroot/lib/wasm32-wasi/* $SYSROOT/lib/wasm32-wasi
