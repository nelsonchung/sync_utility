
echo "1. Add the information - album and songer"
echo "2. Add cover image"
echo "3. Download mp3 from youtube"
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
    "3")
    echo "請輸入youtube網址"
    read youtubelink
    youtube-dl -f bestaudio --audio-quality 0 --audio-format mp3 -i -x --extract-audio "$youtubelink"
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
