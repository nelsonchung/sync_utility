#!/bin/bash
echo "1. for lab netowork via wlan0 (172.16.x.x)"
echo "2. for office network via wlan0 (10.118.x.x)"

read option

case "$option" in
    "1")
        #for lab netowork via wlan0 (172.16.x.x)
        sudo route add -net 172.16.0.0 netmask 255.255.0.0 gw 172.16.1.1
    ;;
    "2")
        #for office network via wlan0 (10.118.x.x)
        sudo route add -net 10.118.0.0 netmask 255.255.0.0 dev wlan0
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac
