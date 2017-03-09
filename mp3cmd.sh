
echo "1. Add the information - album and songer"
echo "2. Add cover image"
read option

case "$option" in 
    //"")
    //;;
    "1")
    echo "輸入album的名稱"
    read album_info
    echo "輸入songer的名稱"
    read songer_info
    id3v2 -A "$album_info" -a "$songer_info" *.mp3
    ;;
    "2")
    echo "請先準備cover.jpg"
    eyeD3 --add-image cover.jpg:FRONT_COVER *.mp3
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
