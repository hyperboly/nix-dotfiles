{ inputs, configs, pkgs, pkgs-unstable, userSettings, ... }:

{
  imports = [
    #./hypridle.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = false;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    settings = {
      autogenerated = 0;

      debug = {
        disable_logs = false;
      };

      monitor = [
        "eDP-1,2560x1600@165,0x0,1"
        "DP-2,1920x1080@60,2560x0,1"
      ];

      env = [
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];

      exec-once = [
        "uwsm-app -- foot -s"
        "uwsm-app -- fcitx5"
        "uwsm-app -- dunst"
        "[workspace 2;centerwindow] uwsm-app -- firefox -p"
        "uwsm-app -- lxqt-policykit-agent"
        "systemctl --user start hypridle"
        "uwsm-app -- gotify-desktop"
      ];

      exec = [
        "uwsm-app -- swww-daemon & swww img ~/.dotfiles/user/wm/hyprland/wallpaper.jpg --transition-type any"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = "1";
        accel_profile = "flat";
        touchpad = {
          natural_scroll = "true";
        };
      };

      general = {
        gaps_in = "3";
        gaps_out = "0";
        border_size = "0";

        layout = "dwindle";
      };

      decoration = {
        rounding = "2";
        #rounding = "15";

        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
          new_optimizations = "true";
        };
      };

      animations = {
        enabled = "false";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 6, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 3, default"
          "workspaces, 1, 5, default"
          "specialWorkspace, 1, 4, myBezier, slidevert"
        ];
      };

      dwindle = {
        pseudotile = "true";

        preserve_split = "true";
        default_split_ratio = "1.1";

        special_scale_factor = "0.7";
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_distance = "2560";
        workspace_swipe_fingers = "3";
        workspace_swipe_cancel_ratio = "0.2";
        workspace_swipe_min_speed_to_force = "5";
        workspace_swipe_create_new = "false";
      };

      misc = {
        mouse_move_enables_dpms = "true";
        key_press_enables_dpms = "true";
        enable_swallow = "true";
        swallow_regex = "^(foot)$";
        focus_on_activate = "true";
        vfr = "true";
        close_special_on_empty = "true";
        disable_hyprland_logo = "true";
        force_default_wallpaper = "0";
      };

      binds = {
        allow_workspace_cycles = "true";
      };

      windowrule = [
        "fullscreen, ^(Discord)$"
        "opacity 0.92 override 0.7 override, ^(foot)$"
        "float,title:^(swayimg)(.*)$"
        "float,title:^(Open File)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$"
        "float,title:^(Firefox - Choose User Profile:)$"
      ];

      windowrulev2 = [
        "workspace 4 silent, class:^(Discord)$"
        "workspace 10 silent, class:^(org.keepassxc.KeePassXC)$"
        "noborder, floating:1"
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"
      ];

      workspace = [
        "2,monitor:DP-2"
        "3,monitor:DP-2"
        "5,monitor:DP-2"
        "6,monitor:DP-2"
        "7,monitor:DP-2"
        "1,monitor:eDP-1"
        "4,monitor:eDP-1"
        "8,monitor:eDP-1"
        "9,monitor:eDP-1"
        "10,monitor:eDP-1"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, T, exec, uwsm-app -- foot"
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, Q, uwsm stop"
        "$mainMod, E, exec, uwsm-app -- nemo"
        "$mainMod, M, exec, [workspace 8 silent] feishin"
        "$mainMod, V, togglefloating"
        "$mainMod, D, exec, fuzzel --launch-prefix='uwsm app -- '"
        "$mainMod, P, pseudo"
        "$mainMod, S, togglesplit"
        "$mainMod, F, fullscreen"

        #Apps
        "$mainMod SHIFT, F, exec, [centerwindow] uwsm-app -- firefox -p"
        "$mainMod SHIFT, D, exec, uwsm-app -- vesktop --ozone-platform=wayland"
        ''$mainMod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -''
        "$mainMod SHIFT, P, exec, uwsm-app -- keepassxc"

        # Scripts
        "$mainMod, grave, exec, uwsm-app -- dunstctl history-pop"
        "$mainMod, F12, exec, ~/.dotfiles/user/wm/hyprland/scripts/show-stats.sh"
        "$mainMod, F11, exec, ~/.dotfiles/user/wm/hyprland/scripts/show-time.sh"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Special workspace
        "$mainMod SHIFT, C, exec, [workspace special silent] uwsm -- foot"
        "$mainMod CTRL, C, movetoworkspace, special"
        "$mainMod, C, togglespecialworkspace"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, n, workspace, e+1"
        "$mainMod, b, workspace, e-1"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, TAB, workspace, previous"

        "SUPER,F1,exec,hyprlock"

        "$mainMod CTRL, z, exec,hyprctl keyword misc:cursor_zoom_factor 1"
        "$mainMod SHIFT, z, exec,hyprctl keyword misc:cursor_zoom_factor 1.5"
      ];

      binde = [
        "$mainMod CTRL, H, resizeactive, -50 0"
        "$mainMod CTRL, L, resizeactive, 50 0"
        "$mainMod CTRL, K, resizeactive, 0 -50"
        "$mainMod CTRL, J, resizeactive, 0 50"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindle = [
        ",XF86AudioRaiseVolume, exec,pamixer -i 5"
        ",XF86AudioLowerVolume, exec,pamixer -d 5"
        ",XF86AudioMute, exec,pamixer -t"

        ",XF86MonBrightnessUp, exec,brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec,brightnessctl set 5%-"
      ];

      bindl = [
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioNext, exec, playerctl next"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";         # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r";         # set monitor backlight to minimum, avoid 0 on OLED monitor.
        }
        {
          timeout = 150;
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "brightnessctl -rd rgb:kbd_backlight";        # turn on keyboard backlight.
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
        }
        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";        # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on";          # screen on when activity is detected after timeout has fired.
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";                # suspend pc
        }
      ];
    };
  };
}
