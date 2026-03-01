#!/bin/sh

FAN_CONTROL="/sys/class/gpio/fan_pwr/value"
TEMP_CONTROL="/sys/bus/i2c/devices/0-0038/hwmon/hwmon*/temp1_input"
CHECK_INTERVAL=5
START_TEMP=50000
STOP_TEMP=30000


function logg() {
    text="$*"
#    echo $text
    logger -t "fan_control" $text
}

fan_state=1
echo 1 > $FAN_CONTROL

logg "FAN Control Start"
while true; do
temp=$(cat $TEMP_CONTROL 2>/dev/null) || temp=100000
[ -z "$temp" ] && temp=100000

if [ "$fan_state" -eq 0 -a "$temp" -gt "$START_TEMP" ];then
	echo 1 >$FAN_CONTROL
	logg "FAN START at Temperature $temp"
	fan_state=1
fi

if [ "$fan_state" -eq 1 -a "$temp" -lt "$STOP_TEMP" ];then
	echo 0 >$FAN_CONTROL
	logg "FAN STOP at Temperature $temp"
	fan_state=0
fi

sleep $CHECK_INTERVAL

done
