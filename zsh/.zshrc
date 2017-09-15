#==============================================================================
# .ZSHRC
#==============================================================================

#{{{ PREZTO STUFF

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# FIXING THE PROBLEM THAT I COULD NOT DISPLAY 256 COLOR SCHEMES IN TMUX
# IT LOOKS LIKE THESE LINES ARE FIXING THIS PROBLEM FOR EVERY (?) TERMINAL
# WOULD BE HAPPY ABOUT A VERIFICATION ABOUT THIS.
# TESTED SO FAR THE XFCE4, GNOME, KDE TERMINALS AND URXVT
if [[ $TERM ==  "screen" ]] ;
then
    TERM="screen-256color"
fi

# VIM IS LOVE, VIM IS LIFE
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi

#}}}

#==============================================================================
# ALIASES
#==============================================================================

# CLIPBOARD STUFF
alias setclip="xclip -selection c"
alias getclip="xclip -selection clipboard -o"

# HANDY ALIASES/FUNCTIONS TO MAKE THINGS LESS PAINFULL
alias la="ls -a"
function laG() { ls -a | grep "$1" }

# USING VIM TOO OFTEN
alias :q="exit"

# UPATE STUFF FROM THE AUR
alias yaourt-update='yaourt -Syyu --aur'

# AND USING TMUX TOO OFTEN
alias t='tmux'

# Could not get a version of vim compiled with clipboard so I started using
# gvim, which has been compiled with the clipboard flag/featuer(?)
alias vi='gvim -v'
alias vim='gvim -v'

#==============================================================================
# FUNCTIONS
#==============================================================================

# BECAUSE CREATING GITIGNOREFILES WAS NEVER THAT EASY
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# MAKING IT EASIER TO WRITE LATEX
function newTex() { cp ~/.defaults/latex/default.tex "$(pwd)/$1" }

#==============================================================================
# PATHS
#==============================================================================

export PATH=$PATH:/home/zeljko/.cabal/bin

