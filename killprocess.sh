#nelson_chung@nelsonchung:~/tmp$ ps aux | grep logcat
#nelson_+ 20220  0.0  0.0  30424  2444 pts/24   S    10:55   0:00 adb logcat -v time
#nelson_+ 20221  0.0  0.0  30424  2536 pts/24   S    10:55   0:00 adb logcat -v time -b events
#nelson_+ 20222  0.0  0.0  30424  2488 pts/24   S    10:55   0:00 adb logcat -v time threadtime
#nelson_+ 20233  0.0  0.0  14564   952 pts/24   S+   10:55   0:00 grep --color=auto logcat

#nelson_chung@nelsonchung:~/tmp$ kill 20220
#nelson_chung@nelsonchung:~/tmp$ kill 20221
#nelson_chung@nelsonchung:~/tmp$ kill 20222

filename="killprocess.tmp"
id="killprocess.id"

echo "Please input the name:"
read process_name
ps aux | grep "$process_name" > $filename
exec < $filename

while read line
do
echo $line | awk -F " " '{print $2}' > $id
processid=`cat $id`
echo "kill process id - $processid"
kill $processid
done
#We will always get error when kill last process, it doesn't matter
#/home/nelson_chung/git/sync_utility/killprocess.sh: line 24: kill: (20849) - 沒有此一程序

rm $filename
rm $id
