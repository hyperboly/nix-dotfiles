{ config, lib, pkgs, pkgs-unstable, userSettings, ... }:

{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
        ../../user/shell/sh.nix
        ../../user/colorscheme/stylix.nix
    ];

    #fonts.fontconfig.enable = true;

    home.packages =
        (with pkgs-unstable; [ # Unstable
            # Hyprland
            swww
            dunst
            libnotify
            waybar
            grim
            slurp
            hyprlock
            hypridle
            swappy
            swayimg
            monocraft
            xdg-utils
            xdg-desktop-portal
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland

            neovim
            tree-sitter
            lua-language-server
        ])
        ++
        (with pkgs; [ # Stable
            firefox
            vesktop
            steam
            keepassxc
            syncthing
            git
            gcc
            signal-desktop
            monocraft
            wl-clipboard
            playerctl
            pamixer
            mpv
            ffmpeg
            libreoffice-fresh
            obs-studio
            foot
            jellyfin-media-player
            cinnamon.nemo
            pulsemixer
            libsForQt5.qt5.qtwayland
            qt6.qtwayland
            qbittorrent-qt5
            adwaita-qt
            adw-gtk3
            gnome.adwaita-icon-theme
            lxqt.lxqt-policykit
            brightnessctl
        ]);

    services.syncthing.enable = true;

    programs.ripgrep = {
        enable = true;
        package = pkgs-unstable.ripgrep;
    };
    programs.foot.enable = true;
    programs.fuzzel = {
        enable = true;
        package = pkgs-unstable.fuzzel;
    };

    xdg.enable = true;
    xdg.userDirs = {
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
    xdg.mime.enable = true;
    xdg.mimeApps.enable = true;

    gtk = {
        enable = true;
        theme.name = lib.mkDefault "Adwaita-Dark";

        iconTheme.name = lib.mkDefault "Adwaita-Dark";
    };

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        BROWSER = userSettings.browser;
        QT_STYLE_OVERRIDE = "Adwaita-Dark";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt5ct";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
