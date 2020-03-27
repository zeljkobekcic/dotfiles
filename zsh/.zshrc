#==============================================================================
# .ZSHRC
#==============================================================================

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export JDK_HOME=/usr/lib/jvm/default

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/config.zsh

#==============================================================================
# MAKING EXA/LS BEAUTIFUL WITH SOLARIZED COLORS
#==============================================================================

eval `dircolors ~/.dir_colors`
eval "$(starship init zsh)"
eval "$(pyenv init -)"
