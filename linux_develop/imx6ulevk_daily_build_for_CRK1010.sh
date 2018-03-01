source sync_CRK1010.sh 
#echo "run souce sync_CRK1010.sh and get result is "$?
#result is 1 means fail
#result is 0 mean ok
if [ "$?" != "0" ] ;then
   echo "sync code is wrong, please check"
   exit
fi
#DISTRO=fsl-imx-fb MACHINE=crk1010 source fsl-setup-release.sh -b build-fb
DISTRO=fsl-imx-fb MACHINE=imx6ulevk source fsl-setup-release.sh -b build-fb
bitbake fsl-image-gui
