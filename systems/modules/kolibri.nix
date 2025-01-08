{
  inputs,
  nixpkgs,
  hname,
  self,
  ...
}:
{
  kolibri = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit
        inputs
        hname
	nixpkgs
	self
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
      ++ [ (import ./network.nix) ]
      ++ [ (import ./program.nix) ]
      # ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./office-vpn.nix) ]
      ++ [ (import ./software-workstation.nix) ]
      ++ [ (import ./probe-rs.nix) ]
      ++ [
        (import ./vpn.nix)
      ]
      ++ [ (import ./hardware.nix) ];
  };
}
