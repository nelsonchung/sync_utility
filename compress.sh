echo "1. 利用tar打包"
echo "2. 利用tar解包"
echo "3. 利用gzip壓縮"
echo "4. 利用gzip解壓縮"
read option

case "$option" in
    "1")
    echo "Please input the FileName"
    read filename            
    filename=${filename}".tar"
    echo "Please input the DirName"
    read dirname
    tar cvf "$filename" "$dirname"
    ;;
    "2")
    echo "Please input the FileName"
    read filename
    filename=${filename}".tar"
    tar xvf "$filename"
    ;;
    "3")
    echo "Please input the FileName"
    read filename
    gzip "$filename"
    ;;
    "4")
    echo "Please input the FileName"
    read filename
    filename=${filename}".gz"
    gzip -d "$filename"
    ;;
    "*")
    echo "Not supported"
    ;;
    
esac
