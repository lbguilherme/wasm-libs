set -e

git clone --branch release-2.1.12-stable --depth 1 https://github.com/libevent/libevent
cd libevent

export CC="clang"
export CFLAGS="-target wasm32-wasi --sysroot=${SYSROOT} -DCPPCHECK -Os -D_WASI_EMULATED_PROCESS_CLOCKS -D_WASI_EMULATED_SIGNAL"

./autogen.sh

./configure \
  --host=wasm32-wasi \
  --with-sysroot=${SYSROOT} \
  --disable-samples \
  --disable-openssl \
  --disable-shared

cat <<END >> include/private/gcconfig.h
#ifndef GCCONFIG_EXT_H
#define GCCONFIG_EXT_H

#define ALIGNMENT 4
#define HBLKSIZE 4096

#define _WASI_EMULATED_PROCESS_CLOCKS
#define _WASI_EMULATED_SIGNAL
#define _WASI_EMULATED_MMAN
#define USE_MMAP_ANON

extern int __data_end[];
#define DATASTART ((ptr_t)1)
#undef DATAEND
#define DATAEND ((ptr_t)__data_end)

inline int ___mprotect_stub(void *addr, size_t len, int prot) { return 0; }
#define mprotect ___mprotect_stub

inline ptr_t GC_wasm_get_mem(size_t bytes) {
  ptr_t mem = malloc(bytes + HBLKSIZE);
  return (ptr_t)(((size_t)mem + HBLKSIZE) / HBLKSIZE * HBLKSIZE);
}
#undef GET_MEM
#define GET_MEM(bytes) (struct hblk *)GC_wasm_get_mem(bytes)

#endif /* GCCONFIG_EXT_H */
END

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
