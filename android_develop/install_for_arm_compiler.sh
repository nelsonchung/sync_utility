sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get install uml-utilities
sudo apt-get install lsb-base
sudo apt-get install lsb-core
sudo ln -sf /tmp /usr/tmp
sudo mkdir -p /usr/local/flexlm/licenses
sudo cp -af license5.dat /usr/local/flexlm/licenses/license.dat
sudo apt-get install mnemosyne
sudo dpkg-reconfigure dash
