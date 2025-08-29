#!/bin/bash

./build_openssl.sh
./patch_openssl.sh
./patch_libgit2.sh
./build_libgit2.sh
