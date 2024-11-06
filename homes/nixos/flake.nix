{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nur.url = "github:nix-community/NUR";
    # hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    # alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim
    neovim-flake.url = "github:nikita-sh/neovim-flake";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    inputs@{
      self,
      neovim-flake,
      home-manager,
      nixpkgs,
      spicetify-nix,
      ...
    }:
    let
      configModule = {
        config.vim = {
          theme = {
            enable = true;
            style = "dark";
            name = "gruvbox";
          };
          autocomplete = {
            enable = true;
          };
          languages = {
            terraform = {
              enable = true;
              treesitter.enable = true;
            };
            haskell = {
              enable = true;
              treesitter.enable = true;
              lsp.enable = true;
            };
            nix = {
              enable = true;
              extraDiagnostics.enable = true;
              format.enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            rust = {
              enable = true;
              crates = {
                enable = true;
                codeActions = true;
              };
              debugger.enable = true;
              lsp.enable = true;
            };
            sql.enable = true;
            ts.enable = true;
            python = {
              enable = true;
              format.enable = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            markdown.enable = true;
          };
          filetree = {
            nvimTreeLua = {
              enable = true;
              openTreeOnNewTab = true;
              disableNetRW = true;
            };
          };
          git = {
            enable = true;
            gitsigns.enable = true;
          };
          telescope = {
            enable = true;
          };
          autopairs = {
            enable = true;
          };
          statusline = {
            lualine = {
              enable = true;
            };
          };
          visuals = {
            enable = true;
            cursorWordline.enable = true;
            indentBlankline = {
              enable = true;
              eolChar = null;
              fillChar = null;
            };
          };
        };
      };
      pkgs = nixpkgs.legacyPackages.${"x86_64-linux"};
      customNeovim = neovim-flake.lib.neovimConfiguration {
        modules = [ configModule ];
        inherit pkgs;
      };

      system = "x86_64-linux";
    in
    {
      packages.${system}.neovim = customNeovim;

      homeConfigurations."nikita@nixos" = home-manager.lib.homeConfigurations {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ ../modules/default.nix ];
      };
    };
}
