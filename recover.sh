# Home
cp -u .zshrc ~/.zshrc
cp -u .vimrc ~/.vimrc

mkdir -p ~/.config/nvim
mkdir -p ~/.config/ranger
cp -rfu .config/nvim/init.vim ~/.config/nvim/init.vim
cp -rfu .config/ranger/rifle.conf ~/.config/ranger/rifle.conf

# Root
# doas cp -rfu etc/doas.conf /etc/doas.conf

chsh -s /bin/zsh
