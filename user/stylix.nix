{ config, lib, inputs, pkgs, ... }:

# let
#   windowsXpLuna = pkgs.callPackage ./pkgs/b00merang-project/windows-luna-theme.nix {};
# in
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./wm/wallpapers/bliss.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "dark";
    overlays.enable = false;
    targets = {
    #   gtk.enable = false;
      vim.enable = false;
      qt.platform = "wayland;xcb";
    };

    # Disable neovim (conflicts)
    # targets.kubecolor.enable = false;
    # targets.btop.enable = true;

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
        package = pkgs.nerd-fonts.symbols-only;
        name = "Symbols Nerd Font";
      };

      sizes = {
        terminal = 12;
        applications = 15;
        desktop = 15;
        popups = 18;
      };

    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Windows XP Luna";
  #     package = windowsXpLuna;
  #   };
  # };
  # qt = {
  #   enable = true;
  #   style.name = "adwaita-dark";
  #   platformTheme.name = "wayland;xcb"; # This set the QT_QPA_PLATFORMTHEME
  # };
}
