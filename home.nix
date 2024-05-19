{ config, pkgs, ... }:

{
    home.username = "hyperboly";
    home.homeDirectory = "/home/hyperboly";

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        ./sh.nix
    ];

    home.packages = [
        pkgs.neovim
        pkgs.gcc
        pkgs.tree-sitter
        pkgs.lua-language-server
    ];

    home.file = {
    };

    home.sessionVariables = {
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

# Enable bash
#programs.bash.enable = true;
#programs.bash.shellAliases = {
#  ll = "ls -l";
#};
}
