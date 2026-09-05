# Installation

Sadly, the guided TUI installation does not have a sensible BTRFS folder installation where @home and other subvolumes can be created in the same partition. So I guess we must follow the [Manual Installation](https://guix.gnu.org/manual/1.5.0/en/html_node/Keyboard-Layout-and-Networking-and-Partitioning.html).

## Get internet

## Get the necessary packages

``` shell
guix install git cryptsetup vim
. "/root/.guix-profile/etc/profile"
```

## Get dotfiles

``` shell
git clone https://github.com/EdvinAlvarado/configs.git
```

## Manual Paritition

Create a boot partition of ~2GiB as the first partition and a primary partition as a second parition.

Change `/dev/sda` to your device you will use for guix.

```shell
cd ~/configs/btrfs
./make-mount.sh /dev/sda /mnt guix
```

## GUIX Preparation

### Get the nonguix channel

``` shell
mkdir -p ~/.config/guix
cp ~/configs/.guix/.config/guix/channels.scm ~/.config/guix/channels.scm
cp ~/configs/.guix/.config/guix/channels.scm /mnt/etc/channels.scm
guix pull && hash guix
```

### Configure config.scm

!todo make `config_template.scm`.

``` shell
mkdir -p /mnt/etc
cp ~/configs/guix/config_template.scm /mnt/etc/config.scm
UUIDB=$(blkid | grep 1: | grep -oP 'UUID="\K[^"]+' | head -n 1)
UUIDR=$(blkid | grep 2: | grep -oP 'UUID="\K[^"]+' | head -n 1)
sed -i "s/UUID_BOOT/$UUIDB/g" /mnt/etc/config.scm
sed -i "s/UUID_ROOT/$UUIDR/g" /mnt/etc/config.scm
```

Perform any changes to config.scm you would like.

### Install Distro

``` shell
herd start cow-store /mnt &&
guix time-machine -C /mnt/etc/channels.scm -- system init /mnt/etc/config.scm /mnt &&
reboot
```

This has a habit of randomly failing to build or find substitutes. Just keep trying the second command until it completes building. This really makes guix not feel like it's production ready... Although to be fair, I didn't have any issues installling through the official guided installation. I respect GNU's zealoutry on free software but it really should come at the expense of the user experience; so, it's really dissapointing that there's no good documentation of installing the nongnu portion in one go. System Crafters has guides but it's very clear that it is considerably outdated; be it the guide making references to gitlab repos that don't have the folders where they state it is; or the guide saying to download an ISO that's not there. Outside of System Crafters, there are instructions for adding nongnu **after** installing GUIX. Which is ok if you have the necessary drivers or an ethernet connections until while adding nongnu. All this obstacles and pain points considerably adds friction to installing gnu guix basically limiting the target demographic to advanced users.

It feels like the old days of Arch Linux where you had to install it all by hand but with worse documentation (for nongnu). If you don't need nongnu for installation or ever, then most of this friction dissapears as the GNU Guix Reference Material is actually pretty solid.

### Post-install

#### Passwords

We need to set passwords for the users so let's switch to another virtual terminal (e.g. `Ctrl+Alt+F5`) and login as root and set passwords.

``` shell
# root password
passwd
# change your user account password
passwd edvin
```

#### Login

``` shell
mkdir -p ~/.config/guix
cp /etc/channels.scm ~/.config/guix/channels.scm
cp /etc/config.scm ~/.config/guix/system.scm
chmod +w ~/.config/guix/channels.scm
guix pull && hash guix &&
sudo -E guix system reconfigure ~/.config/guix/system.scm
```

## References

- [GNU Guix Reference Material - Manual Installation](https://guix.gnu.org/manual/devel/en/html_node/Manual-Installation.html)
- [System Crafters](https://systemcrafters.net/craft-your-system-with-guix/full-system-install/)
