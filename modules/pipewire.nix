{ config, lib, pkgs, ... }:

{
 pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
   jack.enable = true;
 };
}
