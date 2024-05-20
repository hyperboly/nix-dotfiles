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
        with pkgs; [
            firefox
            steam
            foot
            keepassxc
            syncthing
            git
            gcc
            signal-desktop
            monocraft
            discord
            neovim
            tree-sitter
            lua-language-server
            zsh
            swww
            rofi-wayland
            dunst
            libnotify
            waybar
        ];


    home.file = {
    };

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        BROWSER = userSettings.browser;
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
