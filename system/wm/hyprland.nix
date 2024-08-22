{ inputs, pkgs, pkgs-unstable, ... }:

{
    programs = {
        hyprland = {
            enable = true;
            #package = pkgs.hyprland;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        };
    };
}
