sh bodycam_sync_from_repo_server.sh
cd LA.UM.5.6/LINUX/android
source build/envsetup.sh
lunch msm8953_64-userdebug
#make clean
#make #verify ok
#make -j2 #verify ok
#make -j4a#verify ok
#make -j8 #verify ok
make -j10 
