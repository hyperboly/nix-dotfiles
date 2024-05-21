{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
        (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
        ../../user/shell/sh.nix
        ../../user/colorscheme/catppuccin.nix
    ];

    fonts.fontconfig.enable = true;

    home.packages =
        (with pkgs-unstable; [ # Unstable
            # Hyprland
            foot
            swww
            rofi-wayland
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
            libsForQt5.qt5.qtwayland
            qt6.qtwayland
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
            steam
            discord
            keepassxc
            syncthing
            git
            gcc
            signal-desktop
            monocraft
            wl-clipboard
            playerctl
            pamixer
            catppuccin-cursors.mochaLavender
            mpv
            ffmpeg
            libreoffice-fresh
            obs-studio
        ]);

    services.syncthing.enable = true;

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

    home.pointerCursor = {
        name = "Catppuccin-Mocha-Lavender";
        package = pkgs.catppuccin-cursors;
        size = 32;
        gtk.enable = true;
    };

    gtk = {
        enable = true;

        cursorTheme = {
            package = pkgs.catppuccin-cursors;
            name = "Catppuccin-Mocha-Lavender";
            size = 32;
        };
    };

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        BROWSER = userSettings.browser;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
