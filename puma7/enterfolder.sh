

echo "You need to use - source enterfolder.sh to make effect immediately"
echo "Enter the folder:"
echo "1.    Config setting: "
echo "2.    Build Folder: "
echo "3.    ROOTFS: "
echo "9.    GPIO CTL: "
read option
PWD=`pwd`
       
case "$option" in 
    //"")
    //;;
    "1")
    cd "$PWD/CBN_SDK/products/configs/"
    ;;
    "2")
    cd "PWD/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/core2-32-rdk-linux/"
    ;;
    "3")
        #PWD=`pwd`
        #echo $PWD
        #ls "$PWD/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/puma7_atom-rdk-linux/rdk-generic-broadband-image/1.0-r0/rootfs"
    cd "$PWD/Intel_SDK/atom_rdkbos/build-puma7-atom/tmp/work/puma7_atom-rdk-linux/rdk-generic-broadband-image/1.0-r0/rootfs"
    ;;
    "9")
        cd CBN_PUMA7_ATOM_SDK/CBN_SDK/cbn-package/cbn-apps/gpio_ctl
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
