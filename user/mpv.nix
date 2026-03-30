{ config, pkgs, ... }:

{
    programs.mpv = {
        enable = true;
        package = pkgs.mpv;
        scripts = [
            pkgs.mpvScripts.thumbfast
            pkgs.mpvScripts.mpv-webm
        ];
    };
}
