{ inputs, username, ... }: {
  imports = [ (import ./bat) ] ++ [ (import ./lsd) ] ++ [ (import ./btop) ]
    ++ [ (import ./cava) ] ++ [ (import ./chatgpt-cli) ] ++ [
      (import ./discord)
    ] # discord with catppuccin theme
    #     ++ [(import ./floorp)]          # firefox based browser
    ++ [ (import ./gaming) ] ++ [ (import ./git) ] ++ [ (import ./gtk) ]
    ++ [ (import ./hyprland) ] ++ [ (import ./kitty) ]
    ++ [ (import ./mako) ] # notification deamon
    ++ [ (import ./micro) ] # nano replacement
    ++ [ (import ./nvim) ] ++ [ (import ./package) ]
    ++ [ (import ./taskwarrior) ] ++ [ (import ./scripts) ] # personal scripts
    ++ [
      (import ./slack)
    ]
    # ++ [(import ./starship)]
    ++ [ (import ./swaylock) ] ++ [ (import ./waybar) ] ++ [ (import ./wofi) ]
    ++ [ (import ./spicetify) ] ++ [ (import ./zsh) ];
}
