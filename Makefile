BUILDER_IMAGE_VERSION=$(shell sha256sum Dockerfile | cut -d ' ' -f1)
BUILDER_IMAGE_NAME=wasm-libs-builder-image
WASI_VERSION=14
BUILD_ENV=docker run --rm -ti --volume=$(PWD):/mnt --user=$(shell id -u):$(shell id -g) --workdir=/tmp -e "SYSROOT=/mnt/wasm32-wasi-sysroot" $(BUILDER_IMAGE_NAME)

all: libc libclang_rt libpcre libpcre2 libgc libyaml libz libxml2 libgmp

build-container:
	@if [ "$$(docker inspect $(BUILDER_IMAGE_NAME) --format '{{ index .Config.Labels "version"}}' 2>/dev/null || true)" != "$(BUILDER_IMAGE_VERSION)" ]; then \
		docker build -t $(BUILDER_IMAGE_NAME) --build-arg BUILDER_IMAGE_VERSION=$(BUILDER_IMAGE_VERSION) .; \
	fi

wasm32-wasi-sysroot:
	@mkdir -p wasm32-wasi-sysroot/lib/wasm32-wasi
	@mkdir -p wasm32-wasi-sysroot/include

clean:
	rm -rf wasm32-wasi-sysroot

tar: all
	tar -zcf wasm32-wasi-sysroot.tar.gz wasm32-wasi-sysroot
	cd wasm32-wasi-sysroot/lib/wasm32-wasi && tar -zcf ../../../wasm32-wasi-libs.tar.gz *

debug-cli: build-container
	$(BUILD_ENV) bash

.PHONY: build-container clean all tar

include libs/*/Makefile
