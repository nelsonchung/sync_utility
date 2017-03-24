
echo "1.   載入Qualcomm參數"
echo "2.   編譯全部images - aboot, kernel, system and userdata images"
echo "3.   編譯 aboot image"
echo "4.   編譯 kernel image"
echo "5.   編譯 system image"
echo "6.   編譯 userdata image"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd=". build/envsetup.sh"
    echo "$cmd"
    $cmd
    cmd="lunch msm8953_64-eng"
    echo "$cmd"
    $cmd
    ;;
    "2")
    cpucore=`cat /proc/cpuinfo | grep processor | wc -l`
    cmd="make -j$cpucore"
    echo "$cmd"
    $cmd
    ;;
    "3")
    cpucore=`cat /proc/cpuinfo | grep processor | wc -l`
    cmd="make aboot -j$cpucore"
    echo "$cmd"
    $cmd
    ;;
    "4")
    cpucore=`cat /proc/cpuinfo | grep processor | wc -l`
    cmd="make bootimage -j$cpucore"
    echo "$cmd"
    $cmd
    ;;
    "5")
    cpucore=`cat /proc/cpuinfo | grep processor | wc -l`
    cmd="make systemimage -j$cpucore"
    echo "$cmd"
    $cmd
    ;;
    "6")
    cpucore=`cat /proc/cpuinfo | grep processor | wc -l`
    cmd="make userdata -j$cpucore"
    echo "$cmd"
    $cmd
    ;;
     *)
    ;;
esac

sync
