sudo pacman -Syu && pacman -Qdtq | sudo pacman -Rnsc -
pikaur -Syu
flatpak update && flatpak uninstall --unused
ya pkg upgrade --discard
tldr --update
rustup update
