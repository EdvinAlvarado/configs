#!/usr/bin/env bash

curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage -o nvim.appimage &&
	chmod +x nvim.appimage &&
	if [ ! -d "$HOME/.bin" ]; then
		mkdir -p "$HOME/.bin"
	fi &&
	mv nvim.appimage "$HOME/.bin" &&
	echo "Neovim installed on $HOME/.bin/nvim. Add $HOME/.bin to your PATH to use it."
