set -e

git clone --branch openssl-3.0.8 --depth 1 https://github.com/openssl/openssl
cd openssl

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -DCPPCHECK -Os"

./Configure \
  linux-generic64 \
  no-asm \
  no-threads \
  no-engine \
  no-hw \
  no-weak-ssl-ciphers \
  no-dtls \
  no-shared \
  no-dso \
  --prefix=$SYSROOT

touch $SYSROOT/include/setjmp.h
make -j$(nproc)
rm $SYSROOT/include/setjmp.h

llvm-ranlib .libs/libgc.a
llvm-ranlib .libs/libcord.a

cp include/extra/gc.h $SYSROOT/include
rm -rf $SYSROOT/include/gc
mkdir $SYSROOT/include/gc
cp include/gc_gcj.h \
  include/gc_disclaim.h \
  include/gc.h \
  include/gc_backptr.h \
  include/gc_config_macros.h \
  include/gc_inline.h \
  include/gc_mark.h \
  include/gc_tiny_fl.h \
  include/gc_typed.h \
  include/gc_version.h \
  include/javaxfc.h \
  include/leak_detector.h \
  include/cord.h \
  include/cord_pos.h \
  include/ec.h \
  $SYSROOT/include/gc
cp .libs/libgc.a $SYSROOT/lib/wasm32-wasi
cp .libs/libcord.a $SYSROOT/lib/wasm32-wasi
