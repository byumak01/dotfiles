#!/bin/bash
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/llvm@${1}/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/llvm@${1}/include"
export PATH="/home/linuxbrew/.linuxbrew/opt/llvm@${1}/bin:$PATH"

if [[ "$1" == "19" ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/Cellar/lld@19/19.1.7/bin:$PATH"
    export LD_LIBRARY_PATH="/home/linuxbrew/.linuxbrew/Cellar/llvm@19/19.1.7/lib:$LD_LIBRARY_PATH"
elif [[ "$1" == "18" ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/Cellar/llvm@18/18.1.8/bin:$PATH"
    export LD_LIBRARY_PATH="/home/linuxbrew/.linuxbrew/Cellar/llvm@18/18.1.8/lib:$LD_LIBRARY_PATH"
else
    echo "llvm-${1} does not exist in the system."
fi
