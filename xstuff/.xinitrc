# ~/.xinitrc

setxkbmap -layout 'eu' -options caps:escape
dbus-update-activation-environment --systemd DISPLAY
exec i3
