#!/bin/bash
DIR=/sys/devices/platform/smapi

#Decide which battery to look at
if [[ "`cat $DIR/BAT0/installed`" -eq "1" && "`cat $DIR/BAT0/power_now`" -ne "0" ]]
then
	PWR=`cat $DIR/BAT0/power_avg`
	STATE=`cat $DIR/BAT0/state`
elif [[ "`cat $DIR/BAT1/installed`" -eq "1" && "`cat $DIR/BAT1/power_now`" -ne "0" ]]
then
	PWR=`cat $DIR/BAT1/power_avg`
	STATE=`cat $DIR/BAT1/state`
fi

if [ "$STATE" = "discharging" ]
then
	PWR=`echo "$PWR*-1" | bc`	
	LEFT=`echo "$PWR/1000" | bc`
	RIGHT=`echo "($PWR/10)%100" | bc`
	echo "$LEFT.$RIGHT W"
elif [ "$STATE" = "charging" ]
then
	echo "AC"
else
	echo "-"
fi


