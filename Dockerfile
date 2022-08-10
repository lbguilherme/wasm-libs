FROM alpine:edge

ARG BUILDER_IMAGE_VERSION
LABEL version=${BUILDER_IMAGE_VERSION}

RUN apk add --no-cache \
  autoconf \
  automake \
  bash \
  binutils \
  clang \
  curl \
  git \
  libtool \
  lld \
  llvm \
  make

RUN \
  wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-16/libclang_rt.builtins-wasm32-wasi-16.0.tar.gz && \
  tar -xzf libclang_rt.builtins-wasm32-wasi-16.0.tar.gz && \
  mkdir -p /usr/lib/clang/$(ls /usr/lib/clang)/lib/wasi/ && \
  mv lib/wasi/libclang_rt.builtins-wasm32.a /usr/lib/clang/*/lib/wasi/ && \
  rm libclang_rt.builtins-wasm32-wasi-16.0.tar.gz
