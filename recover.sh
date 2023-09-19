NEOVIM_DIR=.config/nvim
NEOVIM_LUA_DIR=$NEOVIM_DIR/lua

# neovim
while true; do
	read -p "Install neovim configs? " yn
	case $yn in
		[Yy]* ) mkdir -p ~/.config/nvim/lua; 
				cp $NEOVIM_DIR/init.vim ~/$NEOVIM_DIR/init.vim;
				cp $NEOVIM_LUA_DIR/config.lua ~/$NEOVIM_LUA_DIR/config.lua;
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
				nvim -c ':PlugInstall';
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

# ranger
while true; do
	read -p "Install ranger configs? " yn
	case $yn in
		[Yy]* ) mkdir -p ~/.config/ranger; 
				cp .config/ranger/rifle.conf ~/.config/ranger/rifle.conf; break;;
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
