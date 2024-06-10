{ inputs, username, ... }: {
  # imports = [ (import ./bat) ] ++ [ (import ./lsd) ] ++ [ (import ./btop) ]
  #   ++ [ (import ./cava) ] ++ [ (import ./chatgpt-cli) ] ++ [
  #     (import ./discord)
  #   ] # discord with catppuccin theme
  #   ++ [ (import ./gaming) ] ++ [ (import ./git) ] ++ [ (import ./gtk) ]
  #   ++ [ (import ./hyprland) ] ++ [ (import ./kitty) ]
  #   ++ [ (import ./mako) ] # notification deamon
  #   ++ [ (import ./micro) ] # nano replacement
  #   ++ [ (import ./nvim) ] ++ [ (import ./package) ]
  #   ++ [ (import ./taskwarrior) ] ++ [ (import ./scripts) ] # personal scripts
  #   ++ [
  #     (import ./slack)
  #   ]
  #   ++ [ (import ./swaylock) ] ++ [ (import ./waybar) ] ++ [ (import ./wofi) ]
  #   ++ [ (import ./spicetify) ] ++ [ (import ./zsh) ];

  imports = [
    ./bat 
    ./lsd 
    ./btop 
    ./cava 
    ./chatgpt-cli 
    ./discord 
    ./gaming 
    ./git 
    ./gtk 
    ./hyprland 
    ./kitty 
    ./mako 
    ./micro 
    ./nvim 
    ./package 
    ./taskwarrior 
    ./scripts 
    ./slack 
    ./swaylock 
    ./waybar 
    ./wofi 
    ./spicetify 
    ./zsh
    ./obsidian
  ];
}
