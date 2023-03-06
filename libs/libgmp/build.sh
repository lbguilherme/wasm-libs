set -e

curl -LO https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz
tar -xvf gmp-6.2.1.tar.xz
cd gmp-6.2.1

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os -DHAVE_RAISE=1 -D_WASI_EMULATED_SIGNAL"

./configure \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-shared

make -j$(nproc)

llvm-ranlib .libs/libgmp.a

cp gmp.h gmpxx.h $SYSROOT/include
cp .libs/libgmp.a $SYSROOT/lib/wasm32-wasi
