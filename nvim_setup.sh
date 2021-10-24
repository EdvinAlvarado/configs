#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
cp -p .config/nvim/init.vim ~/.config/nvim/init.vim
nvim -c ':PlugInstall'
