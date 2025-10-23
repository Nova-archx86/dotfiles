{ config, lib, pkgs, ... }:

{
   programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initContent = ''
      export PROMPT="%F{cyan} %3~%f"$'\n'" λ "
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --impure --flake /home/nova/dotfiles/";
    };
  };

}
