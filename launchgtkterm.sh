echo "1. for PUMA5 realtek"
echo "2. for PUMA6 celeno"
echo "3. for Android debug"
read option

if [ $option == "1" ] ;then
gtkterm -p /dev/ttyUSB0 -s 38400& 
elif [ $option == "2" ] ;then
gtkterm -p /dev/ttyUSB0 -s 115200& 
else
gtkterm -p /dev/ttyUSB1 -s 115200& 
fi
