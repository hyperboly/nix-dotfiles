{ config, pkgs, ... }:

{
    programs.mpv = {
        enable = true;
        scripts = [
            pkgs.mpvScripts.thumbfast
            pkgs.mpvScripts.mpv-webm
        ];
    };
}
