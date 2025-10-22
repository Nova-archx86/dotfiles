{ config, lib, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    group = "syncthing";
    user = "nova";
    configDir = "/home/nova/.config/syncthing";
    dataDir = "/home/nova/Sync";
    overrideDevices = true;
    overrideFolders = true;
  };
}
