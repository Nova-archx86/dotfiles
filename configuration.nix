# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.nova = import ./home.nix;

  networking.hostName = "LT-Ceasium"; # Define your hostname.
  networking.wireless.iwd.enable = true;
  #networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command"  "flakes" ];

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    font-awesome
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nova = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nova";
    extraGroups = [ "networkmanager" "wheel" "syncthing" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware = {
    graphics.enable = true;
  };

  # WM
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;

  # Bar
  programs.waybar.enable = true;

  # Hint to electron to use wayland over xwayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    vim
    git
    libnotify
    kitty
    mako
    wofi
    pcmanfm
    iwd
    ripgrep
    fd
    cmake
    gnumake
    gcc
    libvterm
    libtool
    brightnessctl
    nh
    gvfs
  ];
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 

  security = {
    rtkit.enable = true;
    doas.enable = true;
    firewall.enable = true;
    gpg.enable = true;
    sshd.enable = false;
  };

  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  services = {
    openssh.enable = false;
    printing.enable = true;
    hypridle.enable = true;
    gvfs.enable = true;
    xserver.xkb = { layout = "us"; variant = ""; };

    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    syncthing = {
      enable = true;
      group = "syncthing";
      user = "nova";
      configDir = "/home/nova/.config/syncthing";
      dataDir = "/home/nova/Sync";
      overrideDevices = true;
      overrideFolders = true;
    };

  };

  # Clean up old pkgs automatically
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true; 
  
  system.stateVersion = "24.11";

}
