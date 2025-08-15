#!/bin/bash

# hipcc
export PATH="/opt/rocm/bin:$PATH"
export CPLUS_INCLUDE_PATH="/opt/rocm/include:$CPLUS_INCLUDE_PATH"
export LD_LIBRARY_PATH="/opt/rocm/lib:$LD_LIBRARY_PATH"

# cuda
export PATH="/opt/cuda/bin:$PATH"
export CPLUS_INCLUDE_PATH="/opt/cuda/include:$CPLUS_INCLUDE_PATH"
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"

# cscc
export PATH="/home/bymk/CHARM-SYCL/build/src/cscc:$PATH"

# iris
export LD_LIBRARY_PATH="/home/bymk/iris/build/src/runtime:$LD_LIBRARY_PATH"
export CPLUS_INCLUDE_PATH="/home/bymk/iris/include:$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH="/home/bymk/iris/include:$C_INCLUDE_PATH"

# linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init bash)"

# Homebrew GCC/Clang environment
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

# llvm18 default
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/llvm@${1}/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/llvm@${1}/include"
export PATH="/home/linuxbrew/.linuxbrew/opt/llvm@${1}/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/Cellar/llvm@18/18.1.8/bin:$PATH"
export LD_LIBRARY_PATH="/home/linuxbrew/.linuxbrew/Cellar/llvm@18/18.1.8/lib:$LD_LIBRARY_PATH"

# dpcpp opensource
export PATH="/home/bymk/intel-llvm/build/bin:$PATH"
export LD_LIBRARY_PATH="/home/bymk/intel-llvm/build/lib:$LD_LIBRARY_PATH"

# scripts
# charm
SCRIPT_DIR="/home/bymk/scripts"
alias bc="${SCRIPT_DIR}/charm_build.sh"

# intel oneapi
alias setoneapi="source /opt/intel/oneapi/setvars.sh"

# set llvm version
alias setllvm="source ${SCRIPT_DIR}/llvm.sh"

# acpp
alias setacpp="source ${SCRIPT_DIR}/acpp.sh"
alias vim=nvim
