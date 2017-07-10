repo init -u ssh://nelson_chung@gerrit-pu101.askey.com.tw:29418/manifest -m n-mr1_qct_msm8953_wolfcombodycam.xml -g all
repo sync
source build/envsetup.sh
lunch msm8953_64-userdebug
#make clean
#make #verify ok
#make -j2 #verify ok
#make -j4a#verify ok
#make -j8 #verify ok
make -j10 
