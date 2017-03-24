
echo "1.   安裝相關套件"
echo "2.   設定git帳號資訊"
echo "3.   安裝repo"
echo "4.   Modify the setting for Android compiler (Jack Server)"
read option

PWD=`pwd`

case "$option" in
    "1")
    cmd="sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip openjdk-8-jdk jackd"
    echo "$cmd"
    $cmd
    ;;
    "2")
    echo "輸入email(Example: nelson_chung@askey.com.tw)"
    read email
    cmd="git config --global user.email \"$email\""
    echo "$cmd"
    $cmd
    echo "輸入name(Example: Nelson Chung)"
    read name
    cmd="git config --global user.name \"$name\""
    echo "$cmd"
    $cmd
    ;;
    "3")
    cmd="mkdir -p ~/bin"
    echo "$cmd"
    $cmd
    cmd="curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo"
    echo "$cmd"
    $cmd
    cmd="chmod a+x ~/bin/repo"
    echo "$cmd"
    $cmd
    cmd="PATH=~/bin:$PATH"
    echo "$cmd"
    $cmd
    ;;
    "4")
    cmd="export JACK_SERVER_VM_ARGUMENTS=\"-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g\""
    echo "$cmd"
    $cmd
    cmd="./prebuilts/sdk/tools/jack-admin kill-server"
    echo "$cmd"
    $cmd
    cmd="./prebuilts/sdk/tools/jack-admin start-server"
    echo "$cmd"
    $cmd
    ;;
     *)
    ;;
esac

sync
