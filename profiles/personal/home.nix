{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        ./sh.nix
    ];

    home.packages = with pkgs; [
        firefox
        discord
        steam
        foot
        keepassxc
        syncthing
        git
        gcc
        neovim
        tree-sitter
        lua-language-server
        signal-desktop
        #userSettings.font
        #libsForQt5
    ];


    home.file = {
    };

    home.sessionVariables = {
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
