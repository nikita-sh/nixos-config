{ ... }:
{
  _module.args.hostname = "kolibri";
  imports = [
    ./bat
    ./lsd
    ./btop
    ./direnv
    ./git
    ../../shared/nvim
    ./package
    ./zsh
    ./vscode-server
  ];
}
