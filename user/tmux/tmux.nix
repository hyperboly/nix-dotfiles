{ config, ... }:

{
    programs.tmux = {
        enable = true;
        terminal = "xterm-256color";
        prefix = "C-f";
    };
}
