#!/bin/bash
export LM_LICENSE_FILE=/usr/local/flexlm/licenses/license.dat
export ARMTOOLS=RVCT41
export ARMCOMPILER6_CLANGOPT=--tool_variant=ult


pushd boot_images/build/ms
./build.sh TARGET_FAMILY=8953 --prod -c
./build.sh -j1 TARGET_FAMILY=8953 --prod
#./build.sh TARGET_FAMILY=8953 --prod #it will build fail
popd
