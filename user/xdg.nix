{ config, lib, ... }:

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
            "inode/directory" = "yazi.desktop";
            "inode/mount-point" = "yazi.desktop";
        };
        mimeApps.enable = true;
    };
}
