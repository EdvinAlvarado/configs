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

# tmux
while true; do
	read -p "Backup tmux configs? " yn
	case $yn in
		[Yy]* ) cp ~/.tmux.conf .tmux.conf; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# ranger
while true; do
	read -p "Backup ranger configs? " yn
	case $yn in
		[Yy]* ) cp ~/.config/ranger/rifle.conf .config/ranger/rifle.conf; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# xmonad/xmobar
while true; do
	read -p "Backup xmonad and xmobarrc configs? " yn
	case $yn in
		[Yy]* ) cp ~/.xmonad/xmonad.hs .xmonad/xmonad.hs;
				cp ~/.xmobarrc .xmobarrc; break;;
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
