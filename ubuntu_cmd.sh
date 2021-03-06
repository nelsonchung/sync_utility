
echo "1.   編輯sources.list"
echo "2.   新增使用者"
echo "21.  新增使用者到群組"
echo "3.   新增群組"
echo "4.   將使用者擁有sudo權限"
echo "5.   加入外部軟體來源"
echo "6.   tftp conneciton"
echo "7.   更新軟體套件"
echo "8.   系統升級到新版本"
echo "9.   apt-cache 搜尋套件"
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
    "21")
    echo "Input the username"
    read username
    echo "Input the groupname"
    read groupname
    sudo adduser $username $groupname
    ;;
    "3")
    echo "Input the group name"
    read groupname
    sudo addgroup $groupname
    ;;
    "4")
    sudo vim /etc/sudoers
    sudo cat /etc/sudoers
    ;;
    "5")
    echo "Input the ppa path"
    read ppa_path
    sudo add-apt-repository "$ppa_path"
    sudo apt-get update
    ;;
    "6")
    echo "Input tftp server ip address"
    read ip_address
    tftp "$ip_address" 69
    ;;
    "7")
    sudo apt-get update
    sudo apt-get upgrade
    ;;
    "8")
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get upgrade
    ;;
    "9")
    echo "Input the package name"
    read package_name
    apt-cache search "$package_name"
    ;;
    *)
    ;;
esac


