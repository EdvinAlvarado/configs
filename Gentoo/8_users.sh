passwd

read -p "username: " NAME

useradd -m $NAME
passwd $NAME

echo "permit persist :$1" >> /etc/doas.conf

EDITOR=vim visudo
