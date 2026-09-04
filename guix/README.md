# Installation

Sadly, the guided TUI installation does not have a sensible BTRFS folder installation where @home and other subvolumes can be created in the same partition. So I guess we must follow the [Manual Installation](https://guix.gnu.org/manual/1.5.0/en/html_node/Keyboard-Layout-and-Networking-and-Partitioning.html).


### Get internet

### Manual Paritition

#### Get the necessary packages

``` shell
guix install git cryptsetup
. "/root/.guix-profile/etc/profile"
```

#### Partitions

Create a boot partition of 2GiB as the first partition and a primary partition as a second parition.

Change `/dev/sda` to your device you will use for guix.

```shell
cd ~/configs/btrfs
./make-mount.sh /dev/sda /mnt guix
```

### Continue manual installation

Continue [instructions](https://guix.gnu.org/manual/1.5.0/en/html_node/Proceeding-with-the-Installation.html) in the GNU guix manual.
