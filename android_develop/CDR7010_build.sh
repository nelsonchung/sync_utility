
echo "1.   Sync CDR7010 code base"
echo "2.   Build Android image"
echo "3.   Build sbl image"
echo "4.   Build rpm image"
echo "5.   Build modem image"
echo "6.   Build adsp image"
echo "99.   Build All images"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="source sync_CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
    "2")
    cmd="source daily_build_for_CDR7010_android.sh"
    echo "$cmd"
    $cmd
    ;;
    "3")
    cmd="source qualcomm_sbl1_image-CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
    "4")
    cmd="source qualcomm_rpm_image-CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
    "5")
    cmd="source qualcomm_build_modem-CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
    "6")
    cmd="source qualcomm_build_adsp-CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
    "99")
    cmd="source sync_CDR7010.sh"
    echo "$cmd"
    $cmd
    cmd="source daily_build_for_CDR7010_android.sh"
    echo "$cmd"
    $cmd
    cmd="source quaocomm_sbl1_image-CDR7010.sh"
    echo "$cmd"
    $cmd
    cmd="source quaocomm_rpm_image-CDR7010.sh"
    echo "$cmd"
    $cmd
    cmd="source quaocomm_rpm_image-CDR7010.sh"
    echo "$cmd"
    $cmd
    cmd="source quaocomm_build_modem-CDR7010.sh"
    echo "$cmd"
    $cmd
    cmd="source quaocomm_build_adsp-CDR7010.sh"
    echo "$cmd"
    $cmd
    ;;
     *)
    ;;
esac

sync
