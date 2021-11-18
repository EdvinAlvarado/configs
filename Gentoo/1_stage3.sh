# $1 == mount

cd $1
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

mkdir -p $1/etc/portage/repos.conf
cp $1/usr/share/portage/config/repos.conf $1/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf $1/etc/
