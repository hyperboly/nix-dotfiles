{ inputs, configs, pkgs-unstable, userSettings, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs-unstable.system}.hyprland;
        settings = {
            autogenerate = 0;

            monitor = [
                "eDP-1,2560x1600@165,0x0,1"
                "HDMI-A-1,1920x1080@60,1920x0,1"
            ];
            
            env = [
            ];

            exec-once = [
                "foot -s"
                "fcitx5"
                "dunst"
                "[workspace 2] firefox -p"
            ];

            exec = [
                "swww init"
            ];

            input = {
                kb_layout = "us";
                follow_mouse = "1";
                touchpad = {
                    natural_scroll = "no";
                };
            };

            general = {
                gaps_in = "3";
                gaps_out = "0";
                border_size = "2";

                layout = "dwindle";
            };
            
            decoration = {
                rounding = "15";

                blur = {
                    enabled = "true";
                    size = "3";
                    passes = "1";
                    new_opimizations = "true";
                };

                drop_shadow = "true";
                show_range = "4";
                shadow_render_power = "3";
                "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = "true";
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                animation = [
                    "windows, 1, 6, myBezier"
                    "windowsOut, 1, 4, default, popin 80%"
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
                no_gaps_when_only = "1";

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
                "fullscreen, ^(discord)$"
                "opacity 0.92 override 0.7 override, ^(foot)$"
                "float,title:^(swayimg)(.*)$"
                "float,title:^(Open File)(.*)$"
                "float,title:^(Open Folder)(.*)$"
                "float,title:^(Save As)(.*)$"
                "float,title:^(Library)(.*)$"
                "float,title:^(Firefox - Choose User Profile)(.*)$"
            ];

            windowrulev2 = [
                "workspace 4 silent, class:^(discord)$"
                "workspace 10 silent, class:^(org.keepassxc.KeePassXC)$"
                "noborder, floating:1"
                "stayfocused, title:^()$,class:^(steam)$"
                "minsize 1 1, title:^()$,class:^(steam)$"
            ];

            workspace = [
                "2,monitor:HDMI-A-1"
                "3,monitor:HDMI-A-1"
                "5,monitor:HDMI-A-1"
                "6,monitor:HDMI-A-1"
                "7,monitor:HDMI-A-1"
                "1,monitor:eDP-1"
                "4,monitor:eDP-1"
                "8,monitor:eDP-1"
                "9,monitor:eDP-1"
                "10,monitor:eDP-1"
            ];

            "$mainMod" = "SUPER";

            bind = [
                "$mainMod, T, exec, foot"
                "$mainMod, Q, killactive"
                "$mainMod SHIFT, Q, exit"
                "$mainMod, E, exec, nemo"
                "$mainMod, M, exec, [workspace 8 silent] feishin"
                "$mainMod, V, togglefloating"
                "$mainMod, D, exec, rofi -show drun"
                "$mainMod, P, pseudo"
                "$mainMod, S, togglesplit"
                "$mainMod, F, fullscreen"

                "$mainMod SHIFT, F, exec, firefox -p"
                "$mainMod SHIFT, D, exec, discord"
                "$mainMod SHIFT, S, exec, grim -g "''$(slurp)''" - | swappy -f -"
                "$mainMod SHIFT, P, exec, keepassxc"

                "$mainMod, grave, exec, dunstctl history-pop"

                "$mainMod, H, movefocus, l"
                "$mainMod, L, movefocus, r"
                "$mainMod, K, movefocus, u"
                "$mainMod, J, movefocus, d"

                "$mainMod SHIFT, H, movewindow, l"
                "$mainMod SHIFT, L, movewindow, r"
                "$mainMod SHIFT, K, movewindow, u"
                "$mainMod SHIFT, J, movewindow, d"

                # Special workspace
                "$mainMod SHIFT, C, exec, [workspace special silent] foot"
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

                # OBS record
                "SUPER,F10,pass,^(com\.obsproject\.Studio)$"

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
}
