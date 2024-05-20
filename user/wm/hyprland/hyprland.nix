{ configs, lib, pkgs-unstable, userSettings, ... }:

{
    wayland.windowManager.hyprland.settings = {
    };

    home.packages =
        with pkgs-unstable; [
            dunst
            libnotify
        ];

    wayland.windowManager.hyprland.enable = true;
}
