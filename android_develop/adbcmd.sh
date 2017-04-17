
echo "1.   Enter fastoot mode"
echo "2.   Enable adb logcat"
echo "3.   Reboot"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="adb reboot bootloader"
    echo "$cmd"
    $cm
    ;;
    "2")
    cmd="adb logcat"
    echo "$cmd"
    $cm
    ;;
    "3")
    cmd="adb reboot"
    echo "$cmd"
    $cm
    ;;
    *)
    ;;
esac


