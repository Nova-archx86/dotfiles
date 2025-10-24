{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      background-color = "#5e81ac";
      border-color = "#88c0d0";
    };
  };
}
