# Dotfiles

My dotfiles contain configuration for:

- zsh
- kitty
- starship 
- neovim (based on <https://github.com/nvim-lua/kickstart.nvim>)
- fonts (NerdFont patched Hack)
- arch linux
- swaywm

## Dependencies 

GNU Stow is required for installing the configurations.

Here are requirements listed for each component.

## Setup

To clone the repo and get all the submodules (zsh plugins) just run the following.

```shell
git clone git@gitlab.com:zeljkobekcic/dotfiles.git
git submodule update --init --recursive
```

## Usage

To create a symlink to the correct place just run the following with the desired module.

```shell
./setup-component.sh <name-of-directory-in-dotfiles-repo>
```

