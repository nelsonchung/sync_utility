export LM_LICENSE_FILE=/home/nelson/DS-5_linux_20121022_c75116/license5.dat
export ARMCOMPILER6_CLANGOPT=--tool_variant=ult

pushd BOOT.BF.3.3/boot_images/build/ms
./build.sh TARGET_FAMILY=8953 --prod -c
./build.sh TARGET_FAMILY=8953 --prod
popd
