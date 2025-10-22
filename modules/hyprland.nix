{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      cursor {
        no_hardware_cursors = true
      }

      animations {
          enabled = true
      }
      general {
          gaps_in = "5"
          gaps_out = "10"

          border_size = "3"

          "col.active_border" = "rgb(5e81ac)"
          "col.inactive_border" = "rgb(81a1c1)"

          resize_on_border = true

          layout = "dwindle"

          allow_tearing = false
      }

      decoration {
          rounding = "8"

          active_opacity = "1.0"
          inactive_opacity = "1.0"

          "shadow:enabled" = true
          "shadow:range" = 2
          "shadow:render_power" = 5
          "shadow:sharp" = false
          "shadow:color" = rgba(0,0,0,0.85)
          "shadow:ignore_window" = true
          "shadow:offset" = 2 2
          "shadow:scale" = 1
          "blur:enabled" = true
      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_status = master
      }

      # We have our own wallpapers :) So I'll disable default things.
      misc {
          force_default_wallpaper = 0
          disable_hyprland_logo = true
      }


      "$mainMod" = "ALT"

      bind = "$mainMod, Return, exec, $terminal"
      bind = "$mainMod, Q, killactive,"
      bind = "$mainMod SHIFT, S, exec, hyprshot --mode region --output-folder /tmp"
      bind = "$mainMod, E, exec, $fileManager"
      bind = "$mainMod, F, fullscreen"
      bind = "$mainMod, D, exec, $menu"
      bind = "$mainMod, L, exec, hyprlock"
      bind = "$mainMod SHIFT, e, exec, emacsclient -c"
      bind = "$mainMod SHIFT, c, exec, hyprctl dispatch exit"

      bind = "$mainMod, 1, workspace, 1"
      bind = "$mainMod, 2, workspace, 2"
      bind = "$mainMod, 3, workspace, 3"
      bind = "$mainMod, 4, workspace, 4"
      bind = "$mainMod, 5, workspace, 5"
      bind = "$mainMod, 6, workspace, 6"
      bind = "$mainMod, 7, workspace, 7"
      bind = "$mainMod, 8, workspace, 8"
      bind = "$mainMod, 9, workspace, 9"
      bind = "$mainMod, 0, workspace, 10"

      # Move a focused window to a workspace with mainMod + SHIFT + [0-9]
      bind = "$mainMod SHIFT, 1, movetoworkspace, 1"
      bind = "$mainMod SHIFT, 2, movetoworkspace, 2"
      bind = "$mainMod SHIFT, 3, movetoworkspace, 3"
      bind = "$mainMod SHIFT, 4, movetoworkspace, 4"
      bind = "$mainMod SHIFT, 5, movetoworkspace, 5"
      bind = "$mainMod SHIFT, 6, movetoworkspace, 6"
      bind = "$mainMod SHIFT, 7, movetoworkspace, 7"
      bind = "$mainMod SHIFT, 8, movetoworkspace, 8"
      bind = "$mainMod SHIFT, 9, movetoworkspace, 9"
      bind = "$mainMod SHIFT, 0, movetoworkspace, 10"

      bindm = "$mainMod, mouse:272, movewindow"
      bindm = "$mainMod, mouse:273, resizewindow"

      bindel = ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      bindel = ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      bindel = ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      bindel = ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      bindel = ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      bindel = ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"

      # Fix dragging issues with XWayland
      windowrulev2 = "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    };
  };
}
