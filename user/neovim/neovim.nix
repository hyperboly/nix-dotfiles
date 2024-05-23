{ config, pkgs-unstable, ... }:

{
    programs.neovim = {
        enable = true;

        imports = [
            ./plugins.nix
        ];

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraLuaConfig = ''
            ${builtins.readFile ./luaconfs/init.lua}
            ${builtins.readFile ./luaconfs/init.lua}
        '';
    };
}
