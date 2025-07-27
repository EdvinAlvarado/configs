NEOVIM_DIR=.config/nvim
NEOVIM_LUA_DIR=$NEOVIM_DIR/lua

# neovim
while true; do
	read -p "Install neovim configs? " yn
	case $yn in
		[Yy]* ) 
				cp $NEOVIM_DIR/init.lua ~/$NEOVIM_DIR/init.lua;
				nvim;
				break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

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

# tmux
while true; do
	read -p "Install tmux configs? " yn
	case $yn in
		[Yy]* ) cp .tmux.conf ~/.tmux.conf;
				git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;
				tmux;
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
				cp -a .config/yazi ~/.config/yazi; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# xmonad/xmobar
while true; do
	read -p "Install xmonad and xmobarrc configs? " yn
	case $yn in
		[Yy]* ) mkdir -p ~/.xmonad; 
				cp .xmonad/xmonad.hs ~/.xmonad/xmonad.hs;
				cp .xmobarrc ~/.xmobarrc;
				xmonad --recompile; break;;
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
