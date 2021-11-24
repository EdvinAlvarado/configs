source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab
