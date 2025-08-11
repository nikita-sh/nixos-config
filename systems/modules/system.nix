{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      trusted-users = [ "nikita" ];
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    distributedBuilds = true;
    # https://github.com/nix-community/nix-direnv
    extraOptions = ''
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
    '';
    buildMachines = [
      {
        hostName = "nixbuild.vital.company";
        system = "x86_64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        sshKey = "/Users/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
      {
        hostName = "nixbuild.vital.company";
        system = "aarch64-linux";
        maxJobs = 64;
        speedFactor = 2;
        sshUser = "nikita";
        sshKey = "/Users/nikita/.ssh/id_ed25519";
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }
      {
        hostName = "hydra-aarch64.vital.company";
        sshUser = "nikita";
        sshKey = "/home/Users/.ssh/id_ed25519";
        system = "aarch64-linux";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = [
          "nixos-test"
          "benchmark"
          "big-parallel"
          "kvm"
        ];
        mandatoryFeatures = [ ];
      }
      {
        hostName = "hydra-x86-64.vital.company";
        sshUser = "nikita";
        sshKey = "/home/Users/.ssh/id_ed25519";
        system = "aarch64-linux";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = [
          "nixos-test"
          "benchmark"
          "big-parallel"
          "kvm"
        ];
        mandatoryFeatures = [ ];
      }
    ];
  };

  nixpkgs = {
    overlays = [
      self.overlays.default
      inputs.nur.overlay
    ];
  };

  programs.sssh.extraConfig = ''
Host *
  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  '';

  environment = {
    systemPackages = with pkgs; [
      wget
      git
      nil
    ];
    localBinInPath = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
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
        IdentityFile /Users/nikita/.ssh/id_ed25519

      Host hydra-aarch64
        Hostname hydra-aarch64
        User nikita
        ForwardAgent yes
        IdentityFile /Users/nikita/.ssh/id_ed25519

      Host hydra-x86-64.vital.company
        Hostname hydra-x86-64.vital.company
        User nikita
        ForwardAgent yes
        IdentityFile /Users/nikita/.ssh/id_ed25519

      Host hydra-aarch64.vital.company
        Hostname hydra-aarch64.vital.company
        User nikita
        ForwardAgent yes
        IdentityFile /Users/nikita/.ssh/id_ed25519

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
