#!/bin/bash

cd libgit2

mkdir build

cd build

emcmake cmake .. -DUSE_HTTPS=on -DOPENSSL_INCLUDE_DIR=/home/techgeeks/libgit2-wasm/openssl_files/include/openssl/ -DOPENSSL_SSL_LIBRARY=/home/techgeeks/libgit2-wasm/openssl_files/libssl.a -DOPENSSL_CRYPTO_LIBRARY=/home/techgeeks/libgit2-wasm/openssl_files/libcrypto.a

cmake --build .
