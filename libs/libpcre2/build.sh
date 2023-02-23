set -e

git clone --branch pcre2-10.42 --depth 1 https://github.com/PCRE2Project/pcre2
cd pcre2

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os"

./autogen.sh

./configure \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-shared \
  --disable-pcre2grep-callout

make -j$(nproc) libpcre2-8.la

llvm-ranlib .libs/libpcre2-8.a

cp src/pcre2.h $SYSROOT/include
cp .libs/libpcre2-8.a $SYSROOT/lib/wasm32-wasi
