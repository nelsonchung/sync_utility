
echo "1. 編輯sources.list"
read option

case "$option" in
    "1")
    sudo vim /etc/apt/sources.list 
    ;;
    *)
    ;;
esac


