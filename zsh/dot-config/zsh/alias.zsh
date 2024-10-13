if [ -x "$(command -v 'eza')" ]; then
	alias ls="eza"
	alias ll="eza -l"
	alias la="eza -la"
else
	alias ll="ls -l"
	alias la="ls -la"
fi


if [ -x "$(command -v 'nvim')" ]; then
	alias v="nvim"
	alias vi="nvim"
	alias vim="nvim"
	alias edit="nvim"
fi

