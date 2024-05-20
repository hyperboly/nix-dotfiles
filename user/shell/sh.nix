{ config, pkgs, ... }:

let
    myAliases = {
        ll = "ls -l";
    };
in {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
        history.path = "${config.xdg.dataHome}/zsh/history";
    };
}
