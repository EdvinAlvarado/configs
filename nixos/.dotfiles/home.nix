{ config, pkgs, ... }:
{
	home.username = "edvin";
	home.homeDirectory = "/home/edvin";
	home.stateVersion = "26.05";
	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		settings.user.email = "ealvarado301@gmail.com";
		settings.user.name = "Edvin Alvarado";
	};

}

