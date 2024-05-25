{ config, ... }:

{
    services.xserver = {
        enable = true;
        displayManager.sddm = {
            enable = true;
            theme = "chili";
            settings = {
                general = {
                    background = ../../user/wm/hyprland/lockscreen.jpg;
                };

                theme = {
                    facesDir = ./faces;
                };
            };
        };
    };
}
