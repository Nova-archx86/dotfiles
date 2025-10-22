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
    librewolf
    #steam
  ];

  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initContent = ''
      export PROMPT="%F{cyan} %3~%f"$'\n'" λ " 
    '';
  };

  programs.git = {
    enable = true;
    userName = "Nova-archx86";
    userEmail = "moorcode66@yahoo.com";

    signing = {
      key = "moorcode66@yahoo.com";
      signByDefault = true;
    };

  };

  programs.gpg.enable = true;
  programs.gpg.publicKeys = [ { source = /home/nova/moorcode66.gpg; } ];
  services.gpg-agent.enable = true;
}

