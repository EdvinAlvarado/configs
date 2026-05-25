NEOVIM_DIR=.config/nvim
NEOVIM_LUA_DIR=$NEOVIM_DIR/lua

# neovim
while true; do
	read -p "Backup neovim configs? " yn
	case $yn in
		[Yy]* ) cp ~/$NEOVIM_DIR/init.lua $NEOVIM_DIR/init.lua; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# zsh
while true; do
	read -p "Backup zsh configs? " yn
	case $yn in
		[Yy]* ) cp ~/.zshrc .zshrc; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# yazi
while true; do
	read -p "Backup yazi configs? " yn
	case $yn in
		[Yy]* ) cp -a ~/.config/yazi/theme.toml .config/yazi/; 
				cp -a ~/.config/yazi/yazi.toml .config/yazi/; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# mpd
while true; do
	read -p "Backup mpd configs? " yn
	case $yn in
		[Yy]* ) cp ~/.config/mpd/mpd.conf .config/mpd/mpd.conf; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done
