{ pkgs, ... }:
{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.enableRedistributableFirmware = true;
  hardware.opengl.extraPackages = with pkgs; [

  ];
  powerManagement.cpuFreqGovernor = "performance";
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
