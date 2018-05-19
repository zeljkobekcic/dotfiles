#!/bin/sh

case "$1" in

    lock)
        i3lock 
        ;;
    exit)
        i3-msg exit
        ;;
    suspend)
        i3lock && systemctl suspend
        ;;
    shutdown)
        systemctl poweroff
        ;;
    reboot)
        systemctl reboot
        ;;
    *)
        echo "You need to provide an argument"
        exit 1
        ;;

esac

exit 0
