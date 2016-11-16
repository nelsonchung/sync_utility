
function f_sample_function(){
    echo "sample functon"
}

echo "1.    Init git repository:                git init"
echo "2.    產生git repository:                 git clone --bare"
echo "3.    上傳到Git server:                   scp "
read option

case "$option" in 
    "1")
        git init 
    ;;
    "2")
        echo "輸入目錄名稱(project)"
        read folder_name
        git clone --bare $folder_name $folder_name".git"
    ;;
    "3")
        echo "輸入git repository檔案名稱(project.git)"
        read git_repository_name
        echo "輸入git server帳號"
        read git_account_name
        echo "輸入git server ip address"
        read git_server_ip
        scp -r $git_repository_name $git_account_name"@"$git_server_ip:/opt/git
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
