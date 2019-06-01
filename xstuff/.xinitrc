# ~/.xinitrc 
#
export _JAVA_AWT_WM_NONREPARENTING=1
dbus-update-activation-environment --systemd DISPLAY

get_available_mem() {
    output=$(free --mebi --si | tail -2)
    mem=$(free --mebi --si | tail -2 | head -1 | awk '{ printf "%3.2f%", (100 * $3 / $2) }')
    swap=$(free --mebi --si | tail -1 | awk '{ printf "%3.2f%", (100 * $3 / $2) }')

    echo " ($mem | $swap)"
}

get_battery() {
    
    b0=$(acpi -b | grep 'Battery 0' | awk '{ print $4}' | sed 's/,//')
    b1=$(acpi -b | grep 'Battery 1' | awk '{ print $4}' | sed 's/,//')

    echo " ($b0 | $b1)"
}

get_date() {
    date +"%Y.%m.%d %R"
}

statusbar() {
    while true
    do
        xsetroot -name "$(get_available_mem) | $(get_battery) | $(get_date)" 
        sleep 60
    done
}

statusbar &

exec dwm
