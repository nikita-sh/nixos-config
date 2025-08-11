{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    with gnome;
    [
      ani-cli # animu
      bitwise # cli tool for bit / hex manipulation
      entr # perform action when file change
      file # Show file information
      delta
      fzf # fuzzy finder
      lazygit
      nix-prefetch-github
      ripgrep # grep replacement
      todo # cli todo list
      toipe # typing test in the terminal
      yazi # terminal file manager

      # C / C++
      gcc
      gnumake

      bleachbit # cache cleaner
      cmatrix
      ffmpeg
      libnotify
      man-pages # extra man pages
      mpv # video player
      ncdu # disk space
      openssl
      httpie
      qalculate-gtk # calculator
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
      zoom-us

      screen
      jq
      # firefox
      calcurse
      vim # just in case
      probe-rs
      # bitwarden
      pkg-config
      wireshark
      inetutils
      dig
      dnsutils
      pstree
      # strace
      # patchelf
      home-manager
      tailscale
      fd
      imagemagick # for neofetch
      gh
      nodejs_20
    ]
  );
}
