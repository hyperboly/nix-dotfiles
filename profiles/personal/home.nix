{ config, lib, pkgs, pkgs-unstable, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    #(./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
    ../../user/wm/${userSettings.wm}/${userSettings.wm}.nix
    #../../user/wm/niri/niri.nix
    ../../user/notifications/dunst.nix
    ../../user/sh.nix
    ../../user/stylix.nix
    ../../user/tmux.nix
    ../../user/mpv.nix
    ../../user/neovim/neovim.nix
    ../../user/git.nix
    ../../user/xdg.nix
    ../../user/yazi.nix
    ../../user/gotify-desktop.nix
    ../../user/keepassxc.nix
    ../../user/fcitx5.nix
    ../../user/ai303.nix
  ];

  #fonts.fontconfig.enable = true;

  home.packages =
    (with pkgs-unstable; [ # Unstable
      swww
      libnotify
      waybar
      grim
      slurp
      swappy
      swayimg
      monocraft
      #xdg-utils
      #xdg-desktop-portal
      #xdg-desktop-portal-gtk
      qbittorrent
      #jellyfin-media-player
      jellyfin-mpv-shim

      tree-sitter
      lua-language-server

      imagemagick
      yt-dlp

      thunderbird
      libreoffice-fresh
      vesktop
      firefox
    ])
    ++
    (with pkgs; [ # Stable
      keepassxc
      prismlauncher
      ardour
      syncthing
      git
      gcc
      signal-desktop
      monocraft
      wl-clipboard
      playerctl
      pamixer
      ffmpeg
      obs-studio
      nemo
      pulsemixer
      libsForQt5.qt5.qtwayland
      qt6.qtwayland
      adwaita-qt
      adw-gtk3
      adwaita-icon-theme
      lxqt.lxqt-policykit
      brightnessctl
      gimp
      ansible
      kdePackages.kdenlive
      hugo
      audacity
      python3
      helvum
      tmuxifier
      #nerd-fonts.symbols-only
      musescore
      gotify-desktop
      alsa-utils
      swayidle
      dragon-drop
      yabridge
      yabridgectl
      gwc
      noise-repellent
    ]);
    # ++
    # ([
    #   ( pkgs.callPackage ../../user/pkgs/eww-niri-workspaces/eww-niri-workspaces.nix {} )
    # ]);

  #
  # Services
  #

  services.syncthing.enable = true;
  services.kdeconnect.enable = true;

  #
  # Programs
  #

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
  programs.ripgrep = {
    enable = true;
    package = pkgs-unstable.ripgrep;
  };
  programs.foot.enable = true;
  programs.fuzzel = {
    enable = true;
    package = pkgs-unstable.fuzzel;
  };
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;
    settings = { color_theme = "stylix"; };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    BROWSER = userSettings.browser;
    QT_QPA_PLATFORM = "wayland";
    QT_IM_MODULE="fcitx";
    XMODIFIERS="@im=fcitx";
    NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
    MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
    WLR_RENDERER_ALLOW_SOFTWARE = "1"; # enable software rendering for wlroots
    WLR_NO_HARDWARE_CURSORS = "1"; # disable hardware cursors for wlroots
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
