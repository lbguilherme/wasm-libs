set -e

git clone --branch 0.2.5 --depth 1 https://github.com/yaml/libyaml
cd libyaml

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os"

./bootstrap

./configure \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-shared

make -j$(nproc) -C src

llvm-ranlib src/.libs/libyaml.a

cp include/yaml.h $SYSROOT/include
cp src/.libs/libyaml.a $SYSROOT/lib/wasm32-wasi
