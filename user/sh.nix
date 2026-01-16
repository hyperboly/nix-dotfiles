{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    mux = "tmuxifier";
  };
in {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = myAliases;
      sessionVariables = {};
      bashrcExtra = ''
        PROMPT_COMMAND='PS1_CMD1=''$(git branch --show-current 2>/dev/null)'
        PS1='\[\e[95m\]\w\[\e[0m\] \[\e[92m\]''${PS1_CMD1}\[\e[96m\]->\[\e[0m\] '

        if command -v Hyprland
        then
          if uwsm check may-start && uwsm select; then
            exec uwsm start default > /dev/null
          fi
        fi

        eval "$(direnv hook bash)"
        eval "$(tmuxifier init -)"
      '';
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
