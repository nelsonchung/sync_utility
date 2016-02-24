echo "0. Compress sample cmd"
echo "5. Compress .tar.gz"
echo "6. Decompress .tar.gz"
echo "7. Decompress .bz"
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
    ;;
    "*")
    echo "Not supported"
    ;;
    
esac
