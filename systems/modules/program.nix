{ lib, ... }:
{
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   # pinentryFlavor = "";
  # };
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
    ];
}
