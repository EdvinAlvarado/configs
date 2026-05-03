## System Packages
# CLI
sudo pacman --noconfirm -S neovim nodejs npm htop glances flatpak rustup zsh dos2unix expac fd fzf go gopls hdparm links neofetch nushell namcap postgresql rsync tree-sitter wget which vorbis-tools zig zls zip unzip unrar clang upx tealdeer wikiman fdupes duperemove btop nfs-utils uutils-coreutils zoxide zellij yazi kitty p7zip bat borg cava feh hyperfine syncthing tailscale ueberzugpp resvg perl-rename eza tmux
# Add yazi theme
ya pkg add yazi-rs/flavors:dracula
# zsh
pikaur --noconfirm -S oh-my-zsh-git
# Tealdeer
tldr --update
# wikiman
curl -L 'https://raw.githubusercontent.com/filiparag/wikiman/master/Makefile' -o 'wikiman-makefile'
make -f ./wikiman-makefile source-arch
make -f ./wikiman-makefile source-tldr
sudo make -f ./wikiman-makefile source-install
sudo make -f ./wikiman-makefile clean
# Rust
rustup default stable
rustup component add rust-analyzer rustfmt rust-src clippy


## Applications 
# KDE
sudo pacman --noconfirm -S kde-accessibility-meta kde-graphics-meta kde-multimedia-meta kdeconnect kdenetwork-filesharing kget kio-extras kio-gdrive kio-zeroconf krdc krfb kde-pim-meta kde-system-meta ark filelight kate kbackup kcalc kcharselect kdf kdialog kfind kgpg print-manager skanpage sweeper yakuake kdiff3 kompare dolphin-plugins elisa
# GUI
sudo pacman --noconfirm -S mkvtoolnix-cli mkvtoolnix-gui deluge deluge-gtk code libreoffice-freshlibreoffice-fresh-ja vlc vlc-plugins-extra texlive-bin obsidian handbrake aegisub audacity calibre texlab virtualbox thunderbirb systray-x-kde
pikaur --noconfirm -S proton-mail proton-vpn-gtk-app protonmail-bridge
# Japanese
sudo pacman --noconfirm -S adobe-source-han-sans-jp-fonts adobe-source-han-sans-jp-fonts otf-ipafont ttf-hanazono ttf-sazanami
sudo pacman --noconfirm -S fcitx5-im
pikaur --noconfirm -S fcitx5-mozc-ut fctix5-breeze
pikaur --noconfirm -S wike-tui 
pikaur --noconfirm -S rusty-man 
pikaur --noconfirm -S cargo-info 


## Snapper
sudo pacman --noconfirm -S snapper snap-pac btrfs-assistant
# Setup root config (recommended by Arch wiki)
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


## Extra Applications 
# AUR
sudo pacman --noconfirm -S insync anki ledger-live ventoy-bin bambustudio-bin orca-slicer-bin ocrmypdf qdirstat subtitleedit trayscale
pikaur --noconfirm -S frame-eth
pikaur --noconfirm -S libation 
pikaur --noconfirm -S audiobookconverter-bin 

if ($XDG_SESSION_TYPE = "wayland"); then
	$ESPANSO = "espanso-wayland"
else
	$ESPANSO = "espanso-x11"
pikaur --noconfirm -S $ESPANSO espanso-gui
espanso service register
espanso start

# Flatpak
flatpak install discord flatseal geogebra komikku monero signal thinkorswim keepassxc com.Google.Chrome app.zen_browser.zen
# Games
flatpak install steam lutris minecraft
sudo pacman --noconfirm -S game-devices-udev


echo ""
echo "Finished"
echo "run recover.sh for neovim and zsh setup"
echo "Running KDE Wayland might require disabling saving sessions"
echo "Run fcitx5-configtool to setup mozc"
