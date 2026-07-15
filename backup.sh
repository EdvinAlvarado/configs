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
				cp -a ~/.config/yazi/keymap.toml .config/yazi/; 
				cp -a ~/.config/yazi/init.lua .config/yazi/; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# Plasma Session
while true; do
	read -p "Backup plasma session system env. variables? " yn
	case $yn in
		[Yy]* ) cp ~/$PLASMA_WORKSPACE_DIR/env/*.sh $PLASMA_WORKSPACE_DIR/env/; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done
