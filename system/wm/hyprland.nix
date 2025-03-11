{ inputs, pkgs, pkgs-unstable, ... }: let

  hyprland-input = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

in {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
    MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
    WLR_RENDERER_ALLOW_SOFTWARE = "1"; # enable software rendering for wlroots
    WLR_NO_HARDWARE_CURSORS = "1"; # disable hardware cursors for wlroots
  };

  hardware.opengl = {
    package = hyprland-input.mesa.drivers;

  };
    # if you also want 32-bit support (e.g for Steam)
  hardware.graphics.enable32Bit = true;
}
