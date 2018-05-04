#!/bin/bash
export LM_LICENSE_FILE=/usr/local/flexlm/licenses/license.dat
#export ARMTOOLS=RVCT41
#export ARMCOMPILER6_CLANGOPT=--tool_variant=ult


pushd rpm_proc/build
./build_8953.sh -c
./build_8953.sh
popd
