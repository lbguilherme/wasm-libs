set -e

git clone --branch v1.2.13 --depth 1 https://github.com/madler/zlib
cd zlib

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os"

./configure \
  --includedir=${SYSROOT}/include \
  --static

make -j$(nproc) libz.a

llvm-ranlib libz.a

cp zconf.h zlib.h $SYSROOT/include
cp libz.a $SYSROOT/lib/wasm32-wasi
