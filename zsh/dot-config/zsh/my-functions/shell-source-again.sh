function shell-reloadConfig() {
    if [ -n  "$BASH" ]; then
        source "$HOME/.bashrc"
    elif [ -n "$ZSH_NAME" ]; then
        source "$HOME/.zshrc"
    else
      echo "Your shell is neither bash nor zsh and therefore not supported"
      return 1
    fi
}
