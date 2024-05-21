{ config, pkgs, ... }:

let
    myAliases = {
        ll = "ls -l";
    };
in {
    programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
        initExtra = ''
        PROMPT_COMMAND='PS1_CMD1=''$(git branch --show-current 2>/dev/null)'
        PS1='\[\e[95m\]\w\[\e[0m\] \[\e[92m\]''${PS1_CMD1}\[\e[96m\]->\[\e[0m\] '
        '';
    };

    #programs.zsh = {
    #    enable = true;
    #    enableCompletion = true;
    #    shellAliases = myAliases;
    #    history.path = "${config.xdg.dataHome}/zsh/history";
    #    #autosuggestion.enable = true;

    #    initExtra = ''
    #        bindkey "\e[1;5C" forward-word
    #        bindkey "\e[1;5D" backward-word
    #    '';
    #};
}
