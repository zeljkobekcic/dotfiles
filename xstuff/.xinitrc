# ~/.xinitrc


setxkbmap eu
xmodmap ~/.xres/xmodmap/xmodmaprc
dbus-update-activation-environment --systemd DISPLAY
exec i3
