{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
        ../../user/shell/sh.nix
    ];

    fonts.fontconfig.enable = true;

    home.packages =
        (with pkgs-unstable; [ # Unstable
            foot
            neovim
            tree-sitter
            lua-language-server
            swww
            rofi-wayland
            dunst
            libnotify
            discord
            waybar
        ])
        ++
        (with pkgs; [ # Stable
            firefox
            steam
            keepassxc
            syncthing
            git
            gcc
            signal-desktop
            monocraft
        ]);

    home.pointerCursor.x11.enable = true;
    home.pointerCursor = {
        name = "mocha";
        package = pkgs.catppuccin-cursors;
        size = 32;
    };


    home.file = {
    };

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        BROWSER = userSettings.browser;
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
