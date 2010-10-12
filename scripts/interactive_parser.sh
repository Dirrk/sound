#!/bin/sh
# usage ./interactive_parser mono.txt

write() {
	if test "$2" != ""; then
		adb shell "echo $1 $2 > /sys/devices/virtual/voodoo_sound/headphone_amplifier/codec_registers"
	fi
}

cat $1 | grep "^ " | cut -d"S" -f1 > /tmp/registers

while read line
do 
	write $line
done < /tmp/registers
