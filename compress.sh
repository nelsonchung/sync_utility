echo "0. Compress sample cmd"
echo "11. .tar.Z"
echo "12. .tgz"
read option

case "$option" in
    "0")
    echo "Compress sample"
    ;;
    "11")
        echo "Select action."
        echo "1. Compress file"
        echo "2. Uncompress file"
        read action
        case "$action" in
        "1")
            read -p "Please input filename : " filename
            read -p "Please input dirname : " dirname
            echo `tar zcvf $filename.tar.Z $dirname`
            ;;
        "2")
            read -p "Please input filename : " filename
            echo `tar zxvf $filename.tar.Z`
            ;;
        esac
    ;;
    "12")
        echo "Select action."
        echo "1. Compress file"
        echo "2. Uncompress file"
        read action
        case "$action" in
        "1")
            read -p "Please input filename : " filename
            echo `tar zcvf $filename.tgz $filename`
            ;;
        "2")
            read -p "Please input filename : " filename
            echo `tar zxvf $filename.tgz`
            ;;
        esac
    ;;
    "*")
    echo "Not supported"
    ;;
    
esac
