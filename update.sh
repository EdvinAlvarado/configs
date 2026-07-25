sudo pacman -Syu && pacman -Qdtq | sudo pacman -Rnsc -
paru -Syu && paru -Scc 
sudo paccache -ruk0
sudo paccache -rk 2
flatpak update && flatpak uninstall --unused
ya pkg upgrade --discard
tldr --update
rustup update
