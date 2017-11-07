#!/bin/sh

# install for vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install xrdr a xrandr wrapper
mkdir ~/tmp_xrdr
cd ~/tmp_xrdr
wget https://raw.github.com/pschmitt/xrdr/master/PKGBUILD
makepkg -si
cd ..
rmdir ~/tmp_xrdr
