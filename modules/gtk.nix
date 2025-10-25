{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.name = "Arc-Darker";
    package = pkgs.arc-theme;
  };
}
