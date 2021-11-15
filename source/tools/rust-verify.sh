#! /bin/bash

if [ `uname` == "Darwin" ]; then
    DYN_LIB_EXT=dylib
elif [ `uname` == "Linux" ]; then
    DYN_LIB_EXT=so
fi

VERUS_Z3_PATH="$(pwd)/z3" DYLD_LIBRARY_PATH=../rust/install/lib/rustlib/x86_64-apple-darwin/lib LD_LIBRARY_PATH=../rust/install/lib ../rust/install/bin/rust_verify --pervasive-path pervasive --extern builtin=../rust/install/bin/libbuiltin.rlib --extern builtin_macros=../rust/install/bin/libbuiltin_macros.$DYN_LIB_EXT --edition=2018 $@
