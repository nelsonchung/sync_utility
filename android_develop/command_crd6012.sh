
echo "1.   Git clone"
echo "2.   Sync source from git server"
echo "3.   Sync source to git server."
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="git clone git@10.1.6.81:Askey/MSM8956_MM/LA1_1/manifest"
    echo "$cmd"
    $cmd
    ;;
    "2")
    cmd="repo init -u git@0.1.6.81:Askey/MSM8956_MM/LA1_1/manifest -b cdr6012-main -m default.xml"
    echo "$cmd"
    $cmd
    cmd="repo sync"
    echo "$cmd"
    $cmd
    ;;
    "3")
    cmd="repo forall -pvc git checkout -b cdr6012-main Askey/cdr6012-main"
    echo "$cmd"
    $cmd
    ;;
     *)
    ;;
esac

sync
