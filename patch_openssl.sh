#!/bin/bash

cd openssl_files/include/openssl/

sed -i -e '/^# include/ s#<openssl/#"superspecialid#g' -e '/^# include "superspecialid/ s#>#"#g' -e '/^# include "superspecialid/ s#superspecialid##g' *
sed -i -e '/^#  include/ s#<openssl/#"superspecialid#g' -e '/^#  include "superspecialid/ s#>#"#g' -e '/^#  include "superspecialid/ s#superspecialid##g' *
sed -i -e '/^#include/ s#<openssl/#"superspecialid#g' -e '/^#include "superspecialid/ s#>#"#g' -e '/^#include "superspecialid/ s#superspecialid##g' *
sed -i -e '/^#   include/ s#<openssl/#"superspecialid#g' -e '/^#   include "superspecialid/ s#>#"#g' -e '/^#   include "superspecialid/ s#superspecialid##g' *
