#!/bin/bash
export LM_LICENSE_FILE=/home/askey/.ds-5/licenses/7DP49-44797-B7N68.lic
export ARM_COMPILER_PATH=/usr/local/DS-5_v5.28.1/sw/ARMCompiler5.06u6/bin
export ARMROOT=/usr/local/DS-5_v5.28.1/sw/ARMCompiler5.06u6
export ARMTOOLS=ARMCT5.06u6
export ARMLIB=$ARMROOT/lib
export ARMINCLUDE=$ARMROOT/include
export ARMINC=$ARMINCLUDE
export ARMBIN=$ARMROOT/bin
export ARMPATH=$ARMBIN


pushd boot_images/build/ms
./build.sh TARGET_FAMILY=8953 --prod -c
./build.sh TARGET_FAMILY=8953 --prod
popd

ls -al boot_images/build/ms/bin/JAASANAZ/sbl1.mbn
