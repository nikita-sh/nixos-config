{ ... }:
{
  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
    pam.services.swaylock = {};
  };
}

