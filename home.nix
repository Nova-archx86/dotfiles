{ config, pkgs, ... }:

{
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
    #steam
  ];

  # wm
  programs.hyprland.enable = true;

  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''
      export PROMPT="%F{cyan} %3~%f"$'\n'" λ " 
    '';
  };

  programs.hyprpaper = {
    enable = true;

  };

  programs.git.settings = {
    enable = true;

    user.email = "moorcode66@yahoo.com";
    user.name = "Nova-archx86";

    user.signing = {
      key = "moorcode66@yahoo.com";
      signByDefault = true;
    };

  };

}
