# $1 == username

passwd

useradd -m $1
passwd $1
echo "permit persist :$1" >> /etc/doas.conf

EDITOR=vim visudo
