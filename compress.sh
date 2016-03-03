echo "Select action."
echo "1. Compress file"
echo "2. Uncompress file"
echo -n "--> "
read action
if [ -z $action ] || [ $action -gt 2 ] || [ $action -lt 1 ]; then
        echo "Invalid action" && exit 0
fi

echo "Choose a Compress/Uncompress type"
echo "11. .tar.Z"
echo "12. .tgz"
echo "13. .tar.tgz"
echo -n "--> "
read option

case "$option" in
    "11")
        case "$action" in
        "1")
            read -p "Please input filename : " filename
            read -p "Please input dirname : " dirname
            tar zcvf $filename.tar.Z $dirname
            ;;
        "2")
            read -p "Please input filename : " filename
            tar zxvf $filename.tar.Z
            ;;
        esac
    ;;
    "12")
        case "$action" in
        "1")
            read -p "Please input filename : " filename
            tar zcvf $filename.tgz $filename
            ;;
        "2")
            read -p "Please input filename : " filename
            tar zxvf $filename.tgz
            ;;
        esac
    ;;
    "13")
        case "$action" in
        "1")
            read -p "Please input filename : " filename
            tar zcvf $filename.tar.tgz $filename
            ;;
        "2")
            read -p "Please input filename : " filename
            tar zxvf $filename.tar.tgz
            ;;
        esac
    ;;
    "*")
    echo "Not supported"
    ;;
    
esac
