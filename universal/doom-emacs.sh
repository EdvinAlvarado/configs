#!/usr/bin/env bash
# This script is used to setup Doom Emacs.

# Check if Emacs is installed
if ! command -v emacs &> /dev/null
then
    echo "Emacs is not installed. Please install Emacs first."
    exit 1
fi

git clone --depth 1 https://github.com/doomemacs/core ~/.config/emacs
~/.config/emacs/bin/doom install
doom sync
