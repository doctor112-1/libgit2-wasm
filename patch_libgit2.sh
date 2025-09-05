#!/bin/bash

base_dir=$(pwd)

git clone --depth 1 https://github.com/libgit2/libgit2.git

cd libgit2/src/util/hash

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.h

cd ${base_dir}

cd libgit2/src/libgit2/streams

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.h

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.c

cd ${base_dir}

cd libgit2/deps/ntlmclient

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.h
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.h

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.c

cd ${base_dir}

cd libgit2/tests/libgit2/online

sed -i -e '/^# include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#  include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *.c
sed -i -e '/^#include/ s#<openssl/#"superspecialid../../../../openssl_files/include/openssl/#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *.c

cd ${base_dir}

cd libgit2/tests/headertest/

sed -i -r 's/ -Werror//' CMakeLists.txt

cd ${base_dir}
