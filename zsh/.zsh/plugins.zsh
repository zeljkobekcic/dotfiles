source ~/.zplug/init.zsh

zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
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


#==============================================================================
# SPACESHIP THEME
#==============================================================================

SPACESHIP_BATTERY_SHOW=false
