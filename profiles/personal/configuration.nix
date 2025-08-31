{ config, lib, pkgs, systemSettings, userSettings, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    # ../../system/grub.nix
    ../../system/audio.nix
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

  networking.hostName = systemSettings.hostname;
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  networking.nameservers = [ "100.100.100.100" ];
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

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
    zsh
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
    virtiofsd

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

  # KDE
  services.desktopManager.plasma6.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker = {
    # Consider disabling the system wide Docker daemon
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
        dns = [ "1.1.1.1" "8.8.8.8" ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };

  #
  # Environment programs
  #

  #environment.shells = with pkgs; [ zsh ];
  #users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.htop.enable = true;

  programs.adb.enable = true;

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
  networking.hostId = "eb3b649e";
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/76d3da1e-e86e-4025-b00a-2b8a8cc0f682";
      preLVM = true;
    };
  };

  system.stateVersion = "23.11";
}
