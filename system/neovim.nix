{ config, pkgs-unstable, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs-unstable.neovim-unwrapped;
        defaultEditor = true;
    };
}
