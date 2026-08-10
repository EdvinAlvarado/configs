# fish 
while true; do
	read -p "Install fish configs? " yn
	case $yn in
		[Yy]* ) cp .config/fish/config.fish ~/.config/fish/config.fish; 
				chsh -s $(which fish); 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# yazi
while true; do
	read -p "Install yazi configs? " yn
	case $yn in
		[Yy]* ) mkdir -p ~/.config/yazi; 
				cp -a .config/yazi/theme.toml ~/.config/yazi/; 
				cp -a .config/yazi/yazi.toml ~/.config/yazi/; 
				cp -a .config/yazi/keymap.toml ~/.config/yazi/; 
				cp -a .config/yazi/init.lua ~/.config/yazi/; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# Plasma Session
while true; do
	read -p "setup plasma session system env. variables? " yn
	case $yn in
		[Yy]* ) cp $PLASMA_WORKSPACE_DIR/env/*.sh ~/$PLASMA_WORKSPACE_DIR/env/; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# paru
while true; do
	read -p "setup paru? " yn
	case $yn in
		[Yy]* ) cp .config/paru/paru.conf ~/.config/paru/paru.conf; 
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# paru
while true; do
	read -p "setup paru? " yn
	case $yn in
		[Yy]* ) cp .config/doom/*el ~/.config/doom/;
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done
