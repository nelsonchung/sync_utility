#!/bin/bash
echo "************************************************************************"
echo "Setting ENV"
echo "************************************************************************"

export MODEM_DIR=./modem_proc/build/ms
export COMMON_DIR=./common/build

export ARMROOT=/home/nelson/DS-5_linux_20121022_c75116
export ARMTOOLS=ARMCT5.01
export HEXAGON_ROOT=/home/nelson/Qualcomm/HEXAGON_Tools
export HEXAGON_RTOS_RELEASE=6.4.06
#export ARM_COMPILER_PATH=$ARMROOT/bin64
#export PATH=$ARM_COMPLIER_PATH:$PATH

#export ARMLIB=$ARMROOT/lib
#export ARMINCLUDE=$ARMROOT/include
#export ARMLMD_LICENSE_FILE=8224@10.1.36.53
#export ARMINC=$ARMINCLUDE
#export ARMBIN=$ARMROOT/bin64
#export ARMHOME=$ARMROOT


echo "************************************************************************"
echo "building MODEM"
echo "************************************************************************"

rm $MODEM_DIR/bin/8953.gen.prod/qdsp6sw.mbn
pushd $MODEM_DIR
./build.sh 8953.gen.prod -c
./build.sh 8953.gen.prod -k
popd
if [ ! -f $MODEM_DIR/bin/8953.gen.prod/qdsp6sw.mbn ]; then
echo "----------------------------------------------------------------------------"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! MODEM built failed !!!!!!!!!!!!!!!!!!!!!!!!"
echo "----------------------------------------------------------------------------"
exit
fi

echo "*********************************************************************"
echo "Creating NON-HLOS.bin"
echo "*********************************************************************"

pushd $COMMON_DIR
python build.py
popd
if [ ! -f $COMMON_DIR/bin/asic/NON-HLOS.bin ]; then
echo "----------------------------------------------------------------------------"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! NON-HLOS.bin creat failed !!!!!!!!!!!!!!!!!!!!!!!!"
echo "----------------------------------------------------------------------------"
exit
else
echo "*********************************************************************"
echo "Show the information of NON-HLOS.bin"
echo "*********************************************************************"
ls -al common/build/bin/asic/NON-HLOS.bin
fi

