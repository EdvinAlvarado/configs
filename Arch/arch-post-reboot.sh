## CLI 
# Add yazi plugins 
ya pkg add yazi-rs/flavors:dracula
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:chmod
ya pkg add yazi-rs/plugins:full-border
ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:jump-to-char
ya pkg add yazi-rs/plugins:vcs-files
ya pkg add yazi-rs/plugins:piper
# fish
fisher install jorgebucaran/fisher
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
# Common Lisp
sbcl --load /usr/share/quicklisp/quicklisp.lisp \
     --eval '(quicklisp-quickstart:install)' \
     --eval '(ql:add-to-init-file)' \
     --quit



## Applications 
sudo pacman --noconfirm -S neofetch insync anki ledger-live ventoy-bin bambustudio-bin orca-slicer-bin ocrmypdf qdirstat subtitleedit trayscale
paru --noconfirm -S proton-mail proton-vpn-gtk-app
paru --noconfirm -S fcitx5-mozc-ut fcitx5-breeze
paru --noconfirm -S wike-tui 
paru --noconfirm -S rusty-man 
paru --noconfirm -S cargo-info 
paru --noconfirm -S frame-eth
paru --noconfirm -S libation 
paru --noconfirm -S audiobookconverter-bin 

if ($XDG_SESSION_TYPE = "wayland"); then
	$ESPANSO = "espanso-wayland"
else
	$ESPANSO = "espanso-x11"
paru --noconfirm -S $ESPANSO espanso-gui
espanso service register
espanso start

# Flatpak
flatpak -y install discord flatseal geogebra komikku monero signal thinkorswim app.zen_browser.zen
# Games
flatpak -y install steam lutris minecraft TinyWiiBackupManager ca.wiilink.Patcher
sudo pacman --noconfirm -S game-devices-udev
paru --noconfirm -S wit-bin # wii game ISO manipulation

## Snapper
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
sudo sed -i -e 's/"pacman -Syu"/"pacman -Syu", "paru -Syu"/' /etc/snap-pac.ini
sudo sed -i -e 's/"linux"/"linux", "linux-zen", "nvidia-utils", "nvidia-dkms", "systemd", "systemd-libs", "zram-generator", "amd-ucode", "intel-ucode", "networkmanager", "linux-firmware", "btrfs-progs"/' /etc/snap-pac.ini


## Configuration
sudo systemctl mask systemd-udev-settle

## AI
# Setup Kagi MCP Server
cd ~/Projects && \
	git clone https://github.com/kagisearch/kagimcp.git && \
	cd kagicmp && \
	uv sync
# Setup Ollama
while true; do
	read -p "Nvidia or AMD GPU? (e.g. nvidia, amd, none) " yn
	case $yn in
		[nvidiaNVIDIA]* ) sudo pacman -S ollama-cuda;
				break;;
		[amdAMD]* ) sudo pacman -S ollama-rocm;
				break;;
		[Nn]* ) break;;
		*     ) echo "Which one?";;
	esac
done
echo "NOTICE: install ollama-cuda (for nvidia) or ollama-rocm (for AMD) for ollama use."

echo ""
echo "Finished"
echo "run recover.sh for conf files"
echo "Running KDE Wayland might require disabling saving sessions"
echo "Run fcitx5-configtool to setup mozc"
