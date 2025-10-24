{ config, lib, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      allow_markup = true;
    };
    style = ''
       * {
         font-family: 0xproto;
       }

       window {
         background-color: #4c566a;
         border-color: #81a1c1; 
       }
    '';
  };
}
