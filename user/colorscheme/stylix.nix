{ config, lib, inputs, pkgs, ... }:

{
    imports = [
        inputs.stylix.homeManagerModules.stylix
    ];

    stylix = {
        enable = true;
        image = ../wm/hyprland/wallpaper.jpg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        
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
                terminal = 20;
                applications = 14;
                desktop = 14;
                popups = 18;
            };

        };

        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 32;
        };
    };

    gtk = {
        enable = true;
        theme.name = lib.mkDefault "Adwaita-Dark";

        iconTheme.name = lib.mkDefault "Adwaita-Dark";
    };

    qt = {
        enable = true;
        style.name = "Adwaita-Dark";
        style.package = pkgs.adwaita-qt;
        platformTheme.name = "qtct";
    };
}
