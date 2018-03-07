#####Parameter####
SHOW_PROGRESS="--progress"
SERVER_ACCOUNT="nelson"

#####Main####
echo "1. 同步兩個資料夾"
echo "2. 同步.ssh資料夾到其他server"
read option

rsync -av .ssh/ nelson@10.194.20.49:/home/nelson/.ssh

case "$option" in 
    "1")
        echo "輸入source名稱"
        read source_folder
        echo "輸入destination名稱"
        read destination_folder
        rsync -ah "$SHOW_PROGRESS" "$source_folder" "$destination_folder"
    ;;
    "2")
        echo "輸入destination ip address"
        read dest_ip_addr
        rsync -av "$SHOW_PROGRESS" .ssh/ "$SERVER_ACCOUNT"@$dest_ip_addr:/home/"$SERVER_ACCOUNT"/.ssh
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac

