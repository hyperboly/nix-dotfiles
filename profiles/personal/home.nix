{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        ./sh.nix
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
        ];


    home.file = {
    };

    home.sessionVariables = {
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
