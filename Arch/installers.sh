sudo pacman -S --needed git base-devel

# Pacman Config
sudo sed -i -e "s/#ParallelDownloads = 5/ParallelDownloads = 10/" /etc/pacman.conf
sudo sed -i -E 's/^(CFLAGS="-march=)\w+/\1native/' /etc/makepkg.conf
sudo sed -i -E 's/^(RUSTFLAGS=".+)"/\1 -C target-cpu=native"/' /etc/makepkg.conf.d/rust.conf

## chaotic-aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman --noconfirm -Syu

## pikaur
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg --noconfirm -fsri
cd ..
rm -rf pikaur

## Hooks
# Change username path to yours.
sudo cp ./repos/pacman_hooks/pikaur-cache-cleanup.hook /usr/share/libalpm/hooks/pikaur-cache-cleanup.hook
username="$USER"
sudo sed -i -e "s/YOUR_USER/$username/" /usr/share/libalpm/hooks/pikaur-cache-cleanup.hook
