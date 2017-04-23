# ~/.xinitrc

# Having the possibility to launch xinitrc with an argument to start an X 
#   session with the wanted enviroment. Here is i3 the default case.
session=${1:-i3}

case $session in
    i3|i3wm ) exec i3;;
    openbox ) exec openbox;;
    *       ) exec i3
esac
