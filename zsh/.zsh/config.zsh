
paths=("$HOME/.local/bin" "$HOME/.rodin")

for p in $paths; do
	if [ -e $p ]; then 
		PATH=$p":"$PATH
	fi
done


HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
