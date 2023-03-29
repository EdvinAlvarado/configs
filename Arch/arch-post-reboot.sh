# Run this before running this scritpy
# sudo pacman -S --needed git base-devel


## System Packages
# CLI
sudo pacman -S neovim nodejs npm ranger htop glances flatpak rustup zsh 
# Rust
rustup default stable
# bluetooth
sudo pacman -S bluez bluez-utils
systemctl enable --now bluetooth.service
# pikaur
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ..
rm -rf pikaur


## Applications 
# KDE
sudo pacman -S kde-accessibility-meta kde-graphiics-meta kde-multimedia-meta kdeconnect kdenetwork-filesharing kget kio-extras kio-gdrive kio-zeroconf krdc krfb kde-pim-meta kde-system-meta ark filelight kate kbackup kcalc kcharselect kdf kdialog kfind kgpg print-manager skanpage sweeper yakuake klatexformula kdiff3 kompare dolphin-plugins 
# GUI
sudo pacman -S mkvtoolnix-cli mkvtoolnix-gui deluge deluge-gtk code libreoffice vlc texlive-bin ghostwriter firefox
# Flatpak
flatpak install discord flatseal geogebra komikku monero signal spotify thinkorswim whatsapp googleChrome
# Games
flatpak install steam lutris minecraft
# Pikaur
pikaur -S sublime-merge anki frame-eth ledger-live 


## Japanese
pikaur -S fcitx5-mozc-ut
fcitx5-configtool


## Snapper
sudo pacman -S snapper snap-pac
pikaur -S snapper-gui-git
# Setup root config (recommended by Arch wiki)
sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config /
sudo btrfs subvolume delete /.snapshots
sudo mkdir /.snapshots
sudo mount -a
sudo chmod 750 /.snapshots

# Setup home config
sudo snapper -c home create-config /home

# Activate automatic snapshots
systemctl enable --now snapper-timeline.timer
systemctl enable --now snapper-cleanup.timer

# Setup pre/post root snapshots for pacman transactions
sudo sed -i -e 's/#[root]/[root]/' /etc/snap-pac.ini
sudo sed -i -e 's/#desc_limit/desc_limit/' /etc/snap-pac.ini
sudo sed -i -e 's/#snapshot/snapshot/' /etc/snap-pac.ini
sudo sed -i -e 's/#cleanup/cleanup/' /etc/snap-pac.ini
sudo sed -i -e 's/#pre/pre/' /etc/snap-pac.ini
sudo sed -i -e 's/#post/post/' /etc/snap-pac.ini
sudo sed -i -e 's/#important/important/g' /etc/snap-pac.ini
sudo sed -i -e 's/"pacman -Syu"/"pacman -Syu", "pikaur -Syu"/' /etc/snap-pac.ini
sudo sed -i -e 's/"linux"/"linux", "linux-zen", "nvidia-utils", "nvidia-dkms", "systemd", "systemd-libs", "zram-generator", "amd-ucode", "intel-ucode", "networkmanager", "linux-firmware", "btrfs-progs"/' /etc/snap-pac.ini

## Network Printing

# You must disable the systemd DNS resolver
systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service

# and use avahi and mdns for it to work.
sudo pacman -S nss-mdns avahi samba
systemctl enable --now avahi-daemon.service
sudo sed -i -e 's/mymachines/mymachines mdns_minimal [NOTFOUND=return]/g' /etc/nsswitch.conf
# CUPS
sudo pacman -S cups cups-pdf
systemctl enable --now cups.service
systemctl restart cups.service

echo ""
echo "Finished"
echo "run recover.sh for neovim and zsh setup"
