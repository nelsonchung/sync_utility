
function f_git_remote_add_upstream(){
    echo "Do you want to add remote http path (Yy/Nn)(default is Y)?"
    read option
    if [ "$option" == "N" ] || [ "$option" == "n" ]; then
        return
    fi

    echo "Please input the remote http path"
    read remote_path
    git remote add upstream "$remote_path"
}

echo "1.    更新來自遠端的資訊:                git pull"
echo "11.   更新/Merge 來自遠端某個branch:     git pull origin branch_name"
echo "2.    同步本地端資料到遠端:              git push"
echo "21.   同步本地端資料到遠端(first time):  git push -u origin master"
echo "22.   同步本地端資料到遠端某個branch:    git push -u origin branch_name"
echo "3.    切換分支:                          git checkout branch_name"
echo "31.   強制切換分支:                      git checkout -f branch_name"
echo "32.   svn update -r:                     git checkout revision(the same as svn update -r rev)"
echo "33.   更新fork branch的資料:             git checkout master, git pull upstream master and checkout back"
echo "34.   建立branch:                        git checkout -b branch_name"
echo "35.   檔案還原:                          git checkout -- <file>"
echo "4.    顯示分支資訊:                      git branch"
echo "41.   刪除分支:                          git branch -d branch_name"
echo "5.    顯示Remote端repository:            git remote show origin"
echo "51.   顯示Remote端repository(簡化版):    git remote -v"
echo "52.   加入Remote端repository:            git remote add upstream some_path"
echo "53.   顯示Remote:                        git remote"
echo "6.    顯示tag資訊:                       git tag"
echo "61.   下tag:                             git tag -a tag_name -m log_info"
echo "62.   顯示tag/commit內容:                git show tag_name/git show commit revision number"
echo "63.   刪除tag:                           git tag -d tag_name"
echo "63.   將tag資訊同步到遠端:               git push origin --tags"
echo "7.    合入patch:                         git apply"
echo "71.   產生patch:                         git diff > patch_file_name"
echo "72.   從別的branch合入patch              git merge --no-ff xxx_branch"
echo "8.    設定Local端的資訊:                 git config user.name, git config user.email "
echo "81.   簡化git push上傳github出現的訊息:  git config --global push.default simple"
echo "9.    Checkout遠端代碼:                  git clone url"
echo "91.   Checkout遠端某個branch的代碼:      git clone url -b branch_name foldername"
echo "10.   刪除資料夾:                        git rm foldername -r -f"
echo "20.   修改前一次commit的內容:            git commit --amend"
echo "30.   顯示當下目錄的log:                 git log --stat ."
echo "301.   顯示commit revision的修改狀況:     git log --stat revision number"
echo "40.   顯示上次改變的內容:                git show"
echo "50.   無條件使用遠端的資訊:              git reset --hard origin/master"
echo "501.  檔案回到上一次 commit的狀態:       git reset HEAD^ --hard"
echo "502.  捨棄當下修改:                      git reset --hard"
echo "99.   目前狀況:                          git status"
echo "100.  合入某個revision:                  git cherry-pick <commit id>"
echo "101.  合入多個revisions:                 git cherry-pick -m <commit id1> <commit id2>... <commit id3>"
echo "110.  顯示差異:                          git diff --cached"
echo "300.  常用組合 - 整合分支並同步到github"
read option

case "$option" in 
    //"")
    //;;
    "1")
        git pull 
    ;;
    "11")
        echo "Input the branch name"
        read branch_name
        git pull origin ${branch_name}
    ;;
    "2")
        git push
    ;;
    "21")
        git push -u origin master
    ;;
    "22")
        echo "Input branch name"
        read branch_name
        git push -u origin ${branch_name}
    ;;
    "3")
        echo "Please input the branch name"
        read branch_name
        git checkout $branch_name
    ;;
    "31")
        echo "Please input the branch name"
        read branch_name
        git checkout -f $branch_name
    ;;
    "32")
        echo "Please input the revision number"
        read revision_number
        git checkout $revision_number
    ;;
    "33")
        f_git_remote_add_upstream
        git checkout master
        git pull upstream master
        git push
    ;;
    "34")
        git branch
        echo "Please input the branch name"
        read branch_name
        git checkout -b $branch_name
    ;;
    "35")
        git status
        echo "Please input the path of file"
        read file_name
        git checkout -- ${file_name}
    ;;
    "4")
        git branch
    ;;
    "41")
        git branch
        echo "Please input the branch name that you want to delete"
        read branch_name
        git branch -d $branch_name
    ;;
    "5")
        git remote show origin
    ;;
    "51")
        git remote -v
    ;;
    "52")
        f_git_remote_add_upstream
    ;;
    "53")
        git remote 
    ;;
    "6")
        git tag 
    ;;
    "61")
        echo "git tag -a tag_name -m log_info"
        echo "Input tag_name:"
        read tag_name
        echo "Input log_info"
        read log_info
        git tag -a ${tag_name} -m ${log_info}
    ;;
    "62")
        git tag
        echo "Input the tag name or commit revision number"
        read tag_name
        git show ${tag_name}
    ;;
    "63")
        git push origin --tags 
    ;;
    "64")
        git tag
        echo "Input tag name"
        read tag_name
        git tag -d ${tag_name}
    ;;
    "7")
        echo "Please input the name patch file"
        read patch_file
        git apply "$patch_file"
    ;;
    "71")
        echo "Please input the name of patch file"
        read patch_file
        git diff > "$patch_file"
    ;;
    "72")
        echo "Please input the name of branch"
        read branch_name
        git merge --no-ff "$branch_name"
    ;;
    "8")
        echo "Please input the username"
        read username
        git config --global user.name "$username"
        echo "Please input the email"
        read email
        git config --global user.email "$email"
    ;;
    "81")
        git config --global push.default simple
    ;;
    "9")
        echo "Input the path of source code"
        read src_url
        git clone ${src_url}
    ;;
    "91")
        echo "Input the path of source code"
        read src_url
        echo "Input the branch name in remote side"
        read branch_name
        echo "Input the folder name in local side"
        read folder_name
        git clone ${src_url} -b ${branch_name} ${folder_name}
    ;;
    "10")
        echo "Please input the folder name"
        read foldername
        git rm $foldername -r -f
    ;;
    "20")
        git commit --amend
    ;;
    "30")
        git log --stat .
    ;;
    "301")
        echo "Input the revision number"
        read revision_number
        git log --stat ${revision_number}
    ;;
    "40")
        git show
    ;;
    "50")
        git reset --hard origin/master
    ;;
    "501")
        git reset HEAD^ --hard
    ;;
    "502")
        git reset --hard
    ;;
    "99")
        git status
    ;;
    "100")
        echo "Input revision number"
        read revision_number
        git status ${revision_number}
    ;;
    "101")
        echo "Input more revision numbers ( abcde12345 qwert09876 ... asdfg76543)"
        read revision_number
        git status ${revision_number}
    ;;
    "110")
	    git diff --cached
    ;;
    "300")
        git branch
        echo "Please input the branch name that you want to merge"
        read branch_name
        git merge $branch_name
        git push
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac 
