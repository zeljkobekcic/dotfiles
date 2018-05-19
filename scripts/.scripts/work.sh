#/bin/sh

WORKSHTXT="/home/$USER/.work.sh.txt"

function push() {
    echo $(date "+%Y-%m-%d | %H:%M:%S") - "$1 - ${@:2}" | tee -a "$WORKSHTXT"
}

function previous_task() {
    lastEntry=`cat $WORKSHTXT | grep --word-regexp "starting\|continue" | tail -1`
    echo $lastEntry | cut -d'-' -f5-
}


function work() {
    input=$1
    text=${@:2}

    if [ -z $text ]; then
        echo "What are you working on?"
    else
        case "$input" in
            "start")
                push "starting" "$text"
                ;;
            "end")
                push "ending" "$text"
                ;;
            "break")
                push "break" "$text"
                ;;
            "continue")
                push "continue" "$text"
                ;;
            *)
                echo "Sorry, I do not know what you want to do"
                ;;
        esac
    fi
}


