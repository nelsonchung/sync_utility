source sync_CRK1010.sh 
if [ "$?" != "0" ] ;then
   echo "sync code is wrong, launch sync_code_solution.sh"
   source sync_code_solution.sh 
   exit
fi
source sync_CRK1010.sh 
if [ "$?" != "0" ] ;then
   echo "sync code is wrong, please check"
   exit
fi
DISTRO=fsl-imx-fb MACHINE=crk1010 source fsl-setup-release.sh -b build-fb 
bitbake fsl-image-gui 
bitbake core-image-minimal
