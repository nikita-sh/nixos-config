{
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-wsl,
      ...
    }:
    {
      nixosConfigurations.mynah = nixpkgs.lib.nixosSystem {
        system = "x86-64-linux";
        specialArgs = {
          inherit inputs;
          inherit (inputs) self nixpkgs;
          hostname = "mynah";
        };
        modules = [
          inputs.vscode-server.nixosModules.default
          nixos-wsl.nixosModules.wsl
          ./hardware.nix
          ../modules/bootloader.nix
          ../modules/network.nix
          ../modules/program.nix
          ../modules/services.nix
          ../modules/system.nix
          ../modules/security.nix
        ];
      };
    };
}
