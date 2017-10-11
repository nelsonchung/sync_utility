
adb root
adb disable-verity
adb reboot
echo "sleep 40 seconds to wait system reboot done"
sleep 40
adb root 
sleep 5
adb remount
