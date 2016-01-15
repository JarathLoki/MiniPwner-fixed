#!/bin/sh

sh /minipwner/minimodes/Lights-Out/Lights-Out.sh

cp -f /minipwner/minimodes/AP/network /etc/config/network
cp -f /minipwner/minimodes/AP/wireless /etc/config/wireless

wifi
