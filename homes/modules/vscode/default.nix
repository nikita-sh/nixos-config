{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jdinhlife.gruvbox
      eamodio.gitlens
      github.vscode-pull-request-github
      hashicorp.terraform
      haskell.haskell
      jnoortheen.nix-ide
      mechatroner.rainbow-csv
      mhutchie.git-graph
      mkhl.direnv
      ms-python.python
      ms-vscode.makefile-tools
      ms-vscode.powershell
      ms-vscode-remote.remote-ssh
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      vscodevim.vim
      zxh404.vscode-proto3
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font', Menlo, Monaco, 'Courier New', monospace";
      "editor.fontSize" = 13;
      "editor.fontLigatures" = true;
      "git.openRepositoryInParentFolders" = "always";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "workbench.iconTheme" = "Monokai Classic Icons";
      "files.insertFinalNewline" = true;
      "files.trimFinalNewline" = true;
      "window.zoomLevel" = 0;
      "gitlens.ai.experimental.generateCommitMessage.enabled" = false;
      "gitlens.launchpad.indicator.enabled" = false;
      "gitlens.launchpad.indicator.polling.enabled" = false;
      "gitlens.plusFeatures.enabled" = false;
      "gitlens.showWelcomeOnInstall" = false;
      "gitlens.showWhatsNewAfterUpgrades" = false;
      "gitlens.telemetry.enabled" = false;
      "haskell.manageHLS" = "PATH";
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "nixfmt";
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [
              "nixfmt"
            ];
          };
        };
      };
      "search.useGlobalIgnoreFiles" = true;
      "search.useParentIgnoreFiles" = true;
      "telemetry.telemetryLevel" = "off";
      # "terminal.integrated.fontSize" = 10;
      "terminal.integrated.scrollback" = 10000;
      "editor.lineNumbers" = "relative";
      "rust-analyzer.cargo.features" = "all";
    };
  };
  # services.vscode-server = {
  #   enable = true;
  #   enableFHS = true;
  # };
}
