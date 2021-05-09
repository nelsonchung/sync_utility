

echo "You need to use - source enterfolder.sh to make effect immediately"
echo "Enter the folder:"
echo "1.    GPIO CTL: "
read option

case "$option" in 
    //"")
    //;;
    "1")
        cd CBN_PUMA7_ATOM_SDK/CBN_SDK/cbn-package/cbn-apps/gpio_ctl
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
