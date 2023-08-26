# neovim
while true; do
	read -p "Backup neovim configs? " yn
	case $yn in
		[Yy]* ) cp ~/.vimrc .vimrc; 
				cp ~/.config/nvim/init.vim .config/nvim/init.vim; break;;
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
