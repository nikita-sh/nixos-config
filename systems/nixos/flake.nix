{
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    {
      nixosConfiguration.nixos = nixpkgs.lib.nixosConfiguration {
        system = "x86_64";
        specialArgs = {
          inherit inputs;
          hostname = "nixos";
        };
        modules = [
          ./hardware.nix
          ../modules/default.nix
        ];
      };
    };
}
