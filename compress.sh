echo "Select type"
array=(.tar .gz .tar.gz bz .tar.bz .bz2 .tar.bz2 .xz .tar.xz .Z .tar.Z .tgz .tar.tgz .7z .zip .rar .lha)
for i in `seq 6 7`
do
    echo $i"."  ${array[$i]}
done

read _type
if [ -z $_type ] ; then
     echo "Invaild Type"
     exit 0
fi

echo "Select action"
echo "1. Compress"
echo "2. Uncompress"
read _action
if [ "${_action}" != "1" ] && [ "${_action}" != "2" ]; then
    echo "Invaild action"
    exit 0
fi

if [ "${_action}" == "1" ] && [ "${_type}" != "7" ]; then
    echo "Enter dirname"
else
    echo "Enter filename"
fi

read _file

case "$_type" in
    6)
    if [ "${_action}" == "1" ];then
       tar jcvf "$_file".tar.bz2 $_file
    else
       tar jxvf $_file
    fi
    ;;
    7)
    if [ "${_action}" == "1" ];then
       xz -z $_file
    else
       xz -d $_file
    fi
    ;;
    *)
    echo "Not supported"
    ;;
esac
