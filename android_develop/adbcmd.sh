
echo "1.   Enter fastoot mode"
echo "2.   Enable adb logcat"
echo "3.   Reboot"
echo "4.   Install apk file"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="adb reboot bootloader"
    echo "$cmd"
    $cmd
    ;;
    "2")
    cmd="adb logcat"
    echo "$cmd"
    $cmd
    ;;
    "3")
    cmd="adb reboot"
    echo "$cmd"
    $cmd
    ;;
    "4")
    cmd="adb install"
    echo "$cmd"
    echo "Input apk file name"
    read apk_name
    $cmd $apk_name
    ;;
    *)
    ;;
esac


