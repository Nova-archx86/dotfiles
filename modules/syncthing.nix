{ config, lib, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    tray.enable = true;

    settings = { gui.theme = "black"; };

    overrideDevices = true;
    overrideFolders = true;
  };
}
