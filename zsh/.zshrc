#==============================================================================
# .ZSHRC
#==============================================================================

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export JDK_HOME=/usr/lib/jvm/default

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/config.zsh

#==============================================================================
# MAKING EXA/LS BEAUTIFUL WITH SOLARIZED COLORS
#==============================================================================

# eval $(dircolors $XDG_CONFIG_HOME/dircolors/dircolors.ansi-dark)
eval "$(starship init zsh)"

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/home/zeljko/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
