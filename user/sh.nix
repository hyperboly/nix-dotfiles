{ config, pkgs, ... }:

let
    myAliases = {
        ll = "ls -l";
        ssha = "eval `ssh-agent` ; ssh-add ~/.ssh/access-jumper";
        push2prod = "hugo --baseURL=https://blog.hyperboly.net/ ; rsync -avz --delete public/ hyperboly@10.100.30.102:/var/www/html";
        mux = "tmuxifier";
    };
in {
    programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
        sessionVariables = {};
        initExtra = ''
        eval "$(tmuxifier init -)"
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
