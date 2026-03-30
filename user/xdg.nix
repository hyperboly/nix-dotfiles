{ config, pkgs, ... }:

{
    xdg = {
        enable = true;
        userDirs = {
            enable = true;
            createDirectories = true;
            music = "${config.home.homeDirectory}/Music";
            videos = "${config.home.homeDirectory}/Videos";
            pictures = "${config.home.homeDirectory}/Pictures";
            templates = "${config.home.homeDirectory}/Templates";
            download = "${config.home.homeDirectory}/Downloads";
            documents = "${config.home.homeDirectory}/Documents";
            publicShare = "${config.home.homeDirectory}/Public";
            desktop = null;
        };
        mime.enable = true;
        mimeApps.defaultApplications = {
            "application/pdf" = "org.pwmt.zathura.desktop";
            "image/png" = "swayimg.desktop";
            "image/jpeg" = "swayimg.desktop";
            "image/bmp" = "swayimg.desktop";
            "image/gif" = "swayimg.desktop";
            "inode/directory" = "nemo.desktop";
            "inode/mount-point" = "yazi.desktop";
            "video/mpeg" = "mpv.desktop";
            "video/mp4" = "mpv.desktop";
            "video/x-m4v" = "mpv.desktop";
            "video/avi" = "mpv.desktop";
            "video/x-msvideo" = "mpv.desktop";
            "video/ogg" = "mpv.desktop";
            "video/webm" = "mpv.desktop";
            "video/x-matroska" = "mpv.desktop";
            "audio/mpeg" = "mpv.desktop";
            "audio/x-mp3" = "mpv.desktop";
            "audio/x-flac" = "mpv.desktop";
            "audio/ogg" = "mpv.desktop";
            "audio/aac" = "mpv.desktop";
        };
        mimeApps.enable = true;
        desktopEntries = {
            ardour = {
                name = "Ardour (low latency)";
                genericName = "Digital Audio Workstation";
                comment = "Digital Audio Workstation";
                exec = "env PIPEWIRE_LATENCY=128/48000 ardour8 %F";
                icon = "ardour8";
                terminal = false;
                categories = [ "AudioVideo" "Audio" "Recorder" ];
                mimeType = [ "application/x-ardour" ];
            };

        };
    };
}
