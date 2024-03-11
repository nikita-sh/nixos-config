{inputs, username, ...}: {
  imports =
    [(import ./bat)]
    ++ [(import ./btop)]
    ++ [(import ./cava)]
    ++ [(import ./discord)]         # discord with catppuccin theme
    ++ [(import ./floorp)]          # firefox based browser
    ++ [(import ./gaming)]
    ++ [(import ./git)]
    ++ [(import ./gtk)]
    ++ [(import ./hyprland)]
    ++ [(import ./kitty)]
    ++ [(import ./mako)]            # notification deamon
    ++ [(import ./micro)]           # nano replacement
    ++ [(import ./nvim)]
    ++ [(import ./package)]
    ++ [(import ./scripts)]         # personal scripts
    ++ [(import ./slack)]
    # ++ [(import ./starship)]
    ++ [(import ./swaylock)]
    ++ [(import ./waybar)]
    ++ [(import ./wofi)]
    ++ [(import ./zsh)];
}
