{ inputs, pkgs, system, ... }:
{
  home.packages = let 
    nilPkg = inputs.nil.packages.${system}.default;
  in (
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
      direnv
      nmap
      neofetch
      pstree
      qemu
      starfetch
      zoom-us
      screen
      jq
      calcurse
      vim # just in case
      probe-rs-tools
      pkg-config
      wireshark
      inetutils
      # dig
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
      nilPkg
      wezterm
      # notion
    ]
  );
}
