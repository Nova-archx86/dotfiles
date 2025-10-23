{ config, lib, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    settings = {
      group = "syncthing";
      user = "nova";
      configDir = "/home/nova/.config/syncthing";
      dataDir = "/home/nova/Sync";
      gui.theme = "black";
    };
       overrideDevices = true;
    overrideFolders = true;
  };
}
