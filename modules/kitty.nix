{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "current-theme.conf"; # Usually set by kitty +kitten themes
    font.package = pkgs.nerd-fonts._0xproto;
    enableGitIntegration = true;

    settings = {
      background_opacity = 0.9;
    };
    
  };
}
