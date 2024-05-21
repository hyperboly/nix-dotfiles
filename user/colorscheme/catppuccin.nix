{ config, inputs, pkgs, ... }:

{
    imports = [ inputs.stylix.homeManagerModules.stylix ];

    stylix = {
        image = "../wm/hyprland/wallpaper.png";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        
        fonts = {
            serif = {
                package = pkgs.ubuntu_font_family;
                name = "Ubuntu Sans";
            };
            
            sansSerif = {
                package = pkgs.ubuntu_font_family;
                name = "Ubuntu Sans-serif";
            };

            monospace = {
                package = pkgs.monocraft;
                name = "Monocraft";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };
}
