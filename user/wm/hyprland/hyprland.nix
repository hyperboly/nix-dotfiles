{ inputs, configs, pkgs-unstable, userSettings, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs-unstable.system}.hyprland;
        settings = {
            monitor = [
                "eDP-1,2560x1600@165,0x0,1"
                "HDMI-A-1,1920x1080@60,1920x0,1"
            ];
        };
    };
}
