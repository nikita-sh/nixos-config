{
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations.kollibri = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {
          inherit inputs;
	  inherit (inputs) self nixpkgs;
          hostname = "kollibri";
        };
        modules = [
	        inputs.vscode-server.nixosModules.default
          ./hardware.nix
	        ../modules/bootloader.nix
	        ../modules/network.nix
	        ../modules/program.nix
	        ../modules/services.nix
	        ../modules/system.nix
	        ../modules/office-vpn.nix
	        ../modules/software-workstation.nix
	        ../modules/probe-rs.nix
	        ../modules/vpn.nix
          ../modules/security.nix
        ];
      };
    };
}
