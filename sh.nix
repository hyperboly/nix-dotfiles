{ config, pkgs, ... }
let
    myAliases = {
        ll = "ls -l";
    };
in {
    programs.zsh = {
        enable = true;
        shellAliases = myAliases;
    };
}
