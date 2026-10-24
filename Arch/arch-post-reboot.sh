#!/usr/bin/env bash
## Kernel
paru --noconfirm -S linux-cachyos
# Bootloader
paru --noconfirm -S limine-mkinitcpio-hook limine-snapper-sync
sudo limine-update
# archiso
paru -S archiso-systemd-boot &&
	sudo cat <<EOF >>/boot/limine.conf


/Arch Linux Rescue
comment: arch rescue
comment: order-priority=30
protocol: linux
kernel_path: boot():/archiso/vmlinuz-linux
module_path: boot():/archiso/initramfs-linux.img
cmdline: archisobasedir=archiso archisosearchfilename=/archiso/vmlinuz-linux 
EOF

## CLI
../universal/yazi.sh
../universal/fish.sh
../universal/wikiman.sh
../universal/teeldear.sh
# Haskell
paru --noconfirm -S ghcup-hs-bin && ../universal/haskell.sh
# Common Lisp
../universal/clisp.sh
# Clojure
paru --noconfirm -S clojure-lsp-bin clj-kondo-bin babashka-bin
# doom emacs
../universal/doom-emacs.sh

## Applications
sudo pacman --noconfirm -S neofetch insync anki ledger-live ventoy-bin bambustudio-bin orca-slicer-bin ocrmypdf qdirstat subtitleedit trayscale otf-symbola woeusb
paru --noconfirm -S proton-mail proton-vpn-gtk-app
paru --noconfirm -S fcitx5-mozc-ut fcitx5-breeze
paru --noconfirm -S wike-tui
paru --noconfirm -S rusty-man
paru --noconfirm -S cargo-info
paru --noconfirm -S frame-eth
paru --noconfirm -S libation
paru --noconfirm -S audiobookconverter-bin
paru --noconfirm -S naps2-bin

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	ESPANSO="espanso-wayland"
else
	ESPANSO="espanso-x11"
fi
paru --noconfirm -S $ESPANSO espanso-gui && ../universal/espanso.sh

# Flatpak
flatpak -y install discord flatseal geogebra komikku monero signal thinkorswim app.zen_browser.zen
# Games
flatpak -y install steam lutris minecraft TinyWiiBackupManager ca.wiilink.Patcher Heroic
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
../universal/kagicmp.sh
# Setup Ollama
while true; do
	read -p "Nvidia or AMD GPU? (e.g. nvidia, amd, none) " yn
	case $yn in
	[nvidiaNVIDIA]*)
		sudo pacman -S ollama-cuda
		break
		;;
	[amdAMD]*)
		sudo pacman -S ollama-rocm
		break
		;;
	[Nn]*)
		echo "NOTICE: install ollama-cuda (for nvidia) or ollama-rocm (for AMD) for ollama use."
		break
		;;
	*) echo "Which one?" ;;
	esac
done

## Package Configuration
../universal/nvim.sh
../recover.sh

echo ""
echo "Finished!"
echo "Running KDE Wayland might require disabling saving sessions"
echo "Run fcitx5-configtool to setup mozc"
