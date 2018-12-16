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
# MKVIRTUALENV
#==============================================================================

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh

#==============================================================================
# MAKING EXA/LS BEAUTIFUL WITH SOLARIZED COLORS
#==============================================================================

eval `dircolors ~/.dircolors`
