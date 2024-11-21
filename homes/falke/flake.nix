{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim
    neovim-flake.url = "github:nikita-sh/neovim-flake";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    inputs@{
      self,
      neovim-flake,
      home-manager,
      nixpkgs,
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
              # lsp.enable = true;
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
      pkgs = nixpkgs.legacyPackages.${"aarch64-darwin"};
      customNeovim = neovim-flake.lib.neovimConfiguration {
        modules = [ configModule ];
        inherit pkgs;
      };

      system = "aarch64-darwin";
    in
    {
      packages.${system}.neovim = customNeovim;
      homeConfigurations."nikita@falke" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ 
            {
                home = {
                  homeDirectory = "/Users/nikita";
                  stateVersion = "24.05";
                  username = "nikita";
                };
            }
            ../modules/bat
            ../modules/lsd
            ../modules/btop
            ../modules/direnv
            ../modules/git
            ../modules/kitty
            ../modules/nvim
            ../modules/package
            # ../modules/slack
            ../modules/zsh
            ../modules/obsidian
            ../modules/vscode
        ];
      };
    };
}
