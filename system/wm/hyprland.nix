{ inputs, pkgs, pkgs-unstable, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      #package = pkgs.hyprland;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
