{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  {
    homeManagerModules = [
      ./nvim
    ];
  };
}
