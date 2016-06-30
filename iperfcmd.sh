echo "1. Iperf Server(TCP)"
echo "2. Iperf Server(UDP)"
echo "3. Iperf Client(TCP)"
echo "4. Iperf Client(UDP)"
echo "5. quickly"
read option

iperf_client_input_info()
{
    echo "請輸入iperf server ip address:"
    read iperf_server_ip
    echo "傳輸檔案大小(100M):"
    read file_size
    echo "持續傳輸時間:"
    read keep_transfer_time
}

case "$option" in
    "1")
        iperf -s
    ;;
    "2")
        iperf -u -s
    ;;
    "3")
        iperf_client_input_info
        iperf -c $iperf_server_ip -w $file_size -t $keep_transfer_time -i 1
    ;;
    "4")
        iperf_client_input_info
        iperf -u -c $iperf_server_ip -w $file_size -t $keep_transfer_time -i 1
    ;;
    "5")
        iperf -c 192.168.0.209 -w 100M -t 60 -i 1
    ;;
    "*")
    ;;
esac
