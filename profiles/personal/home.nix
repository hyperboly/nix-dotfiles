{ config, lib, pkgs, pkgs-unstable, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    #(./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
    ../../user/wm/${userSettings.wm}/${userSettings.wm}.nix
    ../../user/notifications/dunst.nix
    ../../user/sh.nix
    ../../user/stylix.nix
    ../../user/tmux.nix
    ../../user/mpv.nix
    ../../user/neovim/neovim.nix
    ../../user/git.nix
    ../../user/xdg.nix
    ../../user/yazi.nix
  ];

  #fonts.fontconfig.enable = true;

  home.packages =
    (with pkgs-unstable; [ # Unstable
      # Hyprland
      swww
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
      qbittorrent
      alsa-utils

      tree-sitter
      lua-language-server

      imagemagick
      yt-dlp

      prismlauncher
      thunderbird
    ])
    ++
    (with pkgs; [ # Stable
      firefox
      vesktop
      keepassxc
      syncthing
      git
      gcc
      signal-desktop
      monocraft
      wl-clipboard
      playerctl
      pamixer
      ffmpeg
      libreoffice-fresh
      obs-studio
      foot
      jellyfin-media-player
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
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      musescore
    ]);

  #
  # Services
  #

  services.syncthing.enable = true;

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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
