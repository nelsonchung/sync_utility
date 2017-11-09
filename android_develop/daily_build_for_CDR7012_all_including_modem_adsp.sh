
#### For Android Image####
export ANDROID_DIR=LA.UM.5.6/LINUX/android
#export MANIFEST_NAME="$BUILD_TAG.xml"
DATE=`date +"%Y%m%d"`
export MANIFEST_NAME="$DATE.xml"

#sh sync_CDR7012.sh
pushd $ANDROID_DIR
source build/envsetup.sh
lunch msm8953_64-userdebug
make clean
make -j4
#make -j1
popd

###################################################
# Save git revisions for this build
###################################################
repo manifest -r -o $MANIFEST_NAME &&

### For ADSP and Modem image
#!/bin/bash
echo "************************************************************************"
echo "Setting ENV"
echo "************************************************************************"
export ADSP_DIR=ADSP.8953.2.8.2/adsp_proc/build
export MODEM_DIR=MPSS.TA.2.3/modem_proc/build/ms
export MSM8953_COMMON_DIR=MSM8953.LA.2.0/common/build
export BOOT_DIR=BOOT.BF.3.3/boot_images

export ARMROOT=/opt/qualcomm/arm/RVDS/5.01bld94
export ARMLMD_LICENSE_FILE=8224@10.1.36.53
export ARM_COMPILER_PATH=$ARMROOT/bin64
export ARMTOOLS=ARMCT5.01
export ARMLIB=$ARMROOT/lib
export ARMINCLUDE=$ARMROOT/include
export ARMINC=$ARMINCLUDE
export ARMBIN=$ARMROOT/bin64
export PATH=$ARM_COMPLIER_PATH:$PATH
export ARMHOME=$ARMROOT
export HEXAGON_ROOT=/home/nelson_chung/Qualcomm/HEXAGON_Tools
export HEXAGON_RTOS_RELEASE=6.4.06

echo "************************************************************************"
echo "building ADSP"
echo "************************************************************************"

pushd $ADSP_DIR
python build.py -k -c msm8953 -o all
adsp_proc/build/bsp/multi_pd_img/build/adsp.mbn
popd
if [ ! -f $ADSP_DIR/bsp/multi_pd_img/build/adsp.mbn ]; then
  echo "----------------------------------------------------------------------------"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ADSP built failed !!!!!!!!!!!!!!!!!!!!!!!!"
  echo "----------------------------------------------------------------------------"
  exit
fi

#
echo "************************************************************************"
echo "building MODEM"
echo "************************************************************************"

rm $MODEM_DIR/bin/8953.gen.prod/qdsp6sw.mbn
pushd $MODEM_DIR
./build.sh 8953.gen.prod -k
popd
if [ ! -f $MODEM_DIR/bin/8953.gen.prod/qdsp6sw.mbn ]; then
  echo "-----------------------------------------------------------------------------"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! MODEM built failed !!!!!!!!!!!!!!!!!!!!!!!!"
  echo "-----------------------------------------------------------------------------"
  exit
fi

echo "*********************************************************************"
echo "Creating NON-HLOS.bin"
echo "*********************************************************************"

pushd $MSM8953_COMMON_DIR
python build.py
python ../../../$BOOT_DIR/core/storage/tools/ptool/ptool.py -x ../config/partition.xml
popd
if [ ! -f $MSM8953_COMMON_DIR/bin/asic/NON-HLOS.bin ]; then
echo "----------------------------------------------------------------------------"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! NON-HLOS.bin creat failed !!!!!!!!!!!!!!!!!!!!!!!!"
echo "----------------------------------------------------------------------------"
exit
fi


###################################################
# Make archive
###################################################
ARCHIVE_PATH="auto_build"
ARCHIVE_MODEM_PATH=$ARCHIVE_PATH/modem
PREBUILT_IMAGE_PATH="$ANDROID_DIR/device/askey/prebuilts/msm8953"
OUTPUT_IMAGE_PATH="$ANDROID_DIR/out/target/product/msm8953_64"
MODEM_MYPS_PATH="MPSS.TA.2.3/modem_proc/build/myps"
QFIT_IMAGE_PATH="BOOT.BF.3.3/boot_images/build/ms/bin/JAADANAZ/"



## OUTPUT IMAGE ##
OUT_ABOOT="emmc_appsboot.mbn"
OUT_BOOT="boot.img"
OUT_SYSTEM="system.img"
OUT_USERDATA="userdata.img"
OUT_CACHE="cache.img"
OUT_RAMDISK="ramdisk.img"
OUT_RAMDISK_RECOVERY="ramdisk-recovery.img"
OUT_PERSIST="persist.img"
OUT_MDTP="mdtp.img"
OUT_RECOVERY="recovery.img"

## PREBUILT IMAGE ##
PRE_TZ="tz.mbn"
PRE_NONHLOS="NON-HLOS.bin"
PRE_SBL1="sbl1.mbn"
PRE_RPM="rpm.mbn"
PRE_DEVCFG="devcfg.mbn"
PRE_DSP="adspso.bin"
PRE_SEC="sec.dat"
PRE_LKSECAPP="lksecapp.mbn"
PRE_CMNLIB="cmnlib.mbn"
PRE_CMNLIB64="cmnlib64.mbn"
PRE_KEYMASTER="keymaster.mbn"
##PRE_PRIMARYGPT="gpt_main0.bin"
##PRE_BACKUPGPT="gpt_backup0.bin"

## MODEM PROC SYMBOL TABLE AND MAP INFO ##
MODEM_SYMBOL="orig_MODEM_PROC_IMG_8953.gen.prodQ.elf"
MODEM_SYMBOL_MAP="orig_MODEM_PROC_IMG_8953.gen.prodQ.elf.map"

## QFIT Images and Information ##
QFIT_PATCH0_XML="patch0.xml"
QFIT_RAWPRG0_XML="rawprogram0.xml"
QFIT_RAWPRG0_BLANK_XML="rawprogram0_BLANK.xml"
QFIT_PRIMARYGPT="gpt_main0.bin"
QFIT_BACKUPGPT="gpt_backup0.bin"
QFIT_IMAGE="prog_emmc_firehose_8953_ddr.mbn"


echo "*********************************************************************"
echo "Copy NON-HLOS.bin to Android prebuilt folder"
echo "*********************************************************************"
cp $MSM8953_COMMON_DIR/bin/asic/NON-HLOS.bin $PREBUILT_IMAGE_PATH


echo "*********************************************************************"
echo "Generating archive"
echo "*********************************************************************"
rm -rf $ARCHIVE_PATH
mkdir -p $ARCHIVE_PATH
mkdir -p $ARCHIVE_MODEM_PATH

mv $MANIFEST_NAME $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_ABOOT $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_BOOT $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_SYSTEM $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_USERDATA $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_CACHE $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_RAMDISK $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_RAMDISK_RECOVERY $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_PERSIST $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_MDTP $ARCHIVE_PATH
cp $OUTPUT_IMAGE_PATH/$OUT_RECOVERY $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_TZ $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_NONHLOS $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_SBL1 $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_RPM $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_DEVCFG $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_DSP $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_SEC $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_LKSECAPP $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_CMNLIB $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_CMNLIB64 $ARCHIVE_PATH
cp $PREBUILT_IMAGE_PATH/$PRE_KEYMASTER $ARCHIVE_PATH
##cp $PREBUILT_IMAGE_PATH/$PRE_PRIMARYGPT $ARCHIVE_PATH
##cp $PREBUILT_IMAGE_PATH/$PRE_BACKUPGPT $ARCHIVE_PATH

## Copy QFIT Images and Information ##
cp $MSM8953_COMMON_DIR/$QFIT_PATCH0_XML $ARCHIVE_PATH
cp $MSM8953_COMMON_DIR/$QFIT_RAWPRG0_XML $ARCHIVE_PATH
cp $MSM8953_COMMON_DIR/$QFIT_RAWPRG0_BLANK_XML $ARCHIVE_PATH
cp $MSM8953_COMMON_DIR/$QFIT_PRIMARYGPT $ARCHIVE_PATH
cp $MSM8953_COMMON_DIR/$QFIT_BACKUPGPT $ARCHIVE_PATH
cp $QFIT_IMAGE_PATH/$QFIT_IMAGE $ARCHIVE_PATH

## Copy MODEM PROC SYMBOL TABLE AND MAP INFO ##
cp $MODEM_DIR/$MODEM_SYMBOL $ARCHIVE_MODEM_PATH
cp $MODEM_DIR/$MODEM_SYMBOL_MAP $ARCHIVE_MODEM_PATH
cp -Rf $MODEM_MYPS_PATH/ $ARCHIVE_MODEM_PATH

## Archive All the file ##
cd $ARCHIVE_PATH
zip -r $DATE.zip *
