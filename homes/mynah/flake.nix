{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    inputs@{
      self,
      nixvim,
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit pkgs-unstable;
	module = import ../modules/nixvim;
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
      system = "x86_64-linux";
    in
    {
      homeConfigurations."nikita@mynah" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
	  ../modules/mynah.nix
	  {
	    home = {
	      homeDirectory = "/home/nikita";
	      stateVersion = "24.05";
	      username = "nikita";
	    };
	  }
	];
      };

      checks.${system} = {
        default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
      };

      packages.${system} = {
        neovim = nvim;
      };
    };
}
