echo "0. Compress sample cmd"
echo "5. Compress .tar.gz"
echo "6. Decompress .tar.gz"
echo "7. Decompress .bz"
echo "11. .tar.Z"
echo "12. .tgz"
read option

case "$option" in
    "0")
    echo "Compress sample"
    ;;
    "5")
    echo "Compress .tar.gz"
    echo "Please input filename:"
    read filename
    echo "Please input directory:"
    read dirname
    tar zcvf $filename\.tar.gz $dirname
    ;;
    "6")
    echo "Decompress .tar.gz"
    echo "Please input filename:"
    read filename
    tar zxvf $filename\.tar.gz
    ;;
    "7")
    echo "Decompress .bz"
    echo "Please input filename:"
    read filename
    bunzip2 -d $filename.bz
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
