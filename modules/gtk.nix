{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.name = "Arc-Darker";
    theme.package = pkgs.arc-theme;
  };
}
