echo "1. for ttyUSB0 38400"
echo "2. for ttyUSB0 115200"
echo "3. for ttyUSB1 38400"
echo "4. for ttyUSB1 115200"
read option

if [ $option == "1" ] ;then
gtkterm -p /dev/ttyUSB0 -s 38400& 
elif [ $option == "2" ] ;then
gtkterm -p /dev/ttyUSB0 -s 115200& 
elif [ $option == "3" ] ;then
gtkterm -p /dev/ttyUSB1 -s 38400&
else
gtkterm -p /dev/ttyUSB1 -s 115200& 
fi
