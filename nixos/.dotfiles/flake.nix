{
	description = "NixOS Configuration";	

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		yazi.url = "github:sxyazi/yazi";
	};

	outputs = inputs@{ self, nixpkgs, home-manager, yazi, ... }: {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.extraSpecialArgs = { inherit inputs; };
						home-manager.users.edvin = ./home.nix;
					}
					({ pkgs, ... }: {
						environment.systemPackages = [
							(yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
								_7zz = pkgs._7zz-rar;  # Support for RAR extraction
							})
						];
					})
				];
			};
		};

	};
}
