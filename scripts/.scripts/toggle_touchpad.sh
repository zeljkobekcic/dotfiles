#!/bin/sh

dev_id=`xinput list | grep -i 'TouchPad' | awk '{ print $6 }' | sed 's/id=//'`

cur_mode=`xinput list-props $dev_id | grep "Device Enabled" | tr ": " "\n" | tail -1`

if [ $cur_mode -eq 1 ] ; then
    xinput --disable "$dev_id"
else
    xinput --enable "$dev_id"
fi
