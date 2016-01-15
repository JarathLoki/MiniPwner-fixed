#!/bin/sh

cp -f /minipwner/minimodes/WarWalk/network /etc/config/network
cp -f /minipwner/minimodes/WarWalk/wireless /etc/config/wireless

wifi

sh /minipwner/minimodes/Lights-Out/Lights-Out.sh
ifconfig wlan0 down
iwconfig wlan0 mode monitor
ifconfig wlan0 up
#/minipwner/kismet/kismet start &
#/minipwner/kismet/kismet.sh start
sh /minipwner/kismet/kismet.sh start &
