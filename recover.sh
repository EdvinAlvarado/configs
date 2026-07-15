# zsh
while true; do
	read -p "Install zsh configs? " yn
	case $yn in
		[Yy]* ) cp .zshrc ~/.zshrc; 
				chsh -s $(which zsh); 
				sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
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

# mpd
while true; do
	read -p "Install mpd configs? " yn
	case $yn in
		[Yy]* ) mkdir -p ~/.config/mpd; 
				cp .config/mpd/mpd.conf ~/.config/mpd/mpd.conf;
				echo "mpd: remember to enable this daemon (e.g. systemctl enable --now mpd)"; break;;
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
