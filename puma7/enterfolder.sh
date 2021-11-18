

echo "You need to use - source enterfolder.sh to make effect immediately"
echo "Enter the folder:"
echo "1.    Config setting: "
echo "2.    Build Folder: "
echo "3.    ROOTFS: "
echo "4.    Applications: "
echo "5.    HW Restore: "
echo "6.    NVRAM Storage: (ARM) "
echo "7.    NVRAM Storage: (ATOM) "
echo "9.    GPIO CTL: "

read option
PWD=`pwd`

ATOM_PATH="CBN_PUMA7_ATOM_SDK"
ARM_PATH="PUMA7-R7.0"
       
case "$option" in 
    //"")
    //;;
    "1")
    cd "$ATOM_PATH/CBN_SDK/products/configs/"
    ;;
    "2")
    cd "$ATOM_PATH/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/core2-32-rdk-linux/"
    ;;
    "3")
        #PWD=`pwd`
        #echo $PWD
        #ls "$PWD/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/puma7_atom-rdk-linux/rdk-generic-broadband-image/1.0-r0/rootfs"
    cd "$ATOM_PATH/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/puma7_atom-rdk-linux/rdk-generic-broadband-image/1.0-r0/rootfs"
    ;;
    "4")
    ;;cd "$PWD/CBN_SDK/cbn-package/cbn-apps/cbn_hw_restore"
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-apps/"
    ;;
    "5")
    ;;cd "$PWD/CBN_SDK/cbn-package/cbn-apps/cbn_hw_restore"
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-apps/cbn_hw_restore"
    ;;
    "6")
    cd "$ARM_PATH/sdk/cable/docsis/src/vendor/nvram_storage/"
    ;;
    "7")
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-nvram/nvram_db/"
    ;;
    "9")
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-apps/gpio_ctl"
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 

if [ $? -eq 1 ]
then
echo "Recommend you enter the folder \"CBN_PUMA7_ATOM_SDK\""
fi
