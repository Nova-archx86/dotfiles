{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      default-time-out = 15;
      background-color = "#5e81ac";
      border-color = "#81a1c1";
    };
  };
}
