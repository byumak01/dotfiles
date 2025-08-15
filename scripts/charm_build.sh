
export CC=clang
export CXX=clang++

## C++ include paths (gcc14)
export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include/c++/14:$HOMEBREW_PREFIX/include/c++/14/x86_64-pc-linux-gnu:$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
#
## Compiler flags (gcc14)
export CXXFLAGS="-I$HOMEBREW_PREFIX/include/c++/14 -I$HOMEBREW_PREFIX/include/c++/14/x86_64-pc-linux-gnu $CXXFLAGS"



CHARM_BUILD_DIR=$HOME/CHARM-SYCL/build

rm -rf $CHARM_BUILD_DIR/*

cd $CHARM_BUILD_DIR

cmake -DCMAKE_BUILD_TYPE=Debug  -DUSE_IRIS=true   \
      -DIRIS_DIR=/home/bymk/iris/build/src/runtime ..

make -j
