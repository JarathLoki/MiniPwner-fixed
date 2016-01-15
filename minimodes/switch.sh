#!/bin/sh


# Vars
# -----
SLEEP=5  # Set the number of seconds between each cycle
PROCESS="switch.sh"
LOG="/minipwner/minimodes/logs.txt"
DIR="/minipwner/minimodes/"

while :
do
	STAT=`cat /minipwner/minimodes/stat`
	SW1=`grep -i sw1 /sys/kernel/debug/gpio | cut -d" " -f24`
	SW2=`grep -i sw2 /sys/kernel/debug/gpio | cut -d" " -f24`
	POS=$SW1$SW2

	POS1=`grep lohi /minipwner/minimodes/mode | cut -d"=" -f2`
	POS2=`grep hihi /minipwner/minimodes/mode | cut -d"=" -f2`

	case $POS in
		"lohi")
			if [ "$STAT" != "$POS" ]; then
				echo $POS > /minipwner/minimodes/stat
				sh  /minipwner/minimodes/$POS1/*.sh
			fi
		;;
		"hilo")
			if [ "$STAT" != "$POS" ]; then
				echo $POS > /minipwner/minimodes/stat
				sh  /minipwner/minimodes/Setup_Mode/*.sh
			fi
		;;
		"hihi")
			if [ "$STAT" != "$POS" ]; then
				echo $POS > /minipwner/minimodes/stat 
				sh /minipwner/minimodes/$POS2/*.sh
			fi
		;;

		*)
			echo "Something went very, very wrong..."
		;;
	esac

	sleep $SLEEP
done
