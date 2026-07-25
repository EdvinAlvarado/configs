sudo pacman -Syu && pacman -Qdtq | sudo pacman -Rnsc -
paru -Syu
flatpak update && flatpak uninstall --unused
ya pkg upgrade --discard
tldr --update
rustup update
