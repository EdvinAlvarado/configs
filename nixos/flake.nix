{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		yazi.url = "github:sxyazi/yazi";
	};

	outputs = { nixpkgs, yazi, ... }: {
		# To install Yazi system-wide:
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				modules = [
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
