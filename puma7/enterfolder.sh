

echo "You need to use - source enterfolder.sh to make effect immediately"
echo "Enter the folder:"
echo "1.    Config setting: "
echo "2.    Build Folder: "
echo "3.    ROOTFS: "
echo "4.    Applications: "
echo "41.    HW Restore: "
echo "42.    Web GUI: "
echo "43.    SNMP: (CCSP) "
echo "44.    WiFi Agent: (CCSP) "
echo "61.    NVRAM Storage: (ARM) "
echo "62.    NVRAM Storage: (ATOM) "
echo "71.    SDK - Common Component: (ARM) "
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
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-apps/"
    ;;
    "41")
    #cd "$PWD/CBN_SDK/cbn-package/cbn-apps/cbn_hw_restore"
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-apps/cbn_hw_restore"
    ;;
    "42")
    cd "$ATOM_PATH/CBN_SDK/meta-rdk-oem-cbn-puma7/meta-cbnwebui/recipes-packages/cbnwebui/"
    ;;
    "43")
    cd "$ATOM_PATH/CBN_SDK/cbn-rdkb/components/opensource/ccsp/CcspSnmpPa"
    ;;
    "44")
    cd "$ATOM_PATH/CBN_SDK/cbn-rdkb/components/opensource/ccsp/CcspWifiAgent"
    ;;
    "61")
    cd "$ARM_PATH/sdk/cable/docsis/src/vendor/nvram_storage/"
    ;;
    "62")
    cd "$ATOM_PATH/CBN_SDK/cbn-package/cbn-nvram/nvram_db/"
    ;;
    "71")
    cd "$ARM_PATH/PUMA7-R7.0/sdk/common/common_components/"
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
