enable_gre_interface="$1"
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -A POSTROUTING -o $enable_gre_interface -j MASQUERADE
#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo iptables -t nat -A POSTROUTING -o wlan1 -j MASQUERADE
