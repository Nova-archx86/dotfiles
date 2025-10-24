{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = "/home/nova/.config/waybar/style.css";
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "clock" ];
        modules-center = [ "idle_inhibitor" "hyprland/workspaces"];
        modules-right = [ "pulseaudio" "network" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "󰖟";
            "3" = "󰭹";
            "4" = "";
            "5" = "󰮂";
          };
          sort-by-number = true;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = true;
        };

        "tray" = { spacing = 5; };

        "clock" = {
          format = "  {:%H:%M    %e %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          today-format = "<b>{}</b>";
        };

        "network" = {
          format-wifi = " {essid}";
          format-ethernet = " {ipaddr}/{cidr}";
          format-linked = " {ifname}: (No IP)";
          format-disconnected = "{ifname}: ";
          family = "ipv4";
        };

        "pulseaudio" = {
          scroll-step = 3;
          format = "{icon} {volume}% {format_source}";
          format-muted = "";
          format-source = "";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            default = ["" "" ""];
          };
        };
        
      };
    };
  };
}

    
