#!/bin/bash
export LM_LICENSE_FILE=/usr/local/flexlm/licenses/license.dat
export ARM_COMPILER_PATH=~/DS-5_linux_20121022_c75116/bin
export ARMROOT=~/DS-5_linux_20121022_c75116
export ARMTOOLS=ARMCT5.01
export ARMLIB=$ARMROOT/lib
export ARMINCLUDE=$ARMROOT/include
export ARMINC=$ARMINCLUDE
export ARMBIN=$ARMROOT/bin
export ARMPATH=$ARMBIN



pushd rpm_proc/build
./build_8953.sh -c
./build_8953.sh -j1
popd

ls -alth rpm_proc/build/ms/bin/8953/rpm.mbn
