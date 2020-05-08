function keyboard-layout() { setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' & }
# I flashed the keyboard so that caps lock works as escape, so I can enjoy
# a good keyboard layout on other systems too
function tada68() { setxkbmap -layout 'eu' -option caps:escape -layout 'eu' }


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


function yt-dl-audio() {
    if [ ! -e $1 ]
    then;
        title=$(youtube-dl --get-title $1);
        video_id=$(youtube-dl --get-id $1);

        if [ -e $video_id ]
        then;
            echo "$video_id / $title already exists"
        else
            mkdir "$video_id"
            cd "$video_id"

            echo "$title" > title.txt &
            youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 $1 &
            wget $(youtube-dl --get-thumbnail $1) --output-document="$video_id.jpg" &
            youtube-dl --get-description $1 > "$video_id.txt" &

        fi
    else
        echo "Provide an url!"
    fi
}
