#==============================================================================
# .ZSHRC
#==============================================================================

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/config.zsh

#==============================================================================
# MAKING EXA/LS BEAUTIFUL WITH SOLARIZED COLORS
#==============================================================================

eval `dircolors ~/.dircolors`

if [ -n "$DISPLAY" ]; then
    xset b off
fi


