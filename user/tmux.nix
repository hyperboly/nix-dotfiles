{ config, ... }:

{
    programs.tmux = {
        enable = true;
        terminal = "xterm-256color";
        prefix = "C-f";
        extraConfig = ''
            set -g default-terminal "screen-256color"
            set -as terminal-features ",xterm-256color:RGB"
            set -g allow-passthrough on

            set -ga update-environment TERM
            set -ga update-environment TERM_PROGRAM
        '';
    };
}
