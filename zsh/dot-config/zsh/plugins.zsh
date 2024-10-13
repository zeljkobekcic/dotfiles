## Plugins section: Enable fish style features
# source "${XDG_CONFIG_HOME}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${XDG_CONFIG_HOME}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^ ' autosuggest-accept

source "${XDG_CONFIG_HOME}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline"

source "${XDG_CONFIG_HOME}/zsh/plugins/zsh-z/zsh-z.plugin.zsh"
ZSHZ_CASE=ignore

