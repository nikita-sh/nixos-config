{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.zsh.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   # pinentryFlavor = "";
  # };
}
