if [ -e "$HOME/.local/bin" ]
then
    PATH="$HOME/.local/bin:"$PATH
fi

if [ -e "$HOME/projects/fff" ]
then
    PATH="$HOME/projects/fff":$PATH
fi


HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
