# sudo pacman -Syu && pacman -Qdtq | sudo pacman -Rnsc -
paru -Syu && paru -Scc && pacman -Qdtq | sudo pacman -Rnsc -
sudo paccache -ruk0
sudo paccache -rk 2
flatpak update && flatpak uninstall --unused
ya pkg upgrade --discard
tldr --update
rustup update
guix pull && guix upgrade -u && sudo -i guix pull && sudo systemctl restart guix-daemon.service
