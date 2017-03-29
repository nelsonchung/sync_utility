
echo "1.   Show devices"
echo "2.   Upgrade aboot image"
echo "3.   Upgrade boot image"
echo "4.   Upgrade system image"
echo "5.   Upgrade userdata image"
echo "6.   Upgrade boot, system, userdata images"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="sudo fastboot devices"
    echo "$cmd"
    $cmd
    ;;
    "2")
    cmd="sudo fastboot flash aboot $PWD/emmc_appsboot.mbn"
    echo "$cmd"
    $cmd
    ;;
    "3")
    cmd="sudo fastboot flash boot $PWD/boot.img"
    echo "$cmd"
    $cmd
    ;;
    "4")
    cmd="sudo fastboot flash system $PWD/system.img"
    echo "$cmd"
    $cmd
    ;;
    "5")
    cmd="sudo fastboot flash userdata $PWD/userdata.img"
    echo "$cmd"
    $cmd
    ;;
    "6")
    cmd="sudo fastboot flash aboot $PWD/emmc_appsboot.mbn"
    echo "$cmd"
    $cmd
    cmd="sudo fastboot flash boot $PWD/boot.img"
    echo "$cmd"
    $cmd
    cmd="sudo fastboot flash system $PWD/system.img"
    echo "$cmd"
    $cmd
    cmd="sudo fastboot flash userdata $PWD/userdata.img"
    echo "$cmd"
    $cmd
    ;;
     *)
    ;;
esac

sync
