source ~/.zplug/init.zsh

zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
# does not work so well with the completions or he history substring search
# zplug "softmoth/zsh-vim-mode"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "MichaelAquilina/zsh-you-should-use"

zplug load

#==============================================================================
# ZSH ALIAS HARDCORE 
#==============================================================================

export YSU_HARDCORE=1

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


PURE_PROMPT_SYMBOL="[I]"
PURE_PROMPT_VICMD_SYMBOL="[N]"

#==============================================================================
# ZSH HISTORY SUBSTRING SEARCH STUFF
#==============================================================================

MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff blinking underline"

