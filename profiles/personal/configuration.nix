{ config, lib, pkgs, systemSettings, userSettings, ... }:

{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/grub.nix
        ../../system/audio.nix
        ../../system/kern.nix
        ../../system/zfs.nix
        ../../system/displaymanager/sddm.nix
        ../../system/impermanence.nix
        ../../system/neovim.nix
        ../../system/locale.nix
        ../../system/users.nix
        (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = systemSettings.hostname;
    networking.networkmanager.enable = true;

    time.timeZone = systemSettings.timezone;
    fonts.fontDir.enable = true;

    # System package
    environment.systemPackages = with pkgs; [
        wget
        curl
        zsh
        git
        home-manager
        cryptsetup
        nvtopPackages.full
        btop
        power-profiles-daemon
        smartmontools
        fprintd
        killall
        sddm-chili-theme
        fd
        sanoid
        mangohud
    ];

    #
    # Services
    #

    services.fprintd.enable = true;
    services.tailscale = {
        enable = true;
        package = pkgs.tailscale;
        useRoutingFeatures = "client";
        extraUpFlags = "--accept-routes";
    };

    services.libinput.enable = true;
    services.xserver.desktopManager.runXdgAutostartIfNone = true;

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    #
    # Environment programs
    #

    #environment.shells = with pkgs; [ zsh ];
    #users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    programs.adb.enable = true;

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    hardware.opengl.driSupport32Bit = true;

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

    system.stateVersion = "23.11";
}
