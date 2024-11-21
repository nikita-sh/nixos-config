{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    enableDefaultEditor = true;
    vimAlias = true;
  };
}
