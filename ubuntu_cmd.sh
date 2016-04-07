
echo "1. 編輯sources.list"
echo "2. 新增使用者"
echo "3. 將使用者擁有sudo權限"
echo "4. 加入外部軟體來源"
echo "5. tftp conneciton"
read option

case "$option" in
    "1")
    sudo vim /etc/apt/sources.list 
    ;;
    "2")
    echo "Input the username"
    read username
    sudo adduser $username
    ;;
    "3")
    sudo vim /etc/sudoers
    sudo cat /etc/sudoers
    ;;
    "4")
    echo "Input the ppa path"
    read ppa_path
    sudo add-apt-repository "$ppa_path"
    sudo apt-get update
    ;;
    "5")
    echo "Input tftp server ip address"
    read ip_address
    tftp "$ip_address" 69
    ;;
    *)
    ;;
esac


