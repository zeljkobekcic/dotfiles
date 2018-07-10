#==============================================================================
# .ZSHRC
#==============================================================================

#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim


#==============================================================================
# ALIASES
#==============================================================================

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

alias ls='exa' # [ exa > ls ]
alias la='exa -a'
alias ll='exa -al'

alias yaourt-update='yaourt -Syyu --aur'

alias v='vim'
alias vi='vim'
alias vim='vim'

alias jshell='/usr/lib/jvm/java-9-openjdk/bin/jshell'

alias t='todo.sh'
alias z='zathura'

alias jup='jupyter notebook'

#==============================================================================
# FUNCTIONS
#==============================================================================

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



#==============================================================================
# SCRIPTS 
#==============================================================================

source ~/.scripts/work.sh

#==============================================================================
# MKVIRTUALENV
#==============================================================================

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh

#==============================================================================
# MAKING EXA/LS BEAUTIFUL WITH SOLARIZED COLORS
#==============================================================================
#
eval `dircolors ~/.dircolors`

#==============================================================================
# ZSH HISTORY
#==============================================================================

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

#==============================================================================
# ZPLUGINS
#==============================================================================

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug load --verbose

#==============================================================================
# ZSH SYNTAX HIGHLIGHTING
#==============================================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"
bindkey '^ ' autosuggest-accept

#==============================================================================
# ZSH HISTORY SUBSTRING SEARCH STUFF
#==============================================================================

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

