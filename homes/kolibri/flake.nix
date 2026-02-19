{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
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
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      nixvim,
      ...
    }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        pkgs = pkgs-unstable;
	module = import ../modules/nixvim;
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in
    {
      homeConfigurations."nikita@kolibri" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ 
	  ../modules/kolibri.nix 
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
