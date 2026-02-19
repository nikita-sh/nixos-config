{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    inputs@{
      self,
      nixvim,
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      nix-vscode-extensions,
      nil,
      ...
    }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
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
      homeConfigurations."nikita@falke" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs system;
        };

        modules = [ 
            {
              home = {
                homeDirectory = "/Users/nikita";
                stateVersion = "24.05";
                username = "nikita";
              };
            }
            ../modules/bat
            ../modules/lsd
            ../modules/btop
            ../modules/direnv
            ../modules/git
            ../modules/kitty
            ../modules/nvim
            ../modules/package
            ../modules/zsh
            ../modules/obsidian
            ../modules/vscode
            ../modules/wezterm
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
