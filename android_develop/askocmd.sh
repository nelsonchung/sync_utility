
echo "1.    asko sync:                "
read option

case "$option" in 
    //"")
    //;;
    "1")
        asko sync 
    ;;
     *)
    echo "Not support"
    exit 1
    ;;
esac 
