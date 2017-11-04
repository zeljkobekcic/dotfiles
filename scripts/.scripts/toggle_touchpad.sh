#!/bin/sh

dev_line=`xinput --list | grep "TouchPad"`

#TODO: WHAT IF THERE IS NO TOUCHPAD

dev_number=`echo $dev_line | tr "=" "\n" | tail -1 | tr " " "\n" | head -1`
cur_mode=`xinput --list-props $dev_number | grep "Device Enabled" | tr "\t" "\n" | tail -1`


if [ $cur_mode -eq 1 ]; then
    xinput --disable "$dev_number"
else
    xinput --enable "$dev_number"
fi
