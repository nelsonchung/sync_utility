#!/bin/bash
export LM_LICENSE_FILE=/usr/local/flexlm/licenses/license.dat
#export ARMTOOLS=RVCT41
#export ARMCOMPILER6_CLANGOPT=--tool_variant=ult
#export ARM_COMPILER_PATH=~/DS-5_linux_20121022_c75116/bin
export ARM_COMPILER_PATH=/home/nelson/DS-5_linux_20121022_c75116/bin
#export ARMROOT=~/DS-5_linux_20121022_c75116
export ARMROOT=/home/nelson/DS-5_linux_20121022_c75116
export ARMTOOLS=ARMCT5.01
export ARMLIB=$ARMROOT/lib
export ARMINCLUDE=$ARMROOT/include
export ARMINC=$ARMINCLUDE
export ARMBIN=$ARMROOT/bin
export ARMPATH=$ARMBIN
export PATH=$MAKE_PATH:$PYTHON_PATH:$ARMBIN:$ARM_COMPILER_PATH:$PATH
export ARMHOME=$ARMROOT
export HEXAGON_ROOT=~/Qualcomm/HEXAGON_Tools



pushd rpm_proc/build
./build_8953.sh -c
./build_8953.sh
popd
