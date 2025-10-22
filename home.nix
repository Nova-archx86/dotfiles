{ config, pkgs, ... }:

{
  imports = [
    ./modules/git.nix
    ./modules/gh.nix
    ./modules/zsh.nix
    ./modules/gpg.nix
    ./modules/syncthing.nix
    ./modules/pipewire.nix
    ./modules/hyprland.nix
  ];

  home.username = "nova";
  home.homeDirectory = "/home/nova";
  home.stateVersion = "18.09";

  home.packages = with pkgs; [
    zsh
    bat
    lsd
    spotify
    discord-canary
    telegram-desktop
    betterdiscordctl
    gh
    pika-backup
    keepassxc
    syncthing
    emacs
    hyprpaper
    librewolf
    #steam
  ];
 # bar
 programs.waybar.enable = true;



}
