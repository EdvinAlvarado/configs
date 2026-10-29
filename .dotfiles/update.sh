#!/usr/bin/env bash

if command -v paru >/dev/null 2>&1; then
    # sudo pacman -Syu && pacman -Qdtq | sudo pacman -Rnsc -
    paru -Syu && paru -Scc && pacman -Qdtq | sudo pacman -Rnsc -
    sudo paccache -ruk0
    sudo paccache -rk 2
fi

flatpak update && flatpak uninstall --unused
ya pkg upgrade --discard
tldr --update
rustup update

if command -v guix >/dev/null 2>&1; then
    guix pull && guix upgrade u && sudo -i guix pull && sudo systemctl restart guix-daemon.service
else
    echo "WARNING: Guix is not installed, skipping guix commands."
fi
