sudo pacman --noconfirm -S --needed git base-devel

# Pacman Config
sudo sed -i -e "s/#ParallelDownloads = 5/ParallelDownloads = 10/" /etc/pacman.conf
sudo sed -i -E 's/^(CFLAGS="-march=)\w+/\1native/' /etc/makepkg.conf
sudo sed -i -E 's/^(RUSTFLAGS=".+)"/\1 -C target-cpu=native"/' /etc/makepkg.conf.d/rust.conf

## cahyos-kernel
# Download and extract the installer
curl -O https://mirror.cachyos.org/cachyos-repo.tar.xz && \
tar xvf cachyos-repo.tar.xz && cd cachyos-repo && \
# Run the automated installer
sudo ./cachyos-repo.sh && \
cd .. && \
rm -rf cachyos-repo.tar.xz cachyos-repo

## chaotic-aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman --noconfirm -Syu

## paru 
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg --noconfirm -si
cd ..
rm -rf paru
paru --gendb

