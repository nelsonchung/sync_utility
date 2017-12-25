sh sync_CRK1010.sh 
DISTRO=fsl-imx-fb MACHINE=crk1010 source fsl-setup-release.sh -b build-fb
bitbake fsl-image-gui
