set -e

git clone --branch pcre-8.45 --depth 1 https://github.com/jwilk-mirrors/pcre
cd pcre

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -Os"

./autogen.sh

# update config.sub and config.guess to latest version
# curl "https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub" > config.sub
# curl "https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess" > config.guess
cp /mnt/libs/libpcre/config.sub /mnt/libs/libpcre/config.guess .

./configure \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-shared \
  --disable-cpp \
  --enable-unicode-properties \
  --disable-pcretest-libedit \
  --disable-pcretest-libreadline

# remove pcretest.c as it is not part of the lib and it can't be built
echo "int main(int argc, char** argv) {}" > pcretest.c

make -j$(nproc) libpcre.la libpcreposix.la

llvm-ranlib .libs/libpcre.a
llvm-ranlib .libs/libpcreposix.a

cp pcre.h $SYSROOT/include
cp pcreposix.h $SYSROOT/include
cp .libs/libpcre.a $SYSROOT/lib/wasm32-wasi
cp .libs/libpcreposix.a $SYSROOT/lib/wasm32-wasi
