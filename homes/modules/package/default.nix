{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    with gnome;
    [
      ani-cli # animu
      bitwise # cli tool for bit / hex manipulation
      file # Show file information
      delta
      fzf # fuzzy finder
      lazygit
      nix-prefetch-github
      ripgrep # grep replacement
      todo # cli todo list
      yazi # terminal file manager

      # C / C++
      gcc
      gnumake

      bleachbit # cache cleaner
      cmatrix
      ffmpeg
      libnotify
      mpv # video player
      ncdu # disk space
      openssl
      unzip
      wget
    #   xdg-utils
      direnv
      nmap
      neofetch
      pstree
      qemu
      # rustc
      starfetch

      screen
      jq
      vim # just in case
      probe-rs
      # bitwarden
      inetutils
      dig
      dnsutils
      pstree
      strace
      patchelf
      home-manager
    ]
  );
}
