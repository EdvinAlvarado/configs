# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs,	... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
		];
	
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
	boot.loader.limine.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Use latest kernel.
	boot.kernelPackages = pkgs.linuxPackages_latest;

	boot.initrd.luks.devices."luks-978b1448-8f36-4e12-897e-c36e13ca4d50".device = "/dev/disk/by-uuid/978b1448-8f36-4e12-897e-c36e13ca4d50";
	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "America/Chicago";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	nix.optimise.automatic = true;
	nix.optimise.dates = [ "02:00" ];
	nix.gc.automatic = true;
	nix.gc.dates = "daily";
	nix.gc.options = "--delete-older-than 30d";
	
	# Enable the X11 windowing system.
	# You can disable this if you're only using the Wayland session.
	services.xserver.enable = true;

	# Enable the KDE Plasma Desktop Environment.
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		# jack.enable = true;
	};

	# Enable touchpad support (enabled default in most desktopManager).
	# services.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users."edvin" = {
		isNormalUser = true;
		description = "Edvin Alvarado";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			kdePackages.kate
		#	thunderbird
		];
	};


	# Install firefox.
	programs.firefox.enable = true;

	# Enable AppImage Support
	programs.appimage.enable = true;
	programs.appimage.binfmt = true;

	# Fish
	programs.fish.enable = true;
	users.defaultUserShell = pkgs.fish;

	# git
	programs.git.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile.
	# You can use https://search.nixos.org/ to find more packages (and options).
	environment.systemPackages = with pkgs; [
		neovim
		wget
		emacs
		aegisub
		anki
		audacity
		babashka
		#bambu-studio
		bat
		bat-extras.core
		borgbackup
		btop
		btrfs-assistant
		cabal-install
		calibre
		cargo-info
		cargo-nextest
		cargo-seek
		cava
		clang
		clojure
		cljfmt
		clj-kondo
		deluge
		deluged
		dos2unix
		dosfstools
		duperemove
		espanso
		eza
		fcitx5-mozc
		fd
		fdupes
		feh
		fish
		fzf
		git
		ghc
		glances
		glow
		gnumake
		go
		gopls
		#handbrake
		haskell-language-server
		haskellPackages.fast-tags
		hdparm
		home-manager
		htop
		hyperfine
		#insync
		kitty
		ledger-live-desktop
		libation
		libreoffice
		links2
		mame-tools
		markdownlint-cli2
		memtest86-efi
		mkvtoolnix
		mkvtoolnix-cli
		mpv
		mpd
		naps2
		nfs-utils
		nodejs
		nushell
		obsidian
		ocrmypdf
		odin
		ols
		orca-slicer
		proton-pass
		proton-vpn
		protonmail-bridge
		qdirstat
		rename
		resvg
		ripgrep
		ripgrep-all
		rsync
		rustup
		rusty-man
		screenfetch
		shfmt
		shellcheck
		starship
		stack
		syncthing
		trayscale
		tealdeer
		texlab
		texliveSmall
		thunderbird
		tree-sitter
		ueberzugpp
		unrar
		unzip
		upx
		uutils-coreutils
		virtualbox
		vlc
		vorbis-tools
		vscode
		stow
		uv
		wike
		wikiman
		yazi
		zellij
		zig
		zip
		zls
		zoxide
		] ++ (with kdePackages; [ 
		audiocd-kio
		dolphin-plugins
		elisa
		filelight
		kbackup
		kcalc
		kcharselect
		kdeconnect-kde
		kdenetwork-filesharing
		kdf
		kdialog
		kdiff3
		kfind
		kgpg
		kio-extras
		kio-gdrive
		kio-zeroconf
		kompare
		krdc
		krfb
		partitionmanager
		print-manager
		sddm-kcm
		skanpage
		sweeper
		util-linux
		yakuake
]) ++ (with tree-sitter-grammars; [tree-sitter-c tree-sitter-lua tree-sitter-toml tree-sitter-latex tree-sitter-sql tree-sitter-haskell tree-sitter-scheme tree-sitter-nix tree-sitter-rust tree-sitter-go tree-sitter-clojure]);

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#	 enable = true;
	#	 enableSSHSupport = true;
	# };

	#nixpkgs.overlays = [ yazi.overlay.default ];
	programs.yazi.enable = true;

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;
	
	# Enable Flatpak
	services.flatpak.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	xdg.portal.config.common.default = "gtk";

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "26.05"; # Did you read the comment?

}
