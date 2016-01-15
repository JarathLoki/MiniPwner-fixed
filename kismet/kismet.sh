#!/bin/sh
# Name: kismet.sh
clear

PROCESS="kismet_server"
LOG="/minipwner/kismet/logs/$PROCESS.log"

if test -z $1; then
        echo "Supply an argument [start | stop | status]"                 
        exit 1                                                            
fi

case $1 in
        "start")
                if ps | grep -v grep | grep $PROCESS; then
                        echo "`date`,start,$PROCESS already runing" >> $LOG
			echo "$PROCESS is already running, nothing to do"
                else
                        mkdir /minipwner/kismet/logs > /dev/null 2>&1
                        mkdir /minipwner/kismet/logsold > /dev/null 2>&1
                        mv /minipwner/kismet/logs/* /minipwner/kismet/logsold/ > /dev/null 2>&1
                        cd /minipwner/kismet/logs
                        $PROCESS > /dev/null 2>&1 &
                        echo "`date`,start,$PROCESS started" >> $LOG
			echo "$PROCESS started"
                fi
                ;;
        "stop")
		PID=`ps | grep -v grep | grep $PROCESS | awk '{print $1}'`                                                         
                mkdir /minipwner/kismet/logs > /dev/null 2>&1
                if test -z $PID; then
			echo "`date`,stop,$PROCESS is not running" >> $LOG
			echo "$PROCESS is not running, nothing to do."
		else
			kill $PID
			echo "`date`,stop,killed pid $PID to stop $PROCESS" >> $LOG
			echo "Killed pid $PID to stop $PROCESS"
		fi                                         
                ;;                                                        
        "status")
		PID=`ps | grep -v grep | grep $PROCESS | awk '{print $1}'`                                      
                mkdir /minipwner/kismet/logs > /dev/null 2>&1
                if test -z $PID; then
                        echo "`date`,status,$PROCESS is not running" >> $LOG
                        echo "$PROCESS is not running at this time"
		else
			echo "`date`,status,$PROCESS is running at pid $PID" >> $LOG
			echo "$PROCESS is running at pid $PID"
                fi                                                                            
                ;;                                                        
        *)                                                                
                echo "That sir, is invalid. Please try again."
		exit 1          
                ;;                                                        
esac
