function keyboard-layout() { setxkbmap -layout 'eu' -option caps:escape }
# I flashed the keyboard so that caps lock works as escape, so I can enjoy
# a good keyboard layout on other systems too
function tada68() { setxbmap -layout 'eu' }


function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function lagrep() { 
    if   [ $# -eq 1 ]; then; ls -a | grep "$1";
    elif [ $# -eq 2 ]; then; ls -a "$1" | grep "$2"
    else ls -a
    fi
}

function mkcd() {
    if [ $# -eq 1 ]; then;
        mkdir -p "$1"
        cd "$1"
    else
        echo "You need to provide one argument" 
    fi
}

function sshrpi() {
    ip=$(cat /var/lib/misc/dnsmasq.leases | grep 'raspberrypi' | awk '{ print $3 }')
    ssh pi@$ip
}


