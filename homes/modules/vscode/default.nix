{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
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
        jdinhlife.gruvbox
        catppuccin.catppuccin-vsc
        sainnhe.gruvbox-material
        github.copilot
        ms-python.vscode-pylance
        twxs.cmake
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        ms-vscode.cpptools-extension-pack
        # raspberry-pi.raspberry-pi-pico # doesnt exist yet
      ];
      userSettings = {
        "editor.fontFamily" = "'FiraCode Nerd Font', Menlo, Monaco, 'Courier New', monospace";
        "editor.fontSize" = 13;
        "editor.fontLigatures" = true;
        "git.openRepositoryInParentFolders" = "always";
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "workbench.iconTheme" = "catppuccin-latte";
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
        "terminal.integrated.scrollback" = 10000;
        "editor.lineNumbers" = "relative";
        "rust-analyzer.cargo.features" = "all";
        "rust-analyzer.cargo.targetDir" = true;
        "rust-analyzer.check.command" = "clippy";
        "extensions.verifySignature" = false;
        "parallels-desktop.extension.path" = "/Users/nikita/.parallels-desktop-vscode";
      };
    };
    
  };
}
