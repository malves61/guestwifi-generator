#!/bin/ash

ssid=`cat /dev/urandom | env LC_CTYPE=C tr -dc _ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjklmnpqrstuvwxyz23456789- | head -c 7; echo;`
password=`cat /dev/urandom | env LC_CTYPE=C tr -dc _ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjklmnpqrstuvwxyz23456789- | head -c 10; echo;`
datec=`date +%Y-%m-%dT%H:%M:%SZ`

echo "{\"guest_ssid\":\"$ssid\",\"guest_password\":\"$password\",\"creation_date\":\"$datec\"}" > /www/guest_credentials.json

for i in 0 1 2; do
    if [ `uci get wireless.@wifi-iface[$i].network` = 'guest' ]; then
        uci set wireless.@wifi-iface[$i].ssid=$ssid
        uci set wireless.@wifi-iface[$i].key=$password
        uci commit wireless
        wifi
    fi
done;
