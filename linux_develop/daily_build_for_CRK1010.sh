ROOT_PATH=`pwd`
source sync_CRK1010.sh 
if [ "$?" != "0" ] ;then
   echo "sync code is wrong, launch sync_code_solution.sh"
   source sync_code_solution.sh 
fi
source sync_CRK1010.sh 
if [ "$?" != "0" ] ;then
   echo "sync code is wrong, please check"
   exit
fi
DISTRO=fsl-imx-fb MACHINE=crk1010 source fsl-setup-release.sh -b build-fb 
bitbake fsl-image-gui 
if [ "$?" != "0" ] ;then
   echo "bitbake fsl-image-gui fail, please check"
   exit
fi
cd $ROOT_PATH
DISTRO=fsl-imx-fb MACHINE=crk1010 source fsl-setup-release.sh -b build-core-image-minimal 
bitbake core-image-minimal
if [ "$?" != "0" ] ;then
   echo "bitbake core-image-minimal fail, please check"
   exit
fi
