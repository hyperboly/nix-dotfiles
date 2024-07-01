{ config, pkgs-unstable, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs-unstable.neovim-unwrapped;

        extraPackages = with pkgs-unstable; [
            gnumake
            unzip
            nodePackages_latest.nodejs
            cargo
        ];

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };
}
