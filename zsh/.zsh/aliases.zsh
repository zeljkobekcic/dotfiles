if command -v xclip > /dev/null || command -v xsel > /dev/null; then
    if command -v xclip > /dev/null; then
        alias setclip='xclip -selection primary -in'
        alias getclip='xclip -selection primary -out'
    elif command -v xsel > /dev/null; then
        alias setclip='xsel -p -i'
        alias getclip='xsel -p -o'
    fi
elif; then
    echo "You should install xclip or xsel"
fi


alias ls='ls                      -v --group-directories-first --color=auto'
alias la='ls -la --human-readable -v --group-directories-first --color=auto'
alias ll='ls -l  --human-readable -v --group-directories-first --color=auto'

# why using ls if we can use exa
# it does everything we could ask for
if command -v exa > /dev/null; then
    alias ls='exa'
    alias la='exa -a'
    alias ll='exa -al'
fi


alias v='vim'
alias vi='vim'

# neovim is love
# neovim is life
if command -v nvim > /dev/null; then
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
fi


alias z='zathura'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

alias -g G='| grep -in'
alias -g T='| tail'
alias -g H='| head'
