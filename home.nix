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

  programs.git = {
    enable = true;

    userEmail = "moorcode66@yahoo.com";
    userName = "Nova-archx86";

    signing = {
      key = "moorcode66@yahoo.com";
      signByDefault = true;
    };

  };

}
