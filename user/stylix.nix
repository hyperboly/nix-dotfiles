{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./wm/hyprland/wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    # Disable neovim (conflicts)
    targets.vim.enable = false;
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
}
