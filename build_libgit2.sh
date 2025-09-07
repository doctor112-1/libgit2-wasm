#!/bin/bash

base_dir=$(pwd)

cd libgit2

mkdir build

cd build

emcmake cmake .. -DUSE_HTTPS=on -DOPENSSL_INCLUDE_DIR=${base_dir}/openssl_files/include/openssl/ -DOPENSSL_SSL_LIBRARY=${base_dir}/openssl_files/libssl.a -DOPENSSL_CRYPTO_LIBRARY=${base_dir}/openssl_files/libcrypto.a -DCMAKE_C_FLAGS="-s STACK_SIZE=2197152"

cmake --build .
