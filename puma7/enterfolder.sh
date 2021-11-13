

echo "You need to use - source enterfolder.sh to make effect immediately"
echo "Enter the folder:"
echo "1.    ROOTFS: "
echo "9.    GPIO CTL: "
read option

case "$option" in 
    //"")
    //;;
    "1")
        PWD=`pwd`
        echo $PWD
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
