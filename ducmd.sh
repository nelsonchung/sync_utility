
echo "1. 計算資料夾目錄的檔案大小（顯示一層）"
echo "2. 計算資料夾目錄的檔案大小（顯示兩層）"
read option

case "$option" in 
    //"")
    //;;
    "1")
    du -B M ./ --max-depth=1 | sort -g
    ;;
    "2")
    du -B M ./ --max-depth=2 | sort -g
    ;;
        *)
    echo "Not support"
    exit 1
    ;;
esac 
