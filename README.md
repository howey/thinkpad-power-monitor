thinkpad-power-monitor
======================

A simple bash script that displays the power consumption of a ThinkPad laptop.


What you'll need:

A ThinkPad running Linux
tp_smapi installed (If you're running Arch Linux, there's a guide here: https://wiki.archlinux.org/index.php/Tp_smapi)
bc


To run:

Make sure that you've got the tp_smapi kernel modules loaded. If they're loaded, you should have a directory '/sys/devices/platform/smapi' present.
Copy the file 'battery.sh' to some directory on your machine
Make sure that you're able to execute the script with the command 'chmod +x battery.sh'
Run './battery.sh'.

If you're on battery power, the power consumption (in watts) will be displayed. If your battery is charging, 'AC' will be displayed. I use this combined with the 'Generic Monitor' panel item in XFCE to give me a quick way of checking the power consumption of my laptop.


How it works:

tp_smapi communicates with the hardware of the ThinkPad and reads the status of the battery. For example, if you're just using one battery (e.g., not a slice or UltraBay battery), the power consumption (in milliwatts) of that battey will be what's written in the file '/sys/devices/platform/smapi/BAT0/power_now'. If the battery is discharging, this value will be negative. This script reads the value of the appropriate file and converts it into units of watts, and also removes the sign. If you're running off of an auxillary battery, such as an UltraBay battery, the script reads the power consumption from that file instead.
