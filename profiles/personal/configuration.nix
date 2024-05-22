{ configs, lib, pkgs, systemSettings, userSettings, ... }:

{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/boot/grub.nix
        ../../system/audio/audio.nix
        ../../system/kernel/zen.nix
        ../../system/zfs/zfs.nix
        (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = systemSettings.hostname;
    networking.networkmanager.enable = true;

    time.timeZone = systemSettings.timezone;

    i18n.defaultLocale = systemSettings.locale;
    i18n.extraLocaleSettings = {
        LC_ADDRESS = systemSettings.locale;
        LC_IDENTIFICATION = systemSettings.locale;
        LC_MEASUREMENT = systemSettings.locale;
        LC_MONETARY = systemSettings.locale;
        LC_NAME = systemSettings.locale;
        LC_NUMERIC = systemSettings.locale;
        LC_PAPER = systemSettings.locale;
        LC_TELEPHONE = systemSettings.locale;
        LC_TIME = systemSettings.locale;
    };

    users.users.${userSettings.username} = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
        uid = 1000;
        description = userSettings.name;
        packages = [];
    };

    # System package
    environment.systemPackages = with pkgs; [
        wget
        curl
        zsh
        git
        home-manager
        cryptsetup
        nvtop
        btop
        power-profiles-daemon
        smartmontools
        fprintd
        killall
        mangohud
        #sanoid
    ];

    services.fprintd.enable = true;
    services.tailscale = {
        enable = true;
        package = pkgs.tailscale;
        useRoutingFeatures = "client";
        extraUpFlags = "--accept-routes";
    };

    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.libinput.enable = true;

    fonts.fontDir.enable = true;

    #environment.shells = with pkgs; [ zsh ];
    #users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    hardware.opengl.driSupport32Bit = true;

    environment.extraInit = ''
        unset -v SSH_ASKPASS
    '';


    services.smartd.enable = true;

    services.power-profiles-daemon.enable = true;

    system.stateVersion = "23.11";
}
