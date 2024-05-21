{ config, inputs, pkgs, ... }:

{
    imports = [
        inputs.stylix.homeManagerModules.stylix
    ];

    stylix = {
        image = ../wm/hyprland/wallpaper.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        
        fonts = {
            serif = {
                package = pkgs.monocraft;
                name = "Monocraft";
            };
            
            sansSerif = {
                package = pkgs.monocraft;
                name = "Monocraft";
            };

            monospace = {
                package = pkgs.monocraft;
                name = "Monocraft";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };

            sizes = {
                terminal = 24;
                applications = 14;
                desktop = 14;
                popups = 18;
            };

        };

        targets.foot.enable = true;

        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 32;
        };
    };
}
