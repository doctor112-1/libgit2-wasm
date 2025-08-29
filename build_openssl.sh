#!/bin/bash

git clone --depth 1 https://github.com/openssl/openssl.git

cd openssl

# script taken from https://github.com/cryptable/wasm-openssl
# modified

export CC=emcc
export CXX=emcc
export LINK=${CXX}
export AR=emar
export RANLIB=emranlib
export ARCH_FLAGS=""
export ARCH_LINK=""
export CPPFLAGS=" ${ARCH_FLAGS} "
export CXXFLAGS=" ${ARCH_FLAGS} "
export CFLAGS=" ${ARCH_FLAGS} "
export LDFLAGS=" ${ARCH_LINK} "

export DEBUG=1

#export LDFLAGS=" ${ARCH_LINK} --js-library engines/e_belgianeid_javascript.js"
echo $OSTYPE | grep -i darwin >/dev/null 2>/dev/null

# emconfigure ./config purify --openssldir=/tmp --api=1.1.0 -D__STDC_NO_ATOMICS__=1 no-dso no-dgram no-sock no-srtp no-stdio no-ui no-err no-ocsp no-psk no-stdio no-tests no-ts

./Configure \
  gcc \
  --openssldir=/tmp \
  -D__STDC_NO_ATOMICS__=1 \
  no-dynamic-engine no-dgram no-sock no-srtp no-err no-ocsp no-psk no-ts no-ssl2 no-ssl3 no-idea no-asm no-dtls no-dtls1 no-weak-ssl-ciphers no-err no-hw no-engine no-threads

PATH=$TOOLCHAIN_PATH:$PATH emmake make -j$(nproc) build_libs

mkdir ../openssl_files

mv libcrypto.a ../openssl_files
mv libssl.a ../openssl_files
mv include ../openssl_files

rm -rf ../openssl_files/include/crypto
rm -rf ../openssl_files/include/internal
