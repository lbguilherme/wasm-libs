set -e

git clone --branch v2.10.3 --depth 1 https://github.com/GNOME/libxml2
cd libxml2

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os"

./autogen.sh \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-shared \
  --enable-static \
  --without-http

make -j$(nproc) libxml2.la

llvm-ranlib .libs/libxml2.a

cp -r include/libxml $SYSROOT/include/libxml
cp .libs/libxml2.a $SYSROOT/lib/wasm32-wasi
