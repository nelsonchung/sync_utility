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


pushd boot_images/build/ms
./build.sh TARGET_FAMILY=8953 --prod -c
./build.sh -j1 TARGET_FAMILY=8953 --prod
#./build.sh TARGET_FAMILY=8953 --prod #it will build fail
popd

ls -al boot_images/build/ms/bin/JAASANAZ
