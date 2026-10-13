sudo port install rustup neovim zellij yazi fish xsel stow coreutils-uutils fzf zoxide eza tealdeer kitty imagemagick py314-pygments certsync ttf-nerd-fonts-symbols deluge
rustup-init

# Kitty
sudo port load dbus

# Fish
sudo chpass -s /opt/local/bin/fish ${USER}
sudo sh -c 'echo /opt/local/bin/fish >> /etc/shells'

# Python
sudo port select --set python python314
sudo port select --set python3 python314

# Rustup
rustup default stable &&
	rustup component add rust-analyzer rustfmt rust-src clippy &&
	cargo install cargo-seek


# Yazi Plugins
ya pkg add yazi-rs/flavors:dracula
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:chmod
ya pkg add yazi-rs/plugins:full-border
ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:jump-to-char
ya pkg add yazi-rs/plugins:vcs-files
ya pkg add yazi-rs/plugins:piper
