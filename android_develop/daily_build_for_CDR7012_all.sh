#sh sync_CDR7012.sh 
#Fix the problem - sh: 0: Can't open sync_CDR7012.sh
source sync_CDR7012.sh 
cd LA.UM.5.6/LINUX/android
source build/envsetup.sh
lunch msm8953_64-userdebug
#make clean
#make #verify ok
#make -j2 #verify ok
#make -j4a#verify ok
#make -j8 #verify ok
#make -j4 #test ok
#make -j9 #test ok by Cooper and Leo
make -j10 
#cpu_number=`nproc`
#echo $cpu_number
#make -j$cpu_number
