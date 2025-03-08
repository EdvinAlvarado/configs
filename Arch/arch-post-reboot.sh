# Run this before running this scritpy
# sudo pacman -S --needed git base-devel

# Pacman Config
sudo sed -i -e "s/#ParallelDownloads = 5/ParallelDownloads = 10/" /etc/pacman.conf

## System Packages
# CLI
sudo pacman -S neovim nodejs npm ranger htop glances flatpak rustup zsh 
# Rust
rustup default stable
source "$HOME/.cargo/env"
rustup component add rust-analyzer rustfmt rust-src clippy
# bluetooth
sudo pacman -S bluez bluez-utils
sudo systemctl enable --now bluetooth.service
# pikaur
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ..
rm -rf pikaur

## Applications 
# KDE
sudo pacman -S kde-accessibility-meta kde-graphics-meta kde-multimedia-meta kdeconnect kdenetwork-filesharing kget kio-extras kio-gdrive kio-zeroconf krdc krfb kde-pim-meta kde-system-meta ark filelight kate kbackup kcalc kcharselect kdf kdialog kfind kgpg print-manager skanpage sweeper yakuake kdiff3 kompare dolphin-plugins
# GUI
sudo pacman -S mkvtoolnix-cli mkvtoolnix-gui deluge deluge-gtk code libreoffice vlc texlive-bin ghostwriter firefox keepass


## Japanese
sudo pacman -S adobe-source-han-sans-jp-fonts adobe-source-han-sans-jp-fonts otf-ipafont ttf-hanazono ttf-sazanami
sudo pacman -S fcitx5-im
pikaur -S fcitx5-mozc-ut fctix5-breeze


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
sudo systemctl enable --now snapper-timeline.timer
sudo systemctl enable --now snapper-cleanup.timer
# Setup pre/post root snapshots for pacman transactions
# TODO root command did not work. added fix. not tested
sudo sed -i -e 's/#\[root\]/\[root\]/' /etc/snap-pac.ini
sudo sed -i -e 's/#desc_limit/desc_limit/' /etc/snap-pac.ini
sudo sed -i -e 's/#snapshot/snapshot/' /etc/snap-pac.ini
sudo sed -i -e 's/#cleanup/cleanup/' /etc/snap-pac.ini
sudo sed -i -e 's/#pre/pre/' /etc/snap-pac.ini
sudo sed -i -e 's/#post/post/' /etc/snap-pac.ini
sudo sed -i -e 's/#important/important/g' /etc/snap-pac.ini
sudo sed -i -e 's/"pacman -Syu"/"pacman -Syu", "pikaur -Syu"/' /etc/snap-pac.ini
sudo sed -i -e 's/"linux"/"linux", "linux-zen", "nvidia-utils", "nvidia-dkms", "systemd", "systemd-libs", "zram-generator", "amd-ucode", "intel-ucode", "networkmanager", "linux-firmware", "btrfs-progs"/' /etc/snap-pac.ini
sudo nvim /etc/snap-pac.ini


## Network Printing
# You must disable the systemd DNS resolver
sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service
# and use avahi and mdns for it to work.
sudo pacman -S nss-mdns avahi samba
sudo systemctl enable --now avahi-daemon.service
sudo sed -i -e 's/mymachines/mymachines mdns_minimal [NOTFOUND=return]/g' /etc/nsswitch.conf
# CUPS
sudo pacman -S cups cups-pdf
sudo systemctl enable --now cups.service
sudo systemctl restart cups.service


## Extra Applications 
# Flatpak
flatpak install discord flatseal geogebra komikku monero signal spotify thinkorswim whatsapp keepassxc chrome
# Games
flatpak install steam lutris minecraft
pikaur -S game-devices-udev
# Pikaur
pikaur -S insync 
pikaur -S sublime-merge
pikaur -S anki
pikaur -S frame-eth
pikaur -S ledger-live


if ($XDG_SESSION_TYPE = "wayland"); then
	$ESPANSO = "espanso-wayland"
else
	$ESPANSO = "espanso-x11"
pikaur -S $ESPANSO
espanso service register
espanso start

echo ""
echo "Finished"
echo "run recover.sh for neovim and zsh setup"
echo "Running KDE Wayland might require disabling saving sessions"
echo "Run fcitx5-configtool to setup mozc"
