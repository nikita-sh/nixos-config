{
  self,
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    settings = {
      download-buffer-size = "100000000";
      trusted-users = [ "nikita" ];
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
      netrc-file = /etc/netrc
    '';
    buildMachines = [
      {
        hostName = "nixbuild.vital.company";
        system = "x86_64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        sshKey = "/home/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
      {
        hostName = "nixbuild.vital.company";
        system = "aarch64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        sshKey = "/home/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
      {
        hostName = "hydra-aarch64.vital.company";
        system = "aarch64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        # sshKey = "/home/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
      {
        hostName = "hydra-x86-64.vital.company";
        system = "x86_64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        # sshKey = "/home/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    nil
    vim
    # TODO: lazy - add this to an overlay in home-manager
    unstable.claude-code
  ];

  environment.etc = {
    "netrc" = {
      text = ''
        machine hydra.vital.company
          login nikita
          password DUMMY
      '';
      mode = "0600";
    };
  };

  nixpkgs.overlays = [
    (final: _: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (final) config;
      };
    })
  ];

  nixpkgs.config.allowUnfree = true;

  users = {
    users = {
      nikita = {
        isNormalUser = true;
        extraGroups = ["wheel" "dialout"];
        shell = pkgs.zsh;
      };
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.05";

  programs.ssh = {
    extraConfig = ''
      Host hydra-x8664
        Hostname hydra-x8664
        User nikita
        ForwardAgent yes
        IdentityFile /home/nikita/.ssh/id_ed25519

      Host hydra-aarch64
        Hostname hydra-aarch64
        User nikita
        ForwardAgent yes
        IdentityFile /home/nikita/.ssh/id_ed25519

      Host hydra-x86-64.vital.company
        Hostname hydra-x86-64.vital.company
        User nikita
        ForwardAgent yes
        IdentityFile /home/nikita/.ssh/id_ed25519

      Host hydra-aarch64.vital.company
        Hostname hydra-aarch64.vital.company
        User nikita
        ForwardAgent yes
        IdentityFile /home/nikita/.ssh/id_ed25519

      Host nixbuild.vital.company
        Port 2222
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
        IPQoS throughput
        IdentityFile /home/nikita/.ssh/id_ed25519
    '';

    knownHosts = {
      nixbuild = {
        hostNames = [ "nixbuild.vital.company" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+jBIzENqxs/p7dFEAIjG8e5TT+A9Gvhi1cKNdIJ9vW";
      };
    };
  };
}
