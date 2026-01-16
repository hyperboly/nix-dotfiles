{ config, lib, pkgs, systemSettings, userSettings, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    # ../../system/grub.nix
    ../../system/audio.nix
    ../../system/networking.nix
    ../../system/kern.nix
    ../../system/zfs.nix
    ../../system/impermanence.nix
    ../../system/neovim.nix
    ../../system/locale.nix
    ../../system/users.nix
    ../../system/containers.nix
    ../../system/peripherals/keyd.nix
    ../../system/wm/${userSettings.wm}.nix
    ../../system/displaymanager/tuigreet.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = systemSettings.timezone;
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      wqy_zenhei
    ];
    fontconfig.enable = true;
  };

  # System package
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    home-manager
    cryptsetup
    nvtopPackages.full
    power-profiles-daemon
    smartmontools
    fprintd
    killall
    fd
    sanoid
    mangohud
    libinput

    android-tools
    android-udev-rules
    lutris
    man-pages
    man-pages-posix

    sbctl

    # for niri
    xwayland-satellite
  ];

  documentation.dev.enable = true;

  #
  # Services
  #

  services.fprintd.enable = true;
  services.fprintd.tod.enable = false;
  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
    useRoutingFeatures = "client";
    extraUpFlags = "--accept-routes --accept-dns";
  };

  services.libinput.enable = true;
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # KDE/xfce
  # services.desktopManager.plasma6.enable = true;
  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   plasma-browser-integration
  #   elisa
  #   xwaylandvideobridge
  # ];
  #
  # services.xserver = {
  #   enable = true;
  #   autorun = false;
  #   displayManager.startx.enable = true;
  #   desktopManager = {
  #     xterm.enable = false;
  #     xfce.enable = true;
  #   };
  # };


  #
  # Environment programs
  #

  programs.htop.enable = true;

  programs.adb.enable = true;

  programs.dconf.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    #fontPackages = with pkgs; [
    #  wqy_zenhei
    #];
  };
  programs.gamemode.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${userSettings.username}/.dotfiles";
  };

  environment.extraInit = ''
        unset -v SSH_ASKPASS
  '';


  services.smartd.enable = true;

  services.power-profiles-daemon.enable = true;

  services.fwupd.enable = true;

  services.logind = {
    powerKey = "hibernate";
    powerKeyLongPress = "poweroff";
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
  };

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 30;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/76d3da1e-e86e-4025-b00a-2b8a8cc0f682";
      preLVM = true;
    };
  };

  system.stateVersion = "23.11";
}
