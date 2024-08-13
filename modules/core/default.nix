{
  inputs,
  nixpkgs,
  self,
  username,
  hname,
  ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        self
        inputs
        username
        hname
        ;
    };
    modules =
      [
        inputs.vscode-server.nixosModules.default
        (
          { config, pkgs, ... }:
          {
            services.vscode-server = {
              enable = true;
              enableFHS = true;
            };
          }
        )
      ]
      ++ [
        (import ./bootloader.nix)
      ]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./xserver.nix) ]
      ++ [ (import ./network.nix) ]
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./../home/package/python.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./office-vpn.nix) ]
      ++ [ (import ./software-workstation.nix) ]
      ++ [ (import ./thinkpad.nix) ]
      ++ [ (import ./probe-rs.nix) ]
      ++ [
        (import ./vpn.nix)
      ]
      ++ [ (import ./virtualization.nix) ]
      ++ [ (import ./../../hosts/nixos/hardware-configuration.nix) ];
  };
}
