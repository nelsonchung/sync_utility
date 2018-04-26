
echo "1. 搜尋x分鐘內有被存取或修改過"
echo "2. 搜尋x分鐘內沒有被存取或修改過"
echo "3. 搜尋x天內有被存取或修改過"
echo "4. 搜尋x天內沒有被存取或修改過"
read option

case "$option" in 
    "1")
    echo "輸入x分鐘"
    read MIN
    find . -type f -amin -$MIN
    ;;
    "2")
    echo "輸入x分鐘"
    read MIN
    find . -type f -amin +$MIN
    ;;
    "3")
    echo "輸入x天"
    read DAY
    find . -type f -atime -$DAY
    ;;
    "4")
    echo "輸入x天"
    read DAY
    find . -type f -atime +$DAY
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
