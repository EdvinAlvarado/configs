#!/usr/bin/env bash

if ! command -v nvim &> /dev/null
then
    echo "nvim is not installed. Please install nvim first."
    exit 1
fi

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi
git clone git@github.com:EdvinAlvarado/kickstart.nvim.git ~/.config/nvim/
